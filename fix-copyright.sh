#!/usr/bin/env sh
#: Update the copyright date for all Haskell files in and under the current directory.
#: You will see a preview of all changes before they are made.

for file in `find . \( -name '*.hs' -o -name '*.cabal' -o -name LICENSE \)`

do
	echo Editing $file
#	sed 's/(c) Amy de Buitléir \(20..\)$/(c) Amy de Buitléir \1-2022/; s/ \(20..\) Amy de Buitléir/ \1-2020 Amy de Buitléir/; s/-20../-2022/' $file > $file.backup
        sed '
             s/(c) Amy de Buitléir \(.*\)/(c) \1 Amy de Buitléir/
             s/\((c) 20..\)$/\1-2022/
             s/\((c) 20..\)-..../\1-2022/
             s/\(copyright: *20..\)$/\1-2022/
             s/\(copyright: *20..\)-..../\1-2022/
            ' $file > $file.backup
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
