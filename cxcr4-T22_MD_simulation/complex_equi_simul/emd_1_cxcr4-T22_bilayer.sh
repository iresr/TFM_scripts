#!/bin/bash

cd /state/partition1/irsil/equi_rec

pmemd.cuda -O -i emd_1_cxcr4-T22_bilayer.inp \
              -p /state/partition1/irsil/receptor/cxcr4-T22_bilayer.prmtop \
              -c /state/partition1/irsil/heatup_rec/hmd_31_cxcr4-T22_bilayer.restrt \
              -ref /state/partition1/irsil/heatup_rec/hmd_31_cxcr4-T22_bilayer.restrt \
              -r emd_1_cxcr4-T22_bilayer.restrt \
              -x emd_1_cxcr4-T22_bilayer.mdcrd \
              -o emd_1_cxcr4-T22_bilayer.out

cpptraj -p /state/partition1/irsil/receptor/cxcr4-T22_bilayer.prmtop \
        -i cpptraj_img.inp \
        -y emd_1_cxcr4-T22_bilayer.restrt \
        -x emd_1_cxcr4-T22_bilayer_img.restrt 

ambpdb -p /state/partition1/irsil/receptor/cxcr4-T22_bilayer.prmtop \
       -c emd_1_cxcr4-T22_bilayer_img.restrt \
       > emd_1_cxcr4-T22_bilayer.pdb

./emd_2_cxcr4-T22_bilayer.sh >& emd_2_cxcr4-T22_bilayer.log

