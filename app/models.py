import numpy as np
import pickle
from sklearn.ensemble import RandomForestClassifier
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, LSTM

# GPS Risk Prediction Model
def load_gps_model():
    try:
        with open('gps_model.pkl', 'rb') as f:
            model = pickle.load(f)
    except FileNotFoundError:
        model = RandomForestClassifier()
        X_train, y_train = load_training_data()
        model.fit(X_train, y_train)
        with open('gps_model.pkl', 'wb') as f:
            pickle.dump(model, f)
    return model

def gps_predict_risk(gps_data):
    model = load_gps_model()
    risk_level = model.predict([gps_data])[0]
    return risk_level

# Audio Sentiment Detection Model
def build_audio_model():
    model = Sequential([
        LSTM(128, input_shape=(None, 13)),
        Dense(1, activation='sigmoid')
    ])
    model.compile(loss='binary_crossentropy', optimizer='adam', metrics=['accuracy'])
    return model

def load_audio_model():
    try:
        model = build_audio_model()
        model.load_weights('audio_model.h5')
    except Exception:
        model = build_audio_model()
    return model

def audio_predict_stress(audio_mfcc):
    model = load_audio_model()
    return model.predict(audio_mfcc)
