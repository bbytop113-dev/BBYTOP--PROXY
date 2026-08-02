# Stage 1: Official Gost Binary Pull
FROM ginuerzh/gost:latest AS gost-bin

# Stage 2: Main Alpine Container
FROM alpine:latest

# Install required tools (udp2raw removed for apk stability)
RUN apk add --no-cache \
    openvpn \
    iptables \
    wireguard-tools \
    socat \
    bash \
    curl \
    wget \
    iproute2 \
    iptables-openrc

# Copy Gost from official image
COPY --from=gost-bin /bin/gost /usr/local/bin/gost

# Expose HTTP Proxy, SOCKS5, WireGuard/Tunnel Ports
EXPOSE 8080 1080 51820 3333

# Entrypoint script creation with permission error guards
RUN echo '#!/bin/bash' > /entrypoint.sh && \
    echo 'echo 1 > /proc/sys/net/ipv4/ip_forward 2>/dev/null || true' >> /entrypoint.sh && \
    echo 'iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE 2>/dev/null || true' >> /entrypoint.sh && \
    echo 'iptables -A FORWARD -i tun0 -o eth0 -j ACCEPT 2>/dev/null || true' >> /entrypoint.sh && \
    echo 'iptables -A FORWARD -i eth0 -o tun0 -j ACCEPT 2>/dev/null || true' >> /entrypoint.sh && \
    echo 'echo "Starting GOST Proxies..."' >> /entrypoint.sh && \
    echo 'gost -L=http+ws://daytona:daytona123@:8080 -L=socks5+ws://daytona:daytona123@:1080 &' >> /entrypoint.sh && \
    echo 'exec tail -f /dev/null' >> /entrypoint.sh && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
