# Note this was built for using python and git bash on windows
# Made by Daniel Fellenz 01/17/2018
# Imports for the files
import os

allfiles = []

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

PullFiles('C:\Program Files (x86)\Steam\steamapps\common\Sid Meier\'s Civilization V\Assets\DLC\Expansion2', '.xml')
print(allfiles)
