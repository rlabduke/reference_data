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
    print "# ID : chi1 : chi2 : chi3 : chi 4 : B-factor : clash?";
}
($11+0) < 40 {
    if($12 == "Y")
        print $1" ("$13" A) "$3" "$4" "$2, $7, $8, $9, $10, $11, "clash";
    else
        print $1" ("$13" A) "$3" "$4" "$2, $7, $8, $9, $10, $11, "";
}
