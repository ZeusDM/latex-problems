for i in {2019..2019};
do
    mkdir $i
	mkdir $i/N3
	mkdir $i/N4
    #rm $i/source_pt.tex
    #rm $i/source_en.tex
    #rm $i/source.tex
	#rm $i/N3/source_pt.tex
	#rm $i/N4/source_pt.tex
	#rm $i/NU/source_pt.tex
	#rm $i/N3/source_en.tex
	#rm $i/N4/source_en.tex
	#rm $i/NU/source_en.tex
	echo "OMERJ $i, N3" >> $i/N3/source_pt.tex
    echo "OMERJ $i, N4" >> $i/N4/source_pt.tex
    echo "OMERJ $i, NU" >> $i/NU/source_pt.tex   
	echo "Rio $i, N3" >> $i/N3/source_en.tex
	echo "Rio $i, N4" >> $i/N4/source_en.tex
	echo "Rio $i, NU" >> $i/NU/source_en.tex	
	for j in {1..6}
	do
		mkdir $i/N3/$j
		mkdir $i/N4/$j
		rm $i/N3/$j/number.tex
		rm $i/N4/$j/number.tex
		rm $i/NU/$j/number.tex
		echo "$j" >> $i/N3/$j/number.tex
		echo "$j" >> $i/N4/$j/number.tex
		echo "$j" >> $i/NU/$j/number.tex		
	done
done
