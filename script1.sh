#!/bin/bash

for i in $(seq 1 12); do date --date="1947-${i}-$(ncal ${i} 1947 | grep Fr | tr -s ' ' | cut -d ' ' -f 4)" +"%A %d/%m/%Y"; done
