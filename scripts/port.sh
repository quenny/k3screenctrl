#!/bin/sh

SWCFG_OUT=`swconfig dev switch0 show`

print_eth_port_status() {
    local port=$1

    if [ -n "`echo $SWCFG_OUT | grep \"port:$port link:up\"`" ]; then
        echo 1
    else
        echo 0
    fi
}

print_usb_port_status() {
    if [ "`ls -1 /sys/bus/usb/devices | wc -l`" -gt 8 ]; then
        echo 1
    else
        echo 0
    fi
}

print_eth_port_status 1 # Labeled LAN1
print_eth_port_status 0 # LAN2
print_eth_port_status 2 # LAN3
print_eth_port_status 3 # WAN
print_usb_port_status