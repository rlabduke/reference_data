#!/bin/awk
# An AWK script I used to re-format some old data files
# and to filter the data by B-factor.
#
# I ran it on the following files:
#   noGPSansSecPreProB30.tab
#   AlaSansSecPreProB30.tab
#   GlySansSecPreProB30.tab
#
# -IWD
BEGIN {
    FS  = ":";
    OFS = ":";
    print "# ID : phi : psi : B-factor : clash?";
}
{
    print $2" (? A) "$4" "$5" "$3, $6, $7, "?", "?";
}
