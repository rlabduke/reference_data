Top8000 rotamer database

This file describes the organization of the MolProbity ultimate rotamer database derived from the Top8000.

# Top8000

In this directory are included:

* Top8000_best_hom##_pdb_chain_list.csv, a list of high data quality PDB chains at varying homology levels
* Top8000_SFbest_hom##_pdb_chain_list.csv, a list of high data quality PDB chains at varying homology levels that also have structure factor data deposited
* Top8000_rotamer_pdb_chain_count.csv , a list of exactly which structures were used to generate the rotamer data used here
* Top8000_rotamer_residues.csv , the rotamer assignment of each residue in the dataset

## Top8000_rotamer_central_values
This directory contains, for each of the rotameric canonical amino acids, a table listing rotamer frequency data and the means and standard deviations of each rotamer's bond torsion and bond angle geometries.

## Top8000_rotamer_kinemages
This directory contains kinemage files plotting the rotamer distributions in various chi angle spaces (including both the data points and the contours), for visualization of the distributions.

## Top8000_rotamer_pct_contour_grids
This directory contains contour/rotamericity grids for sidechain conformation for each of the rotameric canonical amino acids.  Each file's header describes how to interpret it.  Broadly, each file is a list of points that collectively grid out all of chi space (in however many dimensions/chi that sidechain has), plotting rotamericity at each grid point.  Contours drawn through grid points of given values define regions of chi space above a certain rotamericity.  Grid areas with rotamericity below 0.3% (inclusive) represent outlier regions, regions above 2.0% (inclusive) define favored rotamers, and regions in between are defined as allowed.
