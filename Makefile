USRLOCAL_VER=0.8-1
OCAML_VER=0.4-1

.PHONY: install
.PHONY: dist dist-usrlocal  dist-ocaml
.PHONY:      tag-usrlocal   tag-ocaml
.PHONY:      retag-usrlocal retag-ocaml

dist: dist-usrlocal dist-ocaml

install:
	for i in usr/lib/cygport/bin/* usr/share/cygport/*.tmpl usr/share/cygport/cygclass/*.cygclass; do if [ $$i -nt /$$i ]; then echo Update $$i; cp $$i /$$i; fi; done

dist-usrlocal:
	tar cvjf cygport-usrlocal-$(USRLOCAL_VER).tar.bz2 --exclude yak-ocaml.cygclass etc usr

tag-usrlocal:
	git tag cygport-usrlocal-$(USRLOCAL_VER)

retag-usrlocal:
	git tag -f cygport-usrlocal-$(USRLOCAL_VER)

dist-ocaml:
	tar cvjf cygport-ocaml-$(OCAML_VER).tar.bz2 usr/share/cygport/cygclass/yak-ocaml.cygclass

tag-ocaml:
	git tag cygport-ocaml-$(OCAML_VER)

retag-ocaml:
	git tag -f cygport-ocaml-$(OCAML_VER)
