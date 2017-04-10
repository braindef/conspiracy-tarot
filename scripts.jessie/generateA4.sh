#!/bin/bash


if  [ "$1" = "" ]
then
echo -e "
\e[39m
Usage:
------
To generate the Enlgish A4 sheets: \e[36m./generateA4.sh EN\e[39m
To generate the German  A4 sheets: \e[36m./generateA4.sh DE\e[39m


"
exit 0
fi


find ../cards/$1 -name "*.svg" >./A4_$1.txt

counter=0

 for i in $(cat ./A4_$1.txt)
  do
   let counter=counter+1
   if (( $counter % 8 == 1 ))
   then 
     inkscape ../assembled/$1/A4/templateA4.svg &
     file=$(basename $i .svg)
     sleep 3
   else
     file=$file-$(basename $i .svg)
   fi
   echo $i
   echo $file 
   /usr/bin/inkscape $i &
   sleep 6
   xdotool key Ctrl+Alt+a
   sleep 2
   xdotool key Ctrl+c
   sleep 0.2
   xdotool key Alt+Escape
   sleep 0.4
   xdotool key Ctrl+v
   sleep 0.8
   xdotool key Ctrl+g
   sleep 1
   xdotool key Alt+Escape
   sleep 0.2
   xdotool key Alt+F4

   if (( $counter % 8 == 0 ))
   then 
     sleep 1
     xdotool key Ctrl+Alt+a

     sleep 0.5
     xdotool key Alt+o

     sleep 0.5
     xdotool key End KP_Enter
     sleep 0.5
     xdotool key Tab
     sleep 0.2
     xdotool type '2'
     sleep 0.2
     xdotool key Tab Tab Tab
     sleep 0.2
     #xdotool type '4'
     sleep 0.2
     xdotool key Tab Tab Tab Tab
     sleep 0.2
     xdotool type '0'
     sleep 0.2
     xdotool key Tab
     sleep 0.2
     xdotool type '0'
     sleep 0.2
     xdotool key Tab
     sleep 0.1
     xdotool key KP_Enter
     sleep 1
     xdotool key Ctrl+Alt+a
     sleep 0.2
     xdotool key Ctrl+g
     sleep 0.8
     xdotool key Shift+Ctrl+a
     sleep 0.5
     xdotool key Tab Tab Tab Tab Tab
     sleep 0.5
     xdotool key KP_Enter
     sleep 0.5
     xdotool key Tab Tab Tab Tab Tab Tab
     sleep 0.5
     xdotool key KP_Enter

     xdotool key Ctrl+Shift+s
     sleep 0.2
     echo filename $file .svg
     sleep 1
     xdotool type "$file"
     sleep 1.5
#  exit 0
     xdotool key KP_Enter
     sleep 1.5
     xdotool key Alt+F4
   fi
  done

