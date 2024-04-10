copyfiles() {
  local java_files_content=""

  # Change directory to the project's Java source directory
  local project_dir=~/j-s.bank-account-balance-manager/
  cd "$project_dir" || return

  # Find all Java files and concatenate not exluded files
  local exclude_files="RestServiceApplication.java CSVHelperTest.java RestServiceApplicationTests.java"
  if [ $# -eq 0 ]; then
    # No arguments provided, get contents of all not excluded .java files
    local files_to_include=$(find . -type f -name '*.java')
    for file in $files_to_include; do
      if [[ $exclude_files != *$(basename "$file")* ]]; then
        java_files_content+="$(cat "$file")"$'\n'
      fi
    done  
  else
    # Arguments provided, get contents of specified files
    for filename in "$@"; do
      local file_path=$(find . -type f -name "$filename" -print -quit)
      if [ -n "$file_path" ]; then
        java_files_content+="$(cat "$file_path")"$'\n'
      else
        echo "File $filename not found in the project directory."
      fi
    done
  fi

  # Handle additional fixed files first
  local additional_files="pom.xml"
  for fixed_file in $additional_files; do
      local file_path=$(find . -type f -name "$fixed_file" -print -quit)
      if [[ -f "$file_path" ]]; then
        java_files_content+="$(cat "$file_path")"$'\n'
      else
        echo "Fixed file $fixed_file not found."
      fi
  done

  # Append the additional argument to the content
  local append_text="
___________________________________________________________________
  Above I provided you the code that I think that you will need to complete my request
Below I will provide you the task itself that I am doing so you have more context on what I need
______________________________________________________________________
Application sole purpose is to manage bank account
balance via Rest API.
Create endpoints to:
● Import bank statement for one or several bank accounts via
CSV. ● Export bank statement for one or several bank
accounts via CSV. ● Calculate account balance for a given
date.
Notes:
● Information imported/exported via CSV:
○ Account number, mandatory
○ Operation date/time, mandatory
○ Beneficiary, mandatory
○ Comment, optional
○ Amount, mandatory
○ Currency, mandatory
● When exporting CSV, accept:
○ date from, optional
○ date to, optional
● When calculating account balance accept:
○ account number, mandatory
○ date from, optional
○ date to, optional

Don’t forget:i
● Source code should be provided in GIT repository (Github , Bitbucket,
Gitlab or other platform). Do commit early and often.
● Cover your code with tests;
● Use best practices and coding conventions;
● Provide documentation how to build and run your solution;
● Try to use some Java 8 features.
____________________________________________________________
And my request is this : 
"
  java_files_content+=$'\n'"$append_text"

  # Copy the content to the clipboard
  # On WSL you may need to replace 'xclip -selection clipboard' with 'clip.exe'
  echo "$java_files_content" | xclip -selection clipboard

  # Return to the original directory (optional)
  cd - > /dev/null

  # Provide feedback
  echo "Contents of all Java files have been copied to clipboard. Appended custom text if provided."
}
