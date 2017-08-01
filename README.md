#####Population_genomic_anlayses
#Scripts for processing DPGP and DGRP data for evolutionary analyses


#Data

Drosophila melangoaster population genomic re-sequence data was downloaded from the Drosophila Genome Nexus database http://www.johnpool.net/genomes.html

Data for DPGP2 was obtained using the following command:

`wget http://pooldata.genetics.wisc.edu/dpgp2_sequences.tar.bz2`

Data for the DPGP project was obtained using the following command:

`wget http://pooldata.genetics.wisc.edu/dgrp_sequences.tar.bz2`

Unpack the tar files in your local directory. The assembled genome re-sequence data is in `*.seq` format, and for each strain the data obtained has separate folders with the respective chromosome name (2L, 2R, 3L, 3R and X; there is no data for Chr 4)

##Get FASTA for each gene


