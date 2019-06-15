#!/bin/bash
# https://www.gutenberg.org/files/84/84-0.txt
# monster frankenstein love hate scared
if [ -d "book_assignment" ]
then
echo '!!!!kindly press ^c and rename your book_assignment directory or file to something else before
typing the url'
else
mkdir book_assignment
fi
sleep 2
cd book_assignment
echo "------------------------------------------------------------------------------------"
echo -e "Paste the url of the book: \c"
read book
curl $book > book.txt
echo " "
echo "Your book is downloaded and saved as book.txt"
sed '/^\s*$/d' book.txt > no_empty_line #removing empty line
lines_book=$(cat no_empty_line | wc -l)
echo " "
echo "The book you download has $lines_book number of line"
echo "------------------------------------------------------------------------------------"
sleep 1
echo " "
echo -e "please type a number of lines for splitting the files: \c"
read -a line_no
split_file=$(split -l$line_no -d no_empty_line --verbose)
echo "------------------------------------------------------------------------------------"
sleep 1
echo " "
echo "$split_file"
echo " "
echo "------------------------------------------------------------------------------------"
len=$(ls x[0-9][0-9] | wc -l)
fil_es=$(ls x[0-9][0-9])
sleep 1
echo " "
echo -n "these are the total number of splitted files created: "
sleep 1
echo $len
#echo $fil_es checking
arra=($fil_es)
# this is for checking echo "${arra[2]}"
sleep 1
echo "------------------------------------------------------------------------------------"
echo " "
echo -e "Enter the words you like : \c"read -a word
for w in ${word[@]}
do
for a in ${arra[@]}
do
var1=$(grep -o -w -i $w $a | wc -w)
var2=$(cat $a | wc -l)
var3=$(bc <<< "scale=4; $var1/$var2")
echo "$var1" >> word_per_file
echo "$var3" >> word_density_per_file.txt
done
done
echo " "
echo "The count of words ${word[@]} in ${arra[@]} files is saved in word_per_file"
sleep 1
echo " "
echo "The density of words ${word[@]} in ${arra[@]} files is saved in word_density_per_file.txt"
sleep 1
echo "------------------------------------------------------------------------------------"
split -l$len word_per_file
var5=$(ls x[a-z][a-z])
var6=($var5) # making an array, for loop takes in array
for var7 in ${var6[@]}
do
var8=0
for var9 in $(cat $var7)
do
var8=$((var8 + $var9))
done
echo $var8 >> sum_word
done
for var10 in $(cat sum_word)
do
var11=$(bc <<< "scale=4; $var10/$lines_book")
echo "$var11" >> word_totaldensity.txt
done
echo " "
echo "The density of words ${word[@]} in the entire book is saved in word_totaldensity.txt"
rm x* sum_word no_empty_line
cd ..
echo " "


