# Makefile to compile and clean cv.tex

# Main file name (without extension)
MAIN = cv

# LaTeX command (you can change pdflatex to xelatex or lualatex if needed)
LATEX = pdflatex

# Options for latexmk
LATEXMK_OPTS = -pdf -interaction=nonstopmode -halt-on-error

# Auxiliary files to be removed with 'make clean'
AUX_FILES = *.aux *.bbl *.blg *.idx *.ilg *.ind *.lof *.log *.lot *.out *.toc *.synctex.gz *.fdb_latexmk *.fls

.PHONY: all clean view fresh

# Default rule to compile the document
all: $(MAIN).pdf

# Rule to compile the PDF using latexmk
$(MAIN).pdf: $(MAIN).tex
	latexmk $(LATEXMK_OPTS) $(MAIN).tex

# Rule to clean auxiliary files
clean:
	latexmk -C $(MAIN).tex
	rm -f $(AUX_FILES)

# Rule to open the PDF
view: $(MAIN).pdf
	open $(MAIN).pdf &

# Rule to force a full recompilation
fresh:
	latexmk -C $(MAIN).tex
	latexmk $(LATEXMK_OPTS) $(MAIN).tex
