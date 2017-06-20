#!/bin/sh
STRING=$1;
TARGET=$2;
KEYWORD=$3;
TMP_FILE="/tmp/filteredText.txt"
cat $STRING|grep $KEYWORD | awk -F'=' '{print $1}'>/tmp/filteredText.txt 
echo The following string are not used in the given file
while IFS= read -r key 
do
cat $TARGET|grep -w  $key >/dev/null 2>&1
if [ $? -ne 0 ];then
 echo $key 
fi
done < "$TMP_FILE"

