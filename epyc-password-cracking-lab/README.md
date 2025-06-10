# 🔥 John the Threadripper
### By Nathan Phelan

Turn your AMD EPYC workstation into a high-performance password cracking lab using **Hashcat**, **John the Ripper**, and **ROCm**. This setup supports **any ROCm-compatible AMD GPU** (RX 6000 series, MI200 series, etc.).

Built for real-world red teamers, hobbyists, and cyber warriors.

## 🔧 Features

- ROCm GPU acceleration (universal AMD ROCm support)
- Hashcat (GPU & CPU support)
- John the Ripper Jumbo build
- Wordlist download (SecLists)
- Benchmark & test ready

## 🚀 Getting Started

1. Clone this repo:
   ```bash
   git clone https://github.com/YOUR_USERNAME/john-the-threadripper.git
   cd john-the-threadripper
   ```

2. Run the setup script:
   ```bash
   chmod +x setup-epyc-cracker.sh
   ./setup-epyc-cracker.sh
   ```

3. Reboot your system when prompted.

## 📂 Folder Contents

- `setup-epyc-cracker.sh`: Full automated setup script
- `example-hashes/`: Sample hash files (add your own)
- `wordlists/`: Folder to store downloaded wordlists (auto-downloaded)

## ✅ Quick Tests

- Test Hashcat:
  ```bash
  hashcat -b
  ```

- Test John:
  ```bash
  ~/john/run/john --test
  ```

## 🧠 Tip

To test real hashes:
```bash
hashcat -m 1000 -a 0 hashes.txt /usr/share/wordlists/rockyou.txt
```

---
Built for 🔥 **performance + practicality**.
