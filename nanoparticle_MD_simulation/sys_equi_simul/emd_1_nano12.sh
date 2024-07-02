#!/bin/bash

cd /state/partition1/irsil/equi_nano12

pmemd.cuda -O -i emd_1_nano12.inp \
              -p /state/partition1/irsil/nanopart12/nano12_box.prmtop \
              -c /state/partition1/irsil/heatup_nano12/hmd_31_nano12.restrt \
              -ref /state/partition1/irsil/heatup_nano12/hmd_31_nano12.restrt \
              -r emd_1_nano12.restrt \
              -x emd_1_nano12.mdcrd \
              -o emd_1_nano12.out

cpptraj -p /state/partition1/irsil/nanopart12/nano12_box.prmtop \
        -i cpptraj_img.inp \
        -y emd_1_nano12.restrt \
        -x emd_1_nano12_img.restrt 

ambpdb -p /state/partition1/irsil/nanopart12/nano12_box.prmtop \
       -c emd_1_nano12_img.restrt \
       > emd_1_nano12.pdb

./emd_2_nano12.sh >& emd_2_nano12.log

