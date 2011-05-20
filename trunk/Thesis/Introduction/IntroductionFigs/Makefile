# make -f Makefile_latex


R = ShipMovement

eps: 	$(R).tex
	latex $(R).tex
	dvips $(R).dvi -E -o $(R).eps
	cp $(R).eps EPS/


clean:
	rm -f $(R).log $(R).aux $(R).bbl $(R).blg $(R).dvi $(R).ps $(R).out $(R).eps
