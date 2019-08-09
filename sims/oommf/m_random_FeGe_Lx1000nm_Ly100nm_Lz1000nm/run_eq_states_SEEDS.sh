mkdir -p m_random_FeGe 

for SEED in 42 4242 424242
do
    oommf boxsi -threads 7 -parameters "RSEED ${SEED} BZ 0.0 BASENAME ./m_random_FeGe/m_SEED${SEED}" m_random_FeGe.mif
done
