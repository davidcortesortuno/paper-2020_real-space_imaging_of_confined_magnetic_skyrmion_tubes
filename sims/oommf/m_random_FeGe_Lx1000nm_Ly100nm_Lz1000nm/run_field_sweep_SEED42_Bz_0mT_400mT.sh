SIMNAME="field_sweep_SEED42_Bz_0mT_400mT"
mkdir -p $SIMNAME
oommf boxsi -threads 35 -parameters "BzStart 0.0 BzStop 0.4 BSteps 200 OMFFILE m_random_FeGe/m_SEED42-Oxs_MinDriver-Magnetization-00-0143346.omf BASENAME ./${SIMNAME}/m" field_sweep_from_file.mif
