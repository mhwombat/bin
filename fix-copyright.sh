#!/usr/bin/env sh
#: Update the copyright date for all Haskell files in and under the current directory.
#: You will see a preview of all changes before they are made.

YEAR=`date +%Y`

SED_SCRIPT="
s/(c) Amy de Buitléir \(.*\)/(c) \1 Amy de Buitléir/
s/(c) Amy de Buitléir, \(.*\)/(c) \1 Amy de Buitléir/
s/(c) \(.*\), Amy de Buitléir\(.*\)/(c) \1 Amy de Buitléir/
s/\(copyright: *\)\([0-9]\)/\1(c) \2/
s/\((c) 20..\)\([^-].*\)/\1-${YEAR}\2/
s/\((c) 20..\)-..../\1-${YEAR}/
# s/\(copyright:.*20..\)$/\1-${YEAR}/
# s/\(copyright:.*20..\)-..../\1-${YEAR}/
"

# echo -e "DEBUG --- sed script ---${SED_SCRIPT}DEBUG ------------------"

for file in `find . \( -name '*.hs' -o -name '*.cabal' -o -name LICENSE \)`

do
	echo Editing $file
        sed "$SED_SCRIPT" $file > $file.backup
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
