copyfiles() {
  local java_files_content=""

  # Change directory to the project's Java source directory (optional)
  # local project_dir=~/repos/gediminasnn/j-s.bank-account-balance-manager/
  # cd "$project_dir" || return

  # Find all Java files and concatenate not excluded files
  local exclude_files=""

  # macOS compatible way to get the directory of the script
  local copyfiles_script_dir="$HOME/.copyfiles"
  while IFS= read -r filename; do
    exclude_files="$exclude_files $filename"
  done < "$copyfiles_script_dir/exclude_files.txt"
  exclude_files="${exclude_files:1}"
  
  if [ $# -eq 0 ]; then
    # No arguments provided, get contents of all not excluded .java files
    while IFS= read -r file; do
      if [[ $exclude_files != *$(basename "$file")* ]]; then
        java_files_content+="$(cat "$file")"$'\n'
      fi
    done < <(find . -type f -name '*.java')
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

  # Handle additional fixed files
  local additional_files=""
  # macOS compatible way to get the directory of the script
  local copyfiles_script_dir="$HOME/.copyfiles"
  while IFS= read -r filename; do
    additional_files="$additional_files $filename"
  done < "$copyfiles_script_dir/additional_files.txt"
  additional_files="${additional_files:1}"
  for fixed_file in $additional_files; do
      local file_path=$(find . -type f -name "$fixed_file" -print -quit)
      if [[ -f "$file_path" ]]; then
        java_files_content+="$(cat "$file_path")"$'\n'
      else
        echo "Fixed file $fixed_file not found."
      fi
  done

  # Append the additional argument to the content
  local copyfiles_script_dir="$HOME/.copyfiles"
  local append_text_file="$copyfiles_script_dir/append_text.txt"
  java_files_content+=$'\n'$(<"$append_text_file")

  # Copy the content to the clipboard
  # Using 'pbcopy' for macOS
  echo "$java_files_content" | pbcopy

  # Return to the original directory (optional)
  # cd - > /dev/null

  # Provide feedback
  echo "Contents of all Java files have been copied to clipboard. Appended custom text if provided."
}
