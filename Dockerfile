FROM docker.io/library/ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive

# hadolint ignore=DL3008
RUN apt-get update && \
apt-get install --yes --no-install-recommends \
# Basic packages \
ca-certificates git curl htop nano \
# Networking tools \
nmap iputils-ping net-tools telnet dnsutils && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* && \
setcap cap_net_raw+eip "$(which nmap)"

COPY doscan.sh /usr/local/bin

RUN useradd --create-home testuser
USER testuser
WORKDIR /home/testuser

ENTRYPOINT [ "/bin/bash" ]