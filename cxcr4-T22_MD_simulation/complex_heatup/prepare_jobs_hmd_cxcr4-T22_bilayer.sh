#!/bin/bash

WD=/state/partition1/irsil/heatup_receptor

cd $WD

cat - << _EOF_ > cpptraj_img.inp
autoimage
_EOF_

t=0

for i in {2..31}; do
p=$(($i-1))
n=$(($i+1))
((t+=10))

cat - << _EOF_ > hmd_${i}_cxcr4-T22_bilayer.inp
Heating up the system, stage $i
&cntrl
nstlim=500000,
dt=0.001,
ntx=5,
irest=1,
ntpr=5000,
ntwr=500000,
ntwx=500000,
ntb=2,
ntt=3,
gamma_ln=1.0,
ig=-1,
temp0=${t}.0,
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
ntr=1,
restraint_wt=100.0,
restraintmask=':1-327,1317-1320',
/
/
&ewald
skinnb=3.0,
/
_EOF_

cat - << _EOF_ > hmd_${i}_cxcr4-T22_bilayer.sh
#!/bin/bash

cd $WD

pmemd.cuda -O -i hmd_${i}_cxcr4-T22_bilayer.inp \\
              -p /state/partition1/irsil/receptor_ult/cxcr4-T22_bilayer.prmtop \\
              -c hmd_${p}_cxcr4-T22_bilayer.restrt \\
              -ref hmd_${p}_cxcr4-T22_bilayer.restrt \\
              -r hmd_${i}_cxcr4-T22_bilayer.restrt \\
              -x hmd_${i}_cxcr4-T22_bilayer.mdcrd \\
              -o hmd_${i}_cxcr4-T22_bilayer.out

cpptraj -p /state/partition1/irsil/receptor_ult/cxcr4-T22_bilayer.prmtop \\
	-i cpptraj_img.inp \\
        -y hmd_${i}_cxcr4-T22_bilayer.restrt \\
        -x hmd_${i}_cxcr4-T22_bilayer_img.restrt 

ambpdb -p /state/partition1/irsil/receptor_ult/cxcr4-T22_bilayer.prmtop \\
       -c hmd_${i}_cxcr4-T22_bilayer_img.restrt \\
       > hmd_${i}_cxcr4-T22_bilayer.pdb

./hmd_${n}_cxcr4-T22_bilayer.sh >& hmd_${n}_cxcr4-T22_bilayer.log

_EOF_

chmod 755 hmd_${i}_cxcr4-T22_bilayer.sh
done

