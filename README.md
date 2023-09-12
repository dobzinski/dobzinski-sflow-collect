# dobzinski-sflow-collect
Collect and archive sFlow transfer package, output JSON format.

# CentOS / Rocky
```
# dnf install tcpdump
# wget https://www.rpmfind.net/linux/openmandriva/cooker/repository/x86_64/non-free/release/sflowtool-6.02-1-omv2390.x86_64.rpm
# rpm -iv sflowtool-6.02-1-omv2390.x86_64.rpm
```

# Service
```
# vi init-script.sh
 -> Edit vars: Interface, Port and Log Path
# cp sflow.service /etc/systemd/system/
# vi /etc/systemd/system/sflow.service
 -> Edit the Path Script
# systemctl daemon-reload
# systemctl enable sflow.service
# systemctl start sflow.service
```
