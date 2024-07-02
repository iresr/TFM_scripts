#!/bin/bash

WD=/state/partition1/irsil/heatup_nano12   #Working Direcotry

cd $WD

cat - << _EOF_ > cpptraj_img.inp
autoimage
_EOF_

t=0

for i in {2..30}; do
p=$(($i-1))
n=$(($i+1))
((t+=10))

cat - << _EOF_ > hmd_${i}_nano12.inp
Heating up the system, stage $i
&cntrl
nstlim=50000,
dt=0.001,
nrespa=1,
ntx=5,
irest=1,
ntpr=5000,
ntwr=50000,
ntwx=50000,
ntb=2,
ntt=1,
temp0=${t}.0,
ntp=1,
barostat=1,
pres0=1.0,
comp=35.0,
taup=1.0,
ntc=2,
ntf=2,
ntr=1,
restraint_wt=10.0,
restraintmask=':1-3239',
/

_EOF_

cat - << _EOF_ > hmd_${i}_nano12.sh
#!/bin/bash

cd $WD

pmemd.cuda -O -i hmd_${i}_nano12.inp \\
              -p /state/partition1/irsil/nanopart12/nano12_box.prmtop \\
              -c hmd_${p}_nano12.restrt \\
              -ref hmd_${p}_nano12.restrt \\
              -r hmd_${i}_nano12.restrt \\
              -x hmd_${i}_nano12.mdcrd \\
              -o hmd_${i}_nano12.out

cpptraj -p /state/partition1/irsil/nanopart12/nano12_box.prmtop \\
	-i cpptraj_img.inp \\
        -y hmd_${i}_nano12.restrt \\
        -x hmd_${i}_nano12_img.restrt 

ambpdb -p /state/partition1/irsil/nanopart12/nano12_box.prmtop \\
       -c hmd_${i}_nano12_img.restrt \\
       > hmd_${i}_nano12.pdb

./hmd_${n}_nano12.sh >& hmd_${n}_nano12.log

_EOF_

chmod 755 hmd_${i}_nano12.sh
done

