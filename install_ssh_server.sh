sudo apt install openssh-server -y
sudo systemctl enable ssh
sudo systemctl start ssh
echo "SSH server installed and started."
