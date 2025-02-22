import paho.mqtt.client as mqtt
import json
from influxdb_client import InfluxDBClient, Point
from influxdb_client.client.write_api import SYNCHRONOUS

# تنظیمات MQTT
BROKER = "mosquitto"
PORT = 1883
TOPIC = "sensors/data"

# تنظیمات InfluxDB
INFLUXDB_URL = "http://influxdb:8086"
INFLUXDB_TOKEN = "adminpass"  # باید با تنظیمات InfluxDB مطابقت داشته باشد
INFLUXDB_ORG = "my_org"
INFLUXDB_BUCKET = "sensor_data"

# اتصال به InfluxDB
client_influx = InfluxDBClient(url=INFLUXDB_URL, token=INFLUXDB_TOKEN, org=INFLUXDB_ORG)
write_api = client_influx.write_api(write_options=SYNCHRONOUS)

# توابع MQTT
def on_connect(client, userdata, flags, rc):
    print("Connected to MQTT Broker with code " + str(rc))
    client.subscribe(TOPIC)

def on_message(client, userdata, msg):
    payload = json.loads(msg.payload.decode())
    print(f"Received: {payload}")
    
    # ساخت نقطه برای InfluxDB
    point = Point("sensor_reading") \
        .tag("source", "mqtt") \
        .field("temperature", payload["temperature"]) \
        .field("humidity", payload["humidity"]) \
        .time(int(payload["timestamp"] * 1e9))  # تبدیل به نانوثانیه
    
    # ذخیره در InfluxDB
    write_api.write(bucket=INFLUXDB_BUCKET, record=point)
    print("Data written to InfluxDB")

# تنظیم MQTT Client
client_mqtt = mqtt.Client()
client_mqtt.on_connect = on_connect
client_mqtt.on_message = on_message

# اتصال به بروکر
client_mqtt.connect(BROKER, PORT, 60)
client_mqtt.loop_forever()
