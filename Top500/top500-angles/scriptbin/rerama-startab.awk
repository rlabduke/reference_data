#!/bin/awk
# An AWK script I used to re-format some old data files
# and to filter the data by B-factor.
#
# I ran it on the following files:
#   top500-rama-Gly-blt30.tab
#   top500-rama-Pro-blt30.tab
#
# See also: rerama-starold.awk
#
# -IWD
BEGIN {
    FS  = ":";
    OFS = ":";
    print "# ID : phi : psi : B-factor : clash?";
}
($10+0) < 30 {
    print $1" ("$7" A) "$2" "$3" "$4, $5, $6, $10, $9;
}
