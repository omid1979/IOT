docker run -d -p 1883:1883 -p 9001:9001 --name mqtt -v /opt/mosquitto/config/mosquitto.conf:/mosquitto/config/mosquitto.conf -v /opt/mosquitto/data:/mosquitto/data -v /opt/mosquitto/log:/mosquitto/log eclipse-mosquitto
