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
while read line; do 
  echo -ne "."
  if [ ! -f ${libdir}/${line}.pdb ]; then
    ./tools/fetch_ca.sh $line > /dev/null 2>&1
    cat ${line}_ca.pdb | awk -v FS="" '{if($1$2$3$4=="ATOM") print $0}' > ${line}.pdb
    if [ ! -s ${line}.pdb ]; then 
      rm -f ${line}*.pdb
    else
      mv ${line}.pdb ${libdir}/${line}.pdb
      rm -f ${line}_ca.pdb
    fi
  fi
done < $1
echo "DONE!"
