#!/bin/bash

# Clear the screen for a clean installer look
clear

echo "╔═════════════════════════════════════════════════════╗"
echo "║                Lazy Installer: upall                ║"
echo "╚═════════════════════════════════════════════════════╝"
echo -e "\n"

# ==========================================
# 1. DETECT SYSTEM & CHOOSE INSTALL METHOD
# ==========================================
# Detect if the system is Debian/Ubuntu-based or Arch-based
if command -v apt &> /dev/null; then
    PKG_MANAGER="apt"
    echo -e "\e[32m[DETECTED]\e[0m Debian/Ubuntu-based system."
elif command -v pacman &> /dev/null; then
    PKG_MANAGER="pacman"
    echo -e "\e[32m[DETECTED]\e[0m Arch-based system."
else
    PKG_MANAGER="unknown"
    echo -e "\e[31m[WARNING]\e[0m Unknown system base. Will attempt a local file copy."
fi

# ==========================================
# 2. ENSURE CURL IS INSTALLED (For GitHub Download)
# ==========================================
# If we know the package manager and 'curl' is missing, install it automatically
if [ "$PKG_MANAGER" != "unknown" ] && ! command -v curl &> /dev/null; then
    echo -e "\n\e[33m[NOTICE]\e[0m 'curl' is required to fetch the script. Installing it now..."
    if [ "$PKG_MANAGER" = "apt" ]; then
        sudo apt update && sudo apt install curl -y
    elif [ "$PKG_MANAGER" = "pacman" ]; then
        sudo pacman -Sy curl --noconfirm
    fi
fi

echo -e "\n"

# ==========================================
# 3. DEPLOYING THE SCRIPT
# ==========================================
echo "Installing 'upall' update script to your system folder..."
echo "--------------------------------------------------------"

# CHANGE THIS: Replace 'YOUR_GITHUB_USERNAME' with your actual GitHub username!
GITHUB_USER="YOUR_GITHUB_USERNAME"

# Check if we can download it fresh from GitHub
if command -v curl &> /dev/null && [ "$GITHUB_USER" != "YOUR_GITHUB_USERNAME" ]; then
    echo -e "\e[34m[DOWNLOADING]\e[0m Fetching latest 'upall' from GitHub..."
    # Downloads directly to the system binary folder
    sudo curl -s -L "https://raw.githubusercontent.com/${GITHUB_USER}/upall/main/upall" -o /usr/local/bin/upall
else
    # Fallback: If GitHub isn't configured yet, copy the local file just like your original script
    echo -e "\e[33m[LOCAL COPY]\e[0m Using local 'upall' file..."
    if [ -f "./upall" ]; then
        sudo cp upall /usr/local/bin/upall
    else
        echo -e "\e[31m[ERROR]\e[0m Could not download from GitHub, and no local 'upall' file was found!"
        exit 1
    fi
fi

# ==========================================
# 4. SET PERMISSIONS & FINISH
# ==========================================
# Make the script executable
sudo chmod +x /usr/local/bin/upall

echo -e "\n"
echo -e "╔═════════════════════════════════════════════════════╗"
echo -e "║            INSTALLATION COMPLETE!                   ║"
echo -e "║      You can now run the script by typing: upall    ║"
echo -e "╚═════════════════════════════════════════════════════╝"
echo -e "\n"
