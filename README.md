# Automate Project Setup with a Shell Script

This project was made to automate the setup of my projects and push the initialized project to a github repo. 

## Motivation

While working through The Odin Project I found myself doing the same series of npm, Bash, and git commands for setting up my projects. I knew there was a way to automate away the repetitive nature of the project setup, so I looked into shell scriptng. This script is the result of that.

## Installation

As of current writing, I do not have this code published or accessible outside of this GitHub repository. If on Ubuntu you can get the file to your device using the following command line command:

```Bash
wget https://raw.githubusercontent.com/Tory-Rochat/shell-create-project/main/createProject.sh
```

If your device does not have `wget` but you know of other command line tools to pull files from a raw link, you may use the link following `wget` with your tool of choice.

**Note: This was written on Ubuntu for use on a device with a Linux OS. This will not work on Windows out of the box.**

## Usage

This script relies on a few things to work.

1. The repository has been created on your GitHub already. It does not need to contain any files and may contain a LICENSE. It is not recommended to add other files before running the script.
2. You have Git and NPM installed on your device.
3. You have connected Git to your GitHub account.

To setup for use from any working directory, use one of the methods found from clicking [this link](https://superuser.com/a/510155). I used option 2 found in that link, which is adding the folder containing the file to your `$PATH`.

If the script is added to your `$PATH` variable, you can use the script in any working directory as follows:

```Bash
Bash createProject.sh githubUsername repositoryName
```
Otherwise you can run the script as follows:

```Bash
Bash ~/path/to/script/folder/createProject.sh githubUsername repositoryName
```


Both `githubUsername` and `repositoryName` are optional arguments. If you choose to use them, replace them with your GitHub username and the repository name respectively (both case sensitive). If you do not pass the arguments, you will be prompted for the arguments you left off. Argument order matters, and you cannot leave off only the first argument.

If I were using it for this repository, it would look like this:

```Bash
Bash createProject.sh Tory-Rochat shell-create-project
```

Or if I chose to leave the arguments out the program would look like the following:

```Bash
Bash createProject.sh
Github Username: Tory-Rochat
Confirm username is Tory-Rochat ? (y/n): y
Repository Name: shell-create-project
Confirm Repository Name is shell-create-project ? (y/n): y
```

If you entered your information correctly and have it setup correctly the program should run, initialize your project, and push it to the GitHub Repository that was input.

## Contributing

If you find a bug or would like to make changes or additions to the code, pull requests are welcome.

## License

[MIT](https://choosealicense.com/licenses/mit/)
