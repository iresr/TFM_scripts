#!/bin/bash

WD=/state/partition1/irsil/equi_nano12


for i in {3..103}; do
p=$(($i-1))
n=$(($i+1))

cat - << _EOF_ > emd_${i}_nano12.inp
Equilibration of the system, stage $i
&cntrl
nstlim=10000000,
dt=0.001,
nrespa=1,
ntx=5,
irest=1,
ntpr=100000,
ntwr=1000000,
ntwx=1000000,
ntb=2,
ntt=1,
temp0=300.0,
ntp=1,
barostat=1,
pres0=1.0,
comp=35.0,
taup=1.0,
cut=10.0,
ntc=2,
ntf=2,
tol=0.00001,
/
/
&ewald
skinnb=3.0
/

_EOF_

cat - << _EOF_ > emd_${i}_nano12.sh
#!/bin/bash

cd $WD

pmemd.cuda -O -i emd_${i}_nano12.inp \\
              -p /state/partition1/irsil/nanopart12/nano12_box.prmtop \\
              -c emd_${p}_nano12.restrt \\
              -ref emd_${p}_nano12.restrt \\
              -r emd_${i}_nano12.restrt \\
              -x emd_${i}_nano12.mdcrd \\
              -o emd_${i}_nano12.out

cpptraj -p /state/partition1/irsil/nanopart12/nano12_box.prmtop \\
	-i cpptraj_img.inp \\
        -y emd_${i}_nano12.restrt \\
        -x emd_${i}_nano12_img.restrt 

ambpdb -p /state/partition1/irsil/nanopart12/nano12_box.prmtop \\
       -c emd_${i}_nano12_img.restrt \\
       > emd_${i}_nano12.pdb

./emd_${n}_nano12.sh >& emd_${n}_nano12.log

_EOF_

chmod 755 emd_${i}_nano12.sh
done

