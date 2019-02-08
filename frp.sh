#!/bin/sh

echo ${FRP_CLIENT='yes'}

sleep 1
if [ $FRP_CLIENT = "yes" ]
then
    /var/frp/frpc -c /var/frp/conf/frpc.ini
else
    /app/kcp/client_linux_amd64 -l 127.0.0.1:$LOCAL_PORT -r $KCP_PORT -mode $MODE -mtu $MTU -sndwnd $SNDWND -rcvwnd $RCVWND -crypt $CRYPT -key $KEY -conn $CONN -dscp $DSCP >/dev/null 2>&1 &
fi
