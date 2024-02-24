#!/usr/bin/env zsh

# Create a new SSH key
ssh-keygen -t ed25519 -C "your_email@example.com"

# Start the ssh-agent 
eval "$(ssh-agent -s)"

# Edit ~/.ssh/config
vi ~/.ssh/config

# Add your SSH private key to the ssh-agent and store your passphrase in the keychain
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

# Copy the contents of the id_ed25519.pub file to your clipboard
pbcopy < ~/.ssh/id_ed25519.pub
