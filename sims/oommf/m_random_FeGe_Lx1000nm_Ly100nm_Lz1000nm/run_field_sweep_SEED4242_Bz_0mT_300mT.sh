SIMNAME="field_sweep_SEED4242_Bz_0mT_300mT"
mkdir -p $SIMNAME
oommf boxsi -threads 7 -parameters "BzStart 0.0 BzStop 0.3 BSteps 150 OMFFILE m_random_FeGe/m_SEED4242-Oxs_MinDriver-Magnetization-00-0082427.omf BASENAME ./${SIMNAME}/m" field_sweep_from_file.mif
