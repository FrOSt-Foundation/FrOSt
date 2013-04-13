#*************************************
#  Génération d'archives pour export
#*************************************
# Il permet de générer des archives d'un point de l'historique.
# Par défaut, il exporte master. Pour exporter un autre point,
# Lancer `make BRANCH='id'` avec id un tag, un hash, une branche…

BRANCH = master
VERSION = $(shell git describe $(BRANCH))
NAME = frost-$(VERSION)
DEST = export
ARCHIVES = $(NAME:=.tar.xz) $(NAME:=.zip)

release: $(DEST) $(ARCHIVES)

$(DEST):
	@[[ -d $(DEST) ]] || mkdir -p $(DEST)

%.zip:
	git archive $(BRANCH) --prefix="$(NAME)/" -o "$(DEST)/$@"

%.tar.xz:
	git archive $(BRANCH) --prefix="$(NAME)/" -o "$(DEST)/$@"

.PHONY: clean
clean:
	@rm -rf $(DEST)
