#!/bin/sh

HADOOP=`ls -1 | grep hadoop-`
sudo /usr/sbin/sshd
cd /app/$HADOOP
./sbin/start-dfs.sh

JAVA_PROC=`ps -o comm | grep java | wc -l`

while [ $JAVA_PROC != 0 ]
do
	sleep 5
	JAVA_PROC=`ps -o comm | grep java | wc -l`
	echo "Got ${JAVA_PROC} processes running"
done

