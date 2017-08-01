#!/usr/bin/sh

### Script to obtain gene-by-gene FASTA for all D. melanogaster gene from DPGP and DGRP data. The script requires the ##
### installation of BEDTOOLS in the PATH ###


### read file containing strain identity for DGRP/DPGP lines ##

readarray -t lines < PATH TO FILE NAME

name=(Chr2L Chr2R Chr3L Chr3R ChrX)

for chr in "${name[@]}"; do

for strain in "${lines[@]}"; do

echo changing ${strain} file ...

echo `cat ${strain}\_${chr}.seq | sed "s/^/>${chr}\n/g" > ${strain}\_${chr}.fasta`

## I noticed not all strains from DPGP2 have data for X chromosome, so I included only strains that had sequence data ##
## for X chromosome ##

if [ -e ${strain}\_ChrX.fasta ]

then

echo ${strain}\_ChrX.fasta exists...

echo `cat ${strain}\_Chr2L.fasta | fold -w 80 > ${strain}\_Chr2L.fa`
echo `cat ${strain}\_Chr2R.fasta | fold -w 80 > ${strain}\_Chr2R.fa`
echo `cat ${strain}\_Chr3L.fasta | fold -w 80 > ${strain}\_Chr3L.fa`
echo `cat ${strain}\_Chr3R.fasta | fold -w 80 > ${strain}\_Chr3R.fa`
echo `cat ${strain}\_ChrX.fasta | fold -w 80 > ${strain}\_ChrX.fa`

echo `rm ${strain}\_Chr2L.fasta`
echo `rm ${strain}\_Chr2R.fasta`
echo `rm ${strain}\_Chr3L.fasta`
echo `rm ${strain}\_Chr3R.fasta`
echo `rm ${strain}\_ChrX.fasta`


echo `awk '{print}' ${strain}\_Chr2L.fa ${strain}\_Chr2R.fa ${strain}\_Chr3L.fa ${strain}\_Chr3R.fa ${strain}\_ChrX.fa > \
${strain}\_all.fas`

fi

echo getting fasta for ${strain}.....

echo `bedtools getfasta -fi ${strain}\_all.fas -bed dmel_all_CDS_final.bed -s -split -name -fo - | fold -w 60 > ${strain}\_genes.fasta`

echo `sed -i "s/>/>${strain}|/g" ${strain}\_genes.fasta`


done

done
