for i in {2014..2019};
do
    #rm $i/source_pt.tex
    #rm $i/source_en.tex
    for j in {5..12};
		do
			rm $i/$j/source_en.tex
			rm $i/$j/source_pt.tex
			echo "Romanian District $i, Grade $j" >> $i/$j/source_en.tex
			echo "Romênia $i, Regional, Série $j" >> $i/$j/source_pt.tex
		done
done
