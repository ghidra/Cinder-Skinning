#https://stackoverflow.com/questions/2212643/python-recursive-folder-read

import os
import sys

#walk_dir = sys.argv[1]
script_path = sys.path[0]

#print(script_path)
project_path = os.path.dirname(os.path.dirname(script_path))
source_path = project_path+"/lib/assimp/code"
source_contrib_path = project_path+"/lib/assimp/contrib"
source_includes__path = project_path+"/lib/assimp/includes"
shorten_path = project_path+"/" #this is for the cmake generation

list_file_path = os.path.join(script_path, 'my-directory-list.txt')
list_file = open(list_file_path,"w")

#this loops the directory without going into the subfolder... dont think i need them
for item in os.listdir(source_path):
    if os.path.isfile(os.path.join(source_path, item)):
        file_path = os.path.join(source_path, item)
        rel_path = os.path.relpath(file_path,project_path)
        #print('''${CINDER_SKINNING_SOURCE_PATH}/'''+rel_path)
        list_file.write('''${CINDER_SKINNING_SOURCE_PATH}/'''+rel_path+"\n")

        #print(item)


for root, subdirs, files in os.walk(source_contrib_path):

    for filename in files:
        file_path = os.path.join(root, filename)
        
        rel_path = os.path.relpath(file_path,project_path)
        #relative path (without the ../../../ print(rel_path)
        file_name = os.path.split(rel_path)[1] #file name print()
        extension = file_name.split(".")[-1]
        
        
        if (extension == 'cpp') or (extension == 'h') or (extension == 'c') or (extension == 'hpp') :
            list_file.write('''${CINDER_SKINNING_SOURCE_PATH}/'''+rel_path+"\n")
            #print('''${CINDER_SKINNING_SOURCE_PATH}/'''+rel_path)

       # print('\t- file %s (full path: %s)' % (filename, file_path))

list_file.close()