echo -e "What format is the source you are referencing from?"
PS3='Please enter your number choice (1/2/3/4): '
options=("(Online) Newspaper" "Website (General)" "Journal" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "(Online) Newspaper")
            format="onlinenewspaper"
	    break
            ;;
        "Website (General)")
            format="website"
	    break
            ;;
        "Journal")
            format="journal"
	    break
            ;;
        "Quit")
        break
            ;;
        *) echo "You did not choose one of the options: '$REPLY'";;
    esac
done
echo -e "\nYou chose '$opt'"
if [ "$format" = "onlinenewspaper" ]; then
    read -p "What is the authors fullname? " firstauthor
    forename=$(echo "$firstauthor" | cut -d ' ' -f 1)
    surname=$(echo "$firstauthor" | cut -d ' ' -f 2)
    echo -e "\n${surname}, ${forename:0:1}."
fi

