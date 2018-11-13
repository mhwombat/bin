#!/bin/sh

force=
#bflag=

while getopts ab: name
do
    case $name in
    a)    force=1;;
#    b)    bflag=1
#         bval="$OPTARG";;
    ?)    printf "Usage: %s: [-a] [-b value] args\n" $0
          exit 2;;
    esac
done

if [ ! -z "$force" ]; then
    printf "Option -a specified\n"
fi
if [ ! -z "$bflag" ]; then
    printf 'Option -b "%s" specified\n' "$bval"
fi
#shift $(($OPTIND - 1))
#printf "Remaining arguments are: %s\n" "$*"

for file in `ls *.html`
do
	echo Editing $file
	sed 's/aaaaa/bbbbb/' $file > $file.backup
	diff $file $file.backup
	result=$?
	if [ $result -gt 0 ] ; then 
		if [ ! -z "$force" ]; then
		    answer="y"
		else
		    read -p "ok (y/n) " answer
		    echo "answer=" $answer
		fi
		if [ "$answer" = "y" ] ; then 
			cp $file.backup $file
			echo File replaced
		fi
	else
		rm $file.backup
	fi
done
