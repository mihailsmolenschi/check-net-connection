LINE="======================================================\n"
STARTTIME=0;
ENDTIME=0;

printf "Enter DESTINATION(default: 8.8.8.8):\n>> "
read DESTINATION
if [[ $DESTINATION == '' ]]
then
    DESTINATION="8.8.8.8"
fi

printf "Enter TIMEOUT(default: 10):\n>> "
read TIMEOUT
if [[ $TIMEOUT == '' ]]
then
    TIMEOUT=10
fi

FVERSION=$(date +%d-%m-%Y_%T)
touch log_$FVERSION.txt
> log_$FVERSION.txt

printf $LINE | tee -a log_$FVERSION.txt
STARTINGTIME=$(date)
printf ">> Starting time/date:  |$STARTINGTIME\n"   | tee -a log_$FVERSION.txt
printf ">> Destination:         |$DESTINATION\n"    | tee -a log_$FVERSION.txt
printf ">> Timeout:             |$TIMEOUT\n"        | tee -a log_$FVERSION.txt
printf $LINE | tee -a log_$FVERSION.txt 

#-O prints a message when reply is not received in time
ping -w $TIMEOUT -O -D $DESTINATION | tee -a log_$FVERSION.txt

printf $LINE | tee -a log_$FVERSION.txt
printf ">> Starting time/date:  |$STARTINGTIME\n"   | tee -a log_$FVERSION.txt
ENDTIME=$(date)
printf ">> End time/date:       |$ENDTIME\n"        | tee -a log_$FVERSION.txt
printf $LINE | tee -a log_$FVERSION.txt

speedtest | tee -a log_$FVERSION.txt