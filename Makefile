# that's vim, duh
vim:
	sh ./scripts/link.sh vim

# manage ruby environment
rbenv:
	brew install rbenv ruby-build
	sh ./scripts/link.sh rbenv

# fancy cat with syntax highlight
bat:
	brew install bat
	sh ./scripts/add_env.sh BAT_STYLE plain

# fuzzy finder
fzf:
	brew install fzf
	sh ./scripts/add_env.sh FZF_DEFAULT_OPTS "--preview 'bat --style=numbers --color=always {}' --bind 'ctrl-y:execute-silent(echo {} | tr -d \"\\\n\" | pbcopy)'"

