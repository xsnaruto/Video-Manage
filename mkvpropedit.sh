#!/bin/bash

for i in *.mkv;
do
    rclone copy "$i" /root/tmp --retries 5 -P;
    # mkvpropedit /root/tmp/"$i" --edit track:s1 --set language=chi;
    mkvpropedit /root/tmp/"$i" --edit track:a1 --set language=jpn --edit track:s1 --set language=chi --edit track:s2 --set language=chi;
    rclone move /root/tmp/"$i" ./ --retries 5 -P;
    echo "=======================================================================";
done
