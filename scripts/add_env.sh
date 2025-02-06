#!/bin/zsh

VAR_NAME="$1"
VAR_VALUE="$2"
ZSHENV="$HOME/.zshenv"

if [ -z "$VAR_NAME" ] || [ -z "$VAR_VALUE" ]; then
    echo "Usage: $0 VAR_NAME VAR_VALUE"
    exit 1
fi

# Check if the variable is already set
if ! grep -q "^export $VAR_NAME=" "$ZSHENV"; then
    echo "export $VAR_NAME=\"$VAR_VALUE\"" >> "$ZSHENV"
    echo "$VAR_NAME added to $ZSHENV"
else
    echo "$VAR_NAME is already set in $ZSHENV. Skipping."
fi
