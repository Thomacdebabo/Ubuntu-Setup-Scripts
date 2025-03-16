ssh-keygen -t ed25519 -C "
echo "SSH key generated."
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
echo "SSH key added to ssh-agent."
echo "Please add the following SSH key to your GitHub account:"
cat ~/.ssh/id_ed25519.pub