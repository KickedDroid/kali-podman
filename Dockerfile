FROM docker.io/kalilinux/kali-rolling

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    kali-linux-headless \
    nmap \
    curl \
    git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /root

CMD ["/bin/bash"]
