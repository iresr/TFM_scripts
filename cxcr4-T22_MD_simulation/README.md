The following steps and files were utilized during the system's preparation, heating and MD simulation processes.


#### System preparation and Energy minimization ####

Directory: comlpex_setup

The script sys_setup_min_1.sh contains the necessary files to perform the system's set up and the genration of the lipid bilayer (B.1. System preparation and Energy minimization in vacuo):

 - Preparation of initial CXCR4-T22 ensamble in vacuo (leap_cxcr4-T22.inp)
 - Energy minimization of the CXCR4-T22 complex in vacuo (two minimization stages; emin_1_cxcr4-T22.inp and emin_2_cxcr4-T22.inp)
 - Construction of the lipid bilayer.

The resulting file of the packmol-memgen run (bilayer_emin_2_cxcr4-T22.pdb) needs to be further refined (resulting file bilayer_emin_2_cxcr4-T22_clean.pdb) (B.2. Generation and Energy minimization of membrane system):
 - Add TER after receptor (residue 309), peptide (residue 327), and each of the four crystallographic waters (residues 328 - 331) 

Once the lipid bilayer system has been constructed and refined (bilayer_emin_2_cxcr4-T22_clean.pdb), proceed with sys_setup_min_1.sh:

 - Solvation of the system (leap_cxcr4-T22_bilayer.inp)
 - Energy minimization of the solvated system (three minimization stages; emin_1_cxcr4-T22_bilayer.inp, emin_2_cxcr4-T22_bilayer.inp and emin_1_cxcr4-T22_bilayer.inp)


#### Heating of the system ####

Directory: complex_heatup

The scprits for the 31 heating stages (B.3. Heating of the system) of the system in order are:

 - Stage 1: hmd_1_cxcr4-T22_bilayer.sh and input file hmd_1_cxcr4-T22_bilayer.inp
 - Stage 2-30: prepare_jobs_hmd_cxcr4-T22_bilayer.sh (it generates the .sh and .inp files for stages 2 to 30, both included)
 - Stage 31: hmd_31_cxcr4-T22_bilayer.sh and input file hmd_31_cxcr4-T22_bilayer.inp


#### Equilibration of the system ####

Directory: complex_equi_simul

The necessary scripts for the two-stage minimization (B.4. Equilibration of the system and Simulation run):
 - Stage 1: emd_1_cxcr4-T22_bilayer.sh and input file emd_1_cxcr4-T22_bilayer.inp
 - Stage 2: emd_2_cxcr4-T22_bilayer.sh and input file emd_2_cxcr4-T22_bilayer


#### MD simulation of system ####

Directory: complex_equi_simul

The script to produce the .sh and .inp files necessary for the MD simulation (B.4. Equilibration of the system and Simulation run) is prepare_jobs_cxcr4-T22_bilayer.sh






