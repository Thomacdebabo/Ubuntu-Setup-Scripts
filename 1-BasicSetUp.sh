#!/bin/bash


set -e

spatialPrint() {
    echo ""
    echo ""
    echo "$1"
	echo "================================"
}

# To note: the execute() function doesn't handle pipes well
execute () {
	echo "$ $*"
	OUTPUT=$($@ 2>&1)
	if [ $? -ne 0 ]; then
        echo "$OUTPUT"
        echo ""
        echo "Failed to Execute $*" >&2
        exit 1
    fi
}

# Speed up the process
# Env Var NUMJOBS overrides automatic detection
if [[ -n $NUMJOBS ]]; then
    MJOBS=$NUMJOBS
elif [[ -f /proc/cpuinfo ]]; then
    MJOBS=$(grep -c processor /proc/cpuinfo)
elif [[ "$OSTYPE" == "darwin"* ]]; then
	MJOBS=$(sysctl -n machdep.cpu.thread_count)
else
    MJOBS=4
fi

execute sudo apt-get update -y

execute sudo apt-get upgrade -y
execute sudo apt-get install ubuntu-restricted-extras -y

# Choice for terminal that will be adopted: Tilda+tmux
# Not guake because tilda is lighter on resources
# Not terminator because tmux sessions continue to run if you accidentally close the terminal emulator
execute sudo apt-get install git wget curl net-tools -y
execute sudo apt-get install gimp -y
execute sudo apt-get install xclip xsel -y # this is used for the copying tmux buffer to clipboard buffer
execute sudo apt-get install vim-gui-common vim-runtime -y

execute sudo apt install gnome-tweaks
execute sudo apt-get install aria2 -y


# Now create shortcuts
# execute sudo apt-get install run-one xbindkeys xbindkeys-config wmctrl xdotool -y
# cp ./config_files/xbindkeysrc ~/.xbindkeysrc


sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils \
tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
sudo apt-get install cmake -y
# For utilities such as lspci
execute sudo apt-get install pciutils

## Detect if an Nvidia card is attached, and install the graphics drivers automatically if not already installed
if [[ -n $(lspci | grep -i nvidia) && ! $(command -v nvidia-smi) ]]; then
    spatialPrint "Installing Display drivers and any other auto-detected drivers for your hardware"
    execute sudo add-apt-repository ppa:graphics-drivers/ppa -y
    execute sudo apt-get update
    execute sudo ubuntu-drivers autoinstall
fi

spatialPrint "The script has finished. Please enter credentials to access your new shell"
if [[ ! -n $CIINSTALL ]]; then
    su - $USER
fi
