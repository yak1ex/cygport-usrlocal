USRLOCAL_VER=0.3-1
OCAML_VER=0.2-1

.PHONY: dist dist-usrlocal  dist-ocaml
.PHONY:      tag-usrlocal   tag-ocaml
.PHONY:      retag-usrlocal retag-ocaml

dist: dist-usrlocal dist-ocaml

install:
	for i in usr/lib/cygport/lib/*.cygclass usr/lib/cygport/bin/* usr/share/cygport/*; do if [ $$i -nt /$$i ]; then echo Update $$i; cp $$i /$$i; fi; done

dist-usrlocal:
	tar cvjf cygport-usrlocal-$(USRLOCAL_VER).tar.bz2 --exclude .svn --exclude yak-ocaml.cygclass etc usr

tag-usrlocal:
	svn copy . https://yak.myhome.cx/repos/source/cygport-usrlocal/tags/cygport-usrlocal-$(USRLOCAL_VER)

retag-usrlocal:
	svn remove https://yak.myhome.cx/repos/source/cygport-usrlocal/tags/cygport-usrlocal-$(USRLOCAL_VER)
	svn copy . https://yak.myhome.cx/repos/source/cygport-usrlocal/tags/cygport-usrlocal-$(USRLOCAL_VER)

dist-ocaml:
	tar cvjf cygport-ocaml-$(OCAML_VER).tar.bz2 --exclude .svn usr/lib/cygport/lib/yak-ocaml.cygclass

tag-ocaml:
	svn copy . https://yak.myhome.cx/repos/source/cygport-usrlocal/tags/cygport-ocaml-$(OCAML_VER)

retag-ocaml:
	svn remove https://yak.myhome.cx/repos/source/cygport-usrlocal/tags/cygport-ocaml-$(OCAML_VER)
	svn copy . https://yak.myhome.cx/repos/source/cygport-usrlocal/tags/cygport-ocaml-$(OCAML_VER)
