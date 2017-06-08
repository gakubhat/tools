#!/bin/sh
cd $PWD; mvn install && scp datamodel-service/target/iprint-appliance-service-0.0.7-SNAPSHOT.jar root@$1:/opt/novell/datamodel-service/lib/iprint-appliance-service-0.0.7-SNAPSHOT.jar ; scp datamodel-interface/target/iprint-appliance-datamodel-0.0.7-SNAPSHOT.jar root@$1:/opt/novell/datamodel-service/lib/; ssh root@$1 "rcnovell-datamodel-service restart";

