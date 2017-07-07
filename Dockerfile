FROM inventory

ENV URL https://raw.githubusercontent.com/fahlmant/inventory/master/inventory.sh
ENV INV_IP 10.7.28.191
ENV INV_PORT 5000

RUN wget $URL --no-check-certificate
CMD /bin/bash inventory.sh | netcat $INV_IP $INV_PORT -u -v
