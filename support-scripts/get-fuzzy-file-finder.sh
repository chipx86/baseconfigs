#!/bin/sh

if test ! -e /usr/bin/gem; then
	if test -e /usr/bin/apt-get; then
		sudo apt-get install rubygems
	else
		echo "The ruby gems package is needed."
	fi
fi

sudo gem install --source=http://gems.github.com jamis-fuzzy_file_finder
