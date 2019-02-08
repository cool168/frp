#!/bin/sh

echo ${FRP_CLIENT='yes'}

sleep 1
if [ $FRP_CLIENT = "yes" ]
then
    /var/frp/frpc -c /var/frp/conf/frpc.ini
else
    /var/frp/frps -c /var/frp/conf/frps.ini
fi
