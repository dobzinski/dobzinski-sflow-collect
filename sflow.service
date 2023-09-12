[Unit]
Description=sFlow Collect Service
After=syslog.target network.target remote-fs.target nss-lookup.target network-online.target
Requires=network-online.target

[Service]
Type=oneshot
User=USER
Group=GROUP
ExecStart=/PATH/init-script.sh start
ExecStop=/PATH/init-script.sh stop
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
