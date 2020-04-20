author () {
	unset noofauthor

	while [[ ! $noofauthor =~ ^(1|2|3|4|5)$ ]]
	do
		echo -e "How many authors are there? - \e[3mMaximum of 5\e[0m:"
		read -n 2 -r noofauthor

		if [[ ! $noofauthor =~ ^(1|2|3|4|5)$ ]]; then
			echo -e "\nYou did not input a number or a number within the range: '$noofauthor'. Try again.\n"
		fi
	done

	if [[ "$noofauthor" -eq "1" ]]; then
		echo -e "\nWhat is the authors fullname? (e.g. Forename Surname - \e[3mForename can be a letter\e[0m)"
		read author

		forename=$(echo "$author" | cut -d ' ' -f 1)
		surname=$(echo "$author" | cut -d ' ' -f 2)

		authorcomplete=$(echo "${surname}, ${forename:0:1}.")
		echo "$authorcomplete" # This command is here for now to test
	fi

	if [[ "$noofauthor" -eq "2" ]]; then
		echo
		read -p "Provide both author names, using a comma to separate (e.g. Forename Surname, Forename Surname): " author
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

		authorcomplete=$(echo "$firstauthorcomplete and $secondauthorcomplete")
	fi

	if [[ "$noofauthor" -ge "3" ]]; then
		echo -e "\nList all $noofauthor author names, using a comma to separate (e.g. Forename Surname, Forename Surname, Forname Surname ... : "
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
			authorcomplete=$(echo "$firstauthorcomplete, $secondauthorcomplete, $thirdauthorcomplete")
		fi

		if [[ "$noofauthor" -eq "4" ]]; then
			authorcomplete=$(echo "$firstauthorcomplete, $secondauthorcomplete, $thirdauthorcomplete, $fourthauthorcomplete")
		fi

		if [[ "$noofauthor" -eq "5" ]]; then
			authorcomplete=$(echo "$firstauthorcomplete, $secondauthorcomplete, $thirdauthorcomplete, $fourthauthorcomplete, $fifthauthorcomplete")
		fi
	fi

}

date=$(echo $(date '+%dth %B %Y'))
dateaccessed=$(echo "[Accessed on $date]")

generateanother () {
	unset generateanother
	
	while [[ ! $generateanother =~ ^(Y|y|N|n)$ ]]
	do
		read -p "Would you like to generate another reference? (y/n) " -n 2 -r generateanother
	
		if [[ $generateanother =~ ^[Nn]$ ]]; then
			echo ""
			echo "Thank you for using the generator. Good luck with your assignment!"
			return 1
		fi

		if [[ $generateanother =~ ^[Yy]$ ]]; then
			echo "Alrighty, ready for the next reference"
			options
		fi

		if [[ ! $generateanother =~ ^[Yy|Nn]$ ]]; then
			echo ""
			echo "You did not input 'y'/'Y' or 'n'/'N'! Try again."
			echo ""
		fi
	done
}

namenewsmag () {
	echo
	read -p "What is the name of the Newspaper/Magazine? (e.g. The Guardian  or  Financial Times): " namenewsmag
	namenewsmag=$(echo -e "\e[3m$namenewsmag\e[0m.")
	echo "$namenewsmag" # This command is here for now to test
}

publishdate () {
	echo

	read -p "What is the published date of the source? (e.g. 12th March 2017): " pub
	pub=( $pub )
	
	pubdate=$(echo "${pub[0]} ${pub[1]}")
	pubyear=$(echo "${pub[2]}")

	itpubyear=$(echo "$pubyear") # "I"n-"T"ext citation does not use brackets around the Publication year
	refpubyear=$(echo "($pubyear)") # Reference Publication year
	pubdate=$(echo "$pubdate".) # The Publication date will only be used in the references section, which includes a '.' after it

	echo "$itpubyear" # This command is here for now to test
	echo "$pubdate" # This command is here for now to test
	echo "$refpubyear" # This command is here for now to test
}

quotedtitle () {
	echo
	read -p "What is the title of the source? " quotedtitle
	quotedtitle=$(echo "'$quotedtitle.'")
	echo "$quotedtitle" # This command is here for now to test
}

url () {
	echo
	read -p "What is the URL of the source? " url
}

options () {
	echo -e "What format is the source you are referencing?"
	PS3='Please enter your number choice (1/2/3/4): '
	options=("(Online) Newspaper" "Website (General)" "Journal" "Quit") # Options to be slowly expanded
	select opt in "${options[@]}"
	do
		case $opt in
			"(Online) Newspaper")
				echo -e "\nYou chose '$opt'"
				echo -e "\n"$opt" reference format:"
				echo -e "Author’s surname, Initial. (Year of publication) ‘Title of article.’ \e[3mName of newspaper (in\e[0m"
				echo -e "\e[3mitalics)\e[0m. [Online] Date of publication. [Date accessed] URL\n"

				author
				namenewsmag
				publishdate
				quotedtitle
				url
				echo -e "\nReference Generated:\n$authorcomplete $pubyear $quotedtitle $namenewsmag [Online] $pubdate $dateaccessed $url"
				generateanother
				break
				;;

			"Website (General)")
				echo -e "\nYou chose '$opt'"
				echo -e "\nWe will now build to this style:"

				author
				publishdate
				generateanother
				break
				;;
			"Journal")
				echo -e "\nYou chose '$opt'"
				echo -e "\nWe will now build to this style:"

				author
				publishdate
				generateanother
				break
				;;

			"Quit")
				break
				;;
			*)
				echo "You did not choose one of the options: '$REPLY'";;
		esac
	done
}

clear # Clear screen, immerse the generator
echo -e "\nWelcome to YourReferenceGenerator (YRG)\n"

options
