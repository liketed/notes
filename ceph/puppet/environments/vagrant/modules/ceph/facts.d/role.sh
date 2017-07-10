#!/bin/bash
echo role=`facter hostname| sed 's/[0-9]*//g'`
