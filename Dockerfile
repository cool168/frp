FROM alpine:3.8
 
ENV Frp_ver 0.23.3

RUN set -ex && \
    wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${Frp_ver}/frp_${Frp_ver}_linux_amd64.tar.gz && \
    tar -zxf frp_${Frp_ver}_linux_amd64.tar.gz && \
    mkdir /var/frp && \
    mkdir /var/frp/conf && \
    mv frp_${Frp_ver}_linux_amd64/* /var/frp && \
    rm -rf frp_${Frp_ver}_linux_amd64.tar.gz 
    
ADD frp_server.sh /var/frp/frp_server.sh
ADD frp_client.sh /var/frp/frp_client.sh
ADD frp.sh /var/frp/frp.sh
ADD frps.ini /var/frp/conf/frps.ini
ADD frpc.ini /var/frp/conf/frpc.ini
RUN chmod +x /var/frp/*.sh
WORKDIR /var/frp
