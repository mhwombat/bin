#!/bin/bash
#: Set the colour of the bash prompt according to the current directory.
set_fg() {
    red=$1
    green=$2
    blue=$3
    echo "\[\x1b[38;2;${red};${green};${blue}m\]"
}

set_bg() {
    red=$1
    green=$2
    blue=$3
    echo "\[\x1b[48;2;${red};${green};${blue}m\]"
}

choose_dir_colour() {
    d=`pwd | cksum | sed 's/ .*//'`
    # echo $d
    r=`expr $d / 1000000` # First 4 digits of checksum
    g=`expr $d / 1000`
    g=`expr $g % 1000` # Next 3 digits of checksum
    b=`expr $d % 1000` # Last 3 digits of checksum
    # echo $r $g $b
    r=`expr $r % 128` # choose red component
    g=`expr $g % 128` # choose blue component
    b=`expr $b % 128` # choose green component
    echo $r $g $b
}

set_prompt() {
    reset_colours="\[\x1b[0m\]"
    dir_colour=$(choose_dir_colour)
    fg=$(set_fg 255 255 255)
    bg=$(set_bg $dir_colour)
    user_host="\\\\u@\\\\h" # username + '@' + the hostname up to the first `.'
    dir="\\\\w" # the current working directory
    prompt="\\\\$" # if the effective UID is 0, a #, otherwise a $
    PS1="$(printf "${fg}${bg}${user_host}:${dir} ${prompt}${reset_colours}") "
}

PROMPT_COMMAND='set_prompt'
