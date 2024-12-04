###Box1 High : 20 Cm
#Ref:  http://parstoyoor.blogfa.com/post/18 
####################
#!/bin/bash
while :
do

mosquitto_pub -t 'sensor/Temp1' -u sensor -P sensor -m `shuf -i 22-27 -n1`
sleep 1
mosquitto_pub -t 'sensor/Temp2' -u sensor -P sensor -m `shuf -i 22-27 -n1`
sleep 1
mosquitto_pub -t 'sensor/humidity1' -u sensor -P sensor -m `shuf -i 60-68 -n1`
sleep 1
mosquitto_pub -t 'sensor/humidity2' -u sensor -P sensor -m `shuf -i 60-68 -n1`
sleep 1
mosquitto_pub -t 'sensor/Oxygen1' -u sensor -P sensor -m `shuf -i 20-25 -n1`
mosquitto_pub -t 'sensor/Oxygen2' -u sensor -P sensor -m `shuf -i 20-25 -n1`
sleep 1
mosquitto_pub -t 'sensor/Hydrogen1' -u sensor -P sensor -m `shuf -i 22-27 -n1`
mosquitto_pub -t 'sensor/Hydrogen2' -u sensor -P sensor -m `shuf -i 22-27 -n1`
sleep 1
mosquitto_pub -t 'sensor/Ammonia1' -u sensor -P sensor -m `shuf -i 22-25 -n1`
mosquitto_pub -t 'sensor/Ammonia2' -u sensor -P sensor -m `shuf -i 22-25 -n1`
sleep 1
mosquitto_pub -t 'sensor/CO2-1' -u sensor -P sensor -m `shuf -i 22-27 -n1`
mosquitto_pub -t 'sensor/CO2-2' -u sensor -P sensor -m `shuf -i 22-27 -n1`
sleep 1
mosquitto_pub -t 'relay/heater1' -u sensor -P sensor -m `shuf -i 0-1 -n1`
mosquitto_pub -t 'relay/heater2' -u sensor -P sensor -m `shuf -i 0-1 -n1`
sleep 1
mosquitto_pub -t 'relay/HumGen1' -u sensor -P sensor -m `shuf -i 0-1 -n1`
sleep 1
mosquitto_pub -t 'relay/OxyGen1' -u sensor -P sensor -m `shuf -i 0-1 -n1`
sleep 1
mosquitto_pub -t 'relay/FAN1' -u sensor -P sensor -m `shuf -i 0-1 -n1`
mosquitto_pub -t 'relay/FAN2' -u sensor -P sensor -m `shuf -i 0-1 -n1`
sleep 1
sleep 10
done






