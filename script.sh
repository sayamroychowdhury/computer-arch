#!/bin/bash

cat experiment.txt | tr `echo {a..z}|tr -d ' '` `echo {a..z}|tr -d ' '|rev` > experiment2.txt
cat experiment2.txt
