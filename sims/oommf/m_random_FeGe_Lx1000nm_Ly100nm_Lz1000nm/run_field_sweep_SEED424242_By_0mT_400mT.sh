SIMNAME="field_sweep_SEED424242_By_0mT_400mT"
mkdir -p $SIMNAME
oommf boxsi -threads 40 -parameters "BzStart 0.0 BzStop 0.0 ByStart 0.0 ByStop 0.4 BSteps 200 OMFFILE m_random_FeGe/m_SEED424242-Oxs_MinDriver-Magnetization-00-0131587.omf BASENAME ./${SIMNAME}/m" field_sweep_from_file.mif
