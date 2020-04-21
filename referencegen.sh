# ANSI Escape Codes
bold='\e[1m' # Turn subsequent string to .. bold font
italic='\e[3m' # .. italic font 
red='\e[1m\e[31m' # .. red
green='\e[32m' # .. green
yellow='\e[33m' # .. yellow
purple='\e[35m' # .. purple
cyan='\e[36m' # .. cyan
grey='\e[37m' # .. grey
reset='\e[0m' # Reset subsequent string back to normal font

author () {
	unset noofauthor
	echo

	while [[ ! $noofauthor =~ ^(1|2|3|4|5)$ ]]
	do
		read -p "How many authors are there? - Maximum of 5: " -n 2 -r noofauthor

		if [[ ! $noofauthor =~ ^(1|2|3|4|5)$ ]]; then
			echo
			echo -e ""$red"You did not input a number, a number within the range or pressing backspace instead: '$noofauthor'"$reset""
		fi
	done

	echo
	echo -e ""$bold""$cyan"Forename may be a single letter"$reset"" 

	if [[ "$noofauthor" -eq "1" ]]; then
		read -p "What is the authors fullname? (e.g. Forename Surname): " author

		forename=$(echo "$author" | cut -d ' ' -f 1)
		surname=$(echo "$author" | cut -d ' ' -f 2)

		authorcomplete=$(echo "${surname}, ${forename:0:1}.")
		echo
		echo "$authorcomplete" # This command is here for now to test
	fi

	if [[ "$noofauthor" -eq "2" ]]; then
		read -p "Provide both author names, using a comma to separate (e.g. Forename Surname, Forename Surname): " author
		author=$(echo "$author" | sed 's/, /,/g') # Can only use one character as delimiter; comma is desired
		echo

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
		read -p "List all $noofauthor author names, using a comma to separate (e.g. Forename Surname, Forename Surname, Forname Surname ...): " author
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

		thirdauthorfullname=$(echo "$author" | cut -d ',' -f 3)
		thirdauthorforename=$(echo "$thirdauthorfullname" | cut -d ' ' -f 1)
		thirdauthorsurname=$(echo "$thirdauthorfullname" | cut -d ' ' -f 2)
		thirdauthorcomplete=$(echo "${thirdauthorsurname}, ${thirdauthorforename:0:1}.")
		echo "$thirdauthorcomplete" # This command is here for now to test

		if [[ "$noofauthor" -ge "4" ]]; then
			fourthauthorfullname=$(echo "$author" | cut -d ',' -f 4)
			fourthauthorforename=$(echo "$fourthauthorfullname" | cut -d ' ' -f 1)
			fourthauthorsurname=$(echo "$fourthauthorfullname" | cut -d ' ' -f 2)
			fourthauthorcomplete=$(echo "${fourthauthorsurname}, ${fourthauthorforename:0:1}.")
			echo "$fourthauthorcomplete" # This command is here for now to test
		fi

		if [[ "$noofauthor" -ge "5" ]]; then
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

date=$(echo $(date '+%d %B %Y'))
dateaccessed=$(echo "[Accessed on $date]")

generateanother () {
	unset generateanother
	echo
	
	while [[ ! $generateanother =~ ^(Y|y|N|n)$ ]]
	do
		read -p "Would you like to generate another reference? (y/n) " -n 2 -r generateanother
	
		if [[ $generateanother =~ ^[Nn]$ ]]; then
			echo
			echo -e ""$green"Thank you for using YRG. Good luck with your assignment! ;]"$reset""
			return 1
		fi

		if [[ $generateanother =~ ^[Yy]$ ]]; then
			echo "Alrighty, ready for the next reference"
			options
		fi

		if [[ ! $generateanother =~ ^[Yy|Nn]$ ]]; then
			echo
			echo -e ""$red"You did not input 'y'/'Y' or 'n'/'N': "$generateanother"."$reset""
			echo
		fi
	done
}

namenewsmag () {
	echo
	read -p "What is the name of the Newspaper/Magazine? (e.g. The Guardian  or  Financial Times): " namenewsmag
	namenewsmag=$(echo -e ""$italic"$namenewsmag"$reset".")
	echo
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

	echo
	echo "$itpubyear $pubdate $refpubyear " # This command is here for now to test
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
	echo
	echo -e "What format is the source you are referencing?"
	echo
	PS3='Please enter your number choice (1/2/3/4): '
	options=("(Online) Newspaper" "Website (General)" "Journal" "Quit") # Options to be slowly expanded
	select opt in "${options[@]}"
	do
		case $opt in

			"(Online) Newspaper")
				echo
				echo "You chose '$opt'"
				echo
				echo ""$opt" reference layout:"
				echo -e "Author surname, Initial. (Year of publication) ‘Title of article.’ "$italic"Name of newspaper"$reset". [Online] Date of publication. [Date accessed] URL"

				author
				namenewsmag
				publishdate
				quotedtitle
				url

				echo
				echo -e ""$green"Reference Generated:"$reset""
				echo -e "$authorcomplete $refpubyear $quotedtitle $namenewsmag [Online] $pubdate $dateaccessed $url"
				generateanother
				break
				;;

			"Website (General)")
				echo "You chose '$opt'"
				echo
				echo ""$opt" reference layout:"

				author
				publishdate
				generateanother
				break
				;;
			"Journal")
				echo "You chose '$opt'"
				echo
				echo ""$opt" reference layout:"

				author
				publishdate
				generateanother
				break
				;;

			"Quit")
				break
				;;
			*)
				echo
				echo ""$red"You did not choose one of the options: '$REPLY'. Try again:"$reset""
				echo
				;;

		esac
	done
}

clear # Clear screen, immerse the generator

echo "   -------------------------------------------   "
echo " / /‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ \ "
echo -e " | | "$cyan"Welcome "$bold""$red"to"$reset" "$green"Your"$yellow"Reference"$grey"Generator "$purple"(YRG)"$reset" | | "
echo " \ \_________________________________________/ / "
echo "   -------------------------------------------   "

options
