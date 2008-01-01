USRLOCAL_VER=0.2-1
OCAML_VER=0.1-1

.PHONY: dist dist-usrlocal  dist-ocaml
.PHONY:      tag-usrlocal   tag-ocaml
.PHONY:      retag-usrlocal retag-ocaml

dist: dist-usrlocal dist-ocaml

dist-usrlocal:
	tar cvjf cygport-usrlocal-$(USRLOCAL_VER).tar.bz2 --exclude .svn --exclude ocaml.cygclass etc usr

tag-usrlocal:
	svn copy . https://yak.myhome.cx/repos/source/cygport-usrlocal/tags/cygport-usrlocal-$(USRLOCAL_VER)

retag-usrlocal:
	svn remove https://yak.myhome.cx/repos/source/cygport-usrlocal/tags/cygport-usrlocal-$(USRLOCAL_VER)
	svn copy . https://yak.myhome.cx/repos/source/cygport-usrlocal/tags/cygport-usrlocal-$(USRLOCAL_VER)

dist-ocaml:
	tar cvjf cygport-ocaml-$(OCAML_VER).tar.bz2 --exclude .svn usr/lib/cygport/lib/ocaml.cygclass

tag-ocaml:
	svn copy . https://yak.myhome.cx/repos/source/cygport-usrlocal/tags/cygport-ocaml-$(OCAML_VER)

retag-ocaml:
	svn remove https://yak.myhome.cx/repos/source/cygport-usrlocal/tags/cygport-ocaml-$(OCAML_VER)
	svn copy . https://yak.myhome.cx/repos/source/cygport-usrlocal/tags/cygport-ocaml-$(OCAML_VER)
