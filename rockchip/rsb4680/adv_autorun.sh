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
	ln -s /dev/ttyS1 /dev/ttyuart5
	ln -s /dev/ttyS3 /dev/ttyuart6
	ln -s /dev/ttyS4 /dev/ttyuart2
	ln -s /dev/ttyUSB0 /dev/ttyuart3
	ln -s /dev/ttyUSB1 /dev/ttyuart4
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

