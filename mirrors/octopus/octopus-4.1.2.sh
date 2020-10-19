#!/bin/bash
for i in basic  math   species   ions   grid   poisson   states   xc   hamiltonian   system   scf   td   opt_control   td   sternheimer   main
do
Makefile=src/${i}/Makefile
#修改.F90.o
hang=$(grep -n "^.F90.o:"  $Makefile | awk '{printf "%d\n",$1}' )
hang=$(echo -e "$hang+4"|bc)
sed -i "${hang}i CNQsed -i '5,41d' \$\*_oct.f90" $Makefile
sed -i "${hang}s/CNQ/\t/g" $Makefile
hang=$(echo -e "$hang-4"|bc)
sed -i "${hang}i ##### Add by CNQ " $Makefile
hang=$(echo -e "$hang+8"|bc)
sed -i "${hang}i ##### END CNQ " $Makefile
#修改.F90_oct.f90
hang=$(grep -n .F90_oct.f90 $Makefile | awk '{printf "%d\n",$1}' )
hang=$(echo -e "$hang+4"|bc)
sed -i "${hang}i CNQsed -i '5,41d' \$\*_oct.f90" $Makefile
sed -i "${hang}s/CNQ/\t/g" $Makefile
hang=$(echo -e "$hang-4"|bc)
sed -i "${hang}i ##### Add by CNQ " $Makefile
hang=$(echo -e "$hang+6"|bc)
sed -i "${hang}i ##### END CNQ " $Makefile

done 

