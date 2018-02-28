if [ "$1" == "1" ]; then v=1; fi

if [ $v ]; then echo "creating folders..."; fi

cp -r pics_normal pics_large
cp -r pics_normal pics_medium
cp -r pics_normal pics_small
cp -r pics_normal pics_micro

if [ $v ]; then echo "folders created!"; fi
if [ $v ]; then echo "appending large_..."; fi

cd pics_large
for file in *.JPG
do
    mv "$file" "large_$file"
done

if [ $v ]; then echo "large_ appended!"; fi
if [ $v ]; then echo "appending medium_..."; fi

cd ../pics_medium
for file in *.JPG
do
    mv "$file" "medium_$file"
done

if [ $v ]; then echo "medium_ appended!"; fi
if [ $v ]; then echo "appending small_..."; fi

cd ../pics_small
for file in *.JPG
do
    mv "$file" "small_$file"
done

if [ $v ]; then echo "small_ appended!"; fi
if [ $v ]; then echo "appending micro_..."; fi

cd ../pics_micro
for file in *.JPG
do
    mv "$file" "micro_$file"
done

if [ $v ]; then echo "micro_ appended!"; fi
if [ $v ]; then echo "-rename script exit\n"; fi