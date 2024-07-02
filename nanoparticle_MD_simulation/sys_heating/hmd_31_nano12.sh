#!/bin/bash

cd /state/partition1/irsil/heatup_nano12

pmemd.cuda -O -i hmd_31_nano12.inp \
              -p /state/partition1/irsil/nanopart12/nano12_box.prmtop \
              -c hmd_30_nano12.restrt \
              -ref hmd_30_nano12.restrt \
              -r hmd_31_nano12.restrt \
              -x hmd_31_nano12.mdcrd \
              -o hmd_31_nano12.out

cpptraj -p /state/partition1/irsil/nanopart12/nano12_box.prmtop \
        -i cpptraj_img.inp \
        -y hmd_31_nano12.restrt \
        -x hmd_31_nano12_img.restrt

ambpdb -p /state/partition1/irsil/nanopart12/nano12_box.prmtop \
       -c hmd_31_nano12_img.restrt \
       > hmd_31_nano12.pdb

