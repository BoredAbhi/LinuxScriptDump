#!/bin/bash

HOUR="$(date +"%H")"
BASHRC=/home/abhijeet/.bashrc

echo $HOUR
echo $BASHRC

sed -i '$ d' $BASHRC #deletes last line in bashrc ... in this case konsole color is set via bashrc LAST LINE.

if [ $HOUR -gt 18 ] || [ $HOUR -lt 6 ]
then
    echo 'konsoleprofile colors=Amethyst' >> $BASHRC
else
    echo "konsoleprofile colors='Aritim Light'" >> $BASHRC
fi
