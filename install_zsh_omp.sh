sudo apt install zsh -y
curl -s https://ohmyposh.dev/install.sh | bash -s

command -v zsh | sudo tee -a /etc/shells
mkdir -p ~/.themes
wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/refs/heads/main/themes/lambdageneration.omp.json
echo 'eval "$(oh-my-posh init zsh --config ~/.themes/lambdageneration.omp.json)"' >> ~/.zshrc

sudo chsh -s "$(command -v zsh)" "${USER}"

# Create bash aliases
cp ./config_files/bash_aliases /opt/.zsh/bash_aliases >/dev/null  # Suppress error messages in case the file already exists
rm -f ~/.bash_aliases
ln -s /opt/.zsh/bash_aliases ~/.bash_aliases

{
    echo "if [ -f ~/.bash_aliases ]; then"
    echo "  source ~/.bash_aliases"
    echo "fi"

    echo "# Switching to 256-bit colour by default so that zsh-autosuggestion's suggestions are not suggested in white, but in grey instead"
    echo "export TERM=xterm-256color"
} >> ~/.zshrc
