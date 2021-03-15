#!/bin/bash

print_help() {
	echo "Usage: $0 [options] [Min] Max"
	echo -e "\nOptions:"
	echo " -h, --help	print a brief description of this program and give this help list"
}

get_randint() {
	if [ -z $2 ]; then
		local min=1
		local max=$1
	else
		local min=$1
		local max=$2
	fi
	echo $(( $RANDOM % $(( $max - $min + 1 )) + $min ))
}

if [ -z $1 ] ; then
	# No arguments passed
	echo "Error: missing Max boundary"
	print_help
	exit
fi

case $1 in
	-h | --help)
		echo "randint.sh is a bash script that can generate a random integer between 1 (or a given Min boundary) and a given Max boundary"
		print_help
		exit
		;;

	*)
		get_randint $1 $2
		;;
esac

