#!/bin/bash
t0=`sensors | grep "temp1:" | awk '{print $2}'`
t1=`sensors | grep "temp8:" | awk '{print $2}'`
t2=`sensors | grep "temp9:" | awk '{print $2}'`
t3=`sensors | grep "temp10:" | awk '{print $2}'`
echo "$t0 $t1 $t2 $t3"
