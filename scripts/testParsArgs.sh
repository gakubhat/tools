#!/bin/sh
#!/bin/sh
cd $PWD;
directory=/tmp/$(ssh root@$1 "echo \"ls /tmp/|grep \\\"jetty-0.0.0.0-9090-root.war-_-any\\\"\" >text.sh && sh text.sh")
echo jetty directory is $directory

server=""
while getopts ":d:s:c:j" opt; do
	  case $opt in
    d)
      echo "-d was triggered, Parameter: $OPTARG" >&2
      server=$OPTARG
      ;;
    s)
     scp ./web-application/src/main/webapp/resources/js/*.js root@$server:$directory/webapp/resources/js/
      ;;
          j)
scp ./web-application/src/main/webapp/WEB-INF/jsp/*.jsp root@$server:$directory/webapp/WEB-INF/jsp/
      ;;
          c)
     scp ./web-application/src/main/webapp/resources/css/*.css root@$server:$directory/webapp/resources/css/
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

