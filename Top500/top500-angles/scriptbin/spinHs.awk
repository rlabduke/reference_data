#
# A script that takes the output of silk.util.RotamerSampler and
# inserts a final dihedral angle representing a freely-spinning
# hydrogen, Lys NH3, Met CH3, etc.
#
# USAGE: gawk -v nsteps=N -f spinHs.awk aa.list > aa.list2
#
BEGIN {
    FS = ":"
    OFS = ":"
}
$0 !~ /^#/ {
    out = "";
    for(field = 1; field < NF-1; field++)
        out = out $field ":"
        
    for(step = 0; step < nsteps; step++)
    {
        # +180 means that trans is the default
        ang = (360.0 * step/nsteps) + 180;
        print out ang, $(NF-1), $NF;
    }
}
