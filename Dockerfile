FROM inventory

RUN wget https://raw.githubusercontent.com/fahlmant/inventory/master/inventory.sh
CMD /bin/bash inventory.sh | ncat $IP 5000 -u -v

