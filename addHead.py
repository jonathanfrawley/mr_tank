#!/usr/bin/python

'''
Updates copyright notice in source files.
'''
import os

excludeDirs = []
copyrightFilename = "LICENSE"
endingPattern = ".hx"

def updateSource(filename, oldcopyright, copyright):
    utfstr = chr(0xef)+chr(0xbb)+chr(0xbf)
    fdata = file(filename,"r+").read()
    isUTF = False
    if (fdata.startswith(utfstr)):
        isUTF = True
        fdata = fdata[3:]
    if (oldcopyright != None):
        if (fdata.startswith(oldcopyright)):
            fdata = fdata[len(oldcopyright):]
    if not (fdata.startswith(copyright)):
        print "updating "+filename
        fdata = copyright + fdata
        if (isUTF):
            file(filename,"w").write(utfstr+fdata)
        else:
            file(filename,"w").write(fdata)

def recursiveTraversal(currentDir,  oldcopyright, copyright, endingPattern):
	global excludeDirs
	fns = os.listdir(currentDir)
#	print "listing "+currentDir
	for fn in fns:
		fullfn = os.path.join(currentDir,fn)
		if (fullfn in excludeDirs):
			continue
		if (os.path.isdir(fullfn)):
			recursiveTraversal(fullfn, oldcopyright, copyright, endingPattern)
		else:
			if (fullfn.endswith(endingPattern)):
				updateSource(fullfn, oldcopyright, copyright)

def main():
	global copyrightFilename
	global endingPattern
#	oldCopyrightFile = None 
	oldCopyrightFile = file("LICENSE.old", "r+").read()
	copyrightFile = file(copyrightFilename, "r+").read()
	recursiveTraversal("src", oldCopyrightFile, copyrightFile, endingPattern)
	exit()


if __name__== "__main__":
	main()

