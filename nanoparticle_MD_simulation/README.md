The following steps and files were utilized during the system's preparation, heating and MD simulation processes.


#### System preparation and Energy minimization ####

Directory: sys_setup

The script sys_setup_min.sh contains the necessary files to perform the system's set up and refinement (A.1. System preparation and Energy minimization):

 - Preparation of initial protein nanoparticle ensamble in vacuo (leap_nano12.inp)
 - Energy minimization of the protein nanoparticle in vacuo (two minimization stages; emin_1_nano12.inp and emin_2_nano12.inp)
 - Solvation of the system (leap_nano12_box.inp)
 - Energy minimization of the solvated system (two minimization stages; emin_1_nano12_box.inp and emin_2_nano12_box.inp)


#### Heating of the system ####

Directory: sys_heatup

The scprits for the 31 heating stages (A.2. Heating of the system) of the system in order are:

 - Stage 1: hmd_1_nano12.sh and input file hmd_1_nano12.inp
 - Stage 2-30: prepare_jobs_hmd_nano12 (it generates the .sh and .inp files for stages 2 to 30, both included)
 - Stage 31: hmd_31_nano12.sh and input file hmd_31_nano12.inp


#### Equilibration of the system ####

Directory: sys_equi_simul

The necessary scripts for the two-stage minimization (A.3. Equilibration of the system and Simulation run):
 - Stage 1: emd_1_nano12.sh and input file emd_1_nano12.inp
 - Stage 2: emd_2_nano12.sh and input file emd_2_nano12.inp


#### MD simulation of system ####

Directory: sys_equi_simul

The script to produce the .sh and .inp files necessary for the MD simulation (A.3. Equilibration of the system and Simulation run) is prepare_jobs_emd_nano12.sh






