
MAKEFILES=$(wildcard */Makefile)

TEXFILES=$(wildcard *.tex */*.tex) document.bib

.PHONY: all clean 
all: clean script.pdf casestudy.pdf solutions.pdf

script.pdf: ${TEXFILES}
	pdflatex script
	bibtex script
	pdflatex script
	pdflatex script
	makeindex -s index/style.ist script
	pdflatex script

casestudy.pdf: ${TEXFILES}
	pdflatex casestudy
	pdflatex casestudy

solutions.pdf: ${TEXFILES}
	pdflatex solutions
	pdflatex solutions

clean:
	rm -f *.aux */*.aux *.toc *.lof *.lot *.ilg *.idx *.ind *.bbl *.blg *.lol *.out *.log *.pdf
