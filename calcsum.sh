#!/bin/bash

# Write a script that calculates the sum of three (3) integers passed to it through the command line and_ 
#   _display this to the terminal. If however this sum exceeds 30, give the user a warning indicating this and then_ 
#   _exit the script.
# Call the script calcsum.sh
# When the script is run, your tutor will enter three (3) integers on the command line, e.g._ 
#   _./calcsum.sh 5 10 12. These are example values only, so do not hard-code these into your_ 
#   _script. Your tutor will use different values when marking your script.
# If the sum of the integers passed is less than or equal to 30, the output of the script to the terminal_
#   will appear as follows:
#   "The sum of x and x and x is x" 
#   where x represents the integers passed to the script when it is run and their calculated sum._ 
#   _However, if the sum of the integers passed is greater than 30, the output of the script to the_ 
#   _terminal will appear as follows:
#   "Sum exceeds maximum allowable"
# In either case, your script will then terminate.
# Your script must use bash default variables to hold the passed integers and as arguments in the sum_ 
#   _calculation. You may only create a custom variable for the sum of the integers.
# There is no need for input validation in this script; your tutor will enter three (3) integers as required_ 
#   _when the script is run.

sum=$(($1 + $2 + $3)) # Three integers are all added together when entered onto the command line

if [[ $sum -le 30 ]]; then # The total integer ammount is assessed to detemine if it is less than or equal to 30.
    echo "The sum of $1 and $2 and $3 is $sum" # If the result is true the total amount is shown.

else
    echo "Sum exceeds maximum allowable" # If the result is false a result is not given.
fi # Script terminated.

exit 0