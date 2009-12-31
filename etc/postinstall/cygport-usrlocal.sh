#!/bin/sh

sed -e 's,dobin,mydobin,g;s,^bindir=.*$,if defined USRLOCAL\nthen\n\tbindir=/usr/local/bin\nelse\n\tbindir=/usr/bin\nfi,' /usr/lib/cygport/bin/dobin > /usr/lib/cygport/bin/mydobin
sed -e 's,dolib,mydolib,g;s,^libdir=.*$,if defined USRLOCAL\nthen\n\tlibdir=/usr/local/lib\nelse\n\tlibdir=/usr/lib\nfi,' /usr/lib/cygport/bin/dolib > /usr/lib/cygport/bin/mydolib
