# dev-env

## Build

```bash
docker build --no-cache -t rickkky/dev-env:0.0.11 .
```

### Github Proxy

- https://ghproxy.com/
- https://mirror.ghproxy.com/

## Start

```bash
docker create --name dev-box -h dev-box -u ricky -v codespace:/home/ricky/codespace -it rickkky/dev-env:0.0.11 zsh

docker start dev-box

docker exec -it dev-box zsh
```

Rewrite the permission of codespace volume:

```bash
sudo chown 777 /home/ricky/codespace
```

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
