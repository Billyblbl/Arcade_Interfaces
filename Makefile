##
## EPITECH PROJECT, 2019
## A.L.P-a.C.A
## File description:
## Arcade Library Plug-able Common API
##

DOC		=	ALPaCA.doc

PDF		=	$(DOC).pdf

HTML	=	$(DOC).html

ALL		=	$(PDF) $(HTML)

all: $(ALL)

run:
	doxygen Doxyfile

pdf: $(PDF)

html: $(HTML)

$(PDF): run
	$(MAKE) -C doc/latex pdf
	ln -sf ./doc/latex/refman.pdf $@

$(HTML): run
	ln -sf ./doc/html/index.html $@

clean:
	rm -rf doc/html
	rm -rf doc/latex
	rm -rf doc/man
	rm -rf doc/rtf
	rm -rf doc/xml
	rm -rf $(ALL)

re: clean all

.PHONY: all run clean re
