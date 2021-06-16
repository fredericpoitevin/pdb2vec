#!/bin/bash
#
# assuming pdb-tools has been installed
#
if [ $# -ne 1 ]; then echo "USAGE ERROR: $0 <pdb ID>"; exit; fi
id=$1
#
pdb_fetch -biounit $id > ${id}.pdb
pdb_selatom -CA ${id}.pdb > ${id}_ca.pdb
rm -f ${id}.pdb
