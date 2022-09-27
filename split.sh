#!/bin/bash

# The first line of the script indicates what program is to be used to interpret
# the script. In this case, /bin/bash.

# Everything that appears after a "#" symbol is ignored by bash.

# To create a variable, put a line in the script that contains the name of the
# variable followed immediately by an equal sign ("="). NO SPACES are allowed.
# After the equal sign, assign the information to store.
# The only characters allowed in variable names are [A-Za-z0-9_] (alphanumeric
# characters and underscore).
dirname=lines
extension=.txt
rm -rf $dirname
# Whenever the shell sees a word that begins with a "$", it tries to find out
# what was assigned to the variable and substitutes it.
mkdir $dirname

sourcefile=aladdin.txt
counter=0

# Check the man page of read for its usage
while IFS= read -r line; do
  filename="$dirname""/""$(printf $counter)""$extension" # concatenate strings
  echo "$line" > $filename
  ((counter++))
done < $sourcefile
  
# For more information about how to write shell scripts, 
# see http://linuxcommand.org/lc3_writing_shell_scripts.php
