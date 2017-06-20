#!/bin/sh
cd $PWD;
# ssh root@$1 "echo \"ls /tmp/|grep \\\"jetty-0.0.0.0-9090-root.war-_-any\\\"\" >text.sh && sh text.sh"
# scp getJettyFolderPathForRootwar.sh root@$1:~/
# directory=`ssh root@$1 'sh ~/getJettyFolderPathForRootwar.sh'`
directory=/tmp/$(ssh root@$1 "echo \"ls /tmp/|grep \\\"jetty-0.0.0.0-9090-root.war-_-any\\\"\" >text.sh && sh text.sh")
echo jetty directory is $directory
scp ./web-application/src/main/webapp/resources/js/*.js root@$1:$directory/webapp/resources/js/
scp ./web-application/src/main/webapp/resources/css/*.css root@$1:$directory/webapp/resources/css/
scp ./web-application/src/main/webapp/WEB-INF/jsp/*.jsp root@$1:$directory/webapp/WEB-INF/jsp/