#!/usr/bin/env zsh

INPUTDIR=$(readlink -f $1)

cd "$(dirname "$0")/.."
DOTFILES=$(pwd -P)

set -e

link_file() {

	local src=$1 dst=$2
	local action=false
	local skip=false
	local overwrite=false
	local backup=false

	if [ -f "$dst" ] || [ -d "$dst" ] || [ -L "$dst" ]
	then

		local currentSrc="$(readlink $dst)"

		if [ "$currentSrc" == "$src" ]
		then
			skip=true;
		else
			echo "File already exists: $dst ($(basename "$src")), what do you want to do?\n[s]kip, [o]verwrite, [b]ackup?"
			read -n 1 action < /dev/tty
			echo ''
			
			case "$action" in
          		o )
            		overwrite=true;;
          		b )
            		backup=true;;
          		s )
            		skip=true;;
          		* )
            		;;
        	esac
		fi
	fi

	if [ $overwrite == true ]
    then
		echo "Removing $dst"
		rm -rf "$dst"
    fi

	if [ $backup == true ]
    then
      echo "Moving $dst to ${dst}.backup"
      mv "$dst" "${dst}.backup"
    fi

    if [ $skip == true ]
    then
     	echo "Skipping $src"
	else
		echo "Linking $src to $dst"
		ln -s "$src" "$dst"
    fi
}

link_files_in_dir() {

	find -H "$1" -maxdepth 1 -name 'links.prop' -not -path '*.git*' | while read linkfile
	do
		cat "$linkfile" | while read line
		do
			local src dst dir
			src=$(eval echo "$line" | cut -d '=' -f 1)
        	dst=$(eval echo "$line" | cut -d '=' -f 2)
        	dir=$(dirname "$dst")

			if [ ! -z $src ] && [ ! -z $dst ]
			then
        		mkdir -p "$dir"
        		link_file "$src" "$dst"
			fi
		done
	done
}

link_files_in_dir $INPUTDIR
