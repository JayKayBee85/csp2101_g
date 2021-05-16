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

# cnt=0
dirname=$1 # The directory name is entered on the command line and set in the variable $dirname.
ef=0
nef=0
ed=0
ned=0

# echo "The $dirname directory contains; " # The dirctory name entered is echoed onto the first line.

for i in $1/*; do # Searching for items within the directory entered in the command line.

    # This nested if is for the file counts
    if [ -f $i ]; then # Confirming the item is a file.
        if [ -s $i ]; then # If the file is not zero in size.
            ((nef++))
        else
            ((ef++))
        fi
    fi

    # This nested is for the directory counts
    if [ -d $i ]; then # Confirming the item is a directory.
        if [[ $(ls -A $i) ]]; then # If the directory is not zero in size.
            ((ned++))
        else
            ((ed++))
        fi
    fi

done

echo "The $1 directory contains:"
echo "$nef non empty files"
echo "$ef empty files"
echo "$ned non empty directories"
echo "$ed empty directories"

exit 0 # Complete script with zero errors.

