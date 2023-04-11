# dev-env

## build

```bash
docker build -t rickkky/dev-env:0.0.5 .
```

## start

```bash
docker create --name dev-box -h dev-box -u ricky -v codespace:/home/ricky/codespace -it rickkky/dev-env:0.0.5 zsh

docker start dev-box

docker exec -it dev-box zsh
```

Rewrite the permission of codespace volume:

```bash
sudo chown 777 /home/ricky/codespace
```
