from flask import Flask, request, jsonify
from models import gps_predict_risk, audio_predict_stress
from utils import send_alert, save_data_to_cloud
import json

app = Flask(__name__)

@app.route('/upload_data', methods=['POST'])
def upload_data():
    try:
        data = request.get_json()
        gps_data = data.get('gps')
        accelerometer_data = data.get('accelerometer')
        audio_data = data.get('audio')

        # Predict risk based on GPS and accelerometer data
        risk_level = gps_predict_risk(gps_data)
        stress_level = audio_predict_stress(audio_data)

        # Determine if alert is needed
        if risk_level == "high" or stress_level == "high":
            send_alert("worker_id", "You are in a dangerous area! Consider changing your route.")

        # Save the data to cloud storage for analysis
        save_data_to_cloud(data)

        return jsonify({'risk_level': risk_level, 'stress_level': stress_level}), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
