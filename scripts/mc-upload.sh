cd $PWD; mvn install && ssh root@$1 "rm -rf rm -rf /tmp/jetty-0.0.0.0-9090-root.war-_-any-*" && scp web-application/target/iprint-appliance-webapp-0.0.7-SNAPSHOT.war root@$1:/opt/novell/common-services/webapps/root.war ; scp datamodel-service/target/iprint-appliance-service-0.0.7-SNAPSHOT.jar root@$1:/opt/novell/datamodel-service/lib/iprint-appliance-service-0.0.7-SNAPSHOT.jar ; scp datamodel-interface/target/iprint-appliance-datamodel-0.0.7-SNAPSHOT.jar root@$1:/opt/novell/datamodel-service/lib/; ssh root@$1 "rcnovell-datamodel-service restart"; ssh root@$1 "rcnovell-jetty restart"&

