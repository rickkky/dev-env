# dev-env

## Install Docker Engine

> - [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

## Build

```bash
docker build --no-cache -t rickkky/dev-env:0.0.11 .
```

### Github Proxy

- https://ghproxy.com/
- https://mirror.ghproxy.com/

## Start

```bash
docker create --name dev-box -h dev-box -u ricky -v code:/home/ricky/code -it rickkky/dev-env:0.0.11 zsh

docker start dev-box

docker exec -it dev-box zsh
```

Rewrite the permission of code volume:

```bash
sudo chown 777 /home/ricky/code
```

## Terminal Request Proxy

假设代理端口为 `7890`。

### PowerShell

```bash
# Check the environment variables.
ls env:

# Setup proxy.
$env:ALL_PROXY="http://127.0.0.1:7890"
# or
$env:HTTP_PROXY="http://127.0.0.1:7890"
$env:HTTPS_PROXY="http://127.0.0.1:7890"

# Reset proxy.
$env:ALL_PROXY=""
# or
$env:HTTP_PROXY=""
$env:HTTPS_PROXY=""
```

### WSL

```bash
# Check the environment variables.
echo $ALL_PROXY

# Setup proxy.
host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
export ALL_PROXY="http://$host_ip:7890"

# Reset proxy.
unset ALL_PROXY
```

Or add the following settings to `~/.wslconfig` on Windows11.

```bash
networkingMode=mirrored
dnsTunneling=true
autoProxy=true
```

> [Accessing network applications with WSL](https://learn.microsoft.com/en-us/windows/wsl/networking)

## SSH

```bash
ssh-keygen -t ed25519 -C "rickkky@foxmail.com"

ssh-add ~/.ssh/id_ed25519
```

> [Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

## Rust

```bash
$ curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
```

> [Install Rust](https://www.rust-lang.org/tools/install)

## Fnm

> [Fast Node Manager (fnm)](https://github.com/Schniz/fnm)

## PowerShell

> - oh-my-posh

To create the profile file you can run this in PowerShell:

```
if (-not (Test-Path $profile)) { New-Item $profile -Force }
```

To edit your profile run this in PowerShell:

```
Invoke-Item $profile
```
