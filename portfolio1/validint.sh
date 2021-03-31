#!/bin/bash

# Write a script that when run, prompts the user to enter a two digit numeric code (integer) that is either_
#   _equal to 20 or equal to 40.
# Call the script validint.sh
# The value input by the user must be validated to ensure that it is:
#   a) an integer, and
#   b) one of the two integers specified above
# In the event that the input entered by the user is invalid, they are to be advised of such and_ 
#   _prompted to try again.
# In addition to entering valid values, your tutor will test your validation by also entering:
#   a) An integer that is not one of the two specified above
#   b) A string, e.g. helloworld
#   c) A null value (by just pressing enter)
# Your script must detect and reject these invalid inputs and prompt the user to try again.
# The input process must continue until one of the two integers specified above is entered. Do not_ 
#   _allow the script to terminate until this occurs.
# Once one of the two allowable integers has been entered by the user, echo a message to the screen_ 
#   _that a valid input has been made and then terminate the script at this point.

while true; do # The while loop will continue until the break command is received.
    read -p 'please enter a two digit numeric code (integer) that is either equal to 20 or equal to 40: ' unit # The user is prompted to enter input.
    if [[ $unit -eq 20 ]]; then # Determine if the user input is equal to 20.
        echo "You have entered a valid integer"
        break # Valid input is received and the while loop finishes.
    elif [[ $unit -eq 40 ]]; then # Determine if the user input is equal to 40.
        echo "You have entered a valid integer"
        break # Valid input is received and the while loop finishes.
    else
        echo "Invalid input. Please enter a two digit numeric code (integer) that is either equal to 20 or equal to 40" # Invalid input is received and the while loop continues.
    fi
done

exit 0