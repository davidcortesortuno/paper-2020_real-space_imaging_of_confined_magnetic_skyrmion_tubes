mkdir -p mixed_phases
oommf boxsi -threads 7 -parameters "BZ 0.0 BASENAME ./mixed_phases/m_Bz000mT" mixed_phases.mif
# oommf boxsi -threads 8 -parameters "BZ 0.1 BASENAME ./mixed_phases/m_Bz100mT" mixed_phases.mif
# oommf boxsi -threads 8 -parameters "BZ 0.2 BASENAME ./mixed_phases/m_Bz200mT" mixed_phases.mif
# oommf boxsi -threads 8 -parameters "BZ 0.25 BASENAME ./mixed_phases/m_Bz250mT" mixed_phases.mif
