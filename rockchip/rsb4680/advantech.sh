#!/system/bin/sh

insmod /system/lib/module/bcmdhd.ko firmware_path=/system/etc/firmware/43241b4.bin nvram_path=/system/etc/firmware/bcm943241ng1630_p252.txt iface_name=wlan0

logFile=/data/bootCount.tt
adv_hctosys_sleep_time=7200


bootCount()
{

	if [ -e ${logFile} ] ; then 
		logNu=`cat ${logFile}`
		countNu=$((${logNu}+1))
		echo ${countNu} > ${logFile}
	else
		touch ${logFile}
		echo "1" > ${logFile}
	fi
}

adv_hctosys()
{
	echo "adv_hctosys -- sync every " ${adv_hctosys_sleep_time} " seconds"

	while :
	do
		sleep ${adv_hctosys_sleep_time}
		busybox hwclock -s -u
	done
}

init_dev()
{
	chmod 666 /cache/recovery/*
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
bootCount
#adv_hctosys
#enable_tcp_adb
