# Frankenstein-Disintegration
The URL for it as plain text is:        https://www.gutenberg.org/files/84/84-0.txt (copyright free)
The project is to develop a data work flow (and the scripts you need) to download the book, and find how the density of certain words ( = number of lines containing the chosen word divided by the number of lines ) varies through the book. 
Only command line tools are used. Density of the words 1.monster 2.Frankenstein 3.scared 4.love 5.hate
# Script data work flow
1. The data manipulation will require files to be created and removed, so I created a directory called
“book_assignment” and saved all the data files in scripting process in this folder. But If the user already
has this file, it is better to check it in PWD and notify the user to rename that directory or file if it
exists. This is where I used if loop.
2. Taking user input for book url and saving it in book.txt file for user
3. It is better to remove all blank lines, since they are not required in this process of finding densities of
user input words. Sed command is used with \s for any blank line to be removed (note ^$ did not work
in this case )
4.user is notified of the number of line the whole book has prior to asking them to input their desired
number of line for splitting the whole book into parts.
Split command is used with ‘-d’ option for getting the files names with number suffix
5.--verbose option is used to display the user the files split-ted and further the user is given the total
number of files formed after splitting
6. since we know that the split command will create files with x00 format, the names of the file is saved
in a ‘fil_es’ variable. Later the ‘arra’ variable is created as an array to save split-ted files in it using the
‘fil_es’ variable. We created this array of splitted files in it so that we can use it in the for loop.
7. user is asked for the words , the user want to find densities of. The ‘-a’ option with read assigns the
word as array which can accept multiple aguments.
8.using ‘grep’ command in for loop, user input words are counted from the split-ted files and saved in
word_density_per_file.txt for the user
9.word_per_file is also created which has the count of all words in all the split-ted file or say entire
book.
10. The word_per_file is now split-ted with individual number of word count in each files.
11.variable var5 is assigned to include the names of the split-ted word_per_file. Var5 is then converted
to an array using var6 to use in for loop.
12.each file in var6 is used to divide by the entire book line number to find the total density and is
saved in file word_totaldensity.txt for user.
13.Unwanted files are removed from the directory we created at the beginning.

