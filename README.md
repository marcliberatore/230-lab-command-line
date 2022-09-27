# COMPSCI 230 Computer Systems Principles
# Linux Command Line lab

This lab is a brief tutorial on several useful aspects of the Unix command line.

To start working on this lab you must be logged in to the Edlab and in your `cs230` directory, or be in a similar environment on your local machine. 

From this directory run the command:

```
$ git clone https://github.com/marcliberatore/230-lab-bits-and-bytes
```

to make a copy of this lab directory, or use [Github Desktop](https://desktop.github.com), or download and decompress a zip file directly from Github to use locally (the green "Code" button has a "Download ZIP" option). 

## Part 1: `grep` and `wc`

This lab is a brief tutorial on `grep` and `wc`, two useful Linux commands that
count the number of occurrences of certain phrases in some specified files.

In the folder you just downloaded, you will find a zip file `books.zip`. Unzip
it with:

```
$ unzip books.zip
```

Look up the man pages of `grep` and `wc`. The following are some of the most
commonly used flags:

* `grep`: `-i`, `-v`, `-c`, `-n`
* `wc`: `-w`, `-l`, `-m`

The command line utility `grep` searches plain text data sets for lines that
matches a specified pattern. It then prints to `stdout` all the lines that
contain the matching pattern. For example:

```
$ grep -n Circe books/odyssey.txt
```

This command searches `odyssey.txt` for every line that contains "Circe" and
prints them with line number attached (`-n` flag).

We can also do "invert matching" with `grep`. If we want to print all the lines
in `aladdin.txt` that do *not* contain the word `Aladdin`, we do:

```
$ grep -vn Aladdin books/aladdin.txt
```

If we want to count the number of lines where the word "aladdin" shows up in
`aladdin.txt`, case-insensitive, we do:

```
$ grep -ic aladdin books/aladdin.txt
```

The command line utility `wc` reads either standard input or a list of
files and generates one or more of the following statistics: newline count
(`-l`), word count (`-w`), and character count (`-m`).

For example, if we want to know the total number of words contained in all the
text files in a directory, we do the following:

```
$ wc -w books/*.txt
```

Very often we would like to combine two or more of Linux commands via *piping*.
A pipe is a form of redirection (transfer of standard output to some other
destination) that is used to send the output of one command to another command
for further processing. The commands are linked by the pipe character `|`.

For example, if we want to list all the text files in the current directory, we
can do:

```
$ ls | grep "\.txt"
```

(The backslash is to "escape" the dot (`.`), as both the `bash` shell and `grep` will interpret the argument list -- we want `bash` to ignore the dot and pass it along to `grep`.)

Furthermore, if we want to count the number of all the text files in the current
directory, we do:

```
$ ls | grep "\.txt" | wc -l
```

If we want to know the number of words contained in all the text files in the
current directory, in addition to `wc -w *.txt`, we can also do:

```
$ cat *.txt | wc -w
```

Please read the manual pages for `grep` and `wc`, experiment with the various
flags, and answer the questions on Gradescope associated with this lab.

## Part 2: Some shell scripting

First, move (or copy) the file `aladdin.txt` from the `books/` subdirectory to the current directory:

```sh
mv books/aladdin.txt .

# or you can use cp if you like
```

In order to be able to run the script `split.sh`, first do the following:

```
$ chmod +x split.sh
```

This will give `split.sh` "execute" permission for all users. Now you can run
`split.sh`:

```
$ ./split.sh
```

After running the script, inspect the current directory and the directory and
files the script created. What does this script do?

Open `split.sh` in your favorite text editor and examine the code. Try to
understand what each line does as much as you can.

Look up the usage of `printf` with:

```
man printf
```

Recall that in Project 2, you are asked to read up on the documentation of
`printf` with:

```
man 3 printf
```

What is the difference between these two man pages?

Modify **one line** in `split.sh` so that instead of file names

```
0.txt
1.txt
2.txt
...
10.txt
11.txt
12.txt
...
100.txt
101.txt
102.txt
...
```
we have

```
000.txt
001.txt
002.txt
...
010.txt
011.txt
012.txt
...
100.txt
101.txt
102.txt
...
```

Both man pages of `printf` will be helpful here.

Now let's implement a different script called `change_permission.sh`. By running
`change_permission.sh` all files with extension `.txt` in a specified directory
(which you will define in the script) should have read-only permission for all
users. In addition, the string "\*\*\*READ ONLY\*\*\*" will be appended (use
`>>`) to each `.txt` file as its last line.

Some hints:

1. You will want to write a `for` loop that goes over every file with extension
`.txt`. See [here](http://linuxcommand.org/lc3_wss0130.php) for more hints of
what it might look like.

2. Check the man page of `chmod` to see how to set file permissions.

3. Read about option `-l` in the man page of `ls` to see how to display file
permissions. (This is useful when you test your script.)

Visit the Gradescope assignment associated with this lab to complete the lab.
You will be asked to answer questions associated with `split.sh` and to submit
your `change_permission.sh` file.
