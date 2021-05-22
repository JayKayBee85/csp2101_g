#!/bin/bash

protocol() {

}

srcip() {

}

srcport() {

}

destip() {

}

destport() {

}

packets() {

}

bytes() {

}

class() {

}

scount=0

while true; do 
    if [[$scount -eq 0 ]]; then
        read - -p "Enter [1] to search or [2] to exit: " reply
    else
        read -p "Enter [1] to search again or [2] to exit: " reply
    fi

    if [[ $reply -eq 2 ]]; then 
        break
    else
        clear

        declare -a logs
        patt="serv_acc_log.+csv$"
        mennum=1

        for file in ./*; do
            if [[ $file =~ $patt ]]; then
                logs+=($(basename $file))
            fi
        done

        count=${#logs[*]}
        echo -e "There are $count files.\n"

        for file in "${logs[@]}"; do
            echo -e "$mennum $file"
            ((mennum++))

            read -p "Enter [1] to search all logs, or any key to search a specific log: " logsearch

            if [[ $logsearch -eq 1 ]]; then
                read "Enter the number of criteria you wish to search between 1 and 3, i.e. [1], [2], or [3] criteria: " numsearch
                echo "You have selected $numsearch criteria"

                if [[ $numsearch -eq 1 ]]; then
                    read -p 'Enter a search term:' sterm1
                
                elif [[ $numsearch -eq 2 ]]; then
                    read -p 'Enter a search term:' sterm1
                    read -p 'Enter a search term:' sterm2
                
                elif [[ $numsearch -eq 3]]; then
                    read -p 'Enter a search term:' sterm1
                    read -p 'Enter a search term:' sterm2
                    read -p 'Enter a search term:' sterm3

                else
                    echo "The entry you made is invalid."
                    exit 1

            elif [[ $logsearch -eq 2 ]]; then
                echo -e "\t"
                read -p "Enter the number of the log file to search by corresponding number, i.e. [1, 2, 3, 4 or 5]" selected
                echo "You have selected $sel"
                read "Enter the number of criteria you wish to search between 1 and 3, i.e. [1], [2], or [3] criteria: " numsearch
                echo "You have selected $numsearch criteria"

                if [[ $numsearch -eq 1 ]]; then
                    read -p 'Enter a search term:' sterm1
                
                elif [[ $numsearch -eq 2 ]]; then
                    read -p 'Enter a search term:' sterm1
                    read -p 'Enter a search term:' sterm2
                
                elif [[ $numsearch -eq 3]]; then
                    read -p 'Enter a search term:' sterm1
                    read -p 'Enter a search term:' sterm2
                    read -p 'Enter a search term:' sterm3

                else
                    echo "The entry you made is invalid."
                    exit 1

            else
                echo "The entry you made is invalid."
                exit 1
            fi

        read - p 'Enter the name of the file you wish to save your search results: ' filename

        protocol $sterm1 $sterm2 $sterm3
        srcip $sterm1 $sterm2 $sterm3
        srcport $sterm1 $sterm2 $sterm3
        destip $sterm1 $sterm2 $sterm3
        destport $sterm1 $sterm2 $sterm3
        packets $sterm1 $sterm2 $sterm3
        bytes $sterm1 $sterm2 $sterm3
        class $sterm1 $sterm2 $sterm3

        done #needs to match up with the clear command to complete actions following the option to continue searching.
    fi #Indicates the search has finished.
    ((scount++)) #Keeps count of how many searches have been completed.
    #Check if IFS is needed here

done #Indicates the searching is complete.

exit 0  #Script ends with no errors.