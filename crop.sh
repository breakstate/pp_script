#Small shell script to automate picture cropping 
#By Brenton Moodley

#__HOW IT WORKS:__
#bash loop that goes through each file at the given file path containing the extension ".JPG"
#convert is a function in the ImageMagick pack
#-crop option requires size of rectangle (a square is a rectangle) as well as offset in px from top and bottom of original image
#image is then renamed (back to the original name in this case)

#__THINGS TO NOTE:__
#RECOMMENDED that these values are determined in the following way:
#[original image x] - [output image x] / 2
#[original image y] - [output image y] / 2
#for a square, centered resultant image
#
#May take longer than you expect. Estimate 1-3 seconds per image.

#__WARNING__:
#running this script more than once is not recommended.
#please keep a backup of the image folder incase things go wrong. 


if [ "$1" != "" ]; then
    directory=$1
else
    echo "No path specified for cropping"
	exit -1
fi

if [ "$2" == "1" ]; then v=1; fi

if [ $v ]; then echo "copying images..."; fi
cp -r "$directory" pics_normal
if [ $v ]; then echo "images copied"; fi

for file in pics_normal/*.JPG	#for every file ending in ".png" at the given file path
do	
	convert "$file" -crop 1500x1500+2092+1228 "${file}"
	if [ $v ]; then echo "${file} cropped"; else printf "." -n; fi
done
echo ""
if [ $v ]; then echo "-cropping script exit\n"; fi