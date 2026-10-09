#!/bin/bash
#inštalácia cutadapt, ak ešte nie je nainštalovaný
sudo apt install cutadapt

#vytvorenie priečinka pre orezané čítania
mkdir -p Trimmed_Reads

#vytvorenie premenných pre input a output
input=SHbasic_1.fastq.gz
output="Trimmed_Reads/SHbasic_trimmed.fastq.gz"

#spustenie cutadapt
cutadapt \
  -a "A{10}" \
  -a "G{10}" \
  --trim-n \
  -q 20 \
  -m 17 -M 30 \
  --discard-untrimmed \
  -o "$output" \
  "$input"

#spustenie fastqc dát po trimmingu
fastqc "$output" -o QC_results/
