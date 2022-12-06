TEX      = xelatex
BIB      = bibtex
MKI      = makeindex
MAIN     = yanputhesis
TEXARGS  = -synctex=1 -shell-escape

main: close wipe clean makecls open

sample: close wipesample clean texsample opensample

samplebib: close wipesample clean texsamplebib opensample

makecls: $(MAIN).dtx
	$(TEX) $<
	./zhmakeindex -s gglo.ist -o $(MAIN).gls $(MAIN).glo
	$(MKI) -s gind.ist -o $(MAIN).ind $(MAIN).idx
	$(TEX) $<
	$(TEX) $<

ifeq ($(OS), Windows_NT)
    PLATFORM = Windows
else
    ifeq ($(shell uname), Darwin)
        PLATFORM = MacOS
    else
        PLATFORM = Unix-Like
    endif
endif

ifeq ($(PLATFORM), Windows)
    RM = del /s /f
    OPEN = cmd /c start
    CLOSE = cmd /c taskkill /im Acrobat.exe /t /f
else
    RM = rm -rf
    OPEN = open
    PID = $$(ps -ef | grep AdobeAcrobat | grep -v grep | awk '{print $$2}')
    CLOSE = kill -9 $(PID)
endif

texsample: $(MAIN)-sample.tex
	$(TEX) $(TEXARGS) $<
	$(MKI) $(MAIN)-sample.nlo -s nomencl.ist -o $(MAIN)-sample.nls
	$(TEX) $(TEXARGS) $<

texsamplebib: $(MAIN)-sample.tex
	$(TEX) $(TEXARGS) $<
	$(BIB) $(MAIN)-sample.aux
	$(MKI) $(MAIN)-sample.nlo -s nomencl.ist -o $(MAIN)-sample.nls
	$(TEX) $(TEXARGS) $<
	$(TEX) $(TEXARGS) $<

open: $(MAIN).pdf
	$(OPEN) $(MAIN).pdf

opensample: $(MAIN)-sample.pdf
	$(OPEN) $(MAIN)-sample.pdf

close:
	@$(CLOSE) || echo not found

clean:
	$(RM) *.gls *.glo *.ind *.idx
	$(RM) *.ilg *.aux *.toc *.aux
	$(RM) *.hd *.out *.thm *.gz *.nlo *.nls
	$(RM) *.log *.lof *.lot *.bbl *.blg

wipe:
	$(RM) $(MAIN).pdf

wipesample:
	$(RM) $(MAIN)-sample.pdf

.PHONY: open close clean wipe
