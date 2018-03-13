#short script to change file extensions of .png files to .JPG
#by Brenton Moodlely

#__HOW IT WORKS:__
#-x flag removes according to the given pattern (in this case everything ending with ".png")
#-a appends a string to the end of the filename (in this case ".JPG")

#__WARNINGS:__
#running this script multiple times will cause problems
#always keep a back up of the image folder

if [ "$1" == "1" ]; then v=1; fi

if [ $v ]; then echo "removing ".png" extension"; fi
rename -x pics_normal/*.png														# -x strips extension from filename
if [ $v ]; then echo "appended ".JPG" extension"; fi
rename -a .JPG pics_normal/*													# -a appends specified str to the end of filename
if [ $v ]; then echo "-extension conversion script exit\n"; fi