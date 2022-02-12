TEX      = xelatex
BIB      = bibtex
MAIN     = document
TEXARGS  = -synctex=1 -shell-escape

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

target: close wipe clean tex open

tex: $(MAIN).tex
	$(TEX) $(TEXARGS) $<
	$(BIB) $(MAIN).aux
	$(TEX) $(TEXARGS) $<
	$(TEX) $(TEXARGS) $<

nobib: $(MAIN).tex
	$(TEX) $(TEXARGS) $<
	$(TEX) $(TEXARGS) $<

open: $(MAIN).pdf
	$(OPEN) $(MAIN).pdf

close:
	@$(CLOSE) || echo not found

clean:
	$(RM) *.aux *.bbl *.blg *.log *.out *.gz *.toc *.thm *.fdb_latexmk *.fls *.nav *.snm *.vrb *.spl *.lof *.lot *.ist *.glo *.acn

wipe:
	$(RM) $(MAIN).pdf

.PHONY: open close clean wipe
