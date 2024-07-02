#!/bin/bash

cd /state/partition1/irsil/heatup_rec

pmemd.cuda -O -i hmd_31_cxcr4-T22_bilayer.inp \
              -p /state/partition1/irsil/receptor/cxcr4-T22_bilayer.prmtop \
              -c hmd_30_cxcr4-T22_bilayer.restrt \
              -ref hmd_30_cxcr4-T22_bilayer.restrt \
              -r hmd_31_cxcr4-T22_bilayer.restrt \
              -x hmd_31_cxcr4-T22_bilayer.mdcrd \
              -o hmd_31_cxcr4-T22_bilayer.out

cpptraj -p /state/partition1/irsil/receptor/cxcr4-T22_bilayer.prmtop \
	-i cpptraj_img.inp \
        -y hmd_31_cxcr4-T22_bilayer.restrt \
        -x hmd_31_cxcr4-T22_bilayer_img.restrt 

ambpdb -p /state/partition1/irsil/receptor/cxcr4-T22_bilayer.prmtop \
       -c hmd_31_cxcr4-T22_bilayer_img.restrt \
       > hmd_31_cxcr4-T22_bilayer.pdb

./hmd_32_cxcr4-T22_bilayer.sh >& hmd_32_cxcr4-T22_bilayer.log

