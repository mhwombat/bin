#!/usr/bin/env sh
#: A template for making a change to a group of files,
#: previewing each change before it is made.

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
    sed 's/aaaaa/bbbbb/' $file > $file.new
    diff $file $file.new
    result=$?
    if [ $result -gt 0 ] ; then 
        if [ ! -z "$force" ]; then
            answer="y"
        else
            read -p "ok (y/n/A) " answer
            echo "answer=" $answer
            if [ "$answer" = "A" ] ; then
            force=1
            fi
        fi
        if [ "$answer" = "y" ] ; then
            mv -f $file $file.backup
            mv -f $file.new $file
            echo File replaced
        fi
    else
        rm $file.new
    fi
done
