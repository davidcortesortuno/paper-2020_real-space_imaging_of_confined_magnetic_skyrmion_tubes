mkdir -p sk_lattice_FeGe
# Simulations of 3 paraboloids with no helical background -> uniform bg
for BZ in 0 100 150
do
    oommf boxsi -threads 7 -parameters "BZ ${BZ}e-3 BASENAME ./sk_lattice_FeGe/m_Bz${BZ}mT" sk_lattice_FeGe.mif
done
