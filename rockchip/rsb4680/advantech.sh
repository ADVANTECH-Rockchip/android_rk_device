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
	chmod 777 -R /data/local/tmp
	sleep 3
	ln -s /dev/ttyACM0 /dev/ttyS30
	ln -s /dev/ttyACM1 /dev/ttyS31
	ln -s /dev/ttyUSB0 /dev/ttyS6
	ln -s /dev/ttyUSB1 /dev/ttyS7
	chmod 777 /dev/tty*
}

init_dev
bootCount
#adv_hctosys
