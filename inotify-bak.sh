#!/bin/sh
#
# Make a copy of the full path and file
#
if [ -d "$1" ] 
 then 
  echo "$1" 'IN_MODIFY,IN_CREATE,IN_CLOSE_WRITE,IN_MOVED_TO /usr/local/bin/inotify-bak.sh $@/$#' >>/var/spool/incron/$USER
  incrontab -d
 else
  export DATE_N=`date +'%m-%d_%H:%M'`
  cp -p --parents $1  /opt/stor/bak/inotify
  xz -c /opt/stor/bak/inotify/$1 > /opt/stor/bak/inotify/$1_${DATE_N}.xz
fi
# move the file to a file with datetime-stamp
#
#mv /opt/stor/bak/inotify/$1 /opt/stor/bak/inotify/$1_`date +'%m-%d_%H:%M'`
