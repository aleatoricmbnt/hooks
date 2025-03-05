#!/bin/bash

set -e  # Exit on error

PACKAGE="yq"  # Change this to any package you want to install

# Function to check if the package is installed
check_package() {
    if command -v "$PACKAGE" &> /dev/null; then
        echo "$PACKAGE is already installed. Version: $($PACKAGE --version)"
        exit 0
    else
        echo "$PACKAGE is not installed. Attempting to install..."
    fi
}

# Function to install the package without requiring write access to system directories
install_package() {
    if command -v snap &> /dev/null; then
        echo "Installing $PACKAGE via snap..."
        snap install "$PACKAGE"
    elif command -v brew &> /dev/null; then
        echo "Installing $PACKAGE via brew..."
        brew install "$PACKAGE"
    else
        echo "Neither snap nor brew is available. Attempting manual installation..."

        # Manual installation for yq (modify if using another package)
        if [[ "$PACKAGE" == "yq" ]]; then
            wget -q "https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64" -O "$HOME/yq"
            chmod +x "$HOME/yq"
            export PATH="$HOME:$PATH"
            echo "yq installed manually at $HOME/yq"
        else
            echo "Unsupported package. Please install $PACKAGE manually."
            exit 1
        fi
    fi
}

# Run the check and install if necessary
check_package
install_package

# Verify installation
if command -v "$PACKAGE" &> /dev/null; then
    echo "$PACKAGE installed successfully. Version: $($PACKAGE --version)"
else
    echo "Failed to install $PACKAGE."
    exit 1
fi
