
# target file base name
NAME = manual

# default action
all:
	rm -f $(NAME).pdf $(NAME).aux $(NAME).log $(NAME).out $(NAME).toc *~
	pdflatex $(NAME).tex
	pdflatex $(NAME).tex
	pdflatex $(NAME).tex
	rm -f $(NAME).aux $(NAME).log $(NAME).out $(NAME).toc *~
