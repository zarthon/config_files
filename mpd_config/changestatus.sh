#! /bin/bash

stat=$(mpc status | grep "^\[" | cut  -f 1 -d " ")
if [ $stat = "[playing]"  ];then
    mpc pause
else
    mpc play
fi
