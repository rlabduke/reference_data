# (jEdit options) :folding=explicit:collapseFolds=1:

#{{{ Global/documentation
.PHONY : all clean special hills \
	rama rama-stat rama-pct rama-kin \
	bayes bayes-rama \
	psiphi psiphi-stat psiphi-energy psiphi-pct psiphi-kin \
	rota rota1 rota1-stat rota1-pct rota1-kin rota1-hills rota1-modes \
	rota2 rota2-stat rota2-pct rota2-kin rota2-hills rota2-modes \
	rota3 rota3-stat rota3-pct rota3-kin rota3-hills rota3-modes \
	rota4 rota4-stat rota4-pct rota4-kin rota4-hills rota4-modes \
	rota-kin \
	rota1-modes

# Takes about 15 minutes to 'make all'
all : rama psiphi rota

# The basic command to launch Silk
SILK = java -Xmx1024m -cp scriptbin/silk.jar silk.SilkCmdLine
# The basic options for kinNDcont
KCONT_OPT = -samp -last -nosmooth -group

#}}}

#{{{ Ramachandran
RAMA_OPT = -ndim=2 -label=1 -coords=2,3 -wrap -insep=, 
RAMA_GEN_OPT   = $(RAMA_OPT) -gridsize=2 -cosine=5 -twopass=6.5
RAMA_OTHER_OPT = $(RAMA_OPT) -gridsize=2 -cosine=5 -twopass=8
RAMA_STAT_OPT = -bounds=-180,180,-180,180
RAMA_PCT_OPT = -bounds=-180,180,-180,180 -fraction
RAMA_KIN_OPT = -bounds=-181,179,-181,179 -fraction
RAMA_CNTS_OPT = $(RAMA_OPT) -gridsize=0.1 -histogram -bounds=-180,180,-180,180 -counts -dense

KCONT_RAMA_OPT = $(KCONT_OPT) -wrap -180 180 -180 180 -g2
KCONT_RAMA_GEN_OPT = $(KCONT_RAMA_OPT) -l 0.0001 white -l 0.0002 lilactint -l 0.0005 lilac -l 0.001 purple -l 0.002 blue -l 0.01 sky -l 0.02 bluetint -l 0.05 greentint -l 0.1 green -l 0.25 lime -l 0.5 yellow -l 0.75 gold -l 0.9 orange -l 0.95 red
KCONT_RAMA_OTHER_OPT = $(KCONT_RAMA_GEN_OPT)

rama : rama-stat rama-pct rama-kin rama-counts

rama-stat :
	mkdir -p stat/rama
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_STAT_OPT) -title="cis Pro$(SUBTIT)"                   < srcdata/rama8000-cispro.csv             > stat/rama/rama8000-cispro.data
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_STAT_OPT) -title="trans Pro$(SUBTIT)"                 < srcdata/rama8000-transpro.csv           > stat/rama/rama8000-transpro.data
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_STAT_OPT) -title="Gly (sym)$(SUBTIT)"                 < srcdata/rama8000-gly-sym.csv            > stat/rama/rama8000-gly-sym.data
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_STAT_OPT) -title="pre-Pro (no G/P)$(SUBTIT)"          < srcdata/rama8000-prepro-noGP.csv        > stat/rama/rama8000-prepro-noGP.data
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_STAT_OPT) -title="Ile/Val (no preP)$(SUBTIT)"         < srcdata/rama8000-ileval-nopreP.csv      > stat/rama/rama8000-ileval-nopreP.data
	$(SILK) $(RAMA_GEN_OPT)   $(RAMA_STAT_OPT) -title="General (no G/P/I/V/preP)$(SUBTIT)" < srcdata/rama8000-general-noGPIVpreP.csv > stat/rama/rama8000-general-noGPIVpreP.data

rama-pct :
	mkdir -p pct/rama
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="cis Pro$(SUBTIT)"                   < srcdata/rama8000-cispro.csv             > pct/rama/rama8000-cispro.data
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="trans Pro$(SUBTIT)"                 < srcdata/rama8000-transpro.csv           > pct/rama/rama8000-transpro.data
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="Gly (sym)$(SUBTIT)"                 < srcdata/rama8000-gly-sym.csv            > pct/rama/rama8000-gly-sym.data
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="pre-Pro (no G/P)$(SUBTIT)"          < srcdata/rama8000-prepro-noGP.csv        > pct/rama/rama8000-prepro-noGP.data
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="Ile/Val (no preP)$(SUBTIT)"         < srcdata/rama8000-ileval-nopreP.csv      > pct/rama/rama8000-ileval-nopreP.data
	$(SILK) $(RAMA_GEN_OPT)   $(RAMA_PCT_OPT) -title="General (no G/P/I/V/preP)$(SUBTIT)" < srcdata/rama8000-general-noGPIVpreP.csv > pct/rama/rama8000-general-noGPIVpreP.data
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="cis Pro$(SUBTIT)"                   -ndft < srcdata/rama8000-cispro.csv             > pct/rama/rama8000-cispro.ndft
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="trans Pro$(SUBTIT)"                 -ndft < srcdata/rama8000-transpro.csv           > pct/rama/rama8000-transpro.ndft
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="Gly (sym)$(SUBTIT)"                 -ndft < srcdata/rama8000-gly-sym.csv            > pct/rama/rama8000-gly-sym.ndft
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="pre-Pro (no G/P)$(SUBTIT)"          -ndft < srcdata/rama8000-prepro-noGP.csv        > pct/rama/rama8000-prepro-noGP.ndft
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="Ile/Val (no preP)$(SUBTIT)"         -ndft < srcdata/rama8000-ileval-nopreP.csv      > pct/rama/rama8000-ileval-nopreP.ndft
	$(SILK) $(RAMA_GEN_OPT)   $(RAMA_PCT_OPT) -title="General (no G/P/I/V/preP)$(SUBTIT)" -ndft < srcdata/rama8000-general-noGPIVpreP.csv > pct/rama/rama8000-general-noGPIVpreP.ndft

rama-kin :
	mkdir -p kin/rama
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="cis Pro$(SUBTIT)"                   -kin < srcdata/rama8000-cispro.csv             | sed "s/{data}/{cispro}/"                  | sed "s/@dotlist.*/& master= {data}/" > kin/rama/rama8000-cispro.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="trans Pro$(SUBTIT)"                 -kin < srcdata/rama8000-transpro.csv           | sed "s/{data}/{transpro}/"                | sed "s/@dotlist.*/& master= {data}/" > kin/rama/rama8000-transpro.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="Gly (no sym)$(SUBTIT)"              -kin < srcdata/rama8000-gly.csv                | sed "s/{data}/{gly-nosymdata-nosymcont}/" | sed "s/@dotlist.*/& master= {data}/" > kin/rama/rama8000-gly-nosymdata-nosymcont.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="Gly (sym cont)$(SUBTIT)"            -kin < srcdata/rama8000-gly.csv                | sed "s/{data}/{gly-nosymdata-symcont}/"   | sed "s/@dotlist.*/& master= {data}/" > kin/rama/rama8000-gly-nosymdata-symcont.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="Gly (sym cont & data)$(SUBTIT)"     -kin < srcdata/rama8000-gly-sym.csv            | sed "s/{data}/{gly-symdata-symcont}/"     | sed "s/@dotlist.*/& master= {data}/" > kin/rama/rama8000-gly-symdata-symcont.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="pre-Pro (no G/P)$(SUBTIT)"          -kin < srcdata/rama8000-prepro-noGP.csv        | sed "s/{data}/{prepro-noGP}/"             | sed "s/@dotlist.*/& master= {data}/" > kin/rama/rama8000-prepro-noGP.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="Ile/Val (no preP)$(SUBTIT)"         -kin < srcdata/rama8000-ileval-nopreP.csv      | sed "s/{data}/{ileval-nopreP}/"           | sed "s/@dotlist.*/& master= {data}/" > kin/rama/rama8000-ileval-nopreP.kin
	$(SILK) $(RAMA_GEN_OPT)   $(RAMA_PCT_OPT) -title="General (no G/P/preP)$(SUBTIT)"     -kin < srcdata/rama8000-general-noGPpreP.csv   | sed "s/{data}/{general-noGPpreP}/"        | sed "s/@dotlist.*/& master= {data}/" > kin/rama/rama8000-general-noGPpreP.kin
	$(SILK) $(RAMA_GEN_OPT)   $(RAMA_PCT_OPT) -title="General (no G/P/I/V/preP)$(SUBTIT)" -kin < srcdata/rama8000-general-noGPIVpreP.csv | sed "s/{data}/{general-noGPIVpreP}/"      | sed "s/@dotlist.*/& master= {data}/" > kin/rama/rama8000-general-noGPIVpreP.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_KIN_OPT) -title="cis Pro$(SUBTIT)"                   < srcdata/rama8000-cispro.csv             | kin2Dcont $(KCONT_RAMA_OTHER_OPT) - | php -f scriptbin/cont.php >> kin/rama/rama8000-cispro.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_KIN_OPT) -title="trans Pro$(SUBTIT)"                 < srcdata/rama8000-transpro.csv           | kin2Dcont $(KCONT_RAMA_OTHER_OPT) - | php -f scriptbin/cont.php >> kin/rama/rama8000-transpro.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_KIN_OPT) -title="Gly (no sym)$(SUBTIT)"              < srcdata/rama8000-gly.csv                | kin2Dcont $(KCONT_RAMA_OTHER_OPT) - | php -f scriptbin/cont.php >> kin/rama/rama8000-gly-nosymdata-nosymcont.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_KIN_OPT) -title="Gly (sym cont)$(SUBTIT)"            < srcdata/rama8000-gly-sym.csv            | kin2Dcont $(KCONT_RAMA_OTHER_OPT) - | php -f scriptbin/cont.php >> kin/rama/rama8000-gly-nosymdata-symcont.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_KIN_OPT) -title="Gly (sym cont & data)$(SUBTIT)"     < srcdata/rama8000-gly-sym.csv            | kin2Dcont $(KCONT_RAMA_OTHER_OPT) - | php -f scriptbin/cont.php >> kin/rama/rama8000-gly-symdata-symcont.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_KIN_OPT) -title="pre-Pro (no G/P)$(SUBTIT)"          < srcdata/rama8000-prepro-noGP.csv        | kin2Dcont $(KCONT_RAMA_OTHER_OPT) - | php -f scriptbin/cont.php >> kin/rama/rama8000-prepro-noGP.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_KIN_OPT) -title="Ile/Val (no preP)$(SUBTIT)"         < srcdata/rama8000-ileval-nopreP.csv      | kin2Dcont $(KCONT_RAMA_OTHER_OPT) - | php -f scriptbin/cont.php >> kin/rama/rama8000-ileval-nopreP.kin
	$(SILK) $(RAMA_GEN_OPT)   $(RAMA_KIN_OPT) -title="General (no G/P/preP)$(SUBTIT)"     < srcdata/rama8000-general-noGPpreP.csv   | kin2Dcont $(KCONT_RAMA_GEN_OPT)   - | php -f scriptbin/cont.php >> kin/rama/rama8000-general-noGPpreP.kin
	$(SILK) $(RAMA_GEN_OPT)   $(RAMA_KIN_OPT) -title="General (no G/P/I/V/preP)$(SUBTIT)" < srcdata/rama8000-general-noGPIVpreP.csv | kin2Dcont $(KCONT_RAMA_GEN_OPT)   - | php -f scriptbin/cont.php >> kin/rama/rama8000-general-noGPIVpreP.kin

rama-counts :
	mkdir -p counts/rama
	$(SILK) $(RAMA_CNTS_OPT) -title="cis Pro$(SUBTIT)"                   < srcdata/rama8000-cispro.csv             > counts/rama/rama8000-cispro.data
	$(SILK) $(RAMA_CNTS_OPT) -title="trans Pro$(SUBTIT)"                 < srcdata/rama8000-transpro.csv           > counts/rama/rama8000-transpro.data
	$(SILK) $(RAMA_CNTS_OPT) -title="Gly (sym)$(SUBTIT)"                 < srcdata/rama8000-gly-sym.csv            > counts/rama/rama8000-gly-sym.data
	$(SILK) $(RAMA_CNTS_OPT) -title="pre-Pro (no G/P)$(SUBTIT)"          < srcdata/rama8000-prepro-noGP.csv        > counts/rama/rama8000-prepro-noGP.data
	$(SILK) $(RAMA_CNTS_OPT) -title="Ile/Val (no preP)$(SUBTIT)"         < srcdata/rama8000-ileval-nopreP.csv      > counts/rama/rama8000-ileval-nopreP.data
	$(SILK) $(RAMA_CNTS_OPT) -title="General (no G/P/I/V/preP)$(SUBTIT)" < srcdata/rama8000-general-noGPIVpreP.csv > counts/rama/rama8000-general-noGPIVpreP.data
#}}}

rota : rota1 rota2 rota3 rota4

# A cross-cutting group: PART OF rota1 - rota4
hills : rota1-hills rota2-hills rota3-hills rota4-hills

rota-kin : rota1-kin rota2-kin rota3-kin rota4-kin

#{{{ 1-D rotamers
ROTA1_OPT = -ndim=1 -label=1 -coords=4 -wrap -insep=, -gridsize=1 -cosine=5 -twopass=7 -bounds=0,360
ROTA1_1PASS_OPT = -ndim=1 -label=1 -coords=4 -wrap -insep=, -gridsize=1 -cosine=5 -bounds=0,360
ROTA1_STAT_OPT = $(ROTA1_OPT)
ROTA1_PCT_OPT = $(ROTA1_OPT) -fraction
#ROTA1_KIN_OPT = $(ROTA1_OPT) -fraction -scale=100 -kin -contour=1,2,5,10,20
ROTA1_KIN_OPT = $(ROTA1_OPT) -fraction -scale=100 -kin -contour=0.1,0.3,0.5,0.7,1,2,5,10,20
ROTA1_HILL_OPT = $(ROTA1_OPT) -fraction -hillclimb=0.01
ROTA1_MODE_OPT = $(ROTA1_1PASS_OPT) -fraction -hillclimb=0.01
ROTA1_MODE_KIN_OPT = $(ROTA1_1PASS_OPT) -fraction -scale=100 -kin -contour=0.1,0.3,0.5,0.7,1,2,5,10,20

rota1 : rota1-stat rota1-pct rota1-kin rota1-hills

rota1-stat :
	mkdir -p stat/rota
	$(SILK) $(ROTA1_STAT_OPT) -title="Top8000 Ser" < srcdata/rota8000-ser.csv > stat/rota/rota8000-ser.data
	$(SILK) $(ROTA1_STAT_OPT) -title="Top8000 Thr" < srcdata/rota8000-thr.csv > stat/rota/rota8000-thr.data
	$(SILK) $(ROTA1_STAT_OPT) -title="Top8000 Val" < srcdata/rota8000-val.csv > stat/rota/rota8000-val.data
	$(SILK) $(ROTA1_STAT_OPT) -title="Top8000 Pro" < srcdata/rota8000-pro.csv > stat/rota/rota8000-pro.data
	$(SILK) $(ROTA1_STAT_OPT) -title="Top8000 Cys" < srcdata/rota8000-cys.csv > stat/rota/rota8000-cys.data

rota1-pct :
	mkdir -p pct/rota
	$(SILK) $(ROTA1_PCT_OPT) -title="Top8000 Ser" < srcdata/rota8000-ser.csv > pct/rota/rota8000-ser.data
	$(SILK) $(ROTA1_PCT_OPT) -title="Top8000 Thr" < srcdata/rota8000-thr.csv > pct/rota/rota8000-thr.data
	$(SILK) $(ROTA1_PCT_OPT) -title="Top8000 Val" < srcdata/rota8000-val.csv > pct/rota/rota8000-val.data
	$(SILK) $(ROTA1_PCT_OPT) -title="Top8000 Pro" < srcdata/rota8000-pro.csv > pct/rota/rota8000-pro.data
	$(SILK) $(ROTA1_PCT_OPT) -title="Top8000 Cys" < srcdata/rota8000-cys.csv > pct/rota/rota8000-cys.data
	$(SILK) $(ROTA1_PCT_OPT) -ndft -title="Top8000 Ser" < srcdata/rota8000-ser.csv > pct/rota/rota8000-ser.ndft
	$(SILK) $(ROTA1_PCT_OPT) -ndft -title="Top8000 Thr" < srcdata/rota8000-thr.csv > pct/rota/rota8000-thr.ndft
	$(SILK) $(ROTA1_PCT_OPT) -ndft -title="Top8000 Val" < srcdata/rota8000-val.csv > pct/rota/rota8000-val.ndft
	$(SILK) $(ROTA1_PCT_OPT) -ndft -title="Top8000 Pro" < srcdata/rota8000-pro.csv > pct/rota/rota8000-pro.ndft
	$(SILK) $(ROTA1_PCT_OPT) -ndft -title="Top8000 Cys" < srcdata/rota8000-cys.csv > pct/rota/rota8000-cys.ndft

rota1-kin :
	mkdir -p kin/rota
	$(SILK) $(ROTA1_KIN_OPT) -title="Top8000 Ser" < srcdata/rota8000-ser.csv > kin/rota/rota8000-ser.kin
	$(SILK) $(ROTA1_KIN_OPT) -title="Top8000 Thr" < srcdata/rota8000-thr.csv > kin/rota/rota8000-thr.kin
	$(SILK) $(ROTA1_KIN_OPT) -title="Top8000 Val" < srcdata/rota8000-val.csv > kin/rota/rota8000-val.kin
	$(SILK) $(ROTA1_KIN_OPT) -title="Top8000 Pro" < srcdata/rota8000-pro.csv > kin/rota/rota8000-pro.kin
	$(SILK) $(ROTA1_KIN_OPT) -title="Top8000 Cys" < srcdata/rota8000-cys.csv > kin/rota/rota8000-cys.kin

rota1-hills :
	mkdir -p hills/rota
	$(SILK) $(ROTA1_KIN_OPT) -title="Top8000 Ser" < srcdata/rota8000-ser.csv > hills/rota/rota8000-ser.kin
	$(SILK) $(ROTA1_HILL_OPT) -title="Top8000 Ser" < srcdata/rota8000-ser.csv | \
	php -f scriptbin/hills1d.php >> hills/rota/rota8000-ser.kin
	$(SILK) $(ROTA1_KIN_OPT) -title="Top8000 Thr" < srcdata/rota8000-thr.csv > hills/rota/rota8000-thr.kin
	$(SILK) $(ROTA1_HILL_OPT) -title="Top8000 Thr" < srcdata/rota8000-thr.csv | \
	php -f scriptbin/hills1d.php >> hills/rota/rota8000-thr.kin
	$(SILK) $(ROTA1_KIN_OPT) -title="Top8000 Val" < srcdata/rota8000-val.csv > hills/rota/rota8000-val.kin
	$(SILK) $(ROTA1_HILL_OPT) -title="Top8000 Val" < srcdata/rota8000-val.csv | \
	php -f scriptbin/hills1d.php >> hills/rota/rota8000-val.kin
	$(SILK) $(ROTA1_KIN_OPT) -title="Top8000 Pro" < srcdata/rota8000-pro.csv > hills/rota/rota8000-pro.kin
	$(SILK) $(ROTA1_HILL_OPT) -title="Top8000 Pro" < srcdata/rota8000-pro.csv | \
	php -f scriptbin/hills1d.php >> hills/rota/rota8000-pro.kin
	$(SILK) $(ROTA1_KIN_OPT) -title="Top8000 Cys" < srcdata/rota8000-cys.csv > hills/rota/rota8000-cys.kin
	$(SILK) $(ROTA1_HILL_OPT) -title="Top8000 Cys" < srcdata/rota8000-cys.csv | \
	php -f scriptbin/hills1d.php >> hills/rota/rota8000-cys.kin

rota1-modes :
	mkdir -p modes/rota
	$(SILK) $(ROTA1_MODE_OPT) -hillmodes -title="Top8000 Ser" < srcdata/rota8000-ser.csv > modes/rota/rota8000-ser.txt
	$(SILK) $(ROTA1_MODE_OPT) -hillmodes -title="Top8000 Thr" < srcdata/rota8000-thr.csv > modes/rota/rota8000-thr.txt
	$(SILK) $(ROTA1_MODE_OPT) -hillmodes -title="Top8000 Val" < srcdata/rota8000-val.csv > modes/rota/rota8000-val.txt
	$(SILK) $(ROTA1_MODE_OPT) -hillmodes -title="Top8000 Pro" < srcdata/rota8000-pro.csv > modes/rota/rota8000-pro.txt
	$(SILK) $(ROTA1_MODE_OPT) -hillmodes -title="Top8000 Cys" < srcdata/rota8000-cys.csv > modes/rota/rota8000-cys.txt
	$(SILK) $(ROTA1_MODE_KIN_OPT) -title="Top8000 Ser" < srcdata/rota8000-ser.csv > modes/rota/rota8000-ser.kin
	$(SILK) $(ROTA1_MODE_KIN_OPT) -title="Top8000 Thr" < srcdata/rota8000-thr.csv > modes/rota/rota8000-thr.kin
	$(SILK) $(ROTA1_MODE_KIN_OPT) -title="Top8000 Val" < srcdata/rota8000-val.csv > modes/rota/rota8000-val.kin
	$(SILK) $(ROTA1_MODE_KIN_OPT) -title="Top8000 Pro" < srcdata/rota8000-pro.csv > modes/rota/rota8000-pro.kin
	$(SILK) $(ROTA1_MODE_KIN_OPT) -title="Top8000 Cys" < srcdata/rota8000-cys.csv > modes/rota/rota8000-cys.kin


#}}}

#{{{ 2-D rotamers
ROTA2_OPT = -ndim=2 -label=1 -coords=4,5 -wrap -insep=, -gridsize=5 -cosine=5 -twopass=7
ROTA2_FULL_STAT_OPT = $(ROTA2_OPT) -bounds=0,360,0,360
ROTA2_FULL_PCT_OPT = $(ROTA2_OPT) -bounds=0,360,0,360 -fraction
ROTA2_FULL_KIN_OPT = $(ROTA2_OPT) -bounds=-2.5,357.5,-2.5,357.5 -fraction
ROTA2_FULL_HILL_OPT = $(ROTA2_FULL_KIN_OPT) -hillclimb=0.01
ROTA2_HALF_STAT_OPT = $(ROTA2_OPT) -bounds=0,360,0,180
ROTA2_HALF_PCT_OPT = $(ROTA2_OPT) -bounds=0,360,0,180 -fraction
ROTA2_HALF_KIN_OPT = $(ROTA2_OPT) -bounds=-2.5,357.5,-2.5,177.5 -fraction
ROTA2_HALF_HILL_OPT = $(ROTA2_HALF_KIN_OPT) -hillclimb=0.01

#KCONT_ROTA2_OPT = $(KCONT_OPT) -g5 -l 0.01 pink -l 0.02 peach -l 0.05 yellow -l 0.10 sea -l 0.20 sky
KCONT_ROTA2_OPT = $(KCONT_OPT) -g5 -l 0.001 bluetint -l 0.003 peachtint -l 0.005 yellowtint -l 0.007 greentint -l 0.01 pink -l 0.02 peach -l 0.05 yellow -l 0.10 sea -l 0.20 sky
KCONT_ROTA2_FULL_OPT = $(KCONT_ROTA2_OPT) -wrap 0 360 0 360
KCONT_ROTA2_HALF_OPT = $(KCONT_ROTA2_OPT) -wrap 0 360 0 180

rota2 : rota2-stat rota2-pct rota2-kin rota2-hills

rota2-stat :
	mkdir -p stat/rota
	$(SILK) $(ROTA2_FULL_STAT_OPT) -title="Top8000 Ile" < srcdata/rota8000-ile.csv > stat/rota/rota8000-ile.data
	$(SILK) $(ROTA2_FULL_STAT_OPT) -title="Top8000 Leu (tt* and mp* removed)" < srcdata/rota8000-leu-clean.csv > stat/rota/rota8000-leu-clean.data
	$(SILK) $(ROTA2_FULL_STAT_OPT) -title="Top8000 Leu (raw)" < srcdata/rota8000-leu-raw.csv > stat/rota/rota8000-leu-raw.data
	$(SILK) $(ROTA2_FULL_STAT_OPT) -title="Top8000 His" < srcdata/rota8000-his.csv > stat/rota/rota8000-his.data
	$(SILK) $(ROTA2_FULL_STAT_OPT) -title="Top8000 Trp" < srcdata/rota8000-trp.csv > stat/rota/rota8000-trp.data
	$(SILK) $(ROTA2_FULL_STAT_OPT) -title="Top8000 Asn" < srcdata/rota8000-asn.csv > stat/rota/rota8000-asn.data
	$(SILK) $(ROTA2_HALF_STAT_OPT) -title="Top8000 Asp" < srcdata/rota8000-asp.csv > stat/rota/rota8000-asp.data
	$(SILK) $(ROTA2_HALF_STAT_OPT) -title="Top8000 Tyr and Phe" < srcdata/rota8000-phetyr.csv > stat/rota/rota8000-phetyr.data

rota2-pct :
	mkdir -p pct/rota
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top8000 Ile" < srcdata/rota8000-ile.csv > pct/rota/rota8000-ile.data
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top8000 Leu (tt* and mp* removed)" < srcdata/rota8000-leu-clean.csv > pct/rota/rota8000-leu-clean.data
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top8000 Leu (raw)" < srcdata/rota8000-leu-raw.csv > pct/rota/rota8000-leu-raw.data
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top8000 His" < srcdata/rota8000-his.csv > pct/rota/rota8000-his.data
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top8000 Trp" < srcdata/rota8000-trp.csv > pct/rota/rota8000-trp.data
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top8000 Asn" < srcdata/rota8000-asn.csv > pct/rota/rota8000-asn.data
	$(SILK) $(ROTA2_HALF_PCT_OPT) -title="Top8000 Asp" < srcdata/rota8000-asp.csv > pct/rota/rota8000-asp.data
	$(SILK) $(ROTA2_HALF_PCT_OPT) -title="Top8000 Tyr and Phe" < srcdata/rota8000-phetyr.csv > pct/rota/rota8000-phetyr.data
	$(SILK) $(ROTA2_FULL_PCT_OPT) -ndft -title="Top8000 Ile" < srcdata/rota8000-ile.csv > pct/rota/rota8000-ile.ndft
	$(SILK) $(ROTA2_FULL_PCT_OPT) -ndft -title="Top8000 Leu (tt* and mp* removed)" < srcdata/rota8000-leu-clean.csv > pct/rota/rota8000-leu-clean.ndft
	$(SILK) $(ROTA2_FULL_PCT_OPT) -ndft -title="Top8000 His" < srcdata/rota8000-his.csv > pct/rota/rota8000-his.ndft
	$(SILK) $(ROTA2_FULL_PCT_OPT) -ndft -title="Top8000 Trp" < srcdata/rota8000-trp.csv > pct/rota/rota8000-trp.ndft
	$(SILK) $(ROTA2_FULL_PCT_OPT) -ndft -title="Top8000 Asn" < srcdata/rota8000-asn.csv > pct/rota/rota8000-asn.ndft
	$(SILK) $(ROTA2_HALF_PCT_OPT) -ndft -title="Top8000 Asp" < srcdata/rota8000-asp.csv > pct/rota/rota8000-asp.ndft
	$(SILK) $(ROTA2_HALF_PCT_OPT) -ndft -title="Top8000 Tyr and Phe" < srcdata/rota8000-phetyr.csv > pct/rota/rota8000-phetyr.ndft

rota2-kin :
	mkdir -p kin/rota
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top8000 Ile" -kin < srcdata/rota8000-ile.csv > kin/rota/rota8000-ile.kin
	$(SILK) $(ROTA2_FULL_KIN_OPT) -title="Top8000 Ile" < srcdata/rota8000-ile.csv | \
	kin2Dcont $(KCONT_ROTA2_FULL_OPT) - >>  kin/rota/rota8000-ile.kin
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top8000 Leu (tt* and mp* removed)" -kin < srcdata/rota8000-leu-clean.csv > kin/rota/rota8000-leu-clean.kin
	$(SILK) $(ROTA2_FULL_KIN_OPT) -title="Top8000 Leu (tt* and mp* removed)" < srcdata/rota8000-leu-clean.csv | \
	kin2Dcont $(KCONT_ROTA2_FULL_OPT) - >>  kin/rota/rota8000-leu-clean.kin
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top8000 Leu (raw)" -kin < srcdata/rota8000-leu-raw.csv > kin/rota/rota8000-leu-raw.kin
	$(SILK) $(ROTA2_FULL_KIN_OPT) -title="Top8000 Leu (raw)" < srcdata/rota8000-leu-raw.csv | \
	kin2Dcont $(KCONT_ROTA2_FULL_OPT) - >>  kin/rota/rota8000-leu-raw.kin
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top8000 His" -kin < srcdata/rota8000-his.csv > kin/rota/rota8000-his.kin
	$(SILK) $(ROTA2_FULL_KIN_OPT) -title="Top8000 His" < srcdata/rota8000-his.csv | \
	kin2Dcont $(KCONT_ROTA2_FULL_OPT) - >>  kin/rota/rota8000-his.kin
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top8000 Trp" -kin < srcdata/rota8000-trp.csv > kin/rota/rota8000-trp.kin
	$(SILK) $(ROTA2_FULL_KIN_OPT) -title="Top8000 Trp" < srcdata/rota8000-trp.csv | \
	kin2Dcont $(KCONT_ROTA2_FULL_OPT) - >>  kin/rota/rota8000-trp.kin
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top8000 Asn" -kin < srcdata/rota8000-asn.csv > kin/rota/rota8000-asn.kin
	$(SILK) $(ROTA2_FULL_KIN_OPT) -title="Top8000 Asn" < srcdata/rota8000-asn.csv | \
	kin2Dcont $(KCONT_ROTA2_FULL_OPT) - >>  kin/rota/rota8000-asn.kin
	$(SILK) $(ROTA2_HALF_PCT_OPT) -title="Top8000 Asp" -kin < srcdata/rota8000-asp.csv > kin/rota/rota8000-asp.kin
	$(SILK) $(ROTA2_HALF_KIN_OPT) -title="Top8000 Asp" < srcdata/rota8000-asp.csv | \
	kin2Dcont $(KCONT_ROTA2_HALF_OPT) - >>  kin/rota/rota8000-asp.kin
	$(SILK) $(ROTA2_HALF_PCT_OPT) -title="Top8000 Tyr and Phe" -kin < srcdata/rota8000-phetyr.csv > kin/rota/rota8000-phetyr.kin
	$(SILK) $(ROTA2_HALF_KIN_OPT) -title="Top8000 Tyr and Phe" < srcdata/rota8000-phetyr.csv | \
	kin2Dcont $(KCONT_ROTA2_HALF_OPT) - >>  kin/rota/rota8000-phetyr.kin

rota2-hills :
	mkdir -p hills/rota
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top8000 Ile" -kin < srcdata/rota8000-ile.csv > hills/rota/rota8000-ile.kin
	$(SILK) $(ROTA2_FULL_HILL_OPT) -title="Top8000 Ile" < srcdata/rota8000-ile.csv | \
	php -f scriptbin/hills2d.php >>  hills/rota/rota8000-ile.kin
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top8000 Leu (tt* and mp* removed)" -kin < srcdata/rota8000-leu-clean.csv > hills/rota/rota8000-leu-clean.kin
	$(SILK) $(ROTA2_FULL_HILL_OPT) -title="Top8000 Leu (tt* and mp* removed)" < srcdata/rota8000-leu-clean.csv | \
	php -f scriptbin/hills2d.php >>  hills/rota/rota8000-leu-clean.kin
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top8000 Leu (raw)" -kin < srcdata/rota8000-leu-raw.csv > hills/rota/rota8000-leu-raw.kin
	$(SILK) $(ROTA2_FULL_HILL_OPT) -title="Top8000 Leu (raw)" < srcdata/rota8000-leu-raw.csv | \
	php -f scriptbin/hills2d.php >>  hills/rota/rota8000-leu-raw.kin
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top8000 His" -kin < srcdata/rota8000-his.csv > hills/rota/rota8000-his.kin
	$(SILK) $(ROTA2_FULL_HILL_OPT) -title="Top8000 His" < srcdata/rota8000-his.csv | \
	php -f scriptbin/hills2d.php >>  hills/rota/rota8000-his.kin
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top8000 Trp" -kin < srcdata/rota8000-trp.csv > hills/rota/rota8000-trp.kin
	$(SILK) $(ROTA2_FULL_HILL_OPT) -title="Top8000 Trp" < srcdata/rota8000-trp.csv | \
	php -f scriptbin/hills2d.php >>  hills/rota/rota8000-trp.kin
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top8000 Asn" -kin < srcdata/rota8000-asn.csv > hills/rota/rota8000-asn.kin
	$(SILK) $(ROTA2_FULL_HILL_OPT) -title="Top8000 Asn" < srcdata/rota8000-asn.csv | \
	php -f scriptbin/hills2d.php >>  hills/rota/rota8000-asn.kin
	$(SILK) $(ROTA2_HALF_PCT_OPT) -title="Top8000 Asp" -kin < srcdata/rota8000-asp.csv > hills/rota/rota8000-asp.kin
	$(SILK) $(ROTA2_HALF_HILL_OPT) -title="Top8000 Asp" < srcdata/rota8000-asp.csv | \
	php -f scriptbin/hills2d.php >>  hills/rota/rota8000-asp.kin
	$(SILK) $(ROTA2_HALF_PCT_OPT) -title="Top8000 Tyr and Phe" -kin < srcdata/rota8000-phetyr.csv > hills/rota/rota8000-phetyr.kin
	$(SILK) $(ROTA2_HALF_HILL_OPT) -title="Top8000 Tyr and Phe" < srcdata/rota8000-phetyr.csv | \
	php -f scriptbin/hills2d.php >>  hills/rota/rota8000-phetyr.kin

#}}}

#{{{ 3-D rotamers
ROTA3_OPT = -ndim=3 -label=1 -coords=4,5,6 -wrap -insep=, -gridsize=8 -cosine=5 -twopass=7
ROTA3_FULL_STAT_OPT = $(ROTA3_OPT) -bounds=0,360,0,360,0,360
ROTA3_FULL_PCT_OPT = $(ROTA3_OPT) -bounds=0,360,0,360,0,360 -fraction
ROTA3_FULL_KIN_OPT = $(ROTA3_OPT) -bounds=-2.5,357.5,-2.5,357.5,-2.5,357.5 -fraction
ROTA3_FULL_HILL_OPT = $(ROTA3_FULL_KIN_OPT) -hillclimb=0.01
ROTA3_HALF_STAT_OPT = $(ROTA3_OPT) -bounds=0,360,0,360,0,180
ROTA3_HALF_PCT_OPT = $(ROTA3_OPT) -bounds=0,360,0,360,0,180 -fraction
ROTA3_HALF_KIN_OPT = $(ROTA3_OPT) -bounds=-2.5,357.5,-2.5,357.5,-2.5,177.5 -fraction
ROTA3_HALF_HILL_OPT = $(ROTA3_HALF_KIN_OPT) -hillclimb=0.01

#KCONT_ROTA3_OPT = $(KCONT_OPT) -g8 -l 0.01 pink -l 0.02 peach -l 0.05 yellow -l 0.10 sea -l 0.20 sky
KCONT_ROTA3_OPT = $(KCONT_OPT) -g8 -l 0.001 bluetint -l 0.003 peachtint -l 0.005 yellowtint -l 0.007 greentint -l 0.01 pink -l 0.02 peach -l 0.05 yellow -l 0.10 sea -l 0.20 sky
KCONT_ROTA3_FULL_OPT = $(KCONT_ROTA3_OPT) -wrap 0 360 0 360 0 360
KCONT_ROTA3_HALF_OPT = $(KCONT_ROTA3_OPT) -wrap 0 360 0 360 0 180

rota3 : rota3-stat rota3-pct rota3-kin rota3-hills

rota3-stat :
	mkdir -p stat/rota
	$(SILK) $(ROTA3_FULL_STAT_OPT) -title="Top8000 Pro (ALL CHIS)" < srcdata/rota8000-pro.csv > stat/rota/rota8000-pro3d.data
	$(SILK) $(ROTA3_FULL_STAT_OPT) -title="Top8000 Met" < srcdata/rota8000-met.csv > stat/rota/rota8000-met.data
	$(SILK) $(ROTA3_FULL_STAT_OPT) -title="Top8000 Gln" < srcdata/rota8000-gln.csv > stat/rota/rota8000-gln.data
	$(SILK) $(ROTA3_HALF_STAT_OPT) -title="Top8000 Glu" < srcdata/rota8000-glu.csv > stat/rota/rota8000-glu.data

rota3-pct :
	mkdir -p pct/rota
	$(SILK) $(ROTA3_FULL_PCT_OPT) -title="Top8000 Pro (ALL CHIS)" < srcdata/rota8000-pro.csv > pct/rota/rota8000-pro3d.data
	$(SILK) $(ROTA3_FULL_PCT_OPT) -title="Top8000 Met" < srcdata/rota8000-met.csv > pct/rota/rota8000-met.data
	$(SILK) $(ROTA3_FULL_PCT_OPT) -title="Top8000 Gln" < srcdata/rota8000-gln.csv > pct/rota/rota8000-gln.data
	$(SILK) $(ROTA3_HALF_PCT_OPT) -title="Top8000 Glu" < srcdata/rota8000-glu.csv > pct/rota/rota8000-glu.data
	$(SILK) $(ROTA3_FULL_PCT_OPT) -ndft -title="Top8000 Met" < srcdata/rota8000-met.csv > pct/rota/rota8000-met.ndft
	$(SILK) $(ROTA3_FULL_PCT_OPT) -ndft -title="Top8000 Gln" < srcdata/rota8000-gln.csv > pct/rota/rota8000-gln.ndft
	$(SILK) $(ROTA3_HALF_PCT_OPT) -ndft -title="Top8000 Glu" < srcdata/rota8000-glu.csv > pct/rota/rota8000-glu.ndft

rota3-kin :
	mkdir -p kin/rota
	$(SILK) $(ROTA3_FULL_PCT_OPT) -title="Top8000 Pro (ALL CHIS)" -kin < srcdata/rota8000-pro.csv > kin/rota/rota8000-pro3d.kin
	$(SILK) $(ROTA3_FULL_KIN_OPT) -title="Top8000 Pro (ALL CHIS)" < srcdata/rota8000-pro.csv | \
	kin3Dcont $(KCONT_ROTA3_FULL_OPT) - >>  kin/rota/rota8000-pro3d.kin
	$(SILK) $(ROTA3_FULL_PCT_OPT) -title="Top8000 Met" -kin < srcdata/rota8000-met.csv > kin/rota/rota8000-met.kin
	$(SILK) $(ROTA3_FULL_KIN_OPT) -title="Top8000 Met" < srcdata/rota8000-met.csv | \
	kin3Dcont $(KCONT_ROTA3_FULL_OPT) - >>  kin/rota/rota8000-met.kin
	$(SILK) $(ROTA3_FULL_PCT_OPT) -title="Top8000 Gln" -kin < srcdata/rota8000-gln.csv > kin/rota/rota8000-gln.kin
	$(SILK) $(ROTA3_FULL_KIN_OPT) -title="Top8000 Gln" < srcdata/rota8000-gln.csv | \
	kin3Dcont $(KCONT_ROTA3_FULL_OPT) - >>  kin/rota/rota8000-gln.kin
	$(SILK) $(ROTA3_HALF_PCT_OPT) -title="Top8000 Glu" -kin < srcdata/rota8000-glu.csv > kin/rota/rota8000-glu.kin
	$(SILK) $(ROTA3_HALF_KIN_OPT) -title="Top8000 Glu" < srcdata/rota8000-glu.csv | \
	kin3Dcont $(KCONT_ROTA3_HALF_OPT) - >>  kin/rota/rota8000-glu.kin

rota3-hills :
	mkdir -p hills/rota
	$(SILK) $(ROTA3_FULL_PCT_OPT) -title="Top8000 Pro (ALL CHIS)" -kin < srcdata/rota8000-pro.csv > hills/rota/rota8000-pro3d.kin
	$(SILK) $(ROTA3_FULL_HILL_OPT) -title="Top8000 Pro (ALL CHIS)" < srcdata/rota8000-pro.csv | \
	php -f scriptbin/hills3d.php >>  hills/rota/rota8000-pro3d.kin
	$(SILK) $(ROTA3_FULL_PCT_OPT) -title="Top8000 Met" -kin < srcdata/rota8000-met.csv > hills/rota/rota8000-met.kin
	$(SILK) $(ROTA3_FULL_HILL_OPT) -title="Top8000 Met" < srcdata/rota8000-met.csv | \
	php -f scriptbin/hills3d.php >>  hills/rota/rota8000-met.kin
	$(SILK) $(ROTA3_FULL_PCT_OPT) -title="Top8000 Gln" -kin < srcdata/rota8000-gln.csv > hills/rota/rota8000-gln.kin
	$(SILK) $(ROTA3_FULL_HILL_OPT) -title="Top8000 Gln" < srcdata/rota8000-gln.csv | \
	php -f scriptbin/hills3d.php >>  hills/rota/rota8000-gln.kin
	$(SILK) $(ROTA3_HALF_PCT_OPT) -title="Top8000 Glu" -kin < srcdata/rota8000-glu.csv > hills/rota/rota8000-glu.kin
	$(SILK) $(ROTA3_HALF_HILL_OPT) -title="Top8000 Glu" < srcdata/rota8000-glu.csv | \
	php -f scriptbin/hills3d.php >>  hills/rota/rota8000-glu.kin

#}}}

#{{{ 4-D rotamers
ROTA4_OPT = -ndim=4 -label=1 -coords=4,5,6,7 -wrap -insep=, -gridsize=10 -cosine=5 -twopass=7
ROTA4_STAT_OPT = $(ROTA4_OPT) -bounds=0,360,0,360,0,360,0,360
ROTA4_PCT_OPT = $(ROTA4_OPT) -bounds=0,360,0,360,0,360,0,360 -fraction

ROTA4_KIN_OPT = -ndim=3 -label=1 -wrap -insep=, -gridsize=10 -cosine=5 -twopass=7 -bounds=0,360,0,360,0,360 -fraction
ROTA4_OFF_OPT = -ndim=3 -label=1 -wrap -insep=, -gridsize=10 -cosine=5 -twopass=7 -bounds=-2.5,357.5,-2.5,357.5,-2.5,357.5 -fraction
ROTA4_HILL_OPT = $(ROTA4_OFF_OPT) -hillclimb=0.01
ROTA4_123_OPT = -coords=4,5,6
ROTA4_234_OPT = -coords=5,6,7

#KCONT_ROTA4_OPT = $(KCONT_OPT) -g10 -l 0.01 pink -l 0.02 peach -l 0.05 yellow -l 0.10 sea -l 0.20 sky -wrap 0 360 0 360 0 360
KCONT_ROTA4_OPT = $(KCONT_OPT) -g10 -l 0.001 bluetint -l 0.003 peachtint -l 0.005 yellowtint -l 0.007 greentint -l 0.01 pink -l 0.02 peach -l 0.05 yellow -l 0.10 sea -l 0.20 sky -wrap 0 360 0 360 0 360

rota4 : rota4-stat rota4-pct rota4-kin rota4-hills

rota4-stat :
	mkdir -p stat/rota
	$(SILK) $(ROTA4_STAT_OPT) -title="Top8000 Arg" < srcdata/rota8000-arg.csv > stat/rota/rota8000-arg.data
	$(SILK) $(ROTA4_STAT_OPT) -title="Top8000 Lys" < srcdata/rota8000-lys.csv > stat/rota/rota8000-lys.data

rota4-pct :
	mkdir -p pct/rota
	$(SILK) $(ROTA4_PCT_OPT) -title="Top8000 Arg" < srcdata/rota8000-arg.csv > pct/rota/rota8000-arg.data
	$(SILK) $(ROTA4_PCT_OPT) -title="Top8000 Lys" < srcdata/rota8000-lys.csv > pct/rota/rota8000-lys.data
	$(SILK) $(ROTA4_PCT_OPT) -ndft -title="Top8000 Arg" < srcdata/rota8000-arg.csv > pct/rota/rota8000-arg.ndft
	$(SILK) $(ROTA4_PCT_OPT) -ndft -title="Top8000 Lys" < srcdata/rota8000-lys.csv > pct/rota/rota8000-lys.ndft

rota4-kin :
	mkdir -p kin/rota
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_123_OPT) -title="Top8000 Arg (chi1, chi2, chi3)" -kin < srcdata/rota8000-arg.csv | sed "s/{data}/{arg-123 $(GRP)}/"  | sed "s/@dotlist.*/& master= {data}/" > kin/rota/rota8000-arg-123.kin
	$(SILK) $(ROTA4_OFF_OPT) $(ROTA4_123_OPT) -title="Top8000 Arg (chi1, chi2, chi3)" < srcdata/rota8000-arg.csv | \
	kin3Dcont $(KCONT_ROTA4_OPT) - >>  kin/rota/rota8000-arg-123.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Top8000 Arg (any chi1)" -kin < srcdata/rota8000-arg.csv | sed "s/{data}/{arg-1any $(GRP)}/" | sed "s/@dotlist.*/& master= {data}/" > kin/rota/rota8000-arg-1any.kin
	$(SILK) $(ROTA4_OFF_OPT) $(ROTA4_234_OPT) -title="Top8000 Arg (any chi1)" < srcdata/rota8000-arg.csv | \
	kin3Dcont $(KCONT_ROTA4_OPT) - >> kin/rota/rota8000-arg-1any.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Top8000 Arg (chi1 = plus)" -kin < srcdata/rota8000-arg-1p.csv | sed "s/{data}/{arg-1p $(GRP)}/"   | sed "s/@dotlist.*/& master= {data}/" > kin/rota/rota8000-arg-plus.kin
	$(SILK) $(ROTA4_OFF_OPT) $(ROTA4_234_OPT) -title="Top8000 Arg (chi1 = plus)" < srcdata/rota8000-arg-1p.csv | \
	kin3Dcont $(KCONT_ROTA4_OPT) - >>  kin/rota/rota8000-arg-plus.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Top8000 Arg (chi1 = trans)" -kin < srcdata/rota8000-arg-1t.csv | sed "s/{data}/{arg-1t $(GRP)}/"   | sed "s/@dotlist.*/& master= {data}/" > kin/rota/rota8000-arg-trans.kin
	$(SILK) $(ROTA4_OFF_OPT) $(ROTA4_234_OPT) -title="Top8000 Arg (chi1 = trans)" < srcdata/rota8000-arg-1t.csv | \
	kin3Dcont $(KCONT_ROTA4_OPT) - >>  kin/rota/rota8000-arg-trans.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Top8000 Arg (chi1 = minus)" -kin < srcdata/rota8000-arg-1m.csv | sed "s/{data}/{arg-1m $(GRP)}/"   | sed "s/@dotlist.*/& master= {data}/" > kin/rota/rota8000-arg-minus.kin
	$(SILK) $(ROTA4_OFF_OPT) $(ROTA4_234_OPT) -title="Top8000 Arg (chi1 = minus)" < srcdata/rota8000-arg-1m.csv | \
	kin3Dcont $(KCONT_ROTA4_OPT) - >>  kin/rota/rota8000-arg-minus.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_123_OPT) -title="Top8000 Lys (chi1, chi2, chi3)" -kin < srcdata/rota8000-lys.csv | sed "s/{data}/{lys-123 $(GRP)}/"  | sed "s/@dotlist.*/& master= {data}/" > kin/rota/rota8000-lys-123.kin
	$(SILK) $(ROTA4_OFF_OPT) $(ROTA4_123_OPT) -title="Top8000 Lys (chi1, chi2, chi3)" < srcdata/rota8000-lys.csv | \
	kin3Dcont $(KCONT_ROTA4_OPT) - >>  kin/rota/rota8000-lys-123.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Top8000 Lys (any chi1)" -kin < srcdata/rota8000-lys.csv    | sed "s/{data}/{lys-1any $(GRP)}/" | sed "s/@dotlist.*/& master= {data}/" > kin/rota/rota8000-lys-1any.kin
	$(SILK) $(ROTA4_OFF_OPT) $(ROTA4_234_OPT) -title="Top8000 Lys (any chi1)" < srcdata/rota8000-lys.csv    | \
	kin3Dcont $(KCONT_ROTA4_OPT) - >> kin/rota/rota8000-lys-1any.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Top8000 Lys (chi1 = plus)" -kin < srcdata/rota8000-lys-1p.csv | sed "s/{data}/{lys-1p $(GRP)}/"   | sed "s/@dotlist.*/& master= {data}/" > kin/rota/rota8000-lys-plus.kin
	$(SILK) $(ROTA4_OFF_OPT) $(ROTA4_234_OPT) -title="Top8000 Lys (chi1 = plus)" < srcdata/rota8000-lys-1p.csv | \
	kin3Dcont $(KCONT_ROTA4_OPT) - >>  kin/rota/rota8000-lys-plus.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Top8000 Lys (chi1 = trans)" -kin < srcdata/rota8000-lys-1t.csv | sed "s/{data}/{lys-1t $(GRP)}/"   | sed "s/@dotlist.*/& master= {data}/" > kin/rota/rota8000-lys-trans.kin
	$(SILK) $(ROTA4_OFF_OPT) $(ROTA4_234_OPT) -title="Top8000 Lys (chi1 = trans)" < srcdata/rota8000-lys-1t.csv | \
	kin3Dcont $(KCONT_ROTA4_OPT) - >>  kin/rota/rota8000-lys-trans.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Top8000 Lys (chi1 = minus)" -kin < srcdata/rota8000-lys-1m.csv | sed "s/{data}/{lys-1m $(GRP)}/"   | sed "s/@dotlist.*/& master= {data}/" > kin/rota/rota8000-lys-minus.kin
	$(SILK) $(ROTA4_OFF_OPT) $(ROTA4_234_OPT) -title="Top8000 Lys (chi1 = minus)" < srcdata/rota8000-lys-1m.csv | \
	kin3Dcont $(KCONT_ROTA4_OPT) - >>  kin/rota/rota8000-lys-minus.kin

rota4-hills :
	mkdir -p hills/rota
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_123_OPT) -title="Top8000 Arg (chi1, chi2, chi3)" -kin < srcdata/rota8000-arg.csv > hills/rota/rota8000-arg-123.kin
	$(SILK) $(ROTA4_HILL_OPT) $(ROTA4_123_OPT) -title="Top8000 Arg (chi1, chi2, chi3)" < srcdata/rota8000-arg.csv | \
	php -f scriptbin/hills3d.php >>  hills/rota/rota8000-arg-123.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Arg (any chi1)$(SUBTIT)" -kin < srcdata/rota8000-arg.csv    > hills/rota/rota8000-arg-1any.kin
	$(SILK) $(ROTA4_HILL_OPT) $(ROTA4_234_OPT) -title="Arg (any chi1)$(SUBTIT)" < srcdata/rota8000-arg.csv    | \
	php -f scriptbin/hills3d.php >> hills/rota/rota8000-arg-1any.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Top8000 Arg (chi1 = plus)" -kin < srcdata/rota8000-arg-1p.csv > hills/rota/rota8000-arg-plus.kin
	$(SILK) $(ROTA4_HILL_OPT) $(ROTA4_234_OPT) -title="Top8000 Arg (chi1 = plus)" < srcdata/rota8000-arg-1p.csv | \
	php -f scriptbin/hills3d.php >>  hills/rota/rota8000-arg-plus.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Top8000 Arg (chi1 = trans)" -kin < srcdata/rota8000-arg-1t.csv > hills/rota/rota8000-arg-trans.kin
	$(SILK) $(ROTA4_HILL_OPT) $(ROTA4_234_OPT) -title="Top8000 Arg (chi1 = trans)" < srcdata/rota8000-arg-1t.csv | \
	php -f scriptbin/hills3d.php >>  hills/rota/rota8000-arg-trans.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Top8000 Arg (chi1 = minus)" -kin < srcdata/rota8000-arg-1m.csv > hills/rota/rota8000-arg-minus.kin
	$(SILK) $(ROTA4_HILL_OPT) $(ROTA4_234_OPT) -title="Top8000 Arg (chi1 = minus)" < srcdata/rota8000-arg-1m.csv | \
	php -f scriptbin/hills3d.php >>  hills/rota/rota8000-arg-minus.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_123_OPT) -title="Top8000 Lys (chi1, chi2, chi3)" -kin < srcdata/rota8000-lys.csv > hills/rota/rota8000-lys-123.kin
	$(SILK) $(ROTA4_HILL_OPT) $(ROTA4_123_OPT) -title="Top8000 Lys (chi1, chi2, chi3)" < srcdata/rota8000-lys.csv | \
	php -f scriptbin/hills3d.php >>  hills/rota/rota8000-lys-123.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Lys (any chi1)$(SUBTIT)" -kin < srcdata/rota8000-lys.csv    > hills/rota/rota8000-lys-1any.kin
	$(SILK) $(ROTA4_HILL_OPT) $(ROTA4_234_OPT) -title="Lys (any chi1)$(SUBTIT)" < srcdata/rota8000-lys.csv    | php -f scriptbin/hills3d.php >> hills/rota/rota8000-lys-1any.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Top8000 Lys (chi1 = plus)" -kin < srcdata/rota8000-lys-1p.csv > hills/rota/rota8000-lys-plus.kin
	$(SILK) $(ROTA4_HILL_OPT) $(ROTA4_234_OPT) -title="Top8000 Lys (chi1 = plus)" < srcdata/rota8000-lys-1p.csv | \
	php -f scriptbin/hills3d.php >>  hills/rota/rota8000-lys-plus.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Top8000 Lys (chi1 = trans)" -kin < srcdata/rota8000-lys-1t.csv > hills/rota/rota8000-lys-trans.kin
	$(SILK) $(ROTA4_HILL_OPT) $(ROTA4_234_OPT) -title="Top8000 Lys (chi1 = trans)" < srcdata/rota8000-lys-1t.csv | \
	php -f scriptbin/hills3d.php >>  hills/rota/rota8000-lys-trans.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Top8000 Lys (chi1 = minus)" -kin < srcdata/rota8000-lys-1m.csv > hills/rota/rota8000-lys-minus.kin
	$(SILK) $(ROTA4_HILL_OPT) $(ROTA4_234_OPT) -title="Top8000 Lys (chi1 = minus)" < srcdata/rota8000-lys-1m.csv | \
	php -f scriptbin/hills3d.php >>  hills/rota/rota8000-lys-minus.kin

#}}}

#{{{ Special tests and queries
PHETYR_EXTRA_LEVELS = -m 0.005 0.050 0.005 gray -m 0.06 0.15 0.01 gray -m 0.20 0.80 0.05 gray 
phetyr-lowb :
	$(SILK) $(ROTA2_HALF_PCT_OPT) -title="Top8000 Tyr and Phe" -kin < srcdata/rota8000-phetyr-blt30-noclash.csv > kin/rota/rota8000-phetyr-blt30-noclash.kin
	$(SILK) $(ROTA2_HALF_KIN_OPT) -title="Top8000 Tyr and Phe" < srcdata/rota8000-phetyr-blt30-noclash.csv | \
	kin2Dcont $(KCONT_ROTA2_HALF_OPT) $(PHETYR_EXTRA_LEVELS) - >>  kin/rota/rota8000-phetyr-blt30-noclash.kin
	$(SILK) $(ROTA2_HALF_PCT_OPT) -title="Top8000 Tyr and Phe B<20" -kin < srcdata/rota8000-phetyr-blt20-noclash.csv > kin/rota/rota8000-phetyr-blt20-noclash.kin
	$(SILK) $(ROTA2_HALF_KIN_OPT) -title="Top8000 Tyr and Phe B<20" < srcdata/rota8000-phetyr-blt20-noclash.csv | \
	kin2Dcont $(KCONT_ROTA2_HALF_OPT) $(PHETYR_EXTRA_LEVELS) - >>  kin/rota/rota8000-phetyr-blt20-noclash.kin

#}}}

# Can't clean jmarvin/ because it has special data -- the *.list files
clean :
	rm -r kin/ pct/ stat/ hills/ counts/ #rotasamp/



