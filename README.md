This work (data and/or documentation) is licensed under the
Creative Commons Attribution 4.0 International License (CC BY 4.0).

Copyright (c) 2016-2026 David C. Richardson, Jane S. Richardson, and contributors

You are free to share and adapt the material for any purpose, including
commercially, provided you give appropriate credit. Please credit the
Richardson Lab at Duke University, where these data were produced, and
cite the associated publication if one is listed in the README.

Full license text: https://creativecommons.org/licenses/by/4.0/legalcode
Human-readable summary: https://creativecommons.org/licenses/by/4.0/

---

This is a collection of datasets from the Richardson Lab.

# Top8000
The Top8000 subfolder contains the Top8000 lists of high-quality PDB chains and the MolProbity reference data derived from them. Please cite the publication matching the data you use:

- Rotamer central values, rotamer kinemages, rotamer contour grids, and filtered residues (the MolProbity "ultimate" rotamer distributions):
  Hintze BJ, Lewis SM, Richardson JS, Richardson DC (2016) MolProbity's ultimate rotamer-library distributions for model validation. Proteins 84(9):1177-1189. https://doi.org/10.1002/prot.25039
- Top8000 chain lists and the rama8000 Ramachandran contour grids:
  Williams CJ, Headd JJ, Moriarty NW, Prisant MG, Videau LL, Deis LN, Verma V, Keedy DA, Hintze BJ, Chen VB, Jain S, Lewis SM, Arendall WB, Snoeyink J, Adams PD, Lovell SC, Richardson JS, Richardson DC (2018) MolProbity: More and better reference data for improved all-atom structure validation. Protein Science 27(1):293-315. https://doi.org/10.1002/pro.3330
- CaBLAM contour grids:
  Prisant MG, Williams CJ, Chen VB, Richardson JS, Richardson DC (2020) New tools in MolProbity validation: CaBLAM for CryoEM backbone, UnDowser to rethink "waters," and NGL Viewer to recapture online 3D graphics. Protein Science 29(1):315-329. https://doi.org/10.1002/pro.3786
- rama_z reference data (Rama-Z score):
  Sobolev OV, Afonine PV, Moriarty NW, Hekkelman ML, Joosten RP, Perrakis A, Adams PD (2020) A global Ramachandran score identifies protein structures with unlikely stereochemistry. Structure 28(11):1249-1258.e2. https://doi.org/10.1016/j.str.2020.08.005

The rama.combined files in the Ramachandran folder are earlier, unpublished tables by Vincent B. Chen that combine Top500 Ramachandran contours with steric clash data into a smoothed, differentiable landscape. They serve as the "Emsley" Ramachandran restraint potential in cctbx and are not derived from the Top8000.

# Legacy datasets: Top100 and Top500
Top100 and Top500 are kept for the historical record and so that the published work built on them can be reproduced. Their coordinates, hydrogens and quality filters reflect the PDB and the lab's software of 1998-2005, and they are not recommended for general use, new analyses or validation. For current work use the Top8000 above, or the Top2018: Williams CJ, Richardson DC, Richardson JS (2022) The importance of residue-level filtering and the Top2018 best-parts dataset of high-quality protein residues. Protein Science 31(1):290-300. https://doi.org/10.1002/pro.4239

# Top100 (legacy)
The Top100 subfolder contains the 100 very high resolution protein structures, with hydrogens added and optimized by Reduce, used to develop all-atom contact analysis (Probe, clashscore) and Asn/Gln/His flip correction. Tagged release: `top100-1998-05`.

- Word JM, Lovell SC, LaBean TH, Taylor HC, Zalis ME, Presley BK, Richardson JS, Richardson DC (1999) Visualizing and quantifying molecular goodness-of-fit: small-probe contact dots with explicit hydrogen atoms. J Mol Biol 285(4):1711-1733. https://doi.org/10.1006/jmbi.1998.2400
- Word JM, Lovell SC, Richardson JS, Richardson DC (1999) Asparagine and glutamine: using hydrogen atom contacts in the choice of side-chain amide orientation. J Mol Biol 285(4):1735-1747. https://doi.org/10.1006/jmbi.1998.2401

# Top500 (legacy)
The Top500 subfolder contains the 500 hydrogenated structures behind the Top500 Ramachandran and rotamer distributions, and the angle data and smoothed density tables derived from them. Tagged releases: `top500-2001-06`, `top500-2002-09`, `top500-angles-2004-08`, `top500-angles-2005-06`.

- Lovell SC, Davis IW, Arendall WB 3rd, de Bakker PIW, Word JM, Prisant MG, Richardson JS, Richardson DC (2003) Structure validation by Cα geometry: φ,ψ and Cβ deviation. Proteins 50(3):437-450. https://doi.org/10.1002/prot.10286
- Rotamer data, also: Lovell SC, Word JM, Richardson JS, Richardson DC (2000) The penultimate rotamer library. Proteins 40(3):389-408. https://doi.org/10.1002/1097-0134(20000815)40:3<389::AID-PROT50>3.0.CO;2-2
