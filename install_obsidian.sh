#!/bin/bash

# Define variables
URL="https://github.com/obsidianmd/obsidian-releases/releases/download/v1.8.9/obsidian_1.8.9_amd64.deb"
FILE="obsidian.deb"

# Download the .deb file
echo "Downloading Obsidian..."
wget -O $FILE $URL

# Install the .deb file
echo "Installing Obsidian..."
sudo apt install ./$FILE -y

# Remove the .deb file
echo "Cleaning up..."
rm $FILE

echo "Obsidian installation complete."
