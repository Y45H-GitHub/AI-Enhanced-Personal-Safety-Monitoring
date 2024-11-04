# AI-Enhanced-Personal-Safety-Monitoring
AI-powered safety monitoring system that uses GPS, accelerometer, and audio data to assess risks and send alerts. Built with a Flask API backend, machine learning models for real-time analysis, and cloud storage integration for data management.

## Features

- **Location Tracking**: Real-time GPS data collection.
- **Accelerometer Monitoring**: Tracks movement patterns to assess safety.
- **Audio Sentiment Analysis**: Detects stress levels in audio data using LSTM.
- **Cloud Integration**: Stores data on Vultr Cloud for later analysis.
- **Alerts**: Notifies workers when potentially dangerous situations are detected.

## Project Structure

- **app/data_collection**: Collects real-time GPS and accelerometer data.
- **app/backend**: Flask-based API to process data and predict risk.
- **app/detection**: Machine learning models for GPS risk and audio sentiment.
- **app/alerts**: Sends alerts based on model predictions.
- **app/cloud_integration**: Code to upload data to Vultr Cloud.

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/AI-Enhanced-Personal-Safety-Monitoring.git
