#!/bin/bash

# This checks if the number of arguments is correct
# If the number of arguments is incorrect ( $# != 2) print error message and exit
if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

# This checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

# [TASK 1]
targetDirectory=$1
destinationDirectory=$2

# [TASK 2]
echo "targetDirectory is $targetDirectory"
echo "destinationDirectory is $destinationDirectory"

# [TASK 3]
currentTS=$(date +%s)
backupFileName="backup-$currentTS.tar.gz"

# [TASK 5]
origAbsPath=$(pwd)

# [TASK 6]
cd "$destinationDirectory"
destAbsPath=$(pwd)

# [TASK 7]
cd "$origAbsPath"
cd "$targetDirectory"
targetAbsPath=$(pwd)

# [TASK 8]
yesterdayTS=$(($(date +%s) - 86400))

declare -a toBackup

# [TASK 9]
for file in *
do
  # [TASK 10]
  if [ -f "$file" ] && [ $(date -r "$file" +%s) -gt $yesterdayTS ]
  then
    # [TASK 11]
    toBackup+=("$file")
  fi
done

# [TASK 12]
tar -czvf "$backupFileName" "${toBackup[@]}"

# [TASK 13]
if [ -f "$backupFileName" ] && [ "$destAbsPath" != "$targetAbsPath" ]; then
  mv "$backupFileName" "$destAbsPath/"
fi

# Congratulations! You completed the final project for this course!
