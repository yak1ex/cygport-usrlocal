#!/bin/sh

sed -e 's,/usr/share/info,/usr/local/info,g' /usr/lib/cygport/bin/prep_gnu_info.sh > /usr/lib/cygport/bin/prep_gnu_info_usrlocal.sh
chmod +x /usr/lib/cygport/bin/prep_gnu_info_usrlocal.sh
sed -e 's,dobin,mydobin,g;s,^bindir=.*$,if defined USRLOCAL\nthen\n\tbindir=/usr/local/bin\nelse\n\tlibdir=/usr/bin\nfi,' /usr/lib/cygport/bin/dobin > /usr/lib/cygport/bin/mydobin
sed -e 's,dolib,mydolib,g;s,^libdir=.*$,if defined USRLOCAL\nthen\n\tlibdir=/usr/local/lib\nelse\n\tlibdir=/usr/lib\nfi,' /usr/lib/cygport/bin/dolib > /usr/lib/cygport/bin/mydolib
