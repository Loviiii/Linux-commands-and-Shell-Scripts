#!/bin/bash

if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

# Task 1
targetDirectory=$1
destinationDirectory=$2

# Task 2
echo $targetDirectory
echo $destinationDirectory

# Task 3
currentTS=$(date '+%s')
backupFileName="backup-${currentTS}.tar.gz"

# Task 5
origAbsPath=$(pwd)

# Task 6
cd "$destinationDirectory"
destAbsPath=$(pwd)

# Task 7
cd "$origAbsPath"
cd "$targetDirectory"

# Task 8
yesterdayTS=$(($currentTS - 24 * 60 * 60))

declare -a toBackup

# Task 9
for file in *
do
  # Task 10
  if [[ -f "$file" ]] && [[ $(date -r "$file" +%s) -ge $yesterdayTS ]]
  then
    # Task 11
    toBackup+=("$file")
  fi
done

# Task 12
tar -czvf "$backupFileName" "${toBackup[@]}"

# Task 13
mv "$backupFileName" "$destAbsPath"
