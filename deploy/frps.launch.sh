docker pull elysiur/frps:v0.62.1

mkdir -p /etc/frp
cp -i "./deploy/frps.toml" "/etc/frp/frps.toml"

docker run \
  --name frps \
  --restart always \
  --network host \
  -e TZ=Asia/Shanghai \
  -v /etc/frp:/etc/frp \
  -d \
  elysiur/frps:v0.62.1 \
  -c /etc/frp/frps.toml
