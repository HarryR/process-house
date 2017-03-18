#!/usr/bin/env bash

TODAY_NAME=$(date +%Y%m%d)
DAILY_NAMES=$(for N in `seq 1 7`; do date +%Y%m%d -d "-$N day"; done)
WEEKLY_NAMES=$(for N in `seq 0 5`; do date +%Y%m%d -d "sunday-$N week"; done)
ALL_NAMES=`echo $TODAY_NAME $DAILY_NAMES $WEEKLY_NAMES | sed -e 's/\s*\(\w\b\)\s*/\1.tar\n/g' | sort | uniq | grep -v '^$'`
ALL_COUNT=`echo $ALL_NAMES | wc -w`

if [[ -z $1 ]]; then
	echo "Usage: $0 <files ...>"
	exit
fi

BACKUP_DIR=`pwd`/backups

if [[ ! -d $BACKUP_DIR ]]; then
	mkdir $BACKUP_DIR
fi
if [[ ! -d $BACKUP_DIR ]]; then
	echo "Error: cannot create backup dir"
	exit
fi

BACKUP_SOURCE=$*
BACKUP_TMPFILE=`tempfile -d backups`
echo "+ $TODAY_NAME.tar"
tar -cvpf $BACKUP_TMPFILE $BACKUP_SOURCE
mv $BACKUP_TMPFILE $BACKUP_DIR/$TODAY_NAME.tar

for FILE in `find backups -type f | xargs -n 1 basename`
do
	echo $ALL_NAMES | fgrep -q $FILE
	OK=$?
	if [[ $OK -ne 0 ]]; then
		echo "- $FILE"
		rm $BACKUP_DIR/$FILE
	fi
done
