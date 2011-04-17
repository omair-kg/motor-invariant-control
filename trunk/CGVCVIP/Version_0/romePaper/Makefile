TEX=rommePaper

Show:	$(TEX).pdf
	evince $(TEX).pdf&

$(TEX).pdf: $(TEX).tex  $(TEX).bbl
	latex $(TEX).tex
	latex $(TEX).tex
	dvips ${TEX}
	ps2pdf ${TEX}.ps
$(TEX).bbl: $(TEX).aux $(TEX).bib
	bibtex $(TEX)
$(TEX).aux: $(SOURCES) 
	latex $(TEX)


clean:
	rm *.aux
	rm *.log
	rm *.dvi
	rm *.pdf
	rm *.bbl 
	rm *.toc
	rm *.blg
	rm *.ps
