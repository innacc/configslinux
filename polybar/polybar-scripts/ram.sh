#!/bin/bash
echo "ram: $(free -h --si | awk '/^Mem:/ {print $3}')"
