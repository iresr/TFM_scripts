#!/bin/bash

tleap -s -f leap_cxcr4-T22.inp > leap_cxcr4-T22.out
mv leap.log leap_cxcr4-T22.log
ambpdb -p cxcr4-T22.prmtop -c cxcr4-T22.inpcrd > cxcr4-T22.pdb

sander -O -i emin_1_cxcr4-T22.inp -p cxcr4-T22.prmtop -c cxcr4-T22.inpcrd -r emin_1_cxcr4-T22.restrt -o emin_1_cxcr4-T22.out -ref cxcr4-T22.inpcrd &
mv mdinfo emin_1_cxcr4-T22.info

sander -O -i emin_2_cxcr4-T22.inp -p cxcr4-T22.prmtop -c emin_1_cxcr4-T22.restrt -r emin_2_cxcr4-T22.restrt -o emin_2_cxcr4-T22.out &
mv mdinfo emin_2_cxcr4-T22.info
ambpdb -p cxcr4-T22.prmtop -c emin_2_cxcr4-T22.restrt > emin_2_cxcr4-T22.pdb

packmol-memgen --pdb emin_2_cxcr4-T22.pdb --lipids POPC --salt --salt_c Na+ --saltcon 0.15 --dist 15 --dist_wat 17.5 --n_ter out --nottrim --notprotonate --keepligs