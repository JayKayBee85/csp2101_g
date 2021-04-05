#!/bin/bash

# Write a script that counts the number of files and child directories within a specified directory according to a_ 
#   _specified property.
# Call the script countdf.sh
# When the script is run, the path to a directory will be used by your tutor at the command line, e.g._ 
#   _./countdf.sh ~/CSI6203/backups/june2020. This is an example path only, so do not hardcode it into your script. The directory specified by your tutor will contain:
#   a number of text files that contain data
#   a number of text files that do not contain any data
#   a number of child directories that themselves contain files and directories
#   a number of child directories that are themselves empty
# The output of the script to the terminal will appear as follows:
#   The [dirname] directory contains:
#   x files that contain data
#   x files that are empty
#   x non-empty directories
#   x empty directories
#   where [dirname] represents the directory of your tutor’s choosing and x represents the_ 
#   _number of files and directories found matching each criterion.
# Be sure that the script can be run from any directory it is placed in within your tutor's Linux user_ 
#   _directory structure.
# Use an appropriate loop structure in conjunction with file and directory test commands to achieve_ 
#   _this outcome. Do not use the find command in your task solution.
# Do not count files or directories that exist within any of the child directories.
# There is no need for data validation in this script; your tutor will enter a full path/directory that does_
#   _exist and within which a range of files and child directories also exist.

cnt=0 # The count of files and directories begins at zero.
dirname=$1 # The directory name is entered on the command line and set in the variable $dirname.

echo "The $dirname directory contains; " # The dirctory name entered is echoed onto the first line.

for i in $1/*; do # Searching for items within the directory entered in the command line.
    if [ -f $f ]; then # Confirming the item is a file.
        f=$((cnt++)) # The number of files are counted up from zero.
        if [ -s $f ]; then # If the file is not zero in size.
            echo "$cnt files that contain data" # Echo the number of files not zero in size.
        else
            echo "$cnt files that are empty" # Otherwise echo the number of files as empty.
        fi
    elif [ -d $d ]; then # Confirming the item is a directory.
        d=$((cnt++)) # The number of directories are counted up from zero.
        if [ -s $d ]; then # If the directory is not zero in size.
            echo "$cnt non-empty directories" # Echo the number of directories not empty.
        else
            echo "$cnt empty directories" # Otherwise echo the number of empty directories.
        fi 
    else
        break # If neither a file or directory, then break and finish.
    fi
done

exit 0 # Complete script with zero errors.
