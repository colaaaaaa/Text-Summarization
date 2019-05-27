import nltk
import glob
import sys
import argparse
parser=argparse.ArgumentParser()
parser.add_argument('file_n')
args=parser.parse_args()
n=args.file_n
count=1
text_is=''
name="/mnt/c/Users/Yogesh Kushwah/Desktop/major/summary_files/" + n
with open(name,encoding="latin-1") as f:
    file_try=n.split('.')
    for line in f:
        text_is=text_is + line
    sent_text = nltk.sent_tokenize(text_is)
    length_is=len(sent_text)
    print(length_is) 
    for i in range(0,length_is):
        filename="/mnt/c/Users/Yogesh Kushwah/Desktop/major/tempdir/%d.txt" %(i+1)
        with open(filename,"w") as f1:
            f1.write(sent_text[i])	    	
        	            		
	    
    
        
