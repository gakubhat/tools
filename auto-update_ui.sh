#! /bin/bash
cd "$PWD";
directory=/tmp/$(ssh root@"$1" "echo \"ls /tmp/|grep \\\"jetty-0.0.0.0-9090-root.war-_-any\\\"\" >text.sh && sh text.sh")
echo jetty directory is "$directory"

while output=$(inotifywait -r -e modify,move,create,delete -c "$PWD"); do
    echo Changed "$output"
    name=$(echo "$output" | awk -F "\"*,\"*" '{print $3}')
    folder=$(echo "$output"| awk -F "\"*,\"*" '{print $1}')
    extn=$(echo "$name"|awk -F . '{print $NF}')
    echo "SO now ..... $name, $folder, $extn"
    if [ "$extn" = "jsp" ];then
        scp "$folder$name" root@"$1":"$directory"/webapp/WEB-INF/jsp
    elif [ "$extn" = "js" ];then
        scp "$folder$name" root@"$1":"$directory"/webapp/resources/js/
    elif [ "$extn" = "css" ];then
        scp "$folder$name" root@"$1":"$directory"/webapp/resources/css/
    else
		echo 'I dont want to worry about this file - '"$name"
	fi
done
