A lightweight, persistent Kali Linux environment containerized via Podman. This setup replaces a traditional virtual machine, offering rapid startup and isolated storage without mounting to the host filesystem.

Ensure Podman is installed on your host system

---

## Quick Start

If you are setting this up for the first time or rebuilding after a clean wipe, follow these three steps:

```
git clone &&
cd kali-podman &&  
podman build -t kali:custom . &&
podman run --name kali-box kali:custom /bin/bash
```

Create alias

```bash
echo "alias kali='podman start -a kali-box'" >> ~/.bashrc
source ~/.bashrc
```

Now you can enter your container with:

```
kali
```

---

## From  Dockerfile

```Dockerfile
FROM docker.io/kalilinux/kali-rolling

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    kali-linux-headless \
    nmap \
    curl \
    git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# RUN you can add your commands here

WORKDIR /root

CMD ["/bin/bash"]
```

```
podman build -t kali:custom .
```

```
podman run -it --name kali-box kali:custom /bin/bash
```


## Enter

Create alias

```bash
echo "alias kali='podman start -a kali-box'" >> ~/.bashrc
source ~/.bashrc
```

Now you can enter your container with:

```
kali
```

### From DockerHub

```
podman run -it --name kali-box docker.io/kalilinux/kali-rolling
```

Once inside update the packages

```
apt update && apt -y install kali-linux-headless
```
