#!/bin/bash
# Setup, don't output to console:
chmod 644 lorem_ipsum.txt

# Input/Output
echo "-----2-----Input/Output-----2-----"
echo ""
echo "The [command] > [file] operator writes the output of [command] to [file]"
echo "> echo \"data\" > new_file.txt"
echo "data" > new_file.txt
echo "> ls"
ls
echo "> cat new_file.txt"
cat new_file.txt
echo""
echo "The [command] >> [file] operator appends the output of [command] to the end of [file]"
echo "> echo "more data" >> new_file.txt"
echo "more data" >> new_file.txt
echo "> cat new_file.txt"
cat new_file.txt
echo "> rm new_file.txt"
rm new_file.txt
echo ""
echo "The [command] | [command] operator writes the output of [command] to [file]"
echo "grep – searches a string within a file."
echo "> less lorem_ipsum.txt | grep \"in\" "
less lorem_ipsum.txt | grep "in"
echo ""
echo "tail – prints a file’s last ten lines."
echo "> tail lorem_ipsum.txt"
tail lorem_ipsum.txt

echo ""
echo "---------"
echo "now try:"
echo "---------"
echo "- appending some data to a file, and print the appended data to stdout in 1 line"
echo "- appending some data to a file, and print the entire file to stdout in 1 line"
echo "- listening to a file for new incoming data (hint: open 2 terminal windows, and append some data to a file)"
echo "- searching through lorem_ipsum.txt for the sentence containing all of the following letters: \"r\", \"h\", and \"x\""
echo "- searching through the first 5 lines in lorem_ipsum.txt for a word (say, \"in\")"
echo ""
echo "also check out vim, nano, or other terminal-based editors to edit files!"
