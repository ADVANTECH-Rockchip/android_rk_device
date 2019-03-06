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

bootCount

