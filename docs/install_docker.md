# Docker install

Some docker install tips. For updated info, refer to https://docs.docker.com/install/

## Ubuntu Xenial

> From https://docs.docker.com/install/linux/docker-ce/ubuntu/#set-up-the-repository

Remove old installs

```bash
$ sudo apt-get remove docker docker-engine docker.io
```

Pre-requisites

```bash
$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
```

Add keys

```bash
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Add the repo

```bash
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

Update and install

```bash
$ sudo apt-get update
$ sudo apt-get install docker-ce
```

Add docker compose

```bash
$ sudo curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
```

Optionally:

```bash
$ sudo usermod -aG docker ${USER}
```

Log-in/log-out and check if the group have been successfully added

```bash
$ id -nG
```