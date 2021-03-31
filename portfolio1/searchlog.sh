#!/bin/bash

# Write a script that allows the user to search for specific lines in a server access log according to a pattern_ 
#   _they provide and have these lines written to a new file for further use.
# Call the script searchlog.sh
# Prompt the user for:
#   a) The pattern to be searched for
#   b) Whether they want an whole word match or any match on the line
#   c) If they want to do an inverted match, i.e. retrieve lines that do not contain the pattern
# If no match is found, report to the user “No matches found”.
# If a match is found, echo the number of matches found, e.g. 5 matches found, and then each of_ 
#   _matching word(s)/line(s) to the terminal with their corresponding line numbers in the source file.
# In either case, ensure the user has the option to do another search if they so wish or exit the script.
# Ensure all search options are case-insensitive.
# To assist you in writing this script, a file named access_log.txt has been supplied with sample server_ 
#   _access data. Please note that your tutor will use a file with the same name and structure as the_ 
#   _access_log.txt file provided, but containing different data. Do not therefore hard-code any of the_ 
#   _values within the access_log.txt file provided.
# When your tutor marks your script, the access_log.txt file used will be located in the same directory_ 
#   _as your script when marked. There is no need therefore to prompt for the location of access_log.txt_
#   _as part of your script.

scount=0

while true; do
    if [[ $scount -eq 0 ]]; then
        read -p "Enter [1] to Search or [2] to Exit: "
    else
        read -p "Enter [1] to Search Again or [2] to Exit: "
    fi

    if  [[ $REPLY -eq 1 ]]; then
        clear
    else
        break

        read - 'Enter [1] to search a whole word match, [2] to search any match
        or [3] to search an inverted match: '
            if [[ $REPLY -eq 1 ]]; then
                    # grep 
            elif [[ $REPLY -eq 2 ]]; then
                    # grep -o match part of the file only
            elif [[ $REPLY -eq 3 ]]; then
                    # grep -v inverted search
            else   
                break
        orgifs=$IFS
        IFS=$'n/'
        grep -i access_log.txt
        if [[ sterm  ]]