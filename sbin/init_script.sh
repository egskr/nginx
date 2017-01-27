#!/usr/bin/bash

operation=$1

if [[ $operation == "help" ]]; then
echo "Usage: nginx {start | stop | status}"
exit
fi

if ! [[ $operation ]]; then	
	echo -e "\nUsage: start|stop"
	echo ""
	exit
fi


if [[ $operation == "start" ]]; then
	/home/egor/nginx/sbin/nginx
	if [ $? -eq 0 ]; then
		echo "Nginx Started"
	fi
elif [[ $operation == "stop" ]]; then
	/home/egor/nginx/sbin/nginx -s quit
	if [ $? -eq 0 ]; then
		echo "Nginx Stopped"
	fi
elif [[ $operation == "status" ]]; then
	isactive=0
	isactive=$(ps aux | grep nginx | grep -v "grep nginx" | wc -l)
	if [ $isactive != 0 ]; then
		echo "Nginx is Running"
	else
		echo "Nginx is Stopped"
	fi
else
	echo "Wrong Input"
fi