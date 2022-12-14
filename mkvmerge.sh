#! /bin/bash

for i in *.mp4;
do
    # echo "Merging ${i}";
    rclone copy "$i" /root/tmp --retries 5 -P;
    mkvmerge -o "/root/tmp/${i/.mp4/.mkv}" --language 1:chi /root/tmp/"$i";
    rclone move /root/tmp/${i/.mp4/.mkv} ./ --retries 5 -P;
    rm /root/tmp/$i;
    rm "$i";
done
