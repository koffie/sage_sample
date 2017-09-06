# This Makefile is for convenience as a reminder and shortcut for the most used commands

# Package folder
PACKAGE = sage_sample

# change to your sage command if needed
SAGE = sage

all: install test

install:
	$(SAGE) -pip install --upgrade --no-index -v .

uninstall:
	$(SAGE) -pip uninstall -vy sage_sample 

develop:
	$(SAGE) -pip install --upgrade -e .

test:
	$(SAGE) setup.py test

coverage:
	$(SAGE) -coverage $(PACKAGE)/*

doc: install #sphynx needs be able to import the package in order to build docs
	cd docs && $(SAGE) -sh -c "make html"

doc-pdf: install
	cd docs && $(SAGE) -sh -c "make latexpdf"

clean: clean-doc

clean-doc:
	cd docs && $(SAGE) -sh -c "make clean"

.PHONY: all install develop test coverage clean clean-doc doc doc-pdf
