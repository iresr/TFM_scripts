#!/bin/bash

pmemd.cuda -O -i hmd_1_cxcr4-T22_bilayer.inp -p /state/partition1/irsil/receptor/cxcr4-T22_bilayer.prmtop -c /state/partition1/irsil/receptor/emin_3_cxcr4-T22_bilayer.restrt -r hmd_1_cxcr4-T22_bilayer.restrt -x hmd_1_cxcr4-T22_bilayer.mdcrd -o hmd_1_cxcr4-T22_bilayer.out -ref /state/partition1/irsil/receptor/emin_3_cxcr4-T22_bilayer.restrt >& hmd_1_cxcr4-T22_bilayer.log &
