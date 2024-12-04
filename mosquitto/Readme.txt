
##########################################################
   SET Password 
##########################################################
# Create new password file and add user and it will prompt for password
mosquitto_passwd -c /mosquitto/config/pwfile user1

# Add additional users (remove the -c option) and it will prompt for password
mosquitto_passwd /mosquitto/config/pwfile user2

# delete user command format
mosquitto_passwd -D /mosquitto/config/pwfile <user-name-to-delete>


##########################################################
Let us start Subscriber now - topic name => 'hello/topic'
##########################################################
# Without authentication
mosquitto_sub -v -t 'hello/topic'

# With authentication
mosquitto_sub -v -t 'hello/topic' -u user1 -P <password>

# Alternate way in url format
# Format => mqtt(s)://[username[:password]@]host[:port]/topic
mosquitto_sub -v -L mqtt://user1:abc123@localhost/test/topic


mosquitto_sub -v -t 'sensor/#' -u admin -P cluster -h 127.0.0.1   -F "%I %t "


#########################################################
Let us start Publising to that topic
########################################################
# Without authentication
mosquitto_pub -t 'hello/topic' -m 'hello MQTT'

# With authentication
mosquitto_pub -t 'hello/topic' -m 'hello MQTT' -u user1 -P <password>

# Alternate way in url format 
# Format => mqtt(s)://[username[:password]@]host[:port]/topic
mosquitto_pub -L mqtt://user1:abc123@localhost/test/topic -m 'hello MQTT'


