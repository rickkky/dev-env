# dev-env

```
docker build -t dev-env:0.0.1 .

docker create --name dev-box -h dev-box -u ricky -v codespace:/home/ricky/codespace -it dev-env:0.0.1 zsh

docker start dev-box

docker exec -it dev-box zsh
```
