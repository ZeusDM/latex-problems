for i in {1990..1990}
do
	mkdir $i
	rm $i/source_pt.tex
	rm $i/source_en.tex
	echo "Putnam $i" >> $i/source_pt.tex
	echo "Putnam $i" >> $i/source_en.tex
	for j in {1..6}
	do
		mkdir $i/a$j
		rm $i/a$j/number.tex
		echo "A$j" >> $i/a$j/number.tex
	done
	for j in {1..6}
	do
		mkdir $i/b$j
		rm $i/b$j/number.tex
		echo "B$j" >> $i/b$j/number.tex
	done


	#curl -s https://kskedlaya.org/putnam-archive/$i.tex > $i/tex.tmp
	csplit --digits=2 --quiet --prefix="$i/out" $i/tex.tmp "/\\item\[[AB]-*[1-6]\]/" "{*}"
	rm $i/tex.tmp
	rm $i/out00
	head -n -3 $i/out12 > $i/out12.tmp && mv $i/out12.tmp $i/out12
	for j in {1..6}
	do
		tail -n +2 $i/out$(printf %02d $j) > $i/out$j.tmp && mv $i/out$j.tmp $i/out$(printf %02d $j)
		head -n -1 $i/out$(printf %02d $j) > $i/out$j.tmp && mv $i/out$j.tmp $i/out$(printf %02d $j)
		mv $i/out$(printf %02d $j) $i/a$j/problem_en.tex
	done
	for j in {1..6}
	do
		tail -n +2 $i/out$(printf %02d $(($j + 6))) > $i/out$j.tmp && mv $i/out$j.tmp $i/out$(printf %02d $(($j + 6)))
		head -n -1 $i/out$(printf %02d $(($j + 6))) > $i/out$j.tmp && mv $i/out$j.tmp $i/out$(printf %02d $(($j + 6)))
		mv $i/out$(printf %02d $(($j + 6))) $i/b$j/problem_en.tex
	done
done
