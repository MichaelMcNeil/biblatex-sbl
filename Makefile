# Makefile to create zip file for CTAN upload

CTANDIR = biblatex-sbl
TDSDIR = biblatex-sbl.tds
TDSBIBDIR = $(TDSDIR)/bibtex/bib/biblatex-sbl
TDSDOCDIR = $(TDSDIR)/doc/latex/biblatex-sbl
TDSTEXDIR = $(TDSDIR)/tex/latex/biblatex-sbl
TDSSTYDIR = $(TDSDIR)/tex/latex/sbl-paper
TDSISTDIR = $(TDSDIR)/makeindex/sbl-paper

README   = README.md
BIBFILES = doc/biblatex-sbl.bib
STYFILES = doc/sbl-paper.sty
ISTFILES = doc/sbl-paper-bibleref.ist
DOCFILES = doc/biblatex-sbl.pdf \
	   doc/biblatex-sbl.tex \
	   doc/biblatex-sbl-ibid.pdf \
	   doc/biblatex-sbl-ibid.tex \
	   doc/biblatex-sbl-test.pdf \
	   doc/biblatex-sbl-test.tex \
	   doc/sbl-paper.pdf \
	   doc/sbl-paper.tex
TEXFILES = latex/biblatex-sbl.def \
	   latex/sbl.bbx \
	   latex/sbl.cbx \
	   latex/sbl.dbx \
	   latex/sbl-american.lbx \
	   latex/sbl-british.lbx \
	   latex/sbl-english.lbx \
	   latex/sbl-german.lbx \
	   latex/sbl-spanish.lbx
TDSZIP   = biblatex-sbl.tds.zip
CTANZIP  = biblatex-sbl.zip

all: $(CTANZIP)

$(CTANZIP): $(TDSZIP)
	rm -rf $(CTANZIP) $(CTANDIR)
	mkdir -p $(CTANDIR)
	cp $(README) $(CTANDIR)
	cp $(BIBFILES) $(CTANDIR)
	cp $(STYFILES) $(CTANDIR)
	cp $(ISTFILES) $(CTANDIR)
	cp $(DOCFILES) $(CTANDIR)
	cp $(TEXFILES) $(CTANDIR)
	zip -r $(CTANZIP) $(TDSZIP) $(CTANDIR)
	rm -rf $(TDSZIP) $(TDSDIR) $(CTANDIR)

$(TDSZIP):
	rm -rf $(TDSZIP) $(TDSDIR)
	mkdir -p $(TDSBIBDIR)
	mkdir -p $(TDSDOCDIR)
	mkdir -p $(TDSTEXDIR)
	mkdir -p $(TDSSTYDIR)
	mkdir -p $(TDSISTDIR)
	cp $(BIBFILES) $(TDSBIBDIR)
	cp $(STYFILES) $(TDSSTYDIR)
	cp $(ISTFILES) $(TDSISTDIR)
	cp $(README) $(DOCFILES) $(TDSDOCDIR)
	cp $(TEXFILES) $(TDSTEXDIR)
	cd $(TDSDIR) && zip -r $(TDSZIP) *
	mv $(TDSDIR)/$(TDSZIP) .

clean:
	rm -rf $(TDSZIP) $(CTANZIP) $(CTANDIR) $(TDSDIR)
