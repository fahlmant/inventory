#!/usr/bin/python3

#Importing things
import socket
import sys
import signal

#Handle Ctrl-C properly
def signal_handler(signal, frame):
        print('Cleanly exiting')
        sys.exit(0)

def get_hostname(buf):
    result = buf.split("#^Hostname: ", 1)[1]
    print ("RESULT " + result)
    return result

#Set up socket bindings and signal listener
port = 5000
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind(("", port))
signal.signal(signal.SIGINT, signal_handler)
info_buffer = " "

#Start listening on port
print("waiting on port:", port)
while 1:
    #Make sure we can get a lot of data
    data, addr = s.recvfrom(2048)
    #Stripe \n from strings and decode bytes"
    print(data.rstrip().decode())
    info_buffer += data.rstrip().decode()
    if "#^Hostname" in data.rstrip().decode():
        buf = data.rstrip().decode()
        hostname = get_hostname(buf)
    if "#^END" in data.rstrip().decode():
        print ("HERE")
        info_file = open('servers/' + hostname, "w+")
        info_file.write(info_buffer)
        buf = " "
        hostname = " " 
        info_file.close()
        info_buffer = " "
