#!/usr/bin/env bash
#: A template for a script that synchronises two directories,
#: except that instead of copying files it performs some sort
#: of transformation.

# The directory containing the files to be transformed
SOURCE_DIR="clear"

# The directory to contain the transformed files
TARGET_DIR="encrypted"

# A function which, given the path to a source file (relative to
# SOURCE_DIR), returns the path to the corresponding target file
# (relative to TARGET_DIR).
function target-of() {
    echo "${TARGET_DIR}/${1#*/}.copy"
}

# A function which, given the path to a target file (relative to
# TARGET_DIR), returns the path to the corresponding source file
# (relative to SOURCE_DIR).
function source-of() {
    echo "${SOURCE_DIR}/"`basename "${1%.copy}"`
}

# A function which, given the full path to a source file and
# target file, performs the tasks necessary to synchronise the
# two.
# Typically this involves transforming the source file to
# produce the target file.
# Note: Don't prepend SOURCE_DIR or TARGET_DIR.
function transform() {
    cp ${1} ${2}
}

# A function which, given the path to a source file and target
# file (relative to the current directory), performs the tasks
# necessary to synchronise the two.
# Typically this consists of deleting the target file, but it
# could also involve reverse-transforming the target file to
# regenerate the source file.
# Note: Don't prepend SOURCE_DIR or TARGET_DIR.
function reverse-transform() {
    rm ${1}
}

# Invoke the supplied command, or pretend to, according to the
# command line options.
function react() {
    message=$1
    command=$2
    
    if [ -n "${message}" ]; then
        if [ ${DEBUG} ]; then
            echo "::: ${message}"
        else
            :
        fi
    fi

    if [ -n "${command}" ]; then
        if [ ${PRETEND} ]; then
            echo "I would execute: ${command}"
        else
            echo "${command}"
            `${command}`
        fi
    fi
}

while getopts "dp" options; do
    case "${options}" in
        d)    DEBUG=1;;
        p)    PRETEND=1;;
        *)    echo "Usage: ${0} [-d] args\n" 1>&2
              exit 2;;
    esac
done

mkdir -p ${TARGET_DIR}

find ${SOURCE_DIR} -type f -print0 | while read -d $'\0' source
do
    target=`target-of ${source}`
    message=""
    command=""
    
    if test -f ${target}; then
        if [ ${target} -ot ${source} ]; then
            message="${target} is out of date"
            command="transform ${source} ${target}"
        else
            message="${target} is up-to-date"
        fi
    else
        message="${target} does not exist"
        command="transform ${source} ${target}"
    fi

    react "${message}" "${command}"
done

find ${TARGET_DIR} -type f -print0 | while read -d $'\0' target
do
    source=`source-of ${target}`
    message=""
    command=""
    
    if test -f ${source}; then
        message="${source} exists"
    else
        message="${source} does not exist"
        command="reverse-transform ${target} ${source}"
    fi

    react "${message}" "${command}"

done
