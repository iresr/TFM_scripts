#!/bin/bash

WD=/state/partition1/irsil/equi_rec

cd $WD


for i in {84..103}; do
p=$(($i-1))
n=$(($i+1))


cat - << _EOF_ > emd_${i}_cxcr4-T22_bilayer.inp
Equilibrating the system, stage $i
&cntrl
nstlim=10000000,
dt=0.001,
ntx=5,
irest=1,
ntpr=100000,
ntwr=1000000,
ntwx=1000000,
ntb=2,
ntt=3,
gamma_ln=1.0,
ig=-1,
temp0=300.0,
ntp=3,
csurften=3,
gamma_ten=0.0,
ninterface=2,
barostat=1,
pres0=1.0,
comp=35.0,
taup=2.0,
nrespa=1,
cut=10.0,
ntc=2,
tol=0.00001
ntf=2,
/
/
&ewald
skinnb=3.0,
/
_EOF_

cat - << _EOF_ > emd_${i}_cxcr4-T22_bilayer.sh
#!/bin/bash

cd $WD

pmemd.cuda -O -i emd_${i}_cxcr4-T22_bilayer.inp \\
              -p /state/partition1/irsil/receptor/cxcr4-T22_bilayer.prmtop \\
              -c emd_${p}_cxcr4-T22_bilayer.restrt \\
              -ref emd_${p}_cxcr4-T22_bilayer.restrt \\
              -r emd_${i}_cxcr4-T22_bilayer.restrt \\
              -x emd_${i}_cxcr4-T22_bilayer.mdcrd \\
              -o emd_${i}_cxcr4-T22_bilayer.out

cpptraj -p /state/partition1/irsil/receptor/cxcr4-T22_bilayer.prmtop \\
	-i cpptraj_img.inp \\
        -y emd_${i}_cxcr4-T22_bilayer.restrt \\
        -x emd_${i}_cxcr4-T22_bilayer_img.restrt 

ambpdb -p /state/partition1/irsil/receptor/cxcr4-T22_bilayer.prmtop \\
       -c emd_${i}_cxcr4-T22_bilayer_img.restrt \\
       > emd_${i}_cxcr4-T22_bilayer.pdb

./emd_${n}_cxcr4-T22_bilayer.sh >& emd_${n}_cxcr4-T22_bilayer.log

_EOF_

chmod 755 emd_${i}_cxcr4-T22_bilayer.sh
done

