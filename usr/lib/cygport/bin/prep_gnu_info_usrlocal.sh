#!/bin/bash

set -e

if [ -d ${D}/usr/local/info ]
then
	rm -f ${D}/usr/local/info/dir

	echo "Compressing info pages:";

	for infopage in $(find ${D}/usr/local/info -type f -name '*.info*' ! -name '*.gz' ! -name '*.bz2')
	do
		echo "        ${infopage##*/}";
		gzip -q ${infopage};
	done
fi
