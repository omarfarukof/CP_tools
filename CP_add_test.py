#!/bin/python

import os
import sys 

# Check if test folder exist or create it
if not os.path.exists("test"):
    os.mkdir("test")
    
# Create folders for each problem (*.cpp) in root folder
for file in os.listdir("."):
    if file.endswith(".cpp"):
        os.mkdir("test/" + file[:-4])    

# Add test cases to a problem
def add_test(file , case_in , case_out):
    test_case_in_file = [ f for f in os.listdir("test/" + file) if f.endswith("in.txt") ]
    test_case_out_file = [ f for f in os.listdir("test/" + file) if f.endswith("out.txt") ]
    if len(test_case_in_file) == len(test_case_out_file):
        assert ValueError("Test case number does not match")
    new_case_num = len(test_case_in_file) + 1
    open("test/" + file + "/" + str(new_case_num) + "_in.txt" , "w").write(case_in).close()
    open("test/" + file + "/" + str(new_case_num) + "_out.txt" , "w").write(case_out).close()
    
# Add test cases