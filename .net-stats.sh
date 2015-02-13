#!/bin/bash

interfaces=$(ls /sys/class/net)
declare -A rx_stats=()
declare -A tx_stats=()
stats=""

for interface in $interfaces; do
    if [ "$interface" == "lo" ]; then continue; fi # skip loopback
    rx_stats[$interface]=`cat /sys/class/net/$interface/statistics/rx_bytes`
    tx_stats[$interface]=`cat /sys/class/net/$interface/statistics/tx_bytes`
done

sleep 1

for interface in $interfaces; do
    if [ "$interface" == "lo" ]; then continue; fi # skip loopback
    R1="${rx_stats[$interface]}"
    T1="${tx_stats[$interface]}"
    R2=`cat /sys/class/net/$interface/statistics/rx_bytes`
    T2=`cat /sys/class/net/$interface/statistics/tx_bytes`
    TBPS=`expr $T2 - $T1`
    RBPS=`expr $R2 - $R1`
    TKBPS=`expr $TBPS / 1024`
    RKBPS=`expr $RBPS / 1024`
    stats="$stats$interface tx:${TKBPS}kbs rx:${RKBPS}kbs | "
done

echo -n $stats | sed -e 's/ |$//g'
