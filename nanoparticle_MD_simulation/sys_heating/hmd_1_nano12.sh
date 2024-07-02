#!/bin/bash

pmemd.cuda -O -i hmd_1_nano12.inp -p /state/partition1/irsil/nanopart12/nano12_box.prmtop -c /state/partition1/irsil/nanopart12/emin_2_nano12_box.restrt -r hmd_1_nano12.restrt -x hmd_1_nano12.mdcrd -o hmd_1_nano12.out -ref /state/partition1/irsil/nanopart12/emin_2_nano12_box.restrt >& hmd_1_nano12.log
