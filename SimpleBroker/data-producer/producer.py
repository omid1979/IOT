import paho.mqtt.client as mqtt
import time
import random
import json

# تنظیمات MQTT
BROKER = "mosquitto"
PORT = 1883
TOPIC = "sensors/data"

# اتصال به بروکر
client = mqtt.Client()
client.connect(BROKER, PORT, 60)

while True:
    # تولید داده‌های تصادفی
    temperature = random.uniform(20.0, 30.0)
    humidity = random.uniform(40.0, 80.0)
    
    # ساخت پیام JSON
    payload = {
        "temperature": temperature,
        "humidity": humidity,
        "timestamp": time.time()
    }
    
    # ارسال پیام به Mosquitto
    client.publish(TOPIC, json.dumps(payload))
    print(f"Sent: {payload}")
    
    # صبر 5 ثانیه‌ای
    time.sleep(5)

