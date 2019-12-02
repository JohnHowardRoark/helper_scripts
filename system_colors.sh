#!/bin/bash

# Clear the screen because the chart is large.
clear

# Display the 16 color palette.
echo Colors-16
for i in {30..37}
do
    j=$((i + 10))
    echo -en "\e[00;${j}m ${j} \e[0m"
    echo -en "\e[00;${i}m ${i} \e[0m"
done; echo; echo

# Display the 256 color palette.
# The first 16 follow their own pattern.
echo -n Colors-256
for i in {0..15}
do
    if [ $(( i % 8)) -eq 0 ];then echo; fi
    printf "\e[00;48;05;${i}m %03d \e[0m" ${i};
    printf "\e[00;38;05;${i}m %03d \e[0m" ${i};
done; echo

# The remaining colors have a different pattern.
echo
for i in {0..39}
do    
    for j in {16..21}
    do
        k=$(( i * 6 + j ))
        printf "\e[00;48;05;${k}m %03d \e[0m" ${k};
        printf "\e[00;38;05;${k}m %03d \e[0m" ${k};
    done; echo
done