#!/system/bin/sh

logFile=/data/radiolog.txt
echo $(date) >> ${logFile}

check_neoway()
{
 result=$(lsusb -d 2949:8243 | grep -e "2949:8243")
 if [ $? -eq 0 ]; then
    echo "Detect neoway_n720" >> ${logFile}
        setprop "ril.neoway.start" "1"
        setprop "ril.module" "neoway"
        exit 0
 else
    echo "Can not Detect neoway_n720" >> ${logFile}
 fi

 result=$(lsusb -d 2949:8247 | grep -e "2949:8247")
 if [ $? -eq 0 ]; then
    echo "Detect neoway_n720" >> ${logFile}
        setprop "ril.neoway.start" "1"
        setprop "ril.module" "neoway"
        exit 0
 else
    echo "Can not Detect neoway_n720" >> ${logFile}
 fi
}

check_quectel()
{
 result=$(lsusb -d 05c6:9215 | grep -e "05c6:9215")
 if [ $? -eq 0 ]; then
    echo "Detect quectel_ec20" >> ${logFile}
        setprop "ril.quectel.start" "1"
        setprop "ril.module" "Quectel"
        exit 0
 else
    echo "Can not Detect quectel_ec20" >> ${logFile}
 fi

 result=$(lsusb -d 2c7c:0125 | grep -e "2c7c:0125")
 if [ $? -eq 0 ]; then
    echo "Detect quectel_ec25" >> ${logFile}
        setprop "ril.quectel.start" "1"
        setprop "ril.module" "Quectel"
        exit 0
 else
    echo "Can not Detect quectel_ec25" >> ${logFile}
 fi
}

sleep 5
for i in $(seq 1 10)
do
check_quectel
check_neoway
sleep 1
done

