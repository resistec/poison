#!/bin/bash

#source variables from env.sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# Set default environmental variables based on the script location
PATH_main="$DIR" # Poison's location
PATH_modules="$(dirname "$DIR")" # The location of module components

#Archive disposables from past iterations
mv dork_variables.txt variables.txt archive 2>/dev/null

#banner
echo "
██████╗  ██████╗ ██╗███████╗ ██████╗ ███╗   ██╗
██╔══██╗██╔═══██╗██║██╔════╝██╔═══██╗████╗  ██║
██████╔╝██║   ██║██║███████╗██║   ██║██╔██╗ ██║
██╔═══╝ ██║   ██║██║╚════██║██║   ██║██║╚██╗██║
██║     ╚██████╔╝██║███████║╚██████╔╝██║ ╚████║
╚═╝      ╚═════╝ ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝
                                               "
echo " A Person of Interest (POI) investigation workflow"
echo "                               Created by resistec"
echo "                           Last update: 2024-04-15"
echo ""
echo ""

#Check environmental variables:
echo "The script has been configured with the following paths:"
echo "PATH_main: $PATH_main"
echo "PATH_modules: $PATH_modules"
echo ""
echo "If these paths are incorrect, please edit the script to adjust them accordingly."
echo "------------------------------------------------------------------------------------"
sleep 1


#Create directory for results
mkdir results 2>/dev/null


#VARIABLE ENUMERATION

#Get target details from user
echo "Enter details to generate variables:"
echo ""
echo "First name:"
read first_name

echo "Middle name:"
read mid_name

echo "Last name:"
read last_name

echo "Known username:"
read known_username

echo "Custom email domain (following @):" #e.g. bbc.co.uk
read ced

echo "Known workplace (past or present):"
read workplace
echo "Known role (at named company):"
read workrole
echo ""

cd results
loc=$(pwd)
echo "Results will be saved in $loc."
echo "------------------------------------------------------------------------------------"
cd ..

#Convert the input string to lowercase
cap_first() {
    echo "$1" | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}'
}

# Capitalize the first letter of first_name and last_name
first_name=$(cap_first "$first_name")
mid_name=$(cap_first "$mid_name")
last_name=$(cap_first "$last_name")

#Generate lowercase strings
first_name_lwc=$(echo "$first_name" | tr '[:upper:]' '[:lower:]')
mid_name_lwc=$(echo "$mid_name" | tr '[:upper:]' '[:lower:]')
last_name_lwc=$(echo "$last_name" | tr '[:upper:]' '[:lower:]')

#Get first letter of string
first_first_letter=$(echo "$first_name" | awk '{print substr($0,1,1)}')
mid_first_letter=$(echo "$mid_name" | awk '{print substr($0,1,1)}')
last_first_letter=$(echo "$last_name" | awk '{print substr($0,1,1)}')

#Set first letters lowercase
ffl_lwc=$(echo "$first_first_letter" | tr '[:upper:]' '[:lower:]')
lfl_lwc=$(echo "$last_first_letter" | tr '[:upper:]' '[:lower:]')

#Generate variables from target details and feed into variables.txt
echo "Generating variables from target details..."

echo "$first_name_lwc" >> variables.txt
echo "$last_name_lwc" >> variables.txt
echo "$first_name $last_name" >> variables.txt
echo "$first_name $mid_name $last_name" >> variables.txt
echo "$last_name $first_name" >> variables.txt
echo "$last_name $mid_name $first_name" >> variables.txt
echo "$first_name_lwc $last_name_lwc" >> variables.txt
echo "$last_name_lwc $first_name_lwc" >> variables.txt
echo "$known_username" >> variables.txt
echo "$first_name_lwc.$last_name_lwc" >> variables.txt
echo "$last_name_lwc.$first_name_lwc" >> variables.txt
echo "$first_name_lwc-$last_name_lwc" >> variables.txt
echo "$last_name_lwc-$first_name_lwc" >> variables.txt
echo "$first_name_lwc$last_name_lwc" >> variables.txt
echo "$last_name_lwc$first_name_lwc" >> variables.txt
echo "$ffl_lwc$last_name_lwc" >> variables.txt
echo "$last_name_lwc$ffl_lwc" >> variables.txt
echo "$ffl_lwc.$last_name_lwc" >> variables.txt
echo "$last_name_lwc.$ffl_lwc" >> variables.txt
echo "$lfl_lwc$last_name_lwc" >> variables.txt
echo "$last_name_lwc$lfl_lwc" >> variables.txt
echo "$lfl_lwc.$last_name_lwc" >> variables.txt
echo "$last_name_lwc.$lfl_lwc" >> variables.txt
sleep 1
echo "Variables saved to variables.txt."

echo "Dorks saved to dork_variables.txt."
echo "------------------------------------------------------------------------------------"
sleep 0.5
items=(
    "$first_name_lwc" 
    "$last_name_lwc" 
    "$first_name $last_name" 
    "$first_name $mid_name $last_name" 
    "$last_name $first_name" 
    "$last_name $mid_name $first_name" 
    "$first_name_lwc $last_name_lwc" 
    "$last_name_lwc $first_name_lwc"
    "$known_username" 
    "$first_name_lwc.$last_name_lwc" 
    "$last_name_lwc.$first_name_lwc" 
    "$first_name_lwc-$last_name_lwc" 
    "$last_name_lwc-$first_name_lwc" 
    "$first_name_lwc$last_name_lwc" 
    "$last_name_lwc$first_name_lwc" 
    "$ffl_lwc$last_name_lwc" 
    "$last_name_lwc$ffl_lwc" 
    "$ffl_lwc.$last_name_lwc" 
    "$last_name_lwc.$ffl_lwc" 
    "$lfl_lwc$last_name_lwc"
    "$last_name_lwc$lfl_lwc"
    "$lfl_lwc.$last_name_lwc"
    "$last_name_lwc.$lfl_lwc"
)

echo "\"\"$first_name\" \"$last_name\"\"" >> dork_variables.txt
echo "\"\"$last_name\" \"$first_name\"\"" >> dork_variables.txt

for item in "${items[@]}"; do
    echo "\"$item\" AND (site:facebook.com | site:vk.com | site:t.me | site:youtube.com | site:pinterest.com | site:tiktok.com | site:instagram.com)" >> dork_variables.txt
    echo "\"$item\" AND (\"*@yandex.ru\" | \"*@$ced\" | \"*@gmail.com\" | \"*@protonmail.com\" | \"*@proton.me\")" >> dork_variables.txt
    echo "\"$item\" AND (\"contact\" | \"email\" | \"message\" | \"call\" | \"ring\")" >> dork_variables.txt
    echo "\"$item\" AND \"$workplace\"" >> dork_variables.txt
    echo "\"$item\" AND \"$workrole at $workplace\"" >> dork_variables.txt
    echo "site:\"$item\"" >> dork_variables.txt
    echo "inurl:\"$item\"" >> dork_variables.txt
    echo "intitle:\"$item\"" >> dork_variables.txt
    echo "intext:\"$item\"" >> dork_variables.txt
    echo "site:\"*$item*\"" >> dork_variables.txt
    echo "inurl:\"*$item*\"" >> dork_variables.txt
    echo "intitle:\"*$item*\"" >> dork_variables.txt
    echo "intext:\"*$item*\"" >> dork_variables.txt
done

#MODULES

#feeding the variables into enumeration and search tools and outputs the results into files for each tool.

#MODULE A - dorkScanner (searches)
run_dorkScanner() {
    dork_results="$PATH_main/results/dork_results.txt"
    echo "dorkScanner is now searching for target in Google..."
    echo "dorkScanner is now searching for target in Bing..."
    cd $PATH_modules/dorkScanner/dorkScanner
    while IFS= read -r target || [[ -n "$target" ]]; do
        python dorkScanner.py -q "$target" -e Google -p 10 -P 5 >> "$dork_results" 2>/dev/null
        python dorkScanner.py -q "$target" -e Bing -p 10 -P 5 >> "$dork_results" 2>/dev/null
    done < "$PATH_main/dork_variables.txt"

    echo ""
    echo "[+] Message: dorkScanner results saved to dork_results.txt"
    echo ""
}

#progress bar for Modules B-D
function ProgressBar {
    local _progress=$((100*$1/$2))
    local _done=$((($_progress*4)/10))
    local _left=$((40-$_done))

    printf "\rProgress: $_progress%% "
}

#temporary file for username enumeration
#touch temp_file.txt
input_file="variables.txt"
sed -n '9,23p' "$input_file" >> temp_file.txt

total_lines=$(wc -l < temp_file.txt)
current_line=0

#MODULE B - Sherlock (username)
run_sherlock() {
    echo "Your Sherlock scan has begun for target in variables.txt..."
    cd $PATH_modules/sherlock/sherlock 
    while IFS= read -r target || [[ -n "$target" ]]; do
        ((current_line++)) 
        ProgressBar "$current_line" "$total_lines"    
        python sherlock.py $target >> $PATH_main/results/sherlock_results.txt 2>/dev/null
    done < "$PATH_main/temp_file.txt"

    echo ""
    echo "[+] Message: Sherlock results saved to sherlock_results.txt"
    echo ""
}

#MODULE C - Maigret (username)
run_maigret() {
    echo "Your Maigret scan has begun for target in variables.txt..."
    while IFS= read -r target || [[ -n "$target" ]]; do
        ((current_line++)) 
        ProgressBar "$current_line" "$total_lines"   
        maigret $target --retries 1 --no-recursion --timeout 20 --no-progressbar >> $PATH_main/results/maigret_results.txt 2>/dev/null    
    done < "$PATH_main/temp_file.txt"

    echo ""
    echo "[+] Message: Maigret results saved to maigret_results.txt."
    echo ""
}

#MODULE D - Holehe (email)
run_holehe() {
    echo "Your holehe scan has begun for target in variables.txt."
    cd $PATH_modules/holehe/
    while IFS= read -r target; do
        ((current_line++)) 
        ProgressBar "$current_line" "$total_lines"
        holehe "$target@gmail.com" -NP --only-used --no-color >> holehe_results.txt 2>/dev/null
        holehe "$target@protonmail.com" -NP --only-used --no-color >> holehe_results.txt 2>/dev/null
        holehe "$target@$ced" -NP --only-used --no-color >> holehe_results.txt 2>/dev/null
        # ^ will only work if the ced variable is referenced from variable_enumeration
    done < "$PATH_main/temp_file.txt"
    mv holehe_results.txt $PATH_main/results

    echo ""
    echo "[+] Message: Holehe results saved to holehe_results.txt."
    echo ""
}

# Run modules concurrently in the background
run_dorkScanner &
run_sherlock &
run_maigret &
run_holehe &

# Wait for all background processes to finish
wait

#remove temporary file for username enumeration
cd $PATH_main/
rm temp_file.txt dork_variables.txt variables.txt

echo "------------------------------------------------------------------------------------"

cd results

#Cleaning dorkScanner
echo "Cleaning up dork_results.txt..."

sed -n -e '/^\[+\]/ s/.*\(https\{0,1\}:.*\)/\1/p' dork_results.txt > clean_dork_results.txt
input_file="clean_dork_results.txt"
output_file="final_dork_results.txt"
# Iterate over each line in the input file
while IFS= read -r line; do
    # Flag to indicate if any variable is found in the line
    found=false
    
    # Sorting some false positives by iterating over each variable in the list
    for item in "${items[@]}"; do
        escaped_item=$(printf '%s\n' "$item" | sed 's/[[\.*^$]/\\&/g') 
            # Check if the line contains the current variable
            if [[ $line == *"$escaped_item"* ]]; then
                found=true
                break
            fi
        done
    
    # If any variable is found, write the line to the output file
    if $found; then
        echo "$line" >> "$output_file"
    fi
done < "$input_file"
rm clean_dork_results.txt

#Cleaning Sherlock
echo "Cleaning up sherlock_results.txt..."   

sed -n -e '/^\[+\]/ s/.*\(https\{0,1\}:.*\)/\1/p' sherlock_results.txt > clean_sherlock_results.txt
input_file="clean_sherlock_results.txt"
output_file="final_sherlock_results.txt"
while IFS= read -r line; do
    # Flag to indicate if any variable is found in the line
    found=false
    
    # Iterate over each variable in the list
    for item in "${items[@]}"; do
        escaped_item=$(printf '%s\n' "$item" | sed 's/[[\.*^$]/\\&/g') 
            # Check if the line contains the current variable
            if [[ $line == *"$escaped_item"* ]]; then
                found=true
                break
            fi
        done
    
    # If any variable is found, write the line to the output file
    if $found; then
        echo "$line" >> "$output_file"
    fi
done < "$input_file"
rm clean_sherlock_results.txt
sleep 1

#Cleaning Maigret
echo "Cleaning up maigret_results.txt..."

sed -n -e 's/.*\(https\{0,1\}:.*\)/\1/p' maigret_results.txt > clean_maigret_results.txt
input_file="clean_maigret_results.txt"
output_file="final_maigret_results.txt"
while IFS= read -r line; do
    # Flag to indicate if any variable is found in the line
    found=false
    
    # Iterate over each variable in the list
    for item in "${items[@]}"; do
        escaped_item=$(printf '%s\n' "$item" | sed 's/[[\.*^$]/\\&/g') 
            # Check if the line contains the current variable
            if [[ $line == *"$escaped_item"* ]]; then
                found=true
                break
            fi
        done
    
    # If any variable is found, write the line to the output file
    if $found; then
        echo "$line" >> "$output_file"
    fi
done < "$input_file"
rm clean_maigret_results.txt
sleep 1

#Cleaning Holehe
echo "Cleaning up holehe_results.txt..."

sed -n -e '/@.*\./p' -e '/^\[+\] /p' holehe_results.txt | sed -e '/Email used\|Email not used\|Rate limit/d' -e 's/^\[+\] //' > clean_holehe_results.txt
sed -i '/evernote\.com/d' clean_holehe_results.txt #cleans known false positives
input_file="clean_holehe_results.txt"
output_file="final_holehe_results.txt"
while IFS= read -r line; do
    # Flag to indicate if any variable is found in the line
    found=false
    
    # Iterate over each variable in the list
    for item in "${items[@]}"; do
        escaped_item=$(printf '%s\n' "$item" | sed 's/[[\.*^$]/\\&/g') 
            # Check if the line contains the current variable
            if [[ $line == *"$escaped_item"* ]]; then
                found=true
                break
            fi
        done
    
    # If any variable is found, write the line to the output file
    if $found; then
        echo "$line" >> "$output_file"
    fi
done < "$input_file"
rm clean_holehe_results.txt
sleep 1

echo "------------------------------------------------------------------------------------"
echo "Merging results from all cleaned files..."
cat final_dork_results.txt final_sherlock_results.txt final_maigret_results.txt > merged.txt
echo "Removing duplicates..."
awk '!seen[$0]++' merged.txt > unique.txt
sleep 1

#count lines in final report
line_count=$(wc -l < "unique.txt")
echo ""
echo "Number of results: $line_count. This may contain false positives."
sleep 1

results_final="${first_name}${last_name}-results.txt"
email_final="${first_name}${last_name}-email.txt"
mv unique.txt "$results_final"
mv final_holehe_results.txt "$email_final"
sed -i '1s/^/Each website listed here is presumed to be associated with the email address that is listed above it.\n----------------------------\n/' "$email_final"

sleep 1
echo "
 __________________
|                  |
| PROCESS FINISHED |
|__________________|
"
echo "Your Final Report can be found at $PATH_main/results/$results_final and $email_final."

#deleting disposable files
rm final_dork_results.txt final_sherlock_results.txt final_maigret_results.txt merged.txt dork_results.txt holehe_results.txt maigret_results.txt sherlock_results.txt
cd .. && rmdir reports

#open directory of results
cd $PATH_main/results 2>/dev/null
xdg-open .
