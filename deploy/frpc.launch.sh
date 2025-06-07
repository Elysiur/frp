docker pull elysiur/frpc:v0.62.1

mkdir -p /etc/frp
cp -i "./deploy/frpc.toml" "/etc/frp/frpc.toml"

docker run \
  --name frpc \
  --network host \
  -e TZ=Asia/Shanghai \
  -v /etc/frp:/etc/frp \
  elysiur/frpc:v0.62.1 \
  -c /etc/frp/frpc.toml
