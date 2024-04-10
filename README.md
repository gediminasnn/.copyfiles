# .copyfiles

This Bash script automates copying the contents of specific files and fixed files along with additional text to your clipboard.

## Prerequisites

- Bash shell

- `xclip` utility for clipboard access (might require installation on some systems)

## Instructions: 

1.  **Navigate to the Root Directory**

    Change directory to root. Run the following command in your terminal:

    `cd`

2.  **Clone the Repository**

    First, clone the repository to your local machine. Open a new terminal and run the following command:

    `git clone git@github.com:gediminasnn/.copyfiles.git`

    Replace `git@github.com:gediminasnn/.copyfiles.git` with the actual URL of your repository.

3.  **Add Script Sourcing to Existing `.bashrc`**

    -  **Open your `.bashrc` file using text editor.** Run the following command in your terminal :
     
        `vim ~/.bashrc`
        
        Replace `vim` with your favorite text editor.

    - **At the end of the file add the following line**

        `source ~/.copyfiles/script.sh`

        Replace `~/.copyfiles/script.sh` with the actual path of the project's script.
    
    - Save the changes to your `.bashrc` file.

4. **Refresh Your Terminal Configuration**

    After modifying your `.bashrc` file, the changes might not be reflected immediately in your current terminal session. To ensure the script is available run the following command in your terminal :

    `source ~/.bashrc`

    By completing this step, the `copyfiles` function will be available in your terminal whenever you need to copy the Java file contents and additional text to the clipboard.

## License

This project is licensed under the MIT License
