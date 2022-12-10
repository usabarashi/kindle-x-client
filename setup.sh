#! /usr/bin/bash
wine /root/KindleForPc.exe
sleep 30
while [[ `ps -aux` =~ Kindle ]]
do
    sleep 10
done