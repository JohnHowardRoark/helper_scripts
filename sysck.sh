#!/bin/bash

# not sure what this does
# export LC_ALL=C 

clear
echo "Checking what stuff is installed..."
echo

echo "*** shells ***"
echo bash $(bash --version | head -n1 | cut -d" " -f3-4)
echo dash version $(apt-cache policy dash | head -n2 | tail -n1 | cut -d" " -f4)
MYSH=$(readlink -f /bin/sh)
echo "/bin/sh -> $MYSH"
unset MYSH
echo

echo "*** GNU C and C++ compilation ***"
gcc --version | head -n1
echo 'int main(){}' > dummy.c && gcc -o dummy dummy.c
if [ -x dummy ]
    then echo "gcc compilation OK";
    else echo "gcc compilation failed";
fi
rm -f dummy dummy.c

g++ --version | head -n1
echo 'int main(){}' > dummy.c && g++ -o dummy dummy.c
if [ -x dummy ]
    then echo "g++ compilation OK";
    else echo "g++ compilation failed";
fi
rm -f dummy dummy.c
echo

echo "*** libraries and utility packages ***"
echo -n Coreutils `chown --version | head -n1 | cut -d" " -f2-4`
echo "   -> obtained from chown --version"

# echo -n Coreutils version `dpkg -l | grep coreutils | cut -b54-70`
# echo "  -> obtained from dpkg -l"

echo -n Binutils `ld --version | head -n1 | cut -d" " -f3-`
echo "  -> obtained from ld --version"

echo -n Glibc `ldd --version | head -n1 | cut -d" " -f2-`
echo "  -> obtained from ldd --version"

ctags --version | head -n1
echo

echo "*** languanges/interpreters ***"
python2 --version | head -n1
python3 --version | head -n1
perl --version | head -n2 | tail -n1 | cut -d" " -f3-9
m4 --version | head -n1
bc --version | head -n1
echo

echo "*** awk/gawk/nawk/mawk ***"
gawk --version | head -n1

if [ -h /usr/bin/awk ]; then
 echo "/usr/bin/awk  -> `readlink -f /usr/bin/awk`";
elif [ -x /usr/bin/awk ]; then
 echo awk is `/usr/bin/awk --version | head -n1`
else
 echo "awk not found"
fi

if [ -h /usr/bin/nawk ]; then
    echo "/usr/bin/nawk -> `readlink -f /usr/bin/nawk`";
elif [ -x /usr/bin/nawk ]; then
    nawk --version | head -n1
fi

if [ -h /usr/bin/mawk ]; then
 echo "/usr/bin/mawk -> `readlink -f /usr/bin/mawk`";
elif [ -x /usr/bin/mawk ]; then
 echo "/usr/bin/mawk -> mawk version" `dpkg -l | grep mawk | cut -b54-70`
else
 echo "mawk not found"
fi
echo

echo "*** yacc/bison ***"
bison --version | head -n1
if [ -h /usr/bin/yacc ]; then
 echo "/usr/bin/yacc -> `readlink -f /usr/bin/yacc`";
elif [ -x /usr/bin/yacc ]; then
 echo yacc is `/usr/bin/yacc --version | head -n1`
else
 echo "yacc not found"
fi
echo

echo "*** archiving and compression ***"
tar --version | head -n1
gzip --version | head -n1
bzip2 --version 2>&1 < /dev/null | head -n1 | cut -d" " -f1,6-
xz --version | head -n1
diff --version | head -n1
patch --version | head -n1
echo

echo "*** some utilities ***"
grep --version | head -n1
find --version | head -n1
sed --version | head -n1
make --version | head -n1
makeinfo --version | head -n1 # texinfo version
flex --version
echo

echo "*** git and kernel stuff ***"
git --version
# esmtp
mutt -v | head -n1
echo git-email version `dpkg -l | grep git-email | cut -b54-70`
echo gitk version `dpkg -l | grep gitk | cut -b54-70`
echo

# lvm version | head -n1

echo "*** current kernel ***"
cat /proc/version | cut -d" " -f1-3
