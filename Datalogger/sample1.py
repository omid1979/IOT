import network
import time
import random
from umqtt.simple import MQTTClient
import machine
import ubinascii

# WiFi Access Point Configuration
AP_SSID = "SensorNetwork"
AP_PASSWORD = "SecureNetwork123"

# MQTT Broker Configuration
MQTT_BROKER = "test.mosquitto.org"
MQTT_PORT = 1883
CLIENT_ID = ubinascii.hexlify(machine.unique_id())

# Create MQTT Topics
TOPICS = {
    "temperature1": b"sensors/temp1",
    "temperature2": b"sensors/temp2", 
    "oxygen1": b"sensors/oxygen1",
    "oxygen2": b"sensors/oxygen2",
    "value1": b"sensors/value1",
    "value2": b"sensors/value2"
}

def setup_access_point():
    """Configure device as an access point"""
    ap = network.WLAN(network.AP_IF)
    ap.active(True)
    ap.config(essid=AP_SSID, password=AP_PASSWORD)
    print("Access Point Active")
    print(ap.ifconfig())

def connect_mqtt():
    """Connect to MQTT Broker"""
    client = MQTTClient(CLIENT_ID, MQTT_BROKER, MQTT_PORT)
    client.connect()
    return client

def generate_random_data():
    """Generate random sensor data"""
    return {
        "temperature1": round(random.uniform(20.0, 35.0), 2),
        "temperature2": round(random.uniform(20.0, 35.0), 2),
        "oxygen1": round(random.uniform(90.0, 100.0), 2),
        "oxygen2": round(random.uniform(90.0, 100.0), 2),
        "value1": random.choice(["on", "off"]),
        "value2": random.choice(["on", "off"])
    }

def main():
    # Setup Access Point
    setup_access_point()
    
    # Connect to MQTT Broker
    try:
        mqtt_client = connect_mqtt()
        print("MQTT Broker Connected")
    except Exception as e:
        print(f"MQTT Connection Failed: {e}")
        return

    # Publish Random Data Every 5 Seconds
    while True:
        sensor_data = generate_random_data()
        
        for key, topic in TOPICS.items():
            try:
                mqtt_client.publish(topic, str(sensor_data[key]))
                print(f"Published {key}: {sensor_data[key]} to {topic}")
            except Exception as e:
                print(f"Publish Error for {key}: {e}")
        
        time.sleep(5)

if __name__ == "__main__":
    main()

