#!/bin/bash

clear

if  [ "$1" = "" ]
then
echo -e "
\e[39m
Usage:
------
To generate the Enlgish PNGs sheets: \e[36m./generatePNGs.sh EN\e[39m
To generate the German  PNGs sheets: \e[36m./generatePNGs.sh DE\e[39m


"
exit 0
fi


clear


find ../cards/$1 -name "*.svg" >./PNGs.txt

counter=0

for i in $(cat ./PNGs.txt)
  do
  let counter=counter+1
  /usr/bin/inkscape $i &
  sleep 8
  xdotool key Ctrl+Alt+a
  sleep 1
  xdotool key Ctrl+Shift+e
  sleep 1
  xdotool key Tab Tab Tab KP_Space
  sleep 1
  xdotool key Tab Tab Tab Tab Tab Tab Tab Tab Tab
  sleep 1
  xdotool type "1000"
  #xdotool click 1 if key-shortcuts do not work you can also use mouse commands
  sleep 1
  #xdotool key Ctrl+a
  xdotool key Tab Tab Tab
  sleep 1
  xdotool key Ctrl+a Delete
  pngpath=$(dirname $(pwd))/png
  echo $pngpath
  xdotool key Alt+b
  sleep 1
  xdotool type "$pngpath/$1/"
  xdotool type $(basename $i .svg)
  sleep 1
  xdotool type '.png'
  sleep 1
  xdotool key KP_Enter
  sleep 1
  #xdotool key Alt+e
  sleep 2
  xdotool key Ctrl+w
  sleep 1
  xdotool key Alt+F4
  sleep 2
  xdotool key Alt+w
done



