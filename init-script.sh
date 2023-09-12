#!/bin/bash
# by Robson Dobzinski

IFACE=eth0
PORT=6343
LOG=$IFACE-sflow.log

startCollect() {
    echo –n "Starting sFlow collect..."
    /usr/sbin/tcpdump -i $IFACE -p -s 0 -w - udp port $PORT | /usr/bin/sflowtool -j >> $LOG 2>/dev/null &
}

stopCollect() {
    PID=`/usr/bin/ps -e | /usr/bin/grep sflowtool | /usr/bin/grep -v grep | /usr/bin/awk '{print $1}'`
    if [[ -n $PID ]]
    then 
        echo "Stoping sFlow collect..."
        /usr/bin/kill $PID
    else
        echo "It's not running!"
    fi
}

case "$1" in
    start)
        startCollect;;
    stop)
        stopCollect;;
    restart)
        stopCollect; startCollect;;
    status)
        PID=`/usr/bin/ps -e | /usr/bin/grep sflowtool | /usr/bin/grep -v grep | /usr/bin/awk '{print $1}'`
        if [[ -n $PID ]]
        then
            echo "It's running..."
        else
            echo "It's not running!"
        fi
        ;;
    *)
        echo "Usage: start|stop|restart"
        exit 1
        ;;
esac
