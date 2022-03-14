TEX      = xelatex
BIB      = bibtex
MKI      = makeindex
MAIN     = yanputhesis
TEXARGS  = -synctex=1 -shell-escape

main: $(MAIN).dtx
	$(TEX) $<
	makeindex -s gglo.ist -o $(MAIN).gls $(MAIN).glo
	makeindex -s gind.ist -o $(MAIN).ind $(MAIN).idx
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


sample: $(MAIN)-sample.tex
	$(TEX) $(TEXARGS) $<
	$(TEX) $(TEXARGS) $<

samplebib: $(MAIN)-sample.tex
	$(TEX) $(TEXARGS) $<
	$(BIB) $(MAIN)-sample.aux
	$(TEX) $(TEXARGS) $<
	$(TEX) $(TEXARGS) $<

open: $(MAIN).pdf
	$(OPEN) $(MAIN).pdf

close:
	@$(CLOSE) || echo not found

clean:
	$(RM) *.gls *.glo *.ind *.idx
	$(RM) *.ilg *.aux *.toc *.aux
	$(RM) *.hd *.out *.thm
	$(RM) *.log *.lof *.lot


wipe:
	$(RM) $(MAIN).pdf

.PHONY: open close clean wipe
