for i in {1969..2018}
do
	rm $i/source_pt.tex
	rm $i/source_en.tex
	echo "Canadá $i" >> $i/source_pt.tex
	echo "Canada $i" >> $i/source_en.tex
	for j in {1..8}
	do
		rm $i/$j/number.tex
		echo "$j" >> $i/$j/number.tex
	done
done
