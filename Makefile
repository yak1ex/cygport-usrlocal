USRLOCAL_VER=0.7-1
OCAML_VER=0.4-1

.PHONY: install dcommit
.PHONY: dist dist-usrlocal  dist-ocaml
.PHONY:      tag-usrlocal   tag-ocaml
.PHONY:      gtag-usrlocal  gtag-ocaml
.PHONY:      retag-usrlocal retag-ocaml

dist: dist-usrlocal dist-ocaml

install:
	for i in usr/lib/cygport/bin/* usr/share/cygport/*.tmpl usr/share/cygport/cygclass/*.cygclass; do if [ $$i -nt /$$i ]; then echo Update $$i; cp $$i /$$i; fi; done

dcommit:
	git svn dcommit
	git reset --hard svn/trunk

dist-usrlocal:
	tar cvjf cygport-usrlocal-$(USRLOCAL_VER).tar.bz2 --exclude .svn --exclude yak-ocaml.cygclass etc usr

tag-usrlocal:
	svn copy . https://yak.myhome.cx/repos/source/cygport-usrlocal/tags/cygport-usrlocal-$(USRLOCAL_VER)

gtag-usrlocal:
	git svn tag cygport-usrlocal-$(USRLOCAL_VER)
	git reset --hard svn/trunk

retag-usrlocal:
	svn remove https://yak.myhome.cx/repos/source/cygport-usrlocal/tags/cygport-usrlocal-$(USRLOCAL_VER)
	svn copy . https://yak.myhome.cx/repos/source/cygport-usrlocal/tags/cygport-usrlocal-$(USRLOCAL_VER)

dist-ocaml:
	tar cvjf cygport-ocaml-$(OCAML_VER).tar.bz2 --exclude .svn usr/share/cygport/cygclass/yak-ocaml.cygclass

tag-ocaml:
	svn copy . https://yak.myhome.cx/repos/source/cygport-usrlocal/tags/cygport-ocaml-$(OCAML_VER)

gtag-ocaml:
	git svn tag cygport-ocaml-$(OCAML_VER)
	git reset --hard svn/trunk

retag-ocaml:
	svn remove https://yak.myhome.cx/repos/source/cygport-usrlocal/tags/cygport-ocaml-$(OCAML_VER)
	svn copy . https://yak.myhome.cx/repos/source/cygport-usrlocal/tags/cygport-ocaml-$(OCAML_VER)
