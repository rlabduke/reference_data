#!/bin/awk
# An AWK script I used to re-format some old data files
# and to filter the data by B-factor.
#
# I ran it on the following files:
#   top500-rama-noprepro.old
#   top500-rama-prepro-noGP.old
#
# See also: rerama-startab.awk
#
# -IWD
BEGIN {
    FS  = ":";
    OFS = ":";
    print "# ID : phi : psi : B-factor : clash?";
}
($16+0) < 30 {
    print $1" ("$2" A) "$3, $9, $10, $16, $7;
}
