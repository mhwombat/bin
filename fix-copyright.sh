#!/usr/bin/env sh
#: Update the copyright date for all Haskell files in the current Stack project.
#: You will see a preview of all changes before they are made.

for file in `find . -regextype posix-egrep -regex '.*\.hs|.*\.cabal|package.yaml|LICENSE' | grep -v '^./.stack-work' | 
grep -v -e '/Setup.hs'`
do
	echo Editing $file
	sed 's/(c) Amy de Buitléir \(20..\)$/(c) Amy de Buitléir \1-2019/; s/ \(20..\) Amy de Buitléir/ \1-2019 Amy de Buitléir/; s/-20../-2019/' $file > $file.backup
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
