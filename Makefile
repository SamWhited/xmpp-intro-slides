SHELL = /bin/sh
.SILENT:

DO_XELATEX = xelatex --interaction=nonstopmode $<  $(REDIRECT)
DO_XELATEX_WRITE18 = xelatex --shell-escape --interaction=nonstopmode $<  $(REDIRECT)


NAME=slides
$(NAME).pdf: *.tex *.sty
	$(DO_XELATEX)
	while ($(DO_XELATEX) ; \
		grep -q "Rerun to get" $(NAME).log ) do true; \
		done
