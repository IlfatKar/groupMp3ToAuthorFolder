#!/bin/bash
#set -x
path=./
[ ! -z $1 ] && path=$1
for FILE in "$path"*.mp3
do
  FILENAME=`basename "$FILE"`
  ARTIST=`ffprobe "$path/$FILENAME" 2>&1 | grep -w 'artist' | cut -d ":" -f 2`
  ARTIST=`echo $ARTIST | xargs`
  if [ ! -z "$ARTIST" ]
  then
    mkdir -p "$path/$ARTIST" && mv "$path/$FILENAME" "$path/$ARTIST/$FILENAME" 
  else
    mkdir -p "$path/Other" && mv "$path/$FILENAME" "$path/Other/$FILENAME" 
  fi
done
