# AI-Enhanced-Personal-Safety-Monitoring
AI-powered safety monitoring system that uses GPS, accelerometer, and audio data to assess risks and send alerts. Built with a Flask API backend, machine learning models for real-time analysis, and cloud storage integration for data management.

Mobile App (Flutter)
Open mobile_app/ in a Flutter-compatible IDE.
Run main.dart on an Android or iOS device.

## Features

- **Location Tracking**: Real-time GPS data collection.
- **Accelerometer Monitoring**: Tracks movement patterns to assess safety.
- **Audio Sentiment Analysis**: Detects stress levels in audio data using LSTM.
- **Cloud Integration**: Stores data on Vultr Cloud for later analysis.
- **Alerts**: Notifies workers when potentially dangerous situations are detected.

### Backend (Flask)
1. Navigate to `app/` directory.
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   
## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/AI-Enhanced-Personal-Safety-Monitoring.git

## Usage
- Data Collection: Use gps_collection.dart and accelerometer_data.dart to collect location and movement data.
- Risk and Sentiment Prediction: Run the API and send data to /upload_data endpoint to receive risk assessments.
- Cloud Upload: Use vultr_integration.py to upload data to the Vultr Cloud.
