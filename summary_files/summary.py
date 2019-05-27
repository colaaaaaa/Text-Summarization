import nltk
import csv
import sys
import argparse
parser=argparse.ArgumentParser()
parser.add_argument('file_n')
args=parser.parse_args()
n=args.file_n
name='/mnt/c/Users/Yogesh Kushwah/Desktop/major/summary_files/' + n
count=1
text_is=''
with open(name,encoding="latin-1") as f:
    for line in f:
        text_is=text_is + line
    sent_text = nltk.sent_tokenize(text_is)
    length_is=len(sent_text)

'''print(sent_text[18])
print(len(sent_text))
length=len(sent_text)


for j in sent_text:
    print(j+'\n')
'''
mylist = []
file_try=n.split('.')
filename="/mnt/c/Users/Yogesh Kushwah/Desktop/major/summary_generated/"+file_try[0] + '.txt'
name='/mnt/c/Users/Yogesh Kushwah/Desktop/major/summary_csv/'+ file_try[0] + '.csv'
text_file=open(filename,"w")
with open(name, 'r') as csvfile:
    for row in csv.reader(csvfile, delimiter=';'):
        mylist.append(int(row[0]))
    '''print(mylist)'''
#mylist.sort()
size=len(mylist)

size_of_document=0
for i in range(0,size-1):
    if  size_of_document <= 125:
        text_file.write(sent_text[int(mylist[i])-1].replace("\n", " ").lstrip()+'\n')
        size_of_document=size_of_document+len(nltk.word_tokenize(sent_text[mylist[i]-1]))
    else:
        break
