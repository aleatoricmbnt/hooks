#!/bin/bash

set -e  # Exit on error

PACKAGE="yq"  # Change this to the package you want to install

# Function to check if the package is installed
check_package() {
    if command -v "$PACKAGE" &> /dev/null; then
        echo "$PACKAGE is already installed. Version: $($PACKAGE --version)"
        exit 0
    else
        echo "$PACKAGE is not installed. Installing..."
    fi
}

# Function to install the package
install_package() {
    if [[ "$(uname -s)" == "Linux" ]]; then
        sudo apt-get update && sudo apt-get install -y "$PACKAGE"
    elif [[ "$(uname -s)" == "Darwin" ]]; then
        brew install "$PACKAGE"
    else
        echo "Unsupported OS. Please install $PACKAGE manually."
        exit 1
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
