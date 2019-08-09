mkdir -p field_sweep_no-helix_Bz_150mT_300mT
oommf boxsi -threads 7 -parameters "BzStart 0.15 BzStop 0.3 BzSteps 30 OMFFILE sk_tubes_FeGe/m_no-helix_Bz150mT-Oxs_MinDriver-Magnetization-00-0016822.omf BASENAME ./field_sweep_no-helix_Bz_150mT_300mT/m" field_sweep_from_file.mif
#
mkdir -p field_sweep_no-helix_Bz_150mT_0mT
oommf boxsi -threads 7 -parameters "BzStart 0.15 BzStop 0.0 BzSteps 30 OMFFILE sk_tubes_FeGe/m_no-helix_Bz150mT-Oxs_MinDriver-Magnetization-00-0016822.omf BASENAME ./field_sweep_no-helix_Bz_150mT_0mT/m" field_sweep_from_file.mif
