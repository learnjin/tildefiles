#!/usr/bin/python

import sys,os,Tkinter,tkFileDialog

try:    path = sys.argv[1]
except: path = tkFileDialog.asksaveasfilename()

#if not path:
#    print ("must specify a filename")
#    exit(1)

f = open(path, "w")
f.write("""#!/usr/bin/env python\n
def main():
    pass\n
if __name__ == "__main__":
    main()
""")
os.fchmod(f.fileno(), 0755)
f.close()

os.system("/usr/bin/open " + path)

