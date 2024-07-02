#!/bin/bash

tleap -s -f leap_nano12.inp > leap_nano12.out
mv leap.log leap_nano12.log
ambpdb -p nano12.prmtop -c nano12.inpcrd > nano12.pdb

sander -O -i emin_1_nano12.inp -p nano12.prmtop -c nano12.inpcrd -r emin_1_nano12.restrt -o emin_1_nano12.out -ref nano12.inpcrd
mv mdinfo emin_1_nano12.info
ambpdb -p nano12.prmtop -c emin_1_nano12.restrt > emin_1_nano12.pdb

sander -O -i emin_2_nano12.inp -p nano12.prmtop -c emin_1_nano12.restrt -r emin_2_nano12.restrt -o emin_2_nano12.out
mv mdinfo emin_2_nano12.info
ambpdb -p nano12.prmtop -c emin_2_nano12.restrt > emin_2_nano12.pdb

tleap -s -f leap_nano12_box.inp > leap_nano12_box.out
mv leap.log leap_nano12_box.log
ambpdb -p nano12_box.prmtop -c nano12_box.inpcrd > nano12_box.pdb

sander -O -i emin_1_nano12_box.inp -p nano12_box.prmtop -c nano12_box.inpcrd -r emin_1_nano12_box.restrt -o emin_1_nano12_box.out -ref nano12_box.inpcrd
mv mdinfo emin_1_nano12_box.info
ambpdb -p nano12_box.prmtop -c emin_1_nano12_box.restrt > emin_1_nano12_box.pdb

sander -O -i emin_2_nano12_box.inp -p nano12_box.prmtop -c emin_1_nano12_box.restrt -r emin_2_nano12_box.restrt -o emin_2_nano12_box.out
mv mdinfo emin_2_nano12_box.info
ambpdb -p nano12_box.prmtop -c emin_2_nano12_box.restrt > emin_2_nano12_box.pdb

