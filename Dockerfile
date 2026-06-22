FROM docker.io/kalilinux/kali-rolling

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    kali-linux-headless \
    nmap \
    curl \
    git \
    wget \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
RUN . /usr/local/cargo/env
RUN cargo install zellij --locked

RUN mkdir -p /root/.config/zellij
RUN wget -O /root/.config/zellij/config.kdl https://github.com/KickedDroid/dotfiles/raw/refs/heads/main/zellij/config.kdl


WORKDIR /root

CMD ["/bin/bash"]
