#!/usr/bin/python3


#Importing things
import socket
import sys
import signal

#Handle Ctrl-C properly
def signal_handler(signal, frame):
        print('Cleanly exiting')
        sys.exit(0)

#Set up socket bindings and signal listener
port = 5000
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind(("", port))
signal.signal(signal.SIGINT, signal_handler)

#Start listening on port
print("waiting on port:", port)
while 1:
    #Make sure we can get a lot of data
    data, addr = s.recvfrom(2048)
    #Stripe \n from strings and decode bytes"
    print(data.rstrip().decode())
