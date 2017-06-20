#! /bin/bash
while output=$(inotifywait -r -e modify,move,create,delete -c $PWD); do
echo Changed $output
name=$(echo $output | awk -F "\"*,\"*" '{print $3}')
folder=$(echo $output| awk -F "\"*,\"*" '{print $1}')
extn=$(echo $name|awk -F . '{print $NF}')
echo "SO now ..... $name, $folder, $extn"
if [ "$extn" = "txt" ];then
		echo "File $folder/$name is a text file"
	else
		echo I dont care about this
	fi
done

