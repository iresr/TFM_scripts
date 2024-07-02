#!/bin/bash

tleap -s -f leap_cxcr4-T22_bilayer.inp > leap_cxcr4-T22_bilayer.out
mv leap.log leap_cxcr4-T22_bilayer.log
ambpdb -p cxcr4-T22_bilayer.prmtop -c cxcr4-T22_bilayer.inpcrd > cxcr4-T22_bilayer.pdb

sander -O -i emin_1_cxcr4-T22_bilayer.inp -p cxcr4-T22_bilayer.prmtop -c cxcr4-T22_bilayer.inpcrd -r emin_1_cxcr4-T22_bilayer.restrt -o emin_1_cxcr4-T22_bilayer.out -ref cxcr4-T22_bilayer.inpcrd &
mv mdinfo emin_1_cxcr4-T22_bilayer.info

sander -O -i emin_2_cxcr4-T22_bilayer.inp -p cxcr4-T22_bilayer.prmtop -c emin_1_cxcr4-T22_bilayer.restrt -r emin_2_cxcr4-T22_bilayer.restrt -o emin_2_cxcr4-T22_bilayer.out -ref emin_1_cxcr4-T22_bilayer.restrt &
mv mdinfo emin_2_cxcr4-T22_bilayer.info

sander -O -i emin_3_cxcr4-T22_bilayer.inp -p cxcr4-T22_bilayer.prmtop -c emin_2_cxcr4-T22_bilayer.restrt -r emin_3_cxcr4-T22_bilayer.restrt -o emin_3_cxcr4-T22_bilayer.out -ref emin_2_cxcr4-T22_bilayer.restrt &
mv mdinfo emin_3_cxcr4-T22_bilayer.info
ambpdb -p cxcr4-T22_bilayer.prmtop -c emin_3_cxcr4-T22_bilayer.restrt > emin_3_cxcr4-T22_bilayer.pdb
