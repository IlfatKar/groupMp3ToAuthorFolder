#!/bin/bash
#FILE=Alpine\ Universe\ -\ Organika.mp3
for FILE in ./*.mp3
do
  ARTIST=`ffprobe "$FILE" 2>&1 | grep -w 'artist' | cut -d ":" -f 2`
  ARTIST=`echo $ARTIST | xargs`
  [ ! -z "$ARTIST" ] && mkdir -p "$ARTIST" && mv "$FILE" "$ARTIST/$FILE" 
done
