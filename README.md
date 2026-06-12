# Linux-updator

An intelligent, multi-distribution system updater that automatically adapts to your OS, package manager, and installed containerized platforms.

## Features
- **Auto-Detects OS Base:** Automatically switches between Debian/Ubuntu (`apt`) and Arch Linux (`pacman`).
- **AUR Helper Support:** Automatically detects and utilizes `yay` or `paru` if available on Arch-based systems.
- **Smart Containers:** Checks if `snap` or `flatpak` are installed before displaying headers or running updates, preventing system clutter and error messages.
- **Clean Interface:** Formatted with clear titles, color coding, and neat terminal spacing.

## How to Install and Run

To download and use this script on your system, open your terminal and run the following commands:

```bash
# 1. Download the script
curl -O [https://raw.githubusercontent.com/cybermaxpower/Linux-updator/main/upall](https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/Linux-updator/main/upall)

# 2. Make the script executable
chmod +x upall

# 3. Run the script
./upall
