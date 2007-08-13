#!/bin/sh

sed -e 's,/usr/share/info,/usr/local/info,g' /usr/lib/cygport/bin/prep_gnu_info.sh > /usr/lib/cygport/bin/prep_gnu_info_usrlocal.sh
chmod +x /usr/lib/cygport/bin/prep_gnu_info_usrlocal.sh
