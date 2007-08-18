#!/bin/bash

temp=`mktemp`

for target in `find $1 -type f \( -name '*.exe' -o -name '*.dll' -o -name '*.so' \)`; do
    1>&2 echo Detecting dependent DLLs for $target
    for dll in `cygcheck $target | tail -n +2`; do
        dll=`cygpath -u $dll | tr -d '\r\n'`
        case $dll in
        /cygdrive/*)
            1>&2 echo "    Skip $dll"
            ;;
        *)
            cano_dll=`echo $dll | sed 's,[^[:alnum:]],_,g'`
            eval "package=\$${cano_dll}"
            if [ -z "$package" ]; then
                1>&2 echo -n "    $dll is included in ... "
                eval ${cano_dll}=`cygcheck -f $dll | tr -d '\r\n'`
                eval package="\${$cano_dll}"
                if [ ! -z "$package" ]; then
                    echo $package >> $temp
                    1>&2 echo $package
                else
                    eval ${cano_dll}="'not found'"
                    1>&2 echo not found
                fi
            else
                1>&2 echo "    $dll is included in ... $package (cached)"
            fi
            ;;
        esac
    done
done

sort $temp | uniq
rm $temp
