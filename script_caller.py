import os
import sys

#Checks if -v flag is present. This enables or disables verbose output.
verbose = "0"
if len(sys.argv) > 1:
	if sys.argv[1] == "-v":
		verbose = "1"

#Takes directory of uncropped image folder as string input.
crop_directory = raw_input("Usage: Enter name of directory of images to be cropped.\nMust be in the current directory\n(n to cancel)\nDirectory: ")
print "\n"

#"n" when specifying an initial directory will terminate the script.
if  crop_directory == "n":
	print "exiting"
	exit(0)

#Check to see if the input directory exists and is a directory
if not os.path.isdir("./" + crop_directory):
	print crop_directory,"is an invalid directory\nexiting"
	exit(0)
else:
	if verbose == "1": print crop_directory,"is a valid directory\nworking...\n"

#Check to see if folder names already exist to protect from data overwrites, followed by a prompt to continue or not
if os.path.isdir("./pics_normal") or os.path.isdir("./pics_large") or os.path.isdir("./pics_medium") or os.path.isdir("./pics_small") or os.path.isdir("./pics_micro"):
	print "WARNING: Some folders already exist. Files could be overwritten"
	ans = raw_input("Continue?(y/n): ")
	if not ans == "y":
		print "exiting..."
		exit(0)

if verbose == "1": print "\n**Beginning crop"
os.system("sh crop.sh " + crop_directory + " " + verbose)
if verbose == "1": print "**Beginning extension conversion"
os.system("sh png_to_JPG.sh pics_normal, " + verbose)
if verbose == "1": print "**Beginning folder creation"
os.system("sh rename_sizes.sh")
if verbose == "1": print "\n**DONE!"

#To do:
#verify input directory
#further error checking