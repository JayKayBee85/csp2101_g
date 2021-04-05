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

scount=0 # Count is set to zero to count up with each search by the user.
 # Case statements created here for the user to select from in the pattern search menu.
WWM() {
    cat access_log.txt | -i -o grep | wc -l # Script is run when user selects to search the access_lot.txt file for case insensitive_
}        # _whole word only patterns, with the count provided in the result.


AWM() {
    cat access_log.txt | -i grep | wc -l # Script is run when user selects to search the access_lot.txt file for case insensitive_
}       # _any match patterns, with the count provided in the result.


WIM() {
    cat access_log.txt | -i -v -o grep | wc -l # Script is run when user selects an inverted search of the access_lot.txt file for case insensitive_
}        # _whole word only patterns, with the count provided in the result.


AIM() {
    cat access_log.txt | -i -v grep | wc -l # Script is run when user selects an inverted search of the access_lot.txt file for case insensitive_
}        # _any match patterns, with the count provided in the result.


while true; do # While loop is creatd for the purpose of allowing the user to do more than 1 search.
    if [[ $scount -eq 0 ]]; then #Prompts the user when their first search commences as there is no prior count of a search being done.
        read -p "Enter [1] to Search or [2] to Exit: " # User is prompted for their initial search when count is zero.
    else
        read -p "Enter [1] to Search Again or [2] to Exit: " # If count is more than zero, there has been a prior search counted and new message appears.
    fi # This section of the while loop finishes

    if  [[ $REPLY -eq 1 ]]; then # The user selects 1 to search again and the screen is cleared to begin the search.
        clear
    else
        break # If the user selects an option other than 1 the search breaks and exits from the while loop.

        read -p 'Enter the pattern to be searched: ' sterm #User enters the pattern that they wish to search as prompted.
        orgifs=$IFS # IFS - Internal Field Separator variable is set
        IFS=$'\n' # IFS is used to create a new line
        
        echo -e "$sterm to be searched for:\n[1] Whole word match\n[2] Any match\n[3] Whole word inverted match\n[4] Any inverted match"
            # User's term to be search is displayed and options for search types provide.
        read -p 'Enter choice [1,2,3 or 4]: ' uchoice # User selects from one of the displayed search types for which the scripts are stored in the case statements.

        case $uchoice in # The choice selected is matched with the case statements.
            1) WWM;; # Whole word match
            2) AM;; # Any match
            3) WIM;; # Whole word inverted match
            4) AIM;; # Any inverted match
            *) echo "Invalid choice" && exit 1;; #If an invalid choice is selected this message is echoed and the user is sent back to the initial option to search again.
        esac # Entered to escape the case statement
            
        done # Search is completed.

    fi
    ((scount++)) # A count is incremented each time a search is conducted.
    IFS=$orgifs # IFS reverts back to it's original value and ensure it does not affect other scripts.
    echo "" # Blank message echoed to cthe command line to clear it.

done # No more searches requested.

exit 0 # Exit with zero errors.