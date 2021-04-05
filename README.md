# COMPSCI 230 Computer Systems Principles
# Linux Commands Lab: `grep` and `wc`

This lab is a brief tutorial on `grep` and `wc`, two useful Linux commands that
count the number of occurrences of certain phrases in some specified files.

To start working on this lab you must be logged in to the Edlab and in your
`cs230` directory. From this directory run the command:

```
$ git clone https://github.com/umass-cs-230/230-lab-grep-wc
```

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

The command line utility `wc` reads either standard input or a list of computer
files and generates one or more of the following statistics: newline count
(`-l`), word count (`-w`), and character count (`-m`).

For example, if we want to know the total number of words contained in all the
text files in the current directory, we do the following:

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
