cd $PWD; mvn install && ssh root@$1 "rm -rf rm -rf /tmp/jetty-0.0.0.0-9090-root.war-_-any-*" && scp web-application/target/iprint-appliance-webapp-0.0.7-SNAPSHOT.war root@$1:/opt/novell/common-services/webapps/root.war ;ssh root@$1 "rcnovell-jetty restart"&

