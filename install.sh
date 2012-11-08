#! env bash

if [ ! -d ~/bin ]; then
	mkdir -p ~/bin
fi

for file in `find . -d 1`; do
	# get all executable file
	if [ -x $file ] && [ ! -d $file ] && [ `basename $file` != "install.sh" ]; then
		cp $file ~/bin/
	fi
done
	

