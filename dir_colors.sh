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

get_sys_colors() {
    # Obtain the default system colors 
    for i in `eval echo {0..$(( ${#DirList[@]} - 1 ))}`
    do
        DirVals[i]=`dircolors -p | grep -w ${DirList[i]} | cut -d" " -f2`
    done
}

get_user_colors() {
    for i in `eval echo {0..$(( ${#DirList[@]} - 1 ))}`
    do
        DirVals[i]=`cat ~/.dircolors | grep -w ${DirList[i]} | cut -d" " -f2`
    done
}

print_colors() {
    for i in `eval echo {0..$(( ${#DirList[@]} - 1 ))}`
    do
        echo -e "\e[${DirVals[i]}m${DirLong[i]}\e[0m ${DirVals[i]}"
    done
}

# Find and echo system color settings base on dircolors
echo System color settings:
get_sys_colors
print_colors; echo

# Find and echo user color settings based on user's ~/.dircolors
if [ -f ~/.dircolors ]
then
    echo User color settings:
    get_user_colors
    print_colors; echo
fi


<<COMMENT
# This is how I did it originally. I redid it with the new functions above to make it easier to add and subtract items from the list.
# Note that the function names are repeated so uncommenting this will result in two definitions of the same function name.

get_sys_colors() {
    DIR=`dircolors -p | grep -w DIR | cut -d" " -f2`
    LINK=`dircolors -p | grep -w LINK | cut -d" " -f2`
    FIFO=`dircolors -p | grep -w FIFO | cut -d" " -f2`
    SOCK=`dircolors -p | grep -w SOCK | cut -d" " -f2`
    DOOR=`dircolors -p | grep -w DOOR | cut -d" " -f2`
    BLK=`dircolors -p | grep -w BLK | cut -d" " -f2`
    CHR=`dircolors -p | grep -w CHR | cut -d" " -f2`
    ORPHAN=`dircolors -p | grep -w ORPHAN | cut -d" " -f2`
    SETUID=`dircolors -p | grep -w SETUID | cut -d" " -f2`
    SETGID=`dircolors -p | grep -w SETGID | cut -d" " -f2`
    CAPABILITY=`dircolors -p | grep -w CAPABILITY | cut -d" " -f2`
    STICKY_OTHER_WRITABLE=`dircolors -p | grep -w STICKY_OTHER_WRITABLE | cut -d" " -f2`
    OTHER_WRITABLE=`dircolors -p | grep -w OTHER_WRITABLE | cut -d" " -f2`
    STICKY=`dircolors -p | grep -w STICKY | cut -d" " -f2`
    EXEC=`dircolors -p | grep -w EXEC | cut -d" " -f2`
}

get_user_colors() {
    DIR=`cat ~/.dircolors | grep DIR | cut -d" " -f2`
    LINK=`cat ~/.dircolors | grep -w LINK | cut -d" " -f2`
    FIFO=`cat ~/.dircolors | grep -w FIFO | cut -d" " -f2`
    SOCK=`cat ~/.dircolors | grep -w SOCK | cut -d" " -f2`
    DOOR=`cat ~/.dircolors | grep -w DOOR | cut -d" " -f2`
    BLK=`cat ~/.dircolors | grep -w BLK | cut -d" " -f2`
    CHR=`cat ~/.dircolors | grep -w CHR | cut -d" " -f2`
    ORPHAN=`cat ~/.dircolors | grep -w ORPHAN | cut -d" " -f2`
    SETUID=`cat ~/.dircolors | grep -w SETUID | cut -d" " -f2`
    SETGID=`cat ~/.dircolors | grep -w SETGID | cut -d" " -f2`
    CAPABILITY=`cat ~/.dircolors | grep -w CAPABILITY | cut -d" " -f2`
    STICKY_OTHER_WRITABLE=`cat ~/.bash_dircolors | grep -w STICKY_OTHER_WRITABLE | cut -d" " -f2`
    OTHER_WRITABLE=`cat ~/.dircolors | grep -w OTHER_WRITABLE | cut -d" " -f2`
    STICKY=`cat ~/.dircolors | grep -w STICKY | cut -d" " -f2`
    EXEC=`cat ~/.dircolors | grep -w EXEC | cut -d" " -f2`
}

print_colors() {
    echo -e "\e[${DIR}mdirectory\e[0m"
    echo -e "\e[${LINK}msymbolic link\e[0m"
    echo -e "\e[${FIFO}mpipe\e[0m"
    echo -e "\e[${SOCK}msocket\e[0m"
    echo -e "\e[${DOOR}mdoor\e[0m"
    echo -e "\e[${BLK}mblock device driver\e[0m"
    echo -e "\e[${CHR}mcharacter device driver\e[0m"
    echo -e "\e[${ORPHAN}msymlink to nonexistent file, or non-stat'able file\e[0m"
    echo -e "\e[${SETUID}mfile that is setuid (u+s)\e[0m"
    echo -e "\e[${SETGID}mfile that is setgid (g+s)\e[0m"
    echo -e "\e[${CAPABILITY}mfile with capability\e[0m"
    echo -e "\e[${STICKY_OTHER_WRITABLE}mdir that is sticky and other-writable (+t,o+w)\e[0m"
    echo -e "\e[${OTHER_WRITABLE}mdir that is other-writable (o+w) and not sticky\e[0m"
    echo -e "\e[${STICKY}mdir with the sticky bit set (+t) and not other-writable\e[0m"
    echo -e "\e[${EXEC}mfiles with execute permission\e[0m"
}

# Find and echo system color settings base on dircolors
echo System color settings:
get_sys_colors
print_colors; echo

# Find and echo user color settings based on user's ~/.dircolors
if [ -f ~/.dircolors ]
then
    echo User color settings:
    get_user_colors
    print_colors; echo
fi
COMMENT