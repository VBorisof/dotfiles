#!/bin/bash

# Default to debian/ubuntu package manager
sudo apt-get install clang golang gopls tree-sitter-cli

nvim --headless -c "TSInstall go markdown markdown_inline" -c "q"
