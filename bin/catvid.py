#! /usr/bin/env python

# use ffmpeg to combines several video files into one big mpg file

import sys, re, os, subprocess, tempfile, shutil

def print_usage():
    print("Usage: " + sys.argv[0] + " VIDEO_FILES\n\n")

if len(sys.argv) < 2:
    print_usage()
    exit(1)

td = tempfile.mkdtemp()
list = []

for file in sys.argv[1:]:
    temp = td + "/" + os.path.basename(file) + ".mpg"
    list.append(temp)
    command  = ["ffmpeg -i", file, "-sameq", temp]
    print " ".join(command)
    subprocess.call(" ".join(command), shell=True)

all = td + "/ALL.mpg"

command = ["cat", " ".join(list), ">", all]
subprocess.call(" ".join(command), shell=True)

shutil.move(all, os.path.dirname(os.path.abspath(sys.argv[1])))
shutil.rmtree(td)









                     











    











	

