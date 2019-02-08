#!/bin/sh

echo ${LOCAL_PORT=12948}

sleep 1
if [ $SHOW_LOGS = "yes" ]
then
    /app/kcp/client_linux_amd64 -l 127.0.0.1:$LOCAL_PORT -r $KCP_PORT -mode $MODE -mtu $MTU -sndwnd $SNDWND -rcvwnd $RCVWND -crypt $CRYPT -key $KEY -conn $CONN -dscp $DSCP &
else
    /app/kcp/client_linux_amd64 -l 127.0.0.1:$LOCAL_PORT -r $KCP_PORT -mode $MODE -mtu $MTU -sndwnd $SNDWND -rcvwnd $RCVWND -crypt $CRYPT -key $KEY -conn $CONN -dscp $DSCP >/dev/null 2>&1 &
fi
sleep 5
ss-local -s 127.0.0.1 -p $LOCAL_PORT -b 0.0.0.0 -l $SS_LOCAL_PORT -m $SS_SERVER_METHOD -k $SS_SERVER_PWD -t 60 $SS_UDP $SS_OTA
