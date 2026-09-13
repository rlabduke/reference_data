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