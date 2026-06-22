A lightweight, persistent Kali Linux environment containerized via Podman. This setup replaces a traditional virtual machine, offering rapid startup and isolated storage without mounting to the host filesystem.

Ensure Podman is installed on your host system

---

## Quick Start

If you are setting this up for the first time or rebuilding after a clean wipe, follow these steps. This can take awhile go get some coffee ;)
  
```
git clone https://github.com/KickedDroid/kali-podman.git &&
cd kali-podman &&  
podman build -t kali:custom . &&
podman run -it -d --name kali-box kali:custom /bin/bash
```

Create aliases

```bash
echo "alias kali='podman start -a kali-box'" >> ~/.zshrc
echo "alias kali-start='podman run -d -it --name kali-box kali:custom /bin/bash'" >> ~/.zshrc
echo "alias kali-rm='podman rm -f kali-box'" >> ~/.zshrc
echo "alias kali-rmi='podman rmi kali:custom'" >> ~/.zshrc
source ~/.zshrc
```

Now you can enter your container with:

```
kali
```

![](https://raw.githubusercontent.com/KickedDroid/kali-podman/refs/heads/master/kali-podman.png)

---

# Customize

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

Build the image from the `Dockerfile`

```
podman build -t kali:custom .
```

Create and run the container

```
podman run -it -d --name kali-box kali:custom /bin/bash
```


### From DockerHub

```
podman run -it --name kali-box docker.io/kalilinux/kali-rolling
```

Once inside update the packages

```
apt update && apt -y install kali-linux-headless
```
