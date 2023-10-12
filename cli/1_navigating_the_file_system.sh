#!/bin/bash
## ^
##/_\
## |
## |
# the #! is called a "shebang" and tells the command line interpreter which shell to use to interpret this script (bash, in this case, located in /bin/bash)
repo_dir=$(pwd)
# navigating the file system
echo "-----1-----navigating the file system-----1-----"
echo ""
# because, you know.
echo "echo – prints a message as a standard output."
echo "> echo \"hello, world\""
echo "hello, world"
echo""
echo "pwd – shows the current working directory’s path."
echo "> pwd"
pwd
echo ""
echo "ls – lists a directory’s content."
echo "> ls"
ls
echo ""
echo "cd – changes the working directory."
echo "> cd ~"
cd ~
echo "> pwd"
pwd
echo "(let's stay in the repo's dir for now though:)"
echo "> cd $repo_dir"
cd $repo_dir
echo "> pwd"
pwd

echo ""
echo "touch – creates a new empty file."
echo "> touch new_file.extension"
touch new_file.extension
echo "> ls"
ls
echo ""
echo "rm – deletes a file."
echo "> rm new_file.extension"
rm new_file.extension
echo "> ls"
ls
echo ""
echo "mkdir – creates a new directory."
echo "> mkdir epic_directory"
mkdir epic_directory
echo "> ls"
ls
echo ""
echo "rmdir – removes a folder or path."
echo "> rmdir epic_directory"
rmdir epic_directory
echo "> ls"
ls
echo ""
echo "all these commands have a man page, you can check it out by typing the following:"
echo "man [name_of_command]"
echo "e.g.:"
echo "man mkdir"
echo ""
echo "Often also useful:"
echo "history – lists previously run commands."
echo "alias and unalias – sets and removes an alias for a file or command."
echo ""
echo "---------"
echo "now try:"
echo "---------"
echo "- making some files in a new directory and removing the entire directory (hint: check the man page of rm)"
echo "- making some files in a non-existing directory with 1 command (hint: check the man page of touch)"
echo "- figuring out what these commands do:"
echo "  - cp"
echo "  - mv"
echo "  - cat"
echo "  - less"
echo "  - more"
echo "  - head"
echo "  - tail (check out +1f, and remember what Ctrl+C does)"
echo ""
echo "If you want new binaries, try finding them with brew/apt-get!"



