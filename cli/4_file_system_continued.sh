#!/bin/bash
# Setup, don't output to console
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# permissions & users
echo "-----4-----file system, continued-----4-----"
echo ""

# disk/files
echo "df – displays the system’s overall disk space usage."
echo "> df"
df
echo""
echo "du – checks a file or directory’s storage consumption (size of total storage block)."
echo "> du --si .."
du --si ..
echo""
echo "find – outputs a file or folder’s location."
echo "> find . -name *disks*"
find . -name *disks*
echo""
echo "locate(linux)/mdfind(MacOS) – finds files in a system’s database."
echo "> locate disks_proces"
if (machine==Mac)
then
  mdfind -name disks_proces
fi
if (machine==Linux)
then
  locate disks_proces
fi
echo""
echo "NB: if you didn't find any file, you might need to initialize the database using \"updatedb\""
echo""
echo "zip and unzip – creates and extracts a ZIP archive."
echo "> echo \"random_stuff\" > random_file.ext"
echo "random_stuff" > random_file.ext
echo "> zip random_file.ext"
zip random.zip random_file.ext
echo ""
echo "tar – archives files without compression in a TAR format."
echo "> tar -cf random.tar random_file.ext"
tar -cf random.tar random_file.ext
echo ">  ls -la . | grep random"
ls -la . | grep random
echo ""
echo "ln – links files or directories."
echo "> ln -s random_file.ext random.reference"
ln ln -s random_file.ext random.reference
echo ">  ls -la . | grep random"
ls -la . | grep random
echo""
echo "Often also useful:"
echo ""
echo "mount - attaches a (new) file system to the UNIX file system you are currently on"
echo "umount - detaches a file mount"
echo ""
echo "---------"
echo "now try: "
echo "---------"
echo "- "
echo "- figuring out what these commands do:"
echo "  - "

