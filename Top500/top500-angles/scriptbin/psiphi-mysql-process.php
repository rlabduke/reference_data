<?php
mkdir("blt30");
process("psiphi_nogp.tab", "blt30/psiphi500-nogp.tab",  30);
process("psiphi_glyx.tab", "blt30/psiphi500-gly_x.tab", 30);
process("psiphi_xgly.tab", "blt30/psiphi500-x_gly.tab", 30);
process("psiphi_prox.tab", "blt30/psiphi500-pro_x.tab", 30);
process("psiphi_xpro.tab", "blt30/psiphi500-x_pro.tab", 30);
process("psiphi_nogp_no2str.tab", "blt30/psiphi500-nogp-no2str.tab",  30);

function process($infile, $outfile, $Bcutoff, $fieldsep = "\t")
{
    $in = fopen($infile, 'rb');
    $out = fopen($outfile, 'wb');
    fgets($in); // discard header line from mysql -B
    fwrite($out, "# id : psi : phi : mcMaxB\n");
    while(!feof($in))
    {
        $f = split($fieldsep, trim(fgets($in)));
        $pdbID  = $f[1];
        $chain1 = $f[2];
        $num1   = $f[3]+0;
        $type1  = $f[4];
        $chain2 = $f[5];
        $num2   = $f[6]+0;
        $type2  = $f[7];
        $b1     = $f[8]+0;
        $b2     = $f[9]+0;
        $maxB   = max($b1, $b2);
        $psi    = $f[10];
        $phi    = $f[11];
        if($num1 < $num2)
            $id = "$type1-$type2 $chain1$num1-$chain2$num2 ($pdbID) B$maxB";
        else
            $id = "$type2-$type1 $chain2$num2-$chain1$num1 ($pdbID) B$maxB";
        
        if($maxB < $Bcutoff) fwrite($out, "$id:$psi:$phi:$maxB\n");
    }
    fclose($in);
    fclose($out);
}
?>
