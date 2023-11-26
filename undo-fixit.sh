#!/usr/bin/env sh

for file in `ls src/*.md`
do
    echo "=================================================="
    echo Editing $file
    backup="${file}.backup"

    if [ -e "${backup}" ]; then
        diff $backup $file
        result=$?
        if [ $result -gt 0 ] ; then
            read -p "Restore from backup? (y/n) " answer
            echo "answer=" $answer
            if [ "$answer" = "y" ] ; then
                mv $backup $file
                echo File restored
            fi
        else
            rm $backup # identical
        fi
    fi
done
