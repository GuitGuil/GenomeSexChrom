#!/bin/bash
#$ -S /bin/bash
#$ -M gcossard@sb-roscoff.fr
#$ -V
#$ -o output_KQ.out
#$ -e error_KQ.err
#$ -m bea
#$ -cwd
#$ -pe thread 8

cd /scratch2/umr8227/ga/gcossard/Saccorhiza_Po/DNAseq/

jellyfish count -m 15 -o ./SaccoPo_AllF_k15.jf -c 4 -s 10G -t 8 -C --quality-start=33 --min-quality=20 ./SaccoPo_F_all.fastq
jellyfish dump --lower-count=5 ./SaccoPo_AllF_k15.jf -o ./Dump_AllF_SaccoPo.fasta
jellyfish count -m 15 -o ./SaccoPo_AllM_k15.jf -c 4 -s 10G -t 8 -C --quality-start=33 --min-quality=20 ./SaccoPo_M_all.fastq
jellyfish dump --lower-count=5 ./SaccoPo_AllM_k15.jf -o ./Dump_AllM_SaccoPo.fasta


perl /home/umr8227/ga/gcossard/Scratch/Saccorhiza_Po/DNAseq/kmer.pl -f Dump_AllF_SaccoPo.fasta -m Dump_AllM_SaccoPo.fasta -c Sacc_polyscides_F_Contigs_V1.fa -k 15 -b -t 8 -a 5 -p KQ_Ucandidates
rm -rf ./index
perl /home/umr8227/ga/gcossard/Scratch/Saccorhiza_Po/DNAseq/kmer.pl -f Dump_AllM_SaccoPo.fasta -m Dump_AllF_SaccoPo.fasta -c Sacc_polyscides_M_Contigs_V1.fa -k 15 -b -t 8 -a 5 -p KQ_Vcandidates
rm -rf ./index
