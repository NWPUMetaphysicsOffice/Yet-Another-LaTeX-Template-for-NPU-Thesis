TEX      = xelatex
BIB      = bibtex
MAIN     = document

target: close clean tex open

tex: $(MAIN).tex
	$(TEX) $<
	$(BIB) $(MAIN).aux
	$(TEX) $<
	$(TEX) $<

open: $(MAIN).pdf
	cmd /c start $(MAIN).pdf

close:
	cmd /c taskkill /im Acrobat.exe /t /f || echo not find

clean:
	del /s /f *.aux *.bbl *.blg *.log *.out *.gz *.toc *.thm *.fdb_latexmk *.fls *.acn *.glo *.ist

wipe:
	del /f $(MAIN).pdf

.PHONY: clean
