#!/bin/bash

for i in *.mkv;
do
    rclone copy "$i" /root/tmp -P;
    # mkvpropedit /root/tmp/"$i" --edit track:s1 --set language=chi;
    mkvpropedit /root/tmp/"$i" --edit track:s1 --set language=chi --edit track:s2 --set language=chi;
    rclone move /root/tmp/"$i" ./ -P;
    echo "=======================================================================";
done
