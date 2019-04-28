TARGET=\
		main.pdf

GENERATED_TEX= \
		generated/version.tex \

GENERATED_PDF_FROM_SVG= \


GENERATED_PDF_FROM_UML= \

CHAPTERS= \
		settings.tex \
		preamble.tex \
		glossary.tex \
		chapters/partie1.tex \
		chapters/conclusion.tex \


GENERATED= $(GENERATED_TEX) $(GENERATED_PDF_FROM_SVG) $(GENERATED_PDF_FROM_UML)

PDFLATEX=pdflatex -shell-escape -halt-on-error

main.pdf: main.tex preamble.tex $(GENERATED) $(CHAPTERS)
	$(PDFLATEX) main.tex
	bibtex main.aux
	makeindex main.glo -t main.glg -s main.ist -o main.gls
	$(PDFLATEX) main.tex
	$(PDFLATEX) main.tex


.SECONDARY: $(GENERATED)

generated/version.tex: .git/refs/heads
	mkdir -p generated
	bash scripts/get_version > generated/version.tex

generated/figs/uml/%.svg: figs/plantuml/%.pu
	mkdir -p generated/figs/uml/
	plantuml -tsvg -o $(abspath generated/figs/uml/) $<

generated/figs/uml/%.pdf: generated/figs/uml/%.svg
	inkscape --without-gui --file="$<" --export-pdf="$@"

generated/figs/svg/%.pdf: figs/%.svg
	mkdir -p generated/figs/svg/
	inkscape --without-gui --file="$<" --export-pdf="$@"



.PHONY: clean mrproper

clean:
	rm -f \
		$(TARGET:%.pdf=%.aux) \
		$(TARGET:%.pdf=%.out) \
		$(TARGET:%.pdf=%.tdo) \
		$(TARGET:%.pdf=%.toc) \
		$(TARGET:%.pdf=%.log) \
		$(TARGET:%.pdf=%.bbl) \
		$(TARGET:%.pdf=%.blg) \
		$(TARGET:%.pdf=%.gls) \
		$(TARGET:%.pdf=%.ist) \
		$(TARGET:%.pdf=%.glg) \
	rm -rf generated/


mrproper: clean
	rm -f \
		$(TARGET) \
