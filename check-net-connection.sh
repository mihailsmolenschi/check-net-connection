printf "Enter destination: (default: 8.8.8.8)\n>> "
read userDestination
if [[ $userDestination == '' ]]
then userDestination="8.8.8.8"
fi

printf "Enter timeout: (default: 10)\n>> "
read userTimeout
if [[ $userTimeout == '' ]]
then userTimeout=10
fi

## date format: dd.mm.YYY HH:MM:SS
timeStarted=$(date +%d.%m.%Y" "%H:%M:%S)

fileVersion=$(date +%d-%m-%Y_%H-%M-%S)
fileName="log_$fileVersion.txt"
logsFolder="connection-logs"
mkdir $logsFolder
filePath="$logsFolder/$fileName"
printf "\nFile name: $fileName\n\n" | tee -a $filePath
printf "Time started: $timeStarted\n\n" | tee -a $filePath

ping -w $userTimeout -D $userDestination | tee -a $filePath

printf "\nStart: $timeStarted\n" | tee -a $filePath
timeEnded=$(date +%d.%m.%Y" "%H:%M:%S)
printf "Finish: $timeEnded\n" | tee -a $filePath
printf "Timeout: $userTimeout sec\n" | tee -a $filePath



# speedtest | tee -a file_name.txt

## You can do all of the above by using the ping default command,
## like in the command below.
# ping 8.8.8.8 -D > file_name.txt
