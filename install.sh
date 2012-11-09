#! /usr/bin/env bash

x_realpath() {
	cd `dirname $1`
	echo "$(pwd)/$(basename $1)"
}

if [ ! -d ~/bin ]; then
	mkdir -p ~/bin
fi

for file in `find . -maxdepth 1`; do
	# get all executable file
	if [ -x $file ] && [ ! -d $file ] && [ `basename $file` != "install.sh" ]; then
		source_file=`x_realpath $file`
		target_file="$HOME/bin/$(basename $file)"

		# remove origin file
		if [ -e $target_file ]; then
			rm $target_file
		fi
		# link to ~/bin/
		ln -s $source_file $target_file
	fi
done

