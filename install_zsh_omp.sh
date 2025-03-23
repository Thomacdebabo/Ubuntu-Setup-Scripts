SCRIPT_DIR=$(dirname $0)


sudo apt install zsh tmux -y
curl -s https://ohmyposh.dev/install.sh | bash -s


# Antigen
ANITGEN_PATH=~/.antigen
mkdir -p $ANITGEN_PATH
curl -L git.io/antigen > $ANITGEN_PATH/antigen.zsh
echo "source $ANITGEN_PATH/antigen.zsh" >> ~/.zshrc
# load all lines from ./config_files/antigen.sh into zshrc
cat ./config_files/antigen.sh >> ~/.zshrc
echo "export TERM=xterm-256color" >> ~/.zshrc   


command -v zsh | sudo tee -a /etc/shells
mkdir -p ~/.themes

cd ~/.themes
wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/refs/heads/main/themes/lambdageneration.omp.json
cd $SCRIPT_DIR
echo "export PATH=$PATH:~/.local/bin" >> ~/.zshrc
echo 'eval "$(oh-my-posh init zsh --config ~/.themes/lambdageneration.omp.json)"' >> ~/.zshrc

sudo chsh -s "$(command -v zsh)" "${USER}"


