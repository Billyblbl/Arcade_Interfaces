##
## EPITECH PROJECT, 2019
## A.L.P-a.C.A
## File description:
## Arcade Library Plug-able Common API
##

PDF	=	ALPaCA.doc.pdf

all: $(PDF)

$(PDF):
	doxygen Doxyfile
	$(MAKE) -C latex pdf
	ln -s ./latex/refman.pdf $@

clean:
	rm -rf doc
	rm -rf html
	rm -rf latex
	rm -rf $(PDF)

re: clean all

.PHONY: all clean re
