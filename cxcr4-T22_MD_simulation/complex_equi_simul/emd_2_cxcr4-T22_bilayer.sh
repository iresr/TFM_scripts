#!/bin/bash

cd /state/partition1/irsil/equi_rec

pmemd.cuda -O -i emd_2_cxcr4-T22_bilayer.inp \
              -p /state/partition1/irsil/receptor/cxcr4-T22_bilayer.prmtop \
              -c emd_1_cxcr4-T22_bilayer.restrt \
              -ref emd_1_cxcr4-T22_bilayer.restrt \
              -r emd_2_cxcr4-T22_bilayer.restrt \
              -x emd_2_cxcr4-T22_bilayer.mdcrd \
              -o emd_2_cxcr4-T22_bilayer.out

cpptraj -p /state/partition1/irsil/receptor/cxcr4-T22_bilayer.prmtop \
        -i cpptraj_img.inp \
        -y emd_2_cxcr4-T22_bilayer.restrt \
        -x emd_2_cxcr4-T22_bilayer_img.restrt 

ambpdb -p /state/partition1/irsil/receptor/cxcr4-T22_bilayer.prmtop \
       -c emd_2_cxcr4-T22_bilayer_img.restrt \
       > emd_2_cxcr4-T22_bilayer.pdb

./emd_3_cxcr4-T22_bilayer.sh >& emd_3_cxcr4-T22_bilayer.log

