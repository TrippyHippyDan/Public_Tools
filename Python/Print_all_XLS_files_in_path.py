# Note this was built for using python and git bash on windows
# Made by Daniel Fellenz 01/17/2018
# Imports for the files
import os

# Creating a deffinition so that this can be used in more complext processes if needed in the future

allfiles = [] # Making the  allfiles list globally
def PullFiles(wPath, fType):
    workingpath = wPath
    subpaths = []
    filelist = []
    print('Searching in ' + wPath + ' and all sub dirs')
    for fname in os.listdir(wPath):
        fullName = os.path.join(wPath, fname)
        if os.path.isfile(fullName):
            if fullName.endswith(fType):
                filelist.append(fname)
                allfiles.append(fname)
                print(fullName)
                print('Found file: ' + fname)
        elif os.path.isdir(fullName):
            subpaths.append(fullName)
    for subpath in subpaths:
        PullFiles(subpath, fType)
    print(filelist)

# This is to request information from the user within gitbash making it easy to use on different locations and files
FullPath = input('Enter directory path you wish to inspect for files: ')
FileEXT = input('Enter file ext that you are looking for: ')

# Running process
PullFiles(FullPath, FileEXT)
for x in  range(len(allfiles)):
    print(allfiles[x])
