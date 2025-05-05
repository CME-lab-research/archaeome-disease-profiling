#!/bin/sh
#SBATCH --job-name=gapseq_tk_1600
#SBATCH --cpus-per-task=6
#SBATCH --output=log/gapseq-%j.out
#SBATCH --error=log/gapseq-%j.err


#alias gapseq="singularity run -B $TMPDIR,/home/gpfs/o_mohammad/gapseq_AGORA_medium/Akkermansia_muciniphila/ docker://cdiener/gapseq gapseq"


# Pathway and reaction prediction
#example: srun gapseq find -p all GCF_000690815.1_ASM69081v1_genomic.fna
#srun singularity run -B $TMPDIR,/home/gpfs/o_mohammad/gapseq_AGORA_medium/Akkermansia_muciniphila/ docker://cdiener/gapseq gapseq find -p all Akkermansia_muciniphila.fasta


# Transporter prediction
#example: srun gapseq find-transport GCF_000690815.1_ASM69081v1_genomic.fna
#srun singularity run -B $TMPDIR,/home/gpfs/o_mohammad/gapseq_AGORA_medium/Akkermansia_muciniphila/ docker://cdiener/gapseq gapseq find-transport Akkermansia_muciniphila.fasta



# draft network reconstruction
#example: srun gapseq draft -r GCF_000690815.1_ASM69081v1_genomic-all-Reactions.tbl -t GCF_000690815.1_ASM69081v1_genomic-Transporter.tbl -p GCF_000690815.1_ASM69081v1_genomic-all-Pathways.tbl -c GCF_000690815.1_ASM69081v1_genomic.fna
#srun singularity run -B $TMPDIR,/home/gpfs/o_mohammad/gapseq_AGORA_medium/Akkermansia_muciniphila/ docker://cdiener/gapseq gapseq draft -r Akkermansia_muciniphila-all-Reactions.tbl -t Akkermansia_muciniphila-Transporter.tbl -p Akkermansia_muciniphila-all-Pathways.tbl -c Akkermansia_muciniphila.fasta



# Predict a gapfill/growth medium (`-c "cpd00007:0"` makes sure that the environment is anoxic)
#example: srun gapseq medium -m GCF_000690815.1_ASM69081v1_genomic-draft.RDS -p GCF_000690815.1_ASM69081v1_genomic-all-Pathways.tbl -c "cpd00007:0"
#srun singularity run -B $TMPDIR,/home/gpfs/o_mohammad/gapseq_AGORA_medium/Akkermansia_muciniphila/ docker://cdiener/gapseq gapseq medium -m Akkermansia_muciniphila-draft.RDS -p Akkermansia_muciniphila-all-Pathways.tbl -c "cpd00007:0"


# gapfilling
#example: srun gapseq fill -m GCF_000690815.1_ASM69081v1_genomic-draft.RDS -n GCF_000690815.1_ASM69081v1_genomic-medium.csv -c GCF_000690815.1_ASM69081v1_genomic-rxnWeights.RDS -g GCF_000690815.1_ASM69081v1_genomic-rxnXgenes.RDS
srun singularity run -B $TMPDIR,/home/gpfs/o_mohammad/gapseq_AGORA_medium/Akkermansia_muciniphila/ docker://cdiener/gapseq gapseq fill -m Akkermansia_muciniphila-draft.RDS -n gut.csv -c Akkermansia_muciniphila-rxnWeights.RDS -g Akkermansia_muciniphila-rxnXgenes.RDS
