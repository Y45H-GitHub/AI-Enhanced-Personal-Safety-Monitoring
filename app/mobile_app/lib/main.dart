import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafetyMonitor(),
    );
  }
}

class SafetyMonitor extends StatefulWidget {
  @override
  _SafetyMonitorState createState() => _SafetyMonitorState();
}

class _SafetyMonitorState extends State<SafetyMonitor> {
  Position _currentPosition;
  Map<String, dynamic> _accelerometerData = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerData = {'x': event.x, 'y': event.y, 'z': event.z};
      });
    });
  }

  _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
    });
    _sendDataToServer();
  }

  _sendDataToServer() async {
    if (_currentPosition != null) {
      Map<String, dynamic> data = {
        'gps': {
          'latitude': _currentPosition.latitude,
          'longitude': _currentPosition.longitude,
          'speed': _currentPosition.speed
        },
        'accelerometer': _accelerometerData
      };

      var response = await http.post(
        Uri.parse('http://your-backend-api-url/upload_data'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        _showRiskAlert(result['risk_level']);
      }
    }
  }

  _showRiskAlert(String riskLevel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Risk Alert"),
          content: Text("Your risk level is: $riskLevel"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Safety Monitor"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("GPS: $_currentPosition"),
            Text("Accelerometer: $_accelerometerData"),
          ],
        ),
      ),
    );
  }
}
