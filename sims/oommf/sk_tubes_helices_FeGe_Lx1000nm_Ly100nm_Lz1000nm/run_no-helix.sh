mkdir -p sk_tubes_FeGe
# Simulations of 3 paraboloids with no helical background -> uniform bg
for BZ in 100 120 130 150 200 250 300
do
    oommf boxsi -threads 7 -parameters "Bz ${BZ}e-3 BASENAME ./sk_tubes_FeGe/m_no-helix_Bz${BZ}mT" sk_tubes_no-helix_FeGe.mif
done
