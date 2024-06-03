# .copyfiles

This python script automates copying contents of whole project files and fixed files along with additional text to your clipboard, its mainly used for generating AI prompts.

## Prerequisites

- Bash shell
- Python 3

## Instructions: 

1.  **Navigate to the Root Directory**

    Change directory to root. Run the following command in your terminal:

    ```bash
    cd
    ```

2.  **Clone the Repository**

    First, clone the repository to your local machine. Open a new terminal and run the following command:

    ```bash
    git clone git@github.com:gediminasnn/.copyfiles.git
    ```

    Optionally replace `git@github.com:gediminasnn/.copyfiles.git` with the actual URL of the repository.

3. **Determine Your Root Path**

    Run the following command in your terminal to determine your root path:

    ```bash
    pwd
    ```

    Note the output of this command as it will be used in the next step.

4. **Open Your Shell Configuration File**    
    
    Open your `.bashrc` or `.zshrc` file using a text editor by running the following command in your terminal:

    ```bash
    vim ~/.bashrc
    ```
    or
    ```bash
    vim ~/.zshrc
    ```

    Optionally replace `vim` with your favorite text editor.

5. **Add Execution Function To The Configuration File**
    
    Add the following command function to the end of your `.bashrc` or `.zshrc` file:

    ```bash
    copyfiles() {
        python3 /home/gediminas/.copyfiles/app.py "$1"
    }
    ```

    **Replace `/home/gediminas/.copyfiles/app.py` with the output from the `pwd` command.**

6. **Save The Configuration File**

    After adding the function, you need to save the changes you made to your `.bashrc` or `.zshrc` file. In `vim`, you can do this by pressing `Esc`, typing `:wq`, and then pressing `Enter`. This will write the changes to the file and quit the editor. If you are using a different text editor, follow the appropriate steps to save the file.


7. **Refresh Your Terminal Configuration**

    After modifying your `.bashrc` or `.zshrc` file, the changes might not be reflected immediately in your current terminal session. To ensure the script and alias are available, run the following command in your terminal:

    ```bash
    source ~/.bashrc
    ```
    or
    ```bash
    source ~/.zshrc
    ```

    By completing this step, the `copyfiles` function will be available in your terminal whenever you need to copy the file contents and additional text to the clipboard.

## Usage

1. **Navigate to your desired project's directory source**

    For example run in your terminal: 

    ```bash
    cd /home/gediminas/exchange-portal
    ```

2. **Add your desired files to exclude into `exclude_files.txt`**

    Example of `exclude_files.txt`

    ```
    ExchangePortalApplication.java
    ExchangePortalApplicationTests.java
    ```

3. **Add your desired additional files to copy into `additional_files.txt`**

    Example of `additional_files.txt`
    ```
    pom.xml
    ```

4. **Add your desired custom text to `append_text.txt`**

    Example of `append_text.txt`
    ```
    ___________________________________________________________________
    Above I provided the whole codebase that I have currently
    ___________________________________________________________________ 
    ```

5. **Copy file contents**

    Simply run in the terminal:

    ```bash
    copyfiles java
    ```

    Optionally replace `java` with the actual file type you want to pass to the copy files script.

    **Example output:**

    ```bash
    # ./backend/src/main/java/com/example/exchangeportal/service/CurrencyService.java
    package com.example.exchangeportal.service;

    import java.time.LocalDate;

    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Service;

    import com.example.exchangeportal.entity.Currency;
    import com.example.exchangeportal.exception.ApiException;
    import com.example.exchangeportal.exception.ParsingException;
    import com.example.exchangeportal.repository.CurrencyRepository;
    import com.example.exchangeportal.provider.CurrencyProvider;

    @Service
    public class CurrencyService {
        @Autowired
        private CurrencyRepository currencyRepository;
    ...
    # ./backend/pom.xml
    <?xml version="1.0" encoding="UTF-8"?>
    <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    ...
    ___________________________________________________________________
    Above I provided the whole codebase that I have currently
    ___________________________________________________________________ 
    ```

## License

This project is licensed under the MIT License
