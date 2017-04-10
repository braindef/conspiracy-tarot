!/bin/bash

if  [ "$1" = "" ]
then
echo -e "
\e[39m
Usage:
------
To generate the Enlgish PDF sheets: \e[36m./generateA6.sh EN\e[39m
To generate the German  PDF sheets: \e[36m./generateA6.sh DE\e[39m

"
exit 0
fi


mkdir -p ~/PDF/oldPDFs
mv ~/PDF/* ~/PDF/oldPDFs


find ../assembled/$1/A4 -name "*.svg" >./pdf_$1_A4.txt
find ../assembled/$1/A6 -name "*.svg" >./pdf_$1_A6.txt

echo making directories
mkdir -p ../pdf/$1/A4
mkdir -p ../pdf/$1/A6


# /usr/bin/inkscape &

counter=0

for j in $(echo "./pdf_$1_A4.txt" "./pdf_$1_A6.txt")
 do
 echo j: $j
 for i in $(cat $j)
  do
  echo i: $i

   /usr/bin/inkscape $i &

   sleep 10
   xdotool key ctrl+p
   sleep 0.8
   xdotool key Right Right Right Right 
   sleep 0.5
   xdotool key Down Down Down Down 
   sleep 0.1
   xdotool key Tab  
   sleep 0.1
   xdotool key Tab  
   sleep 0.1
   xdotool key Tab  
   sleep 0.1
   xdotool key KP_Enter
   sleep 5
   xdotool key alt+F4

   echo printed $i

  done

 echo -e "

          my cups-pdf printer is slow, so we wait here 2 Min
"
 sleep 60

 echo moving $j 

 if  [ "$j" = "./pdf_$1_A4.txt" ]
  then
   mv ~/PDF/*.pdf ../pdf/$1/A4
  else
   mv ~/PDF/*.pdf ../pdf/$1/A6
 fi

done


