cd "/mnt/c/Users/Yogesh Kushwah/Desktop/major/summary_files"
for f in *.txt
do
cd "/mnt/c/Users/Yogesh Kushwah/Desktop/major/tempdir/"
rm *.txt
cd "/mnt/c/Users/Yogesh Kushwah/Desktop/major/summary_files"
python3 fsent.py $f
cd "/mnt/c/Users/Yogesh Kushwah/Desktop/major/"
Rscript --vanilla fcrcode.r $f
cd "/mnt/c/Users/Yogesh Kushwah/Desktop/major/summary_files"
done

cd "/mnt/c/Users/Yogesh Kushwah/Desktop/major/summary_files"
for f in *.txt
do
python3 summary.py $f
done

