#!/bin/bash -l
#SBATCH --mem-per-cpu=8000
#SBATCH --time=0-48:00
#SBATCH --ntasks=16
#SBATCH --mail-user=jonathan.coleman@kcl.ac.uk
#SBATCH --mail-type=ALL
#SBATCH -o /scratch/prj/ukbiobank/usr/KCL_Data_Analyses/MHQ2/MHQ2/scripts/Run_Tables_For_Paper_As_R_Output.txt 

module load r/4.1.3-gcc-10.3.0-withx-rmath-standalone-python3+-chk-version

cd /scratch/prj/ukbiobank/usr/KCL_Data_Analyses/MHQ2/MHQ2

Rscript scripts/Tables_For_Paper_As_R.R
