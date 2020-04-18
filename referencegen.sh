env -i bash # Clear any previous bash made variables
echo -e "\nWelcome to YourReferenceGenerator (YRG)\n"

author () {
    read -p "How many authors are there? " noofauthor

    if [[ "$noofauthor" -eq "1" ]]; then
    echo -e "What is the authors fullname? (e.g. Forename Surname - \e[3mForename can be a letter\e[0m) "
    read author
    
    forename=$(echo "$author" | cut -d ' ' -f 1)
    surname=$(echo "$author" | cut -d ' ' -f 2)

    authorcomplete=$(echo "${surname}, ${forename:0:1}. ")
    echo "$authorcomplete" # This command is here for now to test
    fi

    if [[ "$noofauthor" -eq "2" ]]; then
        echo -e "\nProvide both author names, using a comma to separate (e.g. Forename Surname, Forename Surname): "
        read author
        author=$(echo "$author" | sed 's/, /,/g') # Can only use one character as delimiter; comma is desired

        firstauthorfullname=$(echo "$author" | cut -d ',' -f 1)
        firstauthorforename=$(echo "$firstauthorfullname" | cut -d ' ' -f 1)
        firstauthorsurname=$(echo "$firstauthorfullname" | cut -d ' ' -f 2)
        firstauthorcomplete=$(echo "${firstauthorsurname}, ${firstauthorforename:0:1}.")
        echo -e "\n$firstauthorcomplete" # This command is here for now to test

        secondauthorfullname=$(echo "$author" | cut -d ',' -f 2)
        secondauthorforename=$(echo "$secondauthorfullname" | cut -d ' ' -f 1)
        secondauthorsurname=$(echo "$secondauthorfullname" | cut -d ' ' -f 2)
        secondauthorcomplete=$(echo "${secondauthorsurname}, ${secondauthorforename:0:1}.")
        echo "$secondauthorcomplete" # This command is here for now to test

        authorcomplete=$(echo "$firstauthorcomplete and $secondauthorcomplete ")
    fi

    if [[ "$noofauthor" -ge "3" ]]; then
        echo -e "\nList all $noofauthor author names, using a comma to separate (e.g. Forename Surname, Forename Surname, Forname Surname ... - \e[3mMaximum of 5\e[0m): "
        read author
        author=$(echo "$author" | sed 's/, /,/g') # Can only use one character as delimiter; comma is desired

        firstauthorfullname=$(echo "$author" | cut -d ',' -f 1)
        firstauthorforename=$(echo "$firstauthorfullname" | cut -d ' ' -f 1)
        firstauthorsurname=$(echo "$firstauthorfullname" | cut -d ' ' -f 2)
        firstauthorcomplete=$(echo "${firstauthorsurname}, ${firstauthorforename:0:1}.")
        echo -e "\n$firstauthorcomplete" # This command is here for now to test

        secondauthorfullname=$(echo "$author" | cut -d ',' -f 2)
        secondauthorforename=$(echo "$secondauthorfullname" | cut -d ' ' -f 1)
        secondauthorsurname=$(echo "$secondauthorfullname" | cut -d ' ' -f 2)
        secondauthorcomplete=$(echo "${secondauthorsurname}, ${secondauthorforename:0:1}.")
        echo "$secondauthorcomplete" # This command is here for now to test

        if [[ "$noofauthor" -eq "3" ]]; then
        thirdauthorfullname=$(echo "$author" | cut -d ',' -f 3)
        thirdauthorforename=$(echo "$thirdauthorfullname" | cut -d ' ' -f 1)
        thirdauthorsurname=$(echo "$thirdauthorfullname" | cut -d ' ' -f 2)
        thirdauthorcomplete=$(echo "${thirdauthorsurname}, ${thirdauthorforename:0:1}.")
        echo "$thirdauthorcomplete" # This command is here for now to test
        fi

        if [[ "$noofauthor" -eq "4" ]]; then
        fourthauthorfullname=$(echo "$author" | cut -d ',' -f 4)
        fourthauthorforename=$(echo "$fourthauthorfullname" | cut -d ' ' -f 1)
        fourthauthorsurname=$(echo "$fourthauthorfullname" | cut -d ' ' -f 2)
        fourthauthorcomplete=$(echo "${fourthauthorsurname}, ${fourthauthorforename:0:1}.")
        echo "$fourthauthorcomplete" # This command is here for now to test
        fi

        if [[ "$noofauthor" -eq "5" ]]; then
        fifthauthorfullname=$(echo "$author" | cut -d ',' -f 5)
        fifthauthorforename=$(echo "$fifthauthorfullname" | cut -d ' ' -f 1)
        fifthauthorsurname=$(echo "$fifthauthorfullname" | cut -d ' ' -f 2)
        fifthauthorcomplete=$(echo "${fifthauthorsurname}, ${fifthauthorforename:0:1}.")
        echo "$fifthauthorcomplete" # This command is here for now to test
        fi

        if [[ "$noofauthor" -eq "3" ]]; then
            authorcomplete=$(echo "$firstauthorcomplete, $secondauthorcomplete, $thirdauthorcomplete ")
        fi

        if [[ "$noofauthor" -eq "4" ]]; then
            authorcomplete=$(echo "$firstauthorcomplete, $secondauthorcomplete, $thirdauthorcomplete, $fourthauthorcomplete ")
        fi

        if [[ "$noofauthor" -eq "5" ]]; then
            authorcomplete=$(echo "$firstauthorcomplete, $secondauthorcomplete, $thirdauthorcomplete, $fourthauthorcomplete, $fifthauthorcomplete ")
        fi
    fi

}

publishdate () {
    read -p "What is the published date of the source? (e.g. 12th March, 2017): " pub

    pub=$(echo "$pub" | sed 's/, /,/g') # Can only use one character as delimiter; comma is desired
    pubyear=$(echo "$pub" | cut -d ',' -f 2 )
    pubdate=$(echo "$pub" | cut -d ',' -f 1 )
    echo "$pubyear" # This command is here for now to test
    echo "$pubdate" # This command is here for now to test
}

echo -e "What format is the source you are referencing?"
PS3='Please enter your number choice (1/2/3/4): '
options=("(Online) Newspaper" "Website (General)" "Journal" "Quit") # Options to be slowly expanded
select opt in "${options[@]}"
do
    case $opt in
        "(Online) Newspaper")
            echo -e "\nYou chose '$opt'"
            echo -e "\nWe will now build to this style:"
            echo "Author’s surname, Initial. (Year of publication) ‘Title of article.’ Name of newspaper (in"
            echo -e "italics). [Online] Date of publication. [Date accessed] URL\n"

            author
            publishdate
	    break
            ;;
        "Website (General)")
            echo -e "\nYou chose '$opt'"
            echo -e "\nWe will now build to this style:"
            
            author
            publishdate
	    break
            ;;
        "Journal")
            echo -e "\nYou chose '$opt'"
            echo -e "\nWe will now build to this style:"

            author
            publishdate
	    break
            ;;
        "Quit")
        break
            ;;
        *) echo "You did not choose one of the options: '$REPLY'";;
    esac
done
