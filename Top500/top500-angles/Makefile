# (jEdit options) :folding=explicit:collapseFolds=1:
.PHONY : all rama rama-stat rama-pct rama-kin rota rota1 rota1-stat rota1-pct rota1-kin rota2 rota2-stat rota2-pct rota2-kin rota3 rota3-stat rota3-pct rota3-kin rota4 rota4-stat rota4-pct rota4-kin clean

# Takes about 15 minutes to 'make all'
all : rama rota

# The basic command to launch Silk
SILK = java -cp lib/silk.jar silk.SilkCmdLine
# The basic options for kinNDcont
KCONT_OPT = -samp -last -nosmooth -group

#{{{ Ramachandran
# Options for generating the various plots of Ramachandran data
RAMA_OPT = -ndim=2 -label=1 -coords=2,3 -wrap -insep=: -gridsize=2 -cosine=5
RAMA_GEN_OPT = $(RAMA_OPT) -twopass=6.5
RAMA_OTHER_OPT = $(RAMA_OPT) -twopass=8
RAMA_STAT_OPT = -bounds=-180,180,-180,180
RAMA_PCT_OPT = -bounds=-180,180,-180,180 -fraction
RAMA_KIN_OPT = -bounds=-181,179,-181,179 -fraction

# Options for kin2Dcont
KCONT_RAMA_OPT = $(KCONT_OPT) -wrap -180 180 -180 180 -g2
KCONT_RAMA_GEN_OPT = $(KCONT_RAMA_OPT) -l 0.0005 bluetint -l 0.02 sky
KCONT_RAMA_OTHER_OPT = $(KCONT_RAMA_OPT) -l 0.002 bluetint -l 0.02 sky

rama : rama-stat rama-pct rama-kin

rama-stat :
	mkdir -p stat/rama
	$(SILK) $(RAMA_GEN_OPT)   $(RAMA_STAT_OPT) -title="Top500 General case (not Gly, Pro, or pre-Pro) B<30" < srcdata/rama500-general-noGPpreP.tab > stat/rama/rama500-general.data
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_STAT_OPT) -title="Top500 Glycine (sym) B<30" < srcdata/rama500-gly-sym.tab > stat/rama/rama500-gly-sym.data
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_STAT_OPT) -title="Top500 Proline B<30" < srcdata/rama500-pro.tab > stat/rama/rama500-pro.data
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_STAT_OPT) -title="Top500 pre-Proline (not Gly or Pro) B<30" < srcdata/rama500-prepro-noGP.tab > stat/rama/rama500-prepro.data
	$(SILK) $(RAMA_GEN_OPT)   $(RAMA_STAT_OPT) -title="Top500 General case (no repet sec struct) B<30" < srcdata/rama500-general-nosec.tab > stat/rama/rama500-general-nosec.data
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_STAT_OPT) -title="Top500 Alanine (no repet sec struct) B<30" < srcdata/rama500-ala-nosec.tab > stat/rama/rama500-ala-nosec.data
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_STAT_OPT) -title="Top500 Glycine (sym, no repet sec struct) B<30" < srcdata/rama500-gly-sym-nosec.tab > stat/rama/rama500-gly-sym-nosec.data

rama-pct :
	mkdir -p pct/rama
	$(SILK) $(RAMA_GEN_OPT)   $(RAMA_PCT_OPT) -title="Top500 General case (not Gly, Pro, or pre-Pro) B<30" < srcdata/rama500-general-noGPpreP.tab > pct/rama/rama500-general.data
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="Top500 Glycine (sym) B<30" < srcdata/rama500-gly-sym.tab > pct/rama/rama500-gly-sym.data
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="Top500 Proline B<30" < srcdata/rama500-pro.tab > pct/rama/rama500-pro.data
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="Top500 pre-Proline (not Gly or Pro) B<30" < srcdata/rama500-prepro-noGP.tab > pct/rama/rama500-prepro.data
	$(SILK) $(RAMA_GEN_OPT)   $(RAMA_PCT_OPT) -title="Top500 General case (no repet sec struct) B<30" < srcdata/rama500-general-nosec.tab > pct/rama/rama500-general-nosec.data
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="Top500 Alanine (no repet sec struct) B<30" < srcdata/rama500-ala-nosec.tab > pct/rama/rama500-ala-nosec.data
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="Top500 Glycine (sym, no repet sec struct) B<30" < srcdata/rama500-gly-sym-nosec.tab > pct/rama/rama500-gly-sym-nosec.data

rama-kin :
	mkdir -p kin/rama
	$(SILK) $(RAMA_GEN_OPT)   $(RAMA_PCT_OPT) -title="Top500 General case (not Gly, Pro, or pre-Pro) B<30" -kin < srcdata/rama500-general-noGPpreP.tab > kin/rama/rama500-general.kin
	$(SILK) $(RAMA_GEN_OPT)   $(RAMA_KIN_OPT) -title="Top500 General case (not Gly, Pro, or pre-Pro) B<30" < srcdata/rama500-general-noGPpreP.tab | \
	kin2Dcont $(KCONT_RAMA_GEN_OPT) - >>  kin/rama/rama500-general.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="Top500 Glycine (asym) B<30" -kin < srcdata/rama500-gly-nosym.tab >  kin/rama/rama500-gly.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_KIN_OPT) -title="Top500 Glycine (sym) B<30" < srcdata/rama500-gly-sym.tab | \
	kin2Dcont $(KCONT_RAMA_OTHER_OPT) - >>  kin/rama/rama500-gly.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="Top500 Proline B<30" -kin < srcdata/rama500-pro.tab >  kin/rama/rama500-pro.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_KIN_OPT) -title="Top500 Proline B<30" < srcdata/rama500-pro.tab | \
	kin2Dcont $(KCONT_RAMA_OTHER_OPT) - >>  kin/rama/rama500-pro.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="Top500 pre-Proline (not Gly or Pro) B<30" -kin < srcdata/rama500-prepro-noGP.tab >  kin/rama/rama500-prepro.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_KIN_OPT) -title="Top500 pre-Proline (not Gly or Pro) B<30" < srcdata/rama500-prepro-noGP.tab | \
	kin2Dcont $(KCONT_RAMA_OTHER_OPT) - >>  kin/rama/rama500-prepro.kin
	$(SILK) $(RAMA_GEN_OPT)   $(RAMA_PCT_OPT) -title="Top500 General case (no repet sec struct) B<30" -kin < srcdata/rama500-general-nosec.tab > kin/rama/rama500-general-nosec.kin
	$(SILK) $(RAMA_GEN_OPT)   $(RAMA_KIN_OPT) -title="Top500 General case (no repet sec struct) B<30" < srcdata/rama500-general-nosec.tab | \
	kin2Dcont $(KCONT_RAMA_GEN_OPT) - >>  kin/rama/rama500-general-nosec.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="Top500 Alanine (no repet sec struct) B<30" -kin < srcdata/rama500-ala-nosec.tab >  kin/rama/rama500-ala-nosec.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_KIN_OPT) -title="Top500 Alanine (no repet sec struct) B<30" < srcdata/rama500-ala-nosec.tab | \
	kin2Dcont $(KCONT_RAMA_OTHER_OPT) - >>  kin/rama/rama500-ala-nosec.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_PCT_OPT) -title="Top500 Glycine (asym, no repet sec struct) B<30" -kin < srcdata/rama500-gly-nosym-nosec.tab >  kin/rama/rama500-gly-nosec.kin
	$(SILK) $(RAMA_OTHER_OPT) $(RAMA_KIN_OPT) -title="Top500 Glycine (sym, no repet sec struct) B<30" < srcdata/rama500-gly-sym-nosec.tab | \
	kin2Dcont $(KCONT_RAMA_OTHER_OPT) - >>  kin/rama/rama500-gly-nosec.kin

#}}}

rota : rota1 rota2 rota3 rota4

#{{{ 1-D rotamers
ROTA1_OPT = -ndim=1 -label=1 -coords=2 -wrap -insep=: -gridsize=1 -cosine=5 -twopass=7 -bounds=0,360
ROTA1_STAT_OPT = $(ROTA1_OPT)
ROTA1_PCT_OPT = $(ROTA1_OPT) -fraction
ROTA1_KIN_OPT = $(ROTA1_OPT) -fraction -scale=100 -kin -contour=1,2,5,10,20

rota1 : rota1-stat rota1-pct rota1-kin

rota1-stat :
	mkdir -p stat/rota
	$(SILK) $(ROTA1_STAT_OPT) -title="Top500 Ser B<40" < srcdata/rota500-ser.tab > stat/rota/rota500-ser.data
	$(SILK) $(ROTA1_STAT_OPT) -title="Top500 Thr B<40" < srcdata/rota500-thr.tab > stat/rota/rota500-thr.data
	$(SILK) $(ROTA1_STAT_OPT) -title="Top500 Val B<40" < srcdata/rota500-val.tab > stat/rota/rota500-val.data
	$(SILK) $(ROTA1_STAT_OPT) -title="Top500 Pro B<40" < srcdata/rota500-pro.tab > stat/rota/rota500-pro.data
	$(SILK) $(ROTA1_STAT_OPT) -title="Top500 Cys B<40" < srcdata/rota500-cys.tab > stat/rota/rota500-cys.data

rota1-pct :
	mkdir -p pct/rota
	$(SILK) $(ROTA1_PCT_OPT) -title="Top500 Ser B<40" < srcdata/rota500-ser.tab > pct/rota/rota500-ser.data
	$(SILK) $(ROTA1_PCT_OPT) -title="Top500 Thr B<40" < srcdata/rota500-thr.tab > pct/rota/rota500-thr.data
	$(SILK) $(ROTA1_PCT_OPT) -title="Top500 Val B<40" < srcdata/rota500-val.tab > pct/rota/rota500-val.data
	$(SILK) $(ROTA1_PCT_OPT) -title="Top500 Pro B<40" < srcdata/rota500-pro.tab > pct/rota/rota500-pro.data
	$(SILK) $(ROTA1_PCT_OPT) -title="Top500 Cys B<40" < srcdata/rota500-cys.tab > pct/rota/rota500-cys.data

rota1-kin :
	mkdir -p kin/rota
	$(SILK) $(ROTA1_KIN_OPT) -title="Top500 Ser B<40" < srcdata/rota500-ser.tab > kin/rota/rota500-ser.kin
	$(SILK) $(ROTA1_KIN_OPT) -title="Top500 Thr B<40" < srcdata/rota500-thr.tab > kin/rota/rota500-thr.kin
	$(SILK) $(ROTA1_KIN_OPT) -title="Top500 Val B<40" < srcdata/rota500-val.tab > kin/rota/rota500-val.kin
	$(SILK) $(ROTA1_KIN_OPT) -title="Top500 Pro B<40" < srcdata/rota500-pro.tab > kin/rota/rota500-pro.kin
	$(SILK) $(ROTA1_KIN_OPT) -title="Top500 Cys B<40" < srcdata/rota500-cys.tab > kin/rota/rota500-cys.kin

#}}}

#{{{ 2-D rotamers
ROTA2_OPT = -ndim=2 -label=1 -coords=2,3 -wrap -insep=: -gridsize=5 -cosine=5 -twopass=7
ROTA2_FULL_STAT_OPT = $(ROTA2_OPT) -bounds=0,360,0,360
ROTA2_FULL_PCT_OPT = $(ROTA2_OPT) -bounds=0,360,0,360 -fraction
ROTA2_FULL_KIN_OPT = $(ROTA2_OPT) -bounds=-2.5,357.5,-2.5,357.5 -fraction
ROTA2_HALF_STAT_OPT = $(ROTA2_OPT) -bounds=0,360,0,180
ROTA2_HALF_PCT_OPT = $(ROTA2_OPT) -bounds=0,360,0,180 -fraction
ROTA2_HALF_KIN_OPT = $(ROTA2_OPT) -bounds=-2.5,357.5,-2.5,177.5 -fraction

KCONT_ROTA2_OPT = $(KCONT_OPT) -g5 -l 0.01 pink -l 0.02 peach -l 0.05 yellow -l 0.10 sea -l 0.20 sky
KCONT_ROTA2_FULL_OPT = $(KCONT_ROTA2_OPT) -wrap 0 360 0 360
KCONT_ROTA2_HALF_OPT = $(KCONT_ROTA2_OPT) -wrap 0 360 0 180

rota2 : rota2-stat rota2-pct rota2-kin

rota2-stat :
	mkdir -p stat/rota
	$(SILK) $(ROTA2_FULL_STAT_OPT) -title="Top500 Ile B<40" < srcdata/rota500-ile.tab > stat/rota/rota500-ile.data
	$(SILK) $(ROTA2_FULL_STAT_OPT) -title="Top500 Leu (tt* and mp* removed) B<40" < srcdata/rota500-leu.tab > stat/rota/rota500-leu.data
	$(SILK) $(ROTA2_FULL_STAT_OPT) -title="Top500 His B<40" < srcdata/rota500-his.tab > stat/rota/rota500-his.data
	$(SILK) $(ROTA2_FULL_STAT_OPT) -title="Top500 Trp B<40" < srcdata/rota500-trp.tab > stat/rota/rota500-trp.data
	$(SILK) $(ROTA2_FULL_STAT_OPT) -title="Top500 Asn B<40" < srcdata/rota500-asn.tab > stat/rota/rota500-asn.data
	$(SILK) $(ROTA2_HALF_STAT_OPT) -title="Top500 Asp B<40" < srcdata/rota500-asp.tab > stat/rota/rota500-asp.data
	$(SILK) $(ROTA2_HALF_STAT_OPT) -title="Top500 Tyr and Phe B<40" < srcdata/rota500-phetyr.tab > stat/rota/rota500-phetyr.data

rota2-pct :
	mkdir -p pct/rota
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top500 Ile B<40" < srcdata/rota500-ile.tab > pct/rota/rota500-ile.data
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top500 Leu (tt* and mp* removed) B<40" < srcdata/rota500-leu.tab > pct/rota/rota500-leu.data
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top500 His B<40" < srcdata/rota500-his.tab > pct/rota/rota500-his.data
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top500 Trp B<40" < srcdata/rota500-trp.tab > pct/rota/rota500-trp.data
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top500 Asn B<40" < srcdata/rota500-asn.tab > pct/rota/rota500-asn.data
	$(SILK) $(ROTA2_HALF_PCT_OPT) -title="Top500 Asp B<40" < srcdata/rota500-asp.tab > pct/rota/rota500-asp.data
	$(SILK) $(ROTA2_HALF_PCT_OPT) -title="Top500 Tyr and Phe B<40" < srcdata/rota500-phetyr.tab > pct/rota/rota500-phetyr.data

rota2-kin :
	mkdir -p kin/rota
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top500 Ile B<40" -kin < srcdata/rota500-ile.tab > kin/rota/rota500-ile.kin
	$(SILK) $(ROTA2_FULL_KIN_OPT) -title="Top500 Ile B<40" < srcdata/rota500-ile.tab | \
	kin2Dcont $(KCONT_ROTA2_FULL_OPT) - >>  kin/rota/rota500-ile.kin
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top500 Leu (tt* and mp* removed) B<40" -kin < srcdata/rota500-leu.tab > kin/rota/rota500-leu.kin
	$(SILK) $(ROTA2_FULL_KIN_OPT) -title="Top500 Leu (tt* and mp* removed) B<40" < srcdata/rota500-leu.tab | \
	kin2Dcont $(KCONT_ROTA2_FULL_OPT) - >>  kin/rota/rota500-leu.kin
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top500 His B<40" -kin < srcdata/rota500-his.tab > kin/rota/rota500-his.kin
	$(SILK) $(ROTA2_FULL_KIN_OPT) -title="Top500 His B<40" < srcdata/rota500-his.tab | \
	kin2Dcont $(KCONT_ROTA2_FULL_OPT) - >>  kin/rota/rota500-his.kin
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top500 Trp B<40" -kin < srcdata/rota500-trp.tab > kin/rota/rota500-trp.kin
	$(SILK) $(ROTA2_FULL_KIN_OPT) -title="Top500 Trp B<40" < srcdata/rota500-trp.tab | \
	kin2Dcont $(KCONT_ROTA2_FULL_OPT) - >>  kin/rota/rota500-trp.kin
	$(SILK) $(ROTA2_FULL_PCT_OPT) -title="Top500 Asn B<40" -kin < srcdata/rota500-asn.tab > kin/rota/rota500-asn.kin
	$(SILK) $(ROTA2_FULL_KIN_OPT) -title="Top500 Asn B<40" < srcdata/rota500-asn.tab | \
	kin2Dcont $(KCONT_ROTA2_FULL_OPT) - >>  kin/rota/rota500-asn.kin
	$(SILK) $(ROTA2_HALF_PCT_OPT) -title="Top500 Asp B<40" -kin < srcdata/rota500-asp.tab > kin/rota/rota500-asp.kin
	$(SILK) $(ROTA2_HALF_KIN_OPT) -title="Top500 Asp B<40" < srcdata/rota500-asp.tab | \
	kin2Dcont $(KCONT_ROTA2_HALF_OPT) - >>  kin/rota/rota500-asp.kin
	$(SILK) $(ROTA2_HALF_PCT_OPT) -title="Top500 Tyr and Phe B<40" -kin < srcdata/rota500-phetyr.tab > kin/rota/rota500-phetyr.kin
	$(SILK) $(ROTA2_HALF_KIN_OPT) -title="Top500 Tyr and Phe B<40" < srcdata/rota500-phetyr.tab | \
	kin2Dcont $(KCONT_ROTA2_HALF_OPT) - >>  kin/rota/rota500-phetyr.kin

#}}}

#{{{ 3-D rotamers
ROTA3_OPT = -ndim=3 -label=1 -coords=2,3,4 -wrap -insep=: -gridsize=8 -cosine=5 -twopass=7
ROTA3_FULL_STAT_OPT = $(ROTA3_OPT) -bounds=0,360,0,360,0,360
ROTA3_FULL_PCT_OPT = $(ROTA3_OPT) -bounds=0,360,0,360,0,360 -fraction
ROTA3_FULL_KIN_OPT = $(ROTA3_OPT) -bounds=-2.5,357.5,-2.5,357.5,-2.5,357.5 -fraction
ROTA3_HALF_STAT_OPT = $(ROTA3_OPT) -bounds=0,360,0,360,0,180
ROTA3_HALF_PCT_OPT = $(ROTA3_OPT) -bounds=0,360,0,360,0,180 -fraction
ROTA3_HALF_KIN_OPT = $(ROTA3_OPT) -bounds=-2.5,357.5,-2.5,357.5,-2.5,177.5 -fraction

KCONT_ROTA3_OPT = $(KCONT_OPT) -g8 -l 0.01 pink -l 0.02 peach -l 0.05 yellow -l 0.10 sea -l 0.20 sky
KCONT_ROTA3_FULL_OPT = $(KCONT_ROTA3_OPT) -wrap 0 360 0 360 0 360
KCONT_ROTA3_HALF_OPT = $(KCONT_ROTA3_OPT) -wrap 0 360 0 360 0 180

rota3 : rota3-stat rota3-pct rota3-kin

rota3-stat :
	mkdir -p stat/rota
	$(SILK) $(ROTA3_FULL_STAT_OPT) -title="Top500 Pro (ALL CHIS) B<40" < srcdata/rota500-pro.tab > stat/rota/rota500-pro3d.data
	$(SILK) $(ROTA3_FULL_STAT_OPT) -title="Top500 Met B<40" < srcdata/rota500-met.tab > stat/rota/rota500-met.data
	$(SILK) $(ROTA3_FULL_STAT_OPT) -title="Top500 Gln B<40" < srcdata/rota500-gln.tab > stat/rota/rota500-gln.data
	$(SILK) $(ROTA3_HALF_STAT_OPT) -title="Top500 Glu B<40" < srcdata/rota500-glu.tab > stat/rota/rota500-glu.data

rota3-pct :
	mkdir -p pct/rota
	$(SILK) $(ROTA3_FULL_PCT_OPT) -title="Top500 Pro (ALL CHIS) B<40" < srcdata/rota500-pro.tab > pct/rota/rota500-pro3d.data
	$(SILK) $(ROTA3_FULL_PCT_OPT) -title="Top500 Met B<40" < srcdata/rota500-met.tab > pct/rota/rota500-met.data
	$(SILK) $(ROTA3_FULL_PCT_OPT) -title="Top500 Gln B<40" < srcdata/rota500-gln.tab > pct/rota/rota500-gln.data
	$(SILK) $(ROTA3_HALF_PCT_OPT) -title="Top500 Glu B<40" < srcdata/rota500-glu.tab > pct/rota/rota500-glu.data

rota3-kin :
	mkdir -p kin/rota
	$(SILK) $(ROTA3_FULL_PCT_OPT) -title="Top500 Pro (ALL CHIS) B<40" -kin < srcdata/rota500-pro.tab > kin/rota/rota500-pro3d.kin
	$(SILK) $(ROTA3_FULL_KIN_OPT) -title="Top500 Pro (ALL CHIS) B<40" < srcdata/rota500-pro.tab | \
	kin3Dcont $(KCONT_ROTA3_FULL_OPT) - >>  kin/rota/rota500-pro3d.kin
	$(SILK) $(ROTA3_FULL_PCT_OPT) -title="Top500 Met B<40" -kin < srcdata/rota500-met.tab > kin/rota/rota500-met.kin
	$(SILK) $(ROTA3_FULL_KIN_OPT) -title="Top500 Met B<40" < srcdata/rota500-met.tab | \
	kin3Dcont $(KCONT_ROTA3_FULL_OPT) - >>  kin/rota/rota500-met.kin
	$(SILK) $(ROTA3_FULL_PCT_OPT) -title="Top500 Gln B<40" -kin < srcdata/rota500-gln.tab > kin/rota/rota500-gln.kin
	$(SILK) $(ROTA3_FULL_KIN_OPT) -title="Top500 Gln B<40" < srcdata/rota500-gln.tab | \
	kin3Dcont $(KCONT_ROTA3_FULL_OPT) - >>  kin/rota/rota500-gln.kin
	$(SILK) $(ROTA3_HALF_PCT_OPT) -title="Top500 Glu B<40" -kin < srcdata/rota500-glu.tab > kin/rota/rota500-glu.kin
	$(SILK) $(ROTA3_HALF_KIN_OPT) -title="Top500 Glu B<40" < srcdata/rota500-glu.tab | \
	kin3Dcont $(KCONT_ROTA3_HALF_OPT) - >>  kin/rota/rota500-glu.kin

#}}}

#{{{ 4-D rotamers
ROTA4_OPT = -ndim=4 -label=1 -coords=2,3,4,5 -wrap -insep=: -gridsize=10 -cosine=5 -twopass=7
ROTA4_STAT_OPT = $(ROTA4_OPT) -bounds=0,360,0,360,0,360,0,360
ROTA4_PCT_OPT = $(ROTA4_OPT) -bounds=0,360,0,360,0,360,0,360 -fraction

ROTA4_KIN_OPT = -ndim=3 -label=1 -wrap -insep=: -gridsize=10 -cosine=5 -twopass=7 -bounds=0,360,0,360,0,360 -fraction
ROTA4_OFF_OPT = -ndim=3 -label=1 -wrap -insep=: -gridsize=10 -cosine=5 -twopass=7 -bounds=-2.5,357.5,-2.5,357.5,-2.5,357.5 -fraction
ROTA4_123_OPT = -coords=2,3,4
ROTA4_234_OPT = -coords=3,4,5

KCONT_ROTA4_OPT = $(KCONT_OPT) -g10 -l 0.01 pink -l 0.02 peach -l 0.05 yellow -l 0.10 sea -l 0.20 sky -wrap 0 360 0 360 0 360

rota4 : rota4-stat rota4-pct rota4-kin

rota4-stat :
	mkdir -p stat/rota
	$(SILK) $(ROTA4_STAT_OPT) -title="Top500 Arg B<40" < srcdata/rota500-arg.tab > stat/rota/rota500-arg.data
	$(SILK) $(ROTA4_STAT_OPT) -title="Top500 Lys B<40" < srcdata/rota500-lys.tab > stat/rota/rota500-lys.data

rota4-pct :
	mkdir -p pct/rota
	$(SILK) $(ROTA4_PCT_OPT) -title="Top500 Arg B<40" < srcdata/rota500-arg.tab > pct/rota/rota500-arg.data
	$(SILK) $(ROTA4_PCT_OPT) -title="Top500 Lys B<40" < srcdata/rota500-lys.tab > pct/rota/rota500-lys.data

rota4-kin :
	mkdir -p kin/rota
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_123_OPT) -title="Top500 Arg (chi1, chi2, chi3) B<40" -kin < srcdata/rota500-arg.tab > kin/rota/rota500-arg-123.kin
	$(SILK) $(ROTA4_OFF_OPT) $(ROTA4_123_OPT) -title="Top500 Arg (chi1, chi2, chi3) B<40" < srcdata/rota500-arg.tab | \
	kin3Dcont $(KCONT_ROTA4_OPT) - >>  kin/rota/rota500-arg-123.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Top500 Arg (chi1 = plus) B<40" -kin < srcdata/rota500-arg-plus.tab > kin/rota/rota500-arg-plus.kin
	$(SILK) $(ROTA4_OFF_OPT) $(ROTA4_234_OPT) -title="Top500 Arg (chi1 = plus) B<40" < srcdata/rota500-arg-plus.tab | \
	kin3Dcont $(KCONT_ROTA4_OPT) - >>  kin/rota/rota500-arg-plus.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Top500 Arg (chi1 = trans) B<40" -kin < srcdata/rota500-arg-trans.tab > kin/rota/rota500-arg-trans.kin
	$(SILK) $(ROTA4_OFF_OPT) $(ROTA4_234_OPT) -title="Top500 Arg (chi1 = trans) B<40" < srcdata/rota500-arg-trans.tab | \
	kin3Dcont $(KCONT_ROTA4_OPT) - >>  kin/rota/rota500-arg-trans.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Top500 Arg (chi1 = minus) B<40" -kin < srcdata/rota500-arg-minus.tab > kin/rota/rota500-arg-minus.kin
	$(SILK) $(ROTA4_OFF_OPT) $(ROTA4_234_OPT) -title="Top500 Arg (chi1 = minus) B<40" < srcdata/rota500-arg-minus.tab | \
	kin3Dcont $(KCONT_ROTA4_OPT) - >>  kin/rota/rota500-arg-minus.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_123_OPT) -title="Top500 Lys (chi1, chi2, chi3) B<40" -kin < srcdata/rota500-lys.tab > kin/rota/rota500-lys-123.kin
	$(SILK) $(ROTA4_OFF_OPT) $(ROTA4_123_OPT) -title="Top500 Lys (chi1, chi2, chi3) B<40" < srcdata/rota500-lys.tab | \
	kin3Dcont $(KCONT_ROTA4_OPT) - >>  kin/rota/rota500-lys-123.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Top500 Lys (chi1 = plus) B<40" -kin < srcdata/rota500-lys-plus.tab > kin/rota/rota500-lys-plus.kin
	$(SILK) $(ROTA4_OFF_OPT) $(ROTA4_234_OPT) -title="Top500 Lys (chi1 = plus) B<40" < srcdata/rota500-lys-plus.tab | \
	kin3Dcont $(KCONT_ROTA4_OPT) - >>  kin/rota/rota500-lys-plus.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Top500 Lys (chi1 = trans) B<40" -kin < srcdata/rota500-lys-trans.tab > kin/rota/rota500-lys-trans.kin
	$(SILK) $(ROTA4_OFF_OPT) $(ROTA4_234_OPT) -title="Top500 Lys (chi1 = trans) B<40" < srcdata/rota500-lys-trans.tab | \
	kin3Dcont $(KCONT_ROTA4_OPT) - >>  kin/rota/rota500-lys-trans.kin
	$(SILK) $(ROTA4_KIN_OPT) $(ROTA4_234_OPT) -title="Top500 Lys (chi1 = minus) B<40" -kin < srcdata/rota500-lys-minus.tab > kin/rota/rota500-lys-minus.kin
	$(SILK) $(ROTA4_OFF_OPT) $(ROTA4_234_OPT) -title="Top500 Lys (chi1 = minus) B<40" < srcdata/rota500-lys-minus.tab | \
	kin3Dcont $(KCONT_ROTA4_OPT) - >>  kin/rota/rota500-lys-minus.kin

#}}}

#{{{ Special tests and queries
PHETYR_EXTRA_LEVELS = -m 0.005 0.050 0.005 gray -m 0.06 0.15 0.01 gray -m 0.20 0.80 0.05 gray 
phetyr-lowb :
	$(SILK) $(ROTA2_HALF_PCT_OPT) -title="Top500 Tyr and Phe B<30" -kin < srcdata/rota500-phetyr-blt30-noclash.tab > kin/rota/rota500-phetyr-blt30-noclash.kin
	$(SILK) $(ROTA2_HALF_KIN_OPT) -title="Top500 Tyr and Phe B<30" < srcdata/rota500-phetyr-blt30-noclash.tab | \
	kin2Dcont $(KCONT_ROTA2_HALF_OPT) $(PHETYR_EXTRA_LEVELS) - >>  kin/rota/rota500-phetyr-blt30-noclash.kin
	$(SILK) $(ROTA2_HALF_PCT_OPT) -title="Top500 Tyr and Phe B<20" -kin < srcdata/rota500-phetyr-blt20-noclash.tab > kin/rota/rota500-phetyr-blt20-noclash.kin
	$(SILK) $(ROTA2_HALF_KIN_OPT) -title="Top500 Tyr and Phe B<20" < srcdata/rota500-phetyr-blt20-noclash.tab | \
	kin2Dcont $(KCONT_ROTA2_HALF_OPT) $(PHETYR_EXTRA_LEVELS) - >>  kin/rota/rota500-phetyr-blt20-noclash.kin

#}}}

clean :
	rm -r kin/ pct/ stat/ rotasamp/

# The following tasks are not part of 'make all' but may depend on the files it creates.
# If they are not present or are out of date, run 'make all' first.

#{{{ rotasamp: Rotamer sampling for Homme
#
# 	Symmetric chis need to be sampled with half the number of samples
#	Free Hs need to be rotatable
#
# The programs to run
S_SAMP = java -cp lib/silk.jar silk.util.RotamerSampler
C_SAMP = java -cp lib/chiropraxis.jar chiropraxis.sc.RotamerSampler
# The level below which rotamers are considered "bad" and should not be used.
CUTOFF = -2ge=0.01

.PHONY : rotasamp rotasamp-init rotasamp1 rotasamp2 rotasamp3 rotasamp4
rotasamp : rotasamp-init rotasamp1 rotasamp2 rotasamp3 rotasamp4
	wc -l rotasamp/*.list

rotasamp-init :
	mkdir -p rotasamp/

# Proline is a special case, because you need to measure chi2 and chi3
# even though they correlate very highly with chi1.
rotasamp1 : rotasamp-init
	$(S_SAMP) stat/rota/rota500-ser.data pct/rota/rota500-ser.data $(CUTOFF) -sample=72 | \
	gawk -v nsteps=6 -f scriptbin/spinHs.awk > rotasamp/ser.list
	$(C_SAMP) ser rotasamp/ser.list > rotasamp/ser.pdb
	$(S_SAMP) stat/rota/rota500-thr.data pct/rota/rota500-thr.data $(CUTOFF) -sample=72 | \
	gawk -v nsteps=6 -f scriptbin/spinHs.awk > rotasamp/thr.list
	$(C_SAMP) thr rotasamp/thr.list > rotasamp/thr.pdb
	$(S_SAMP) stat/rota/rota500-val.data pct/rota/rota500-val.data $(CUTOFF) -sample=72 > rotasamp/val.list
	$(C_SAMP) val rotasamp/val.list > rotasamp/val.pdb
	$(S_SAMP) stat/rota/rota500-pro3d.data pct/rota/rota500-pro3d.data $(CUTOFF) -sample=36,18,18 > rotasamp/pro.list
	$(C_SAMP) pro rotasamp/pro.list > rotasamp/pro.pdb
	$(S_SAMP) stat/rota/rota500-cys.data pct/rota/rota500-cys.data $(CUTOFF) -sample=72 | \
	gawk -v nsteps=6 -f scriptbin/spinHs.awk > rotasamp/cys.list
	$(C_SAMP) cys rotasamp/cys.list > rotasamp/cys.pdb

rotasamp2 : rotasamp-init
	$(S_SAMP) stat/rota/rota500-ile.data pct/rota/rota500-ile.data $(CUTOFF) -sample=36,36 > rotasamp/ile.list
	$(C_SAMP) ile rotasamp/ile.list > rotasamp/ile.pdb
	$(S_SAMP) stat/rota/rota500-leu.data pct/rota/rota500-leu.data $(CUTOFF) -sample=36,36 > rotasamp/leu.list
	$(C_SAMP) leu rotasamp/leu.list > rotasamp/leu.pdb
	$(S_SAMP) stat/rota/rota500-his.data pct/rota/rota500-his.data $(CUTOFF) -sample=36,36 > rotasamp/his.list
	$(C_SAMP) his rotasamp/his.list > rotasamp/his.pdb
	$(S_SAMP) stat/rota/rota500-trp.data pct/rota/rota500-trp.data $(CUTOFF) -sample=36,36 > rotasamp/trp.list
	$(C_SAMP) trp rotasamp/trp.list > rotasamp/trp.pdb
	$(S_SAMP) stat/rota/rota500-asn.data pct/rota/rota500-asn.data $(CUTOFF) -sample=36,36 > rotasamp/asn.list
	$(C_SAMP) asn rotasamp/asn.list > rotasamp/asn.pdb
	$(S_SAMP) stat/rota/rota500-asp.data pct/rota/rota500-asp.data $(CUTOFF) -sample=36,18 > rotasamp/asp.list
	$(C_SAMP) asp rotasamp/asp.list > rotasamp/asp.pdb
	$(S_SAMP) stat/rota/rota500-phetyr.data pct/rota/rota500-phetyr.data $(CUTOFF) -sample=36,18 > rotasamp/phe.list
	$(C_SAMP) phe rotasamp/phe.list > rotasamp/phe.pdb
	$(S_SAMP) stat/rota/rota500-phetyr.data pct/rota/rota500-phetyr.data $(CUTOFF) -sample=36,18 | \
	gawk -v nsteps=6 -f scriptbin/spinHs.awk > rotasamp/tyr.list
	$(C_SAMP) tyr rotasamp/tyr.list > rotasamp/tyr.pdb

rotasamp3 : rotasamp-init
	$(S_SAMP) stat/rota/rota500-met.data pct/rota/rota500-met.data $(CUTOFF) -sample=12,12,12 > rotasamp/met.list
	$(C_SAMP) met rotasamp/met.list > rotasamp/met.pdb
	$(S_SAMP) stat/rota/rota500-gln.data pct/rota/rota500-gln.data $(CUTOFF) -sample=12,12,12 > rotasamp/gln.list
	$(C_SAMP) gln rotasamp/gln.list > rotasamp/gln.pdb
	$(S_SAMP) stat/rota/rota500-glu.data pct/rota/rota500-glu.data $(CUTOFF) -sample=12,12,6 > rotasamp/glu.list
	$(C_SAMP) glu rotasamp/glu.list > rotasamp/glu.pdb

rotasamp4 : rotasamp-init
	$(S_SAMP) stat/rota/rota500-arg.data pct/rota/rota500-arg.data $(CUTOFF) -sample=9,9,9,9 > rotasamp/arg.list
	$(C_SAMP) arg rotasamp/arg.list > rotasamp/arg.pdb
	$(S_SAMP) stat/rota/rota500-lys.data pct/rota/rota500-lys.data $(CUTOFF) -sample=9,9,9,9 > rotasamp/lys.list
	$(C_SAMP) lys rotasamp/lys.list > rotasamp/lys.pdb

# For visualization afterwards, run this in Bash:
# for pdb in *.pdb; do kin=`basename $pdb .pdb`; prekin -scope -show "mc(brown),sc(green),hy(pinktint)" $pdb $kin.kin; done
#}}}

