#!/bin/sh

for file in `find . -regextype posix-egrep -regex '.*\.hs|.*\.cabal|LICENSE' | grep -v '^./dist' | grep -v -e '/Setup.hs'`
do
	echo Editing $file
	sed 's/\((c) Amy de Buitléir 20..\)$/\1-2018/; s/-20../-2018/' $file > $file.backup
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
