# dev-env

## build

```bash
docker build -t dev-env:0.0.2 .
```

## start

```bash
docker create --name dev-box -h dev-box -u ricky -v codespace:/home/ricky/codespace -it dev-env:0.0.2 zsh

docker start dev-box

docker exec -it dev-box zsh
```

Rewrite the permission of codespace volume:

```bash
sudo chown 777 /home/ricky/codespace
```
