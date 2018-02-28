#short script to change file extensions of .JPG files to .png
#by Brenton Moodlely

#__HOW IT WORKS:__
#-x flag removes according to the given pattern (in this case everything ending with ".png")
#-a appends a string to the end of the filename (in this case ".JPG")

#__WARNINGS:__
#running this script multiple times will cause problems
#always keep a back up of the image folder

if [ "$1" != "" ]; then
    directory=$1
else
    echo "No path specified"
	exit -1
fi

rename -x "$directory"/*.JPG
rename -a .png "$directory"/*
echo "Revert from .JPG to .png complete\n"