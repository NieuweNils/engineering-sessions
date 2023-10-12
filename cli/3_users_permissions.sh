#!/bin/bash
# permissions & users
echo "-----3-----permissions & users-----3-----"
echo ""
echo "ls's option -l (long format) shows extra info besides the filename, such as: the permissions set, user, size, last updated"
echo "> ls -l"
ls -l
echo ""
echo "we no permissions, so can't read the file:"
echo "> cat cant_read_this.txt"
cat cant_read_this.txt
echo ""
echo "whoami - outputs.. who you are (which user is active)"
echo "> whoami"
whoami
echo ""
echo "chmod – modifies a file’s read, write, and execute permissions."
echo "> chmod 444 cant_read_this.txt"
chmod 444 cant_read_this.txt
echo ""
echo "we now have read permission, so can read the file:"
echo "> cat cant_read_this.txt"
cat cant_read_this.txt
echo ""
echo "we should still not have write permission:"
echo "> echo \"You can!\" >> cant_read_this.txt"
echo "You can!" >> cant_read_this.txt
echo ""
echo "file – checks a file’s type."
file cant_read_this.txt
echo ""
echo "---------"
echo "now try: "
echo "---------"
echo "- modifying the file's permission to allow write access, and writing to it"
echo "- checking out what is up with possibly_dangerous.exe and running it (if you want to.. but do you?!)"
echo "- figuring out what these commands do:"
echo "  - useradd"
echo "  - userdel"
echo "  - chown"
echo "  - su (remember what Ctrl+D/ \"exit\" does)"
echo "  - sudo"
echo "  - awk"
echo "  - sed"
echo "  - diff"
echo "  - tee"


