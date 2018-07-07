#!/usr/bin/env python

#1. Sort files by create timestamp
#2. Change the filename if it contains space

import sys
import os
from itertools import permutations

indir = sys.argv[1]
indir += "/"

def getfiles(dirpath):
    a = [s for s in os.listdir(dirpath)
         if os.path.isfile(os.path.join(dirpath, s))]
    a.sort(key=lambda s: os.path.getmtime(os.path.join(dirpath, s)))
    return a

list_files = getfiles(indir)
m = len(list_files)

perm = permutations(['a', 'b', 'c', 'd', 'e', 'f'])

idx = 0
for i in list(perm):
  new_fd = "".join(i)
  new_fd += '.png'
  if(idx == m) : break
  if(list_files[idx].split('.')[-1] == 'png') :
    print ( "Moving %s to %s" % ( list_files[idx], new_fd) )
    os.rename(list_files[idx], new_fd)
  idx += 1

