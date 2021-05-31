# -*- coding: utf-8 -*-
"""
Created on Sun Jan 19 20:21:49 2020

@author: samir
"""
import numpy
import os
import csv
i =-1
#s =numpy.random.randint(1, high=1721, size=300000, dtype='l')
s =numpy.random.randint(1, high=1721, size=4, dtype='l')
for filename in os.listdir(os.getcwd()+"\\ligc.csv.gz"):
    i+=1
#    with open(os.getcwd()+"\\ligc.csv.gz\\"+ filename, 'r') as f:
#        data = csv.reader(f, delimiter=',')
#        for row in data:
#            if ((s[i] < data[i][1]) and (data[i][2] < s[i]+ 278) and (s[i] <data[i][1]) and (data[i][2] < s[i]+ 278)): 
#                print s
                
    with open(os.getcwd()+"\\ligc.csv.gz\\"+ filename, 'rb') as inp, open(os.getcwd()+"\\ligc.csv.gz1\\"+ filename, 'wb') as out:
        writer = csv.writer(out)  
        reader = csv.reader(inp)
        headers = next(reader, None)  # returns the headers or `None` if the input is empty
        if headers:
            writer.writerow(headers)
            
         
        for row in csv.reader(inp):
            
            if ((int(s[i]) < int(row[0])) and (int(row[0]) < int(s[i])+ 278) and (int(s[i]) <int(row[1])) and (int(row[1]) < int(s[i])+ 278)): 
                writer.writerow(row)
        