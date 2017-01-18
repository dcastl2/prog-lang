#!/bin/bash

source '/usr/lib/smartlog/smartlog.sh'

TYPEOUT=true
helper "${BOLD}Renamer${NORMAL} v. 1.0, GPL v. 3.0"
echo ""
tip "Author: Dennis Castleberry <dcastl2@lsu.edu>"
tip "Louisiana State University, LDMC 2019"
TYPEOUT=false

prompt "Source extension"
src=$REPLY

prompt "Destination extension"
dest=$REPLY

log "Checking to see if there are files"
ok
if [ -f *$src ]
then
  true;
else
  die "There were no files with the $src extension"
fi

for file in `ls *$src`
do
  log "Renaming $file"
  mv $file `echo $file | sed "s/\.$src/\.$dest/"`
  ok
  sleep .3
done

TYPEOUT=true
helper "Thank you for using ${BOLD}Renamer${NORMAL}."
echo
TYPEOUT=false
