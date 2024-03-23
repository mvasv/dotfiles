#!/usr/bin/env zsh

git config --global alias.co checkout
git config --global alias.cob 'checkout -b'
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.stv 'status -vv'
git config --global alias.gr 'log --graph --oneline --all'
git config --global alias.mt mergetool

git config --global --add --bool push.autoSetupRemote true

git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false

git config --global core.editor /usr/bin/vim
