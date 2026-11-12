# Top100

100 very high resolution, non-redundant protein structures with all hydrogen atoms added and optimized by Reduce (v2.10.2), from Word et al. (1999). The structures were chosen for resolution (0.8 to 1.7 Å), non-homology and wild-type sequence. Besides adding H atoms, the lab made minor corrections, including 180° flips of Asn, Gln and His side chains where the H-bonding and contacts required them. Each file's `USER MOD` header lines record what was changed.

## Contents

- `top100H/`: the 100 PDB-format coordinate files. Names are the PDB ID, then chain ID(s) if only part of the entry was used, then `H`. The two `bio` files (`bio1rpoH`, `bio2wrpH`) add symmetry-generated chains to complete the dimer; their headers give the details.
- `top100_list.tsv`: one row per file, from the table on the lab's Top100 web page.
  - `sf`: `Y` if structure factors were deposited.
  - `resolution_A`, `R`, `refinement_program`.
  - `structure_type`: tertiary fold.
  - `n_residues`, `protein`, `comments`.
  - `clashscore`: atomic overlaps > 0.4 Å per 1000 atoms, after the corrections.
  - `score`: overall contact + H-bond − clash score.

  Fold abbreviations: aEF, helical E-F hand; 4hx, four-helix bundle; aHb, globin fold; a hp, multihelix hairpin; ba8, TIM barrel; b ud, up-and-down β barrel; Gkb, Greek key β barrel; tref, β trefoil; olb, β oligo-binding fold; smS, small SS-rich; smM, small metal-rich.

## Versions

There is one release, tag `top100-1998-05`. The files are dated 19-20 May 1998 in the lab's original `top100db1` tarball. The `top100H.tgz` later served from the kinemage website (2001 onward) is byte-identical.

The `1benABH` (insulin) row was missing from the later web page. It is restored here from the 2002 copy of that page.

## Citation

Word JM, Lovell SC, LaBean TH, Taylor HC, Zalis ME, Presley BK, Richardson JS, Richardson DC (1999) Visualizing and quantifying molecular goodness-of-fit: small-probe contact dots with explicit hydrogen atoms. J Mol Biol 285(4):1711-1733. https://doi.org/10.1006/jmbi.1998.2400

Word JM, Lovell SC, Richardson JS, Richardson DC (1999) Asparagine and glutamine: using hydrogen atom contacts in the choice of side-chain amide orientation. J Mol Biol 285(4):1735-1747. https://doi.org/10.1006/jmbi.1998.2401

The coordinates derive from the original PDB entries; please also credit the depositors of the structures you use.
