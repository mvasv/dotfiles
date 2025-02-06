vim:
	sh ./scripts/link.sh vim

rbenv:
	brew install rbenv ruby-build
	sh ./scripts/link.sh rbenv

bat:
	brew install bat
	sh ./scripts/add_env.sh BAT_STYLE plain
