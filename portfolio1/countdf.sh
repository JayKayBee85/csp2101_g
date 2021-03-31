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

cnt=0
dirname=$1

echo "The $dirname directory contains; "

for item in .* *; 
do 
    if [ -f $item ]; then
        fsize=$((cnt++))
        if [[ $fsize -gt 0 ]]; then
            echo -e $fsize "files that contain data"
        else
            echo -e $fsize "files that are empty"
    else [ -d $item ]; then
        dsize=$((cnt++))
        if [[ $dsize -gt 0 ]]; then
            echo -e $dsize "non-empty directories"
        else 
            echo -e $dsize "empty directories"
        fi
    fi
done

exit 0
