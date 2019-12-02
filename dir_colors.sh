#!/bin/bash

# The directories for which the color scheme will be reported.
DirList=("DIR" "LINK" "FIFO" "SOCK" "DOOR" "BLK" "CHR" "ORPHAN" "SETUID" "SETGID" "CAPABILITY" "STICKY_OTHER_WRITABLE" "OTHER_WRITABLE" "STICKY" "EXEC")

# More descriptive names, based on the output from dircolor -p.
DirLong=(
    "directory"
    "symbolic link"
    "pipe"
    "socket"
    "door"
    "block device driver"
    "character device driver"
    "symlink to nonexistent file, or non-stat'able file"
    "file that is setuid (u+s)"
    "file that is setgid (g+s)"
    "file with capability"
    "dir that is sticky and other-writable (+t,o+w)"
    "dir that is other-writable (o+w) and not sticky"
    "dir with the sticky bit set (+t) and not other-writable"
    "files with execute permission")

# A place to store the color values
DirVals=()

get_user_colors() {
    for i in `eval echo {0..$(( ${#DirList[@]} - 1 ))}`
    do
        DirVals[i]=`cat ~/.dircolors | grep -w ${DirList[i]} | cut -d" " -f2`
    done
}

get_sys_colors() {
    for i in `eval echo {0..$(( ${#DirList[@]} - 1 ))}`
    do
        DirVals[i]=`dircolors -p | grep -w ${DirList[i]} | cut -d" " -f2`
    done
}

print_colors() {
    for i in `eval echo {0..$(( ${#DirList[@]} - 1 ))}`
    do
        echo -e "\e[${DirVals[i]}m${DirLong[i]}\e[0m"
    done
}

# Show user's custom colors if they exist, otherwise show defaults.
if [ -f ~/.dircolors ]
    then get_user_colors
    else get_sys_colors
fi

# Print the colors.
echo; print_colors; echo