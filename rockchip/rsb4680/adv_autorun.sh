#!/system/bin/sh

countFile=/data/logs/bootCount.txt

bootCount()
{

	if [ -e ${countFile} ] ; then 
		logNu=`cat ${countFile}`
		countNu=$((${logNu}+1))
		echo ${countNu} > ${countFile}
	else
		touch ${countFile}
		echo "1" > ${countFile}
	fi
}

init_dev()
{
	chmod 777 /dev/tty*
}

enable_tcp_adb()
{
	setprop service.adb.tcp.port 5555
	stop adbd
	start adbd
}

init_dev
#bootCount
#enable_tcp_adb

