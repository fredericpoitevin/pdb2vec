#!/bin/bash
#
if [ $# -ne 2 ]; then echo "ERROR USAGE: $0 <file with list of pdbs> <pdb dir>"; exit; fi
#
libdir=$2
while read line; do
  echo -ne "."
done < $1
echo "|"
#
touch moments.txt
while read line; do 
  echo -ne "."
  if [ -f ${libdir}/${line}.pdb ]; then
    echo -ne "$line " >> moments.txt
    ./tools/pdb2moments/bin/pdb2moments ${libdir}/${line}.pdb | tr '\n' ' ' >> moments.txt
    echo "" >> moments.txt
  fi
done < $1
echo "DONE!"
