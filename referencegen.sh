# ANSI Escape Codes
bold="\e[1m" 
italic="\e[3m"
red="\e[1;31m"
green="\e[1;32m"
yellow="\e[1;33m"
dblue="\e[0;34m" # Dark
lblue="\e[1;34m" # Light
purple="\e[1;35m"
cyan="\e[1;36m"
reset="\e[0m" # Reset subsequent string back to normal font

authorfunc () {
	echo

	while [[ ! $noofauthor =~ ^(0|1|2|3|4|5)$ ]]
	do
		read -p "How many authors are there? - Maximum of 5 (If no author, input 0): " -n 2 -r noofauthor

		if [[ ! $noofauthor =~ ^(0|1|2|3|4|5)$ ]]; then
			echo
			echo -e ""$red"You did not input a number, a number within the range or pressing backspace instead: '$noofauthor'"$reset""
			echo
		fi
	done

	if [[ "$noofauthor" -eq "0" ]]; then
		if [[ "$opt" == "Online Newspaper article" ]]; then
			echo
			echo -e ""$yellow"Title of the "$opt" will be used instead"$reset"."
		fi
	fi
 
	while [[ "${#author[@]}" -ne "$((noofauthor*2))" ]]; do

		if [[ "$noofauthor" -ge "1" ]]; then
			echo
			echo -e ""$purple"Authors names should be inputted in "$reset""$bold"Forename Surname"$reset" "$purple"order - Forname may be a single letter"$reset""
			if [[ "$noofauthor" -ge "2" ]]; then
				echo
				echo "Supported Formats:"
				echo -e ""$yellow"'Author1, Author2, ..'"$reset", "$green"'Author1 & Author2 & ..'"$reset", "$red"'Author1 and Author2 and ..'"$reset", "$purple"'Author1 Author2'"$reset", "$cyan"'Author1 Author2'"$reset" or "$bold"any mix of the 4"$reset", e.g. "$lblue"'Author1, Author2 and ..'"$reset""
				echo
			fi
		fi
		
		if [[ "$noofauthor" -eq "1" ]]; then
			echo
			read -p "What is the authors fullname? " author
			author=( $author )

			if [[ "${#author[@]}" -eq "2" ]]; then
				echo

				forename=$(echo "${author[0]}")
				surname=$(echo "${author[1]}")

				authorcomplete=$(echo "${surname}, ${forename:0:1}.")
			else
				echo
				echo -e ""$red"You entered '"${#author[@]}"' word(s). There should be a total of '"$((noofauthor*2))"' forenames/surnames for '"$noofauthor"' author(s). Try again:"$reset""
			fi
		fi

		if [[ "$noofauthor" -eq "2" ]]; then
			read -p "Provide both authors names: " author
			author=$(echo "$author" | sed 's/,//g;s/ & / /g;s/ and / /g') # Can only use one character as delimiter; comma is desired
			author=( $author )

			if [[ "${#author[@]}" -eq "4" ]]; then
				echo

				firstauthorforename=$(echo "${author[0]}")
				firstauthorsurname=$(echo "${author[1]}")
				firstauthorcomplete=$(echo "${firstauthorsurname}, ${firstauthorforename:0:1}.")
				echo "$firstauthorcomplete" # This command is here for now to test

				secondauthorforename=$(echo "${author[2]}")
				secondauthorsurname=$(echo "${author[3]}")
				secondauthorcomplete=$(echo "${secondauthorsurname}, ${secondauthorforename:0:1}.")
				echo "$secondauthorcomplete" # This command is here for now to test

				authorcomplete=$(echo "$firstauthorcomplete and $secondauthorcomplete")
			else
				echo
				echo -e ""$red"You entered '"${#author[@]}"' word(s). There should be a total of '"$((noofauthor*2))"' forenames/surnames for '"$noofauthor"' author(s). Try again:"$reset""
			fi
		fi

		if [[ "$noofauthor" -ge "3" ]]; then
			read -p "Provide all $noofauthor authors names: " author
			author=$(echo "$author" | sed 's/,//g;s/ & / /g;s/ and / /g') # Can only use one character as delimiter; comma is desired
			author=( $author )

			if [[ "${#author[@]}" -eq "$((noofauthor*2))" ]]; then
				echo

				firstauthorforename=$(echo "${author[0]}")
				firstauthorsurname=$(echo "${author[1]}")
				firstauthorcomplete=$(echo "${firstauthorsurname}, ${firstauthorforename:0:1}.")
				echo "$firstauthorcomplete" # This command is here for now to test

				secondauthorforename=$(echo "${author[2]}")
				secondauthorsurname=$(echo "${author[3]}")
				secondauthorcomplete=$(echo "${secondauthorsurname}, ${secondauthorforename:0:1}.")
				echo "$secondauthorcomplete" # This command is here for now to test

				thirdauthorforename=$(echo "${author[4]}")
				thirdauthorsurname=$(echo "${author[5]}")
				thirdauthorcomplete=$(echo "${thirdauthorsurname}, ${thirdauthorforename:0:1}.")
				echo "$thirdauthorcomplete" # This command is here for now to test

				fourthauthorforename=$(echo "${author[6]}")
				fourthauthorsurname=$(echo "${author[7]}")
				fourthauthorcomplete=$(echo "${fourthauthorsurname}, ${fourthauthorforename:0:1}.")
				echo "$fourthauthorcomplete" # This command is here for now to test

				fifthauthorforename=$(echo "${author[8]}")
				fifthauthorsurname=$(echo "${author[9]}")
				fifthauthorcomplete=$(echo "${fifthauthorsurname}, ${fifthauthorforename:0:1}.")
				echo "$fifthauthorcomplete" # This command is here for now to test

				if [[ "$noofauthor" -eq "3" ]] && [[ "${#author[@]}" -eq "6" ]]; then
					authorcomplete=$(echo "$firstauthorcomplete, $secondauthorcomplete, $thirdauthorcomplete")
				fi

				if [[ "$noofauthor" -eq "4" ]] && [[ "${#author[@]}" -eq "8" ]]; then
					authorcomplete=$(echo "$firstauthorcomplete, $secondauthorcomplete, $thirdauthorcomplete, $fourthauthorcomplete")
				fi

				if [[ "$noofauthor" -eq "5" ]] && [[ "${#author[@]}" -eq "10" ]]; then
					authorcomplete=$(echo "$firstauthorcomplete, $secondauthorcomplete, $thirdauthorcomplete, $fourthauthorcomplete, $fifthauthorcomplete")
				fi
			else
				echo
				echo -e ""$red"You entered '"${#author[@]}"' word(s). There should be a total of '"$((noofauthor*2))"' forenames/surnames for '"$noofauthor"' author(s). Try again:"$reset""
			fi
		fi
		
		echo -e ""$yellow""$authorcomplete""$reset""
	
	done

}

date=$(echo $(date '+%d %B %Y'))
dateaccessed=$(echo "[Accessed on $date]")

generateanotherfunc () {
	unsetvariablesfunc
	echo
	
	while [[ ! $generateanother =~ ^(Y|y|N|n)$ ]]
	do
		read -p "Would you like to generate another reference? (y/n) " -n 2 -r generateanother

		if [[ $generateanother =~ ^[Nn]$ ]]; then
			echo
			echo -e "Thank you for using "$purple"YRG"$reset". "$green"Good luck with your assignment! "$yellow";]"$reset""
			return 1
		fi

		if [[ $generateanother =~ ^[Yy]$ ]]; then
			echo -e ""$green"Alrighty, ready for the next reference!"$reset""
			optionsfunc
		fi

		if [[ ! $generateanother =~ ^[Yy|Nn]$ ]]; then
			echo
			echo -e ""$red"You did not input 'y'/'Y' or 'n'/'N': "$generateanother"."$reset""
			echo
		fi
	done
}

namenewsmagfunc () {
	echo
	read -p "What is the name of the Newspaper/Magazine? (e.g. The Guardian  or  Financial Times): " namenewsmag
	namenewsmag=$(echo -e ""$italic""$namenewsmag""$reset".")
	echo
	echo -e ""$yellow""$namenewsmag""$reset"" # This command is here for now to test
}

publishdatefunc () {
	echo

	read -p "What is the published date of the source? (e.g. 12th March 2017): " pub
	pub=( $pub )
	
	pubdate=$(echo "${pub[0]} ${pub[1]}")
	pubyear=$(echo "${pub[2]}")

	itpubyear=$(echo "$pubyear") # "I"n-"T"ext citation does not use brackets around the Publication year
	refpubyear=$(echo "($pubyear)") # Reference Publication year
	pubdate=$(echo "$pubdate".) # The Publication date will only be used in the references section, which includes a '.' after it

	echo
	echo -e ""$yellow""$itpubyear $pubdate $refpubyear" "$reset"" # This command is here for now to test
}

quotedtitlefunc () {
	echo
	read -p "What is the title of the source? " quotedtitle
	quotedtitle=$(echo "'$quotedtitle.'")
	echo
	echo -e "$yellow""$quotedtitle""$reset" # This command is here for now to test
}

urlfunc () {
	echo
	read -p "What is the URL of the source? " url
	url=$(echo -e "$dblue""$url""$reset")
	echo
	echo "$url"
}

unsetvariablesfunc () {
	unset authorcomplete
	unset noofauthor
	unset author
	
	unset firstauthorcomplete
	unset firstauthorfullname
	unset firstauthorforename
	unset firstauthorsurname 
	
	unset secondauthorcomplete
	unset secondauthorfullname
	unset secondauthorforename
	unset secondauthorsurname

	unset thirdauthorcomplete
	unset thirdauthorfullname
	unset thirdauthorforename
	unset thirdauthorsurname

	unset fourthauthorcomplete
	unset fourthauthorfullname
	unset fourthauthorforename
	unset fourthauthorsurname

	unset fifthauthorcomplete
	unset fifthauthorfullname
	unset fifthauthorforename
	unset fifthauthorsurname

	unset generateanother
}

optionsfunc () {
	echo
	echo -e "What format is the source you are referencing?"
	echo
	PS3='Please enter your number choice (1/2/3/4): '
	options=("Online Newspaper article" "Website (General)" "Journal" "Quit") # Options to be slowly expanded
	select opt in "${options[@]}"
	do
		case $opt in

			"Online Newspaper article")
				echo
				echo -e "You chose '"$purple"$opt"$reset"'"
				echo
				echo ""$opt" reference layout:"
				echo -e "Author surname, Initial. (Year of publication) ‘Title of article.’ "$italic"Name of newspaper"$reset". [Online] Date of publication. [Date accessed] "$dblue"URL"$reset""

				authorfunc
				namenewsmagfunc
				publishdatefunc
				quotedtitlefunc
				urlfunc

				echo
				echo -e ""$green"Reference Generated:"$reset""
				if [[ "$noofauthor" -ge "1" ]]; then
					echo -e "$authorcomplete $refpubyear $quotedtitle $namenewsmag [Online] $pubdate $dateaccessed $url"
				else
					echo -e "$quotedtitle $refpubyear $namenewsmag [Online] $pubdate $dateaccessed $url"
				fi
				generateanotherfunc
				break
				;;

			"Website")
				echo -e "You chose '"$purple"$opt"$reset"'"
				echo
				echo ""$opt" reference layout:"

				authorfunc
				publishdatefunc
				generateanotherfunc
				break
				;;
			"Journal")
				echo -e "You chose '"$purple"$opt"$reset"'"
				echo
				echo ""$opt" reference layout:"

				authorfunc
				publishdatefunc
				generateanotherfunc
				break
				;;

			"Quit")
				break
				;;
			*)
				echo
				echo -e ""$red"You did not choose one of the options: '$REPLY'. Try again:"$reset""
				echo
				;;

		esac
	done
}

clear # Clear screen, immerse the generator

echo "   -------------------------------------------   "
echo " / /‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\ \ "
echo -e " | | "$cyan"Welcome "$bold""$red"to"$reset" "$green"Your"$yellow"Reference"$reset"Generator "$purple"(YRG)"$reset" | | "
echo " \ \_________________________________________/ / "
echo "   -------------------------------------------   "
echo
echo -e ""$bold"The "$yellow"Yellow outputs"$reset" "$bold"show what the script is populating towards the final reference."$reset""
echo -e ""$bold"If you inputted an incorrect response, please press '"$cyan"Control + c"$reset"' "$bold"to exit and then re-bash this script"$reset""

unsetvariablesfunc
optionsfunc
