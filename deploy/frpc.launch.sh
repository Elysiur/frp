LAUNCH_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

docker pull elysiur/frpc:v0.62.1

mkdir -p /etc/frp
cp -i "$LAUNCH_DIR/deploy/frpc.toml" "/etc/frp/frpc.toml"

docker run \  
  --name frpc \
  --restart always \
  --network host \
  -e TZ=Asia/Shanghai \
  -v /etc/frp:/etc/frp \
  -d \
  elysiur/frpc:v0.62.1 \
  -c /etc/frp/frpc.toml
