#!/bin/awk
# An AWK script I used to symmetrize glycine data.
#
# I ran it on the following files:
#   rama500-gly-nosym.tab
#
# -IWD
BEGIN {
    FS  = ":";
    OFS = ":";
    print "# ID : phi : psi : B-factor : clash?";
}
$2 != "\\N" && $3 != "\\N" {
    print $1, $2, $3, $4, $5;
    print $1, -$2, -$3, $4, $5;
}
