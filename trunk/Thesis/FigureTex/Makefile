# make -f Makefile_latex


R = basinOfAttraction

eps: 	$(R).tex
	latex $(R).tex
	dvips $(R).dvi -E -o $(R).eps


clean:
	rm -f $(R).log $(R).aux $(R).bbl $(R).blg $(R).dvi $(R).ps $(R).out $(R).eps
