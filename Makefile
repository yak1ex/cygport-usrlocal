USRLOCAL_VER=0.1-1
OCAML_VER=0.1-1

.PHONY: dist dist-usrlocal dist-ocaml

dist: dist-usrlocal dist-ocaml

dist-usrlocal:
	tar cvjf cygport-usrlocal-$(USRLOCAL_VER).tar.bz2 --exclude .svn --exclude ocaml.cygclass etc usr

dist-ocaml:
	tar cvjf cygport-ocaml-$(OCAML_VER).tar.bz2 --exclude .svn usr/lib/cygport/lib/ocaml.cygclass
