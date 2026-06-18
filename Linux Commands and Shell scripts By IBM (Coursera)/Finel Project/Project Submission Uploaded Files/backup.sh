#!/bin/bash

# Task 2 & 3: Store command-line arguments in variables
targetDirectory=$1
destinationDirectory=$2

# Task 3: Print the variables
echo "targetDirectory: $targetDirectory"
echo "destinationDirectory: $destinationDirectory"

# Task 4: Store the current timestamp (in seconds)
currentTS=$(date '+%s')

# Task 5: Construct the backup file name
backupFileName="backup-${currentTS}.tar.gz"

# Task 6: Store the original absolute path
origAbsPath=$(pwd)

# Task 7: Move into destinationDirectory and capture its absolute path
cd "$destinationDirectory"
destAbsPath=$(pwd)

# Task 8: Return to the original path, then move into targetDirectory
cd "$origAbsPath"
cd "$targetDirectory"

# Task 9: Calculate timestamp for 24 hours before currentTS
yesterdayTS=$(($currentTS - 24 * 60 * 60))

# Array to hold files that need to be backed up
toBackup=()

# Task 10 & 11: Loop through all files/directories in the current directory
for file in *
do
    if [[ $(date -r "$file" +%s) -gt $yesterdayTS ]]
    then
        toBackup+=("$file")
    fi
done

# Task 12: Create the compressed archive containing the files to back up
tar -czvf "$backupFileName" "${toBackup[@]}"

# Task 13: Move the backup archive into the destination directory
mv "$backupFileName" "$destAbsPath"
