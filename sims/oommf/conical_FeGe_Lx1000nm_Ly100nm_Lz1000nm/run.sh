mkdir -p conical

for BX in 100 150 200 250
do
    oommf boxsi -threads 7 -parameters "BX ${BX}e-3 BASENAME ./conical/m_Bx${BX}mT" conical.mif
done
