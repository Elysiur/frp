LAUNCH_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p /etc/frp
cp -i "$LAUNCH_DIR/frpc.toml" "/etc/frp/frpc.toml"
docker run \
  --name frps \
  --restart always \
  --network host \
  -e TZ=Asia/Shanghai \
  -v /etc/frp:/etc/frp \
  -d \
  frps:v0.62.1 \
  -c /etc/frp/frps.toml
