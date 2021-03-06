#!/bin/bash
#################################################################
#
# Experiment description
#
test_set=($(seq 1 1 72))
# test_set=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72)
#
# Executable:
name_of_executable='bin/bin/DecoderAppStatic'
#
#################################################################
#
#$ -cwd -V
#$ -l node_type=nxv
#$ -j y
#$ -l h_rt=1:0:0    # Request 6 days runtime
#$ -l h_vmem=3G
#$ -t 1-72
module load cmake/3.16.0
module load gcc/7.1.0
module load openmpi/3.1.2-gcc
num_sequences=${#test_set[@]}
./single_decoder_job.sh $name_of_executable $num_sequences ${test_set[@]}
