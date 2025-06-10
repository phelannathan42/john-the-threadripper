#!/bin/bash

# 🧠 EPYC + ROCm GPU Password Cracking Lab Setup Script
# Tested on: Ubuntu 22.04 LTS

echo "🔧 Starting setup..."

# -------- Update & Install Essentials --------
echo "📦 Installing dependencies..."
sudo apt update && sudo apt install -y build-essential git wget unzip lm-sensors zlib1g-dev libssl-dev clinfo

# -------- Install AMD ROCm Drivers --------
echo "⚙️ Installing AMD ROCm drivers (universal GPU support)..."
wget https://repo.radeon.com/amdgpu-install/5.7/ubuntu/jammy/amdgpu-install_5.7.50700-1_all.deb
sudo dpkg -i amdgpu-install_5.7.50700-1_all.deb
sudo apt update
sudo amdgpu-install --usecase=rocm,opencl -y

# Reboot suggestion
echo "✅ ROCm installed. You may need to reboot before continuing."

# -------- Install Hashcat --------
echo "🛠 Installing Hashcat..."
sudo apt install -y hashcat

# -------- Install John the Ripper (Jumbo) --------
echo "🔨 Building John the Ripper Jumbo version..."
cd ~
git clone https://github.com/openwall/john.git
cd john/src
./configure && make -s clean && make -sj$(nproc)

# -------- Wordlists --------
echo "📚 Downloading wordlists..."
mkdir -p ~/wordlists
cd ~/wordlists
wget https://github.com/danielmiessler/SecLists/archive/master.zip
unzip master.zip

# -------- Verification --------
echo "✅ Verifying setup..."
/opt/rocm/bin/rocminfo | grep -i name
/opt/rocm/opencl/bin/clinfo | grep -i 'device name'
hashcat -I
~/john/run/john --test | grep -i benchmark

# -------- Done --------
echo "🎉 Setup complete! Recommended: Reboot your system before using ROCm fully."
echo "👉 Test Hashcat with: hashcat -b"
echo "👉 Test John with: ~/john/run/john --test"
