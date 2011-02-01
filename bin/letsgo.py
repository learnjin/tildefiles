#! /usr/bin/env python

import sys, re, os, subprocess, tempfile, shutil

def print_usage():
    print("Usage: " + sys.argv[0] + " VIDEO_FILE\n\n")



class MetaInfo:
    pass


def get_meta_info(file):
    info = MetaInfo()
    p = subprocess.Popen("ffmpeg -i '" + sys.argv[1] + "'", shell=True,
                     stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    for line in p.stderr:
        if "Video: " in line:
            info.res, info.rate = re.findall(r"(\d{3}x\d{3}).*, ([0-9\.]+) tbr", line)[0]
            break  
    return info


## ------ MAIN -------------------
    

if len(sys.argv) < 2:
    print_usage()
    exit(1)

input = sys.argv[1]

v = get_meta_info(input)

v.xres,v.yres = map(int, v.res.split('x'))
v.ar = 1.0*v.xres/v.yres

print "original x-res: {0}, y-res: {1}, ar: {2}, framerate: {3}".format(v.xres, v.yres, v.ar, v.rate)


if v.ar < 1.5: maxy = 240
else: maxy = 272


if v.yres > maxy:
    v.yres = maxy
    v.xres = int(v.ar*v.yres)
    v.xres = v.xres + v.xres%2
    v.ar = float(v.xres)/v.yres


td = tempfile.mkdtemp()
output = td + "/" + os.path.splitext(os.path.basename(input))[0] + "-psp.mp4"

command  = ["ffmpeg -threads 8 -y -i", input,
            "-f psp -sameq -ar 24000 -ab 64k -s",repr(v.xres) + "x" + repr(v.yres),
            output]
command = " ".join(command)
print command

subprocess.call(command, shell=True)
shutil.move(output, os.path.dirname(input))
os.rmdir(td)


                     











    











	

