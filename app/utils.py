import boto3
import json

def send_alert(worker_id, message):
    print(f"Alert sent to {worker_id}: {message}")

def save_data_to_cloud(data):
    s3 = boto3.client('s3', endpoint_url='https://ewr1.vultrobjects.com')
    s3.put_object(Bucket='your-bucket', Key='sensor_data.json', Body=json.dumps(data))
