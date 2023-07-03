#!/bin/bash
#$ -S /bin/bash
#$ -M gcossard@sb-roscoff.fr
#$ -V
#$ -o output_Align2CovReverse_SaccoPo.out
#$ -e error_Align2CovReverse_SaccoPo.err
#$ -m bea
#$ -cwd

cd /scratch2/umr8227/ga/gcossard/Saccorhiza_Po/DNAseq

genomeCoverageBed -pc -ibam  SaccoPo_DNAFread_Mgen_sorted.bam -g Sacc_polyscides_M_Contigs_V1.fa > Coverage_Freads_onMgen.txt
genomeCoverageBed -pc -ibam  SaccoPo_DNAMread_Fgen_sorted.bam -g Sacc_polyscides_F_Contigs_V1.fa > Coverage_Mreads_onFgen.txt
