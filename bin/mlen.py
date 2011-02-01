#!/usr/bin/env python

"""calculates total movie length of all movies passed as parameters"""

import sys, re, os, subprocess, getopt

def main():
    sum = 0
    target_size = h2f("4.7G")
    audio_rate = h2f("224k")
    extra_rate = h2f("100k")

    try:
        opts, args = getopt.getopt(sys.argv[1:], "s:a:e:", ["size=", "audio-rate=", "extra"])
    except getopt.GetoptError, err:
        print str(err) # will print something like "option -a not recognized"
        usage()
        sys.exit(2)

    for opt, arg in opts:
        if opt in ("-s", "--size"):            
            target_size=h2f(arg)
        elif opt in ("-a", "--audio-rate"):
            audio_rate=h2f(arg)
        elif opt in ("-e", "--extra"):
            extra_rate=h2f(arg)

    for file in args:
        len = get_movie_length(file)
        print file, ":", len,"s"
        sum += len
          
                 
    print "total:", sum,"s"
    print "video bitrate:", calc_bitrate(seconds=sum,target_size=target_size,audio_br=audio_rate,extra=extra_rate), "kbps"
            

def h2f(size):
    d = {'k':1000, 'm':10**6,'g':10**9, 'K':8*1000, 'M':8*10**6, 'G':8*10**9}
    lc = size[-1]
    m = 1
    if lc in d.keys():
        m = d[lc]
    n = float(re.split(r"[" + ''.join(d.keys()) + "]", size)[0])
    return n*m
        

def get_movie_length(file):
    """returns the movie length in seconds"""

    len = 0
    p = subprocess.Popen("ffmpeg -i '" + file + "'", shell=True,
                     stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    for line in p.stderr:
        if "Duration:" in line:
            h,m,s = (float(x) for x in re.findall("Duration: (\d+):(\d+):(\d+\.\d+)", line)[0])
            return h*3600+m*60+s
            break
    return 0


def calc_bitrate(seconds, target_size,audio_br,extra):
    """calculates the target bitrate in kbps for given target size and audio bitrate"""
    return (target_size/seconds - audio_br - extra)/1000


if __name__ == "__main__":
    main()


