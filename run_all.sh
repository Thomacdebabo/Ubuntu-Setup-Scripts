#!/bin/bash

# Make all scripts in the current directory executable
chmod +x ./*.sh

# Run all scripts in the current directory

./install_docker.sh
./install_zsh_omp.sh
./install_cli_utils.sh
./1-BasicSetUp.sh

./install_uv.sh
./install_obsidian.sh
./install_megasync.sh
./setup_git.sh

./2-GenSoftware.sh