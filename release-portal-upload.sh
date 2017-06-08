cd $PWD; ant && scp ./dist/release-portal.war root@$1:/opt/novell/common-services/webapps/release-portal.war ; ssh root@$1 "rcnovell-jetty restart &";echo "Restarted jetty";
