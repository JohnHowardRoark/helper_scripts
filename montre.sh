#!/bin/bash

ask() {
    echo "Some helpful lists:"
    echo "  r for regex list"
    echo "  t for c conversion character types"
    echo "  d for current dircolors"
    echo "  c for current dircolors"
    echo -n "Selection: ";read request; echo
}

if [ $1 ]; then request=$1; else ask; fi

if [ $request == "r" ] || [ $request == "-r" ]; then
    cat ~/bin/regex.txt | more
elif [ $request == "t" ] || [ $request == "-t" ]; then
    cat ~/bin/ctypes.txt | more
elif [ $request == "d" ] || [ $request == "-d" ]; then
    ~/bin/dir_colors
elif [ $request == "c" ] || [ $request == "-c" ]; then
    ~/bin/system_colors
fi

<<COMMENT
case $request in
    [?-]r)
        cat ~/bin/regex.txt | more
        ;;
    [?-]c)
        cat ~/bin/ctypes.txt | more
        ;;
esac
COMMENT