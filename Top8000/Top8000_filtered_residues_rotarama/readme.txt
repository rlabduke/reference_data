These files contain Ramachandran, rotamer, and C-Beta deviation parameters for the Top8000.

Structures have been filtered at the chain level as per the Top8000 on the following criteria:
-Resolution 2A or better
-MolProbity score 2A or better.

Residue-level filtering is also necessary to ensure that only well-modeled residues are included. Residues have been filtered on the following criteria:
-No steric clashes
-All atoms in residue have b-factor<=40
-All atoms in residue have Real-Space Correlation Coefficient (RSCC)>=0.7
-All atoms in residue have local map value >= 1.1 sigma.

The columns are comma-delimited, and the contents are as follow:
res_name, phi, psi, chi1, chi2, chi3, chi4, Calpha-Cbeta-Cgamma angle, and Cbeta deviation distance

Missing chi values for short sidechains are listed as NULL.


There is a separate file for each sidechain type, except GLY and ALA, which do not have rotamers.  There are also split files for certain sidechain types: cis and trans PRO, disulfide-forming and non-disulfide-forming CYS, ARG and LYS split by m/p/t chi1.  There is also a combined PHE+TYR file.

The Makefile included here is a means of using our scripts Silk (found in javadev) and kin2Dcont/kin3Dcont (found on our main website) to generate contours and kinemages of those contours.  It is probably on minimal use or interest to those outside the Richardson Lab.
