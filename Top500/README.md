# Top500

500 high-resolution, low-homology, high-quality protein structures with hydrogens added by Reduce. They are the reference set behind the Lovell et al. (2003) Ramachandran distributions and the Top500 rotamer distributions.

Selection criteria (from the lab's Top500 web page):
- Resolution 1.8 Å or better.
- Clashscore below 22 per 1000 atoms, counting atoms with B < 40.
- Fewer than 10 per 1000 atoms with mainchain bond angles (including to Cβ) more than 5σ from Engh & Huber values.
- No unusual amino acids with mainchain substitutions, and no free-atom refinements.
- Wild type preferred over mutant when otherwise about equivalent.
- For related but non-identical proteins, the best combination of resolution and clashscore.

The set combines:
- 149 files from the lab's earlier "top240" list.
- 328 from PDBselect30 as of February 2000 (Hobohm & Sander 1994).
- 23 new entries better than 1.5 Å released February to May 2000.

## Contents

- `top500H/`: the 500 PDB-format coordinate files. Names are the PDB ID, then chain ID(s) if only part of the entry was used, then `H`.
- `top500_list.tsv`: one row per file, from the lab's Top500 web page. Columns are `sf` (`Yes` if structure factors were deposited), `resolution_A` and `protein`. The web page listed 1mug as `1mugAH`; the file is `1mugH`.
- `top500-angles/`: the Ramachandran and rotamer data derived from these files. See its `README.html`.
  - `srcdata/`: quality-filtered input. For Ramachandran, residues with mainchain B < 30; for rotamers, residues with all atoms B < 40.
  - `Makefile`: re-creates `stat/`, `pct/` and `kin/` from `srcdata/` with the Silk smoothing program in `lib/`.
  - `stat/`: raw density traces.
  - `pct/`: the same traces scaled as the fraction of data excluded, for outlier and allowed classification.
  - `kin/`: kinemages.
  - The 2005 release adds psi-phi (cross-peptide) distributions, `energy/` tables and the `jmarvin/` lists.

  The original distribution also contained PDFs of the two papers cited below. Those are publisher copyright and are not included here; the links to them in `README.html` will not resolve.

## Versions

Each release is a commit dated to the release and tagged:

| Tag | Release | Notes |
|---|---|---|
| `top500-2001-06` | `top500H.tar.gz`, 19 June 2001 | first release; file names end in `.pdb` |
| `top500-2002-09` | `top500H.tgz`, 25 Sept 2002 | `.pdb` suffix dropped; blank lines removed from 241 files; spurious HG1 on 2sn3 Leu51 removed |
| `top500-angles-2004-08` | `top500-angles.040823.tgz` | Ramachandran and rotamer data |
| `top500-angles-2005-06` | `top500-angles.050606.zip` | adds psi-phi data; 2004 files unchanged |

`git diff top500-2001-06 top500-2002-09` shows the coordinate changes.

## Citation

Lovell SC, Davis IW, Arendall WB 3rd, de Bakker PIW, Word JM, Prisant MG, Richardson JS, Richardson DC (2003) Structure validation by Cα geometry: φ,ψ and Cβ deviation. Proteins 50(3):437-450. https://doi.org/10.1002/prot.10286

For the rotamer data, also: Lovell SC, Word JM, Richardson JS, Richardson DC (2000) The penultimate rotamer library. Proteins 40(3):389-408. https://doi.org/10.1002/1097-0134(20000815)40:3<389::AID-PROT50>3.0.CO;2-2

The coordinates derive from the original PDB entries; please also credit the depositors of the structures you use.
