#1. Function to run PLINK
runPLINK <- function(PLINKoptions = "") system(paste("/hpc/packages/minerva-centos7/modulefiles/plink2/2.3",PLINKoptions))
runPLINK()



#2. Investigate the contents of the PLINK files .fam and .bim files
#Count number of individuals in BioMe
GSA_hg19_FAM <- read.table(file = "/sc/private/regen/data/Regeneron/GSA/GSA_hg19_QC_FINAL.fam", sep = " ", header = FALSE)
dim(GSA_hg19_FAM) #31705 x 6
length(unique(GSA_hg19_FAM$V1)) #31705
#any(is.na(GSA_hg19_FAM))

GSA_hg19_BIM <- read.table(file = "/sc/private/regen/data/Regeneron/GSA/GSA_hg19_QC_FINAL.bim", sep = "\t", header = FALSE)
dim(GSA_hg19_BIM) #589023 x 6


#3. File with Information on Populations of BioMe Individuals
BioMe_PCA_ancestries <- read.table(file = "/sc/arion/projects/rg_HPIMS/user/eolia01/Ancestry/Final_PCA_with_ancestry.txt", sep = "\t", header = TRUE)
colnames(BioMe_PCA_ancestries)



#QCed BioMe Genetic Ancestries
Final_PCA_QCed_BioMe_population <- read.table(file = "/sc/arion/projects/rg_HPIMS/user/eolia01/Ancestry/Final_PCA_QCed_BioMe_ancestry.txt", sep = "\t", header = TRUE)
colnames(Final_PCA_QCed_BioMe_population)

#Ancestry Groups - Genetic Super Populations
superPop_AFR <- filter(Final_PCA_QCed_BioMe_population, SuperPop=="AFR")
superPop_AFR <-superPop_AFR[,c("IID", "FID", "SuperPop", "SP_prob", "GENDER", "RACE", "RACE_OTHER", "ETHICITY_2", "ETHNICITY_2_simpl")]
write.table(superPop_AFR, "superPop_AFR.txt", quote=F, row.names=F)

superPop_AMR <- filter(Final_PCA_QCed_BioMe_population, SuperPop=="AMR")
superPop_AMR <-superPop_AMR[,c("IID", "FID", "SuperPop", "SP_prob", "GENDER", "RACE", "RACE_OTHER", "ETHICITY_2", "ETHNICITY_2_simpl")]
write.table(superPop_AMR, "superPop_AMR.txt", quote=F, row.names=F)

superPop_EAS <- filter(Final_PCA_QCed_BioMe_population, SuperPop=="EAS")
superPop_EAS <-superPop_EAS[,c("IID", "FID", "SuperPop", "SP_prob", "GENDER", "RACE", "RACE_OTHER", "ETHICITY_2", "ETHNICITY_2_simpl")]
write.table(superPop_EAS, "superPop_EAS.txt", quote=F, row.names=F)

superPop_EUR <- filter(Final_PCA_QCed_BioMe_population, SuperPop=="EUR")
superPop_EUR <-superPop_EUR[,c("IID", "FID", "SuperPop", "SP_prob", "GENDER", "RACE", "RACE_OTHER", "ETHICITY_2", "ETHNICITY_2_simpl")]
write.table(superPop_EUR, "superPop_EUR.txt", quote=F, row.names=F)

superPop_SAS <- filter(Final_PCA_QCed_BioMe_population, SuperPop=="SAS")
superPop_SAS <-superPop_SAS[,c("IID", "FID", "SuperPop", "SP_prob", "GENDER", "RACE", "RACE_OTHER", "ETHICITY_2", "ETHNICITY_2_simpl")]
write.table(superPop_SAS, "superPop_SAS.txt", quote=F, row.names=F)



#4. Extract bim files per Ancestry
system("plink2 --bfile /sc/private/regen/data/Regeneron/GSA/GSA_hg19_QC_FINAL --keep superPop_AFR.txt --make-bed --out extracted_SuperPop/subsetted_AFR")
system("plink2 --bfile /sc/private/regen/data/Regeneron/GSA/GSA_hg19_QC_FINAL --keep superPop_AMR.txt --make-bed --out extracted_SuperPop/subsetted_AMR")
system("plink2 --bfile /sc/private/regen/data/Regeneron/GSA/GSA_hg19_QC_FINAL --keep superPop_EAS.txt --make-bed --out extracted_SuperPop/subsetted_EAS")
system("plink2 --bfile /sc/private/regen/data/Regeneron/GSA/GSA_hg19_QC_FINAL --keep superPop_EUR.txt --make-bed --out extracted_SuperPop/subsetted_EUR")
system("plink2 --bfile /sc/private/regen/data/Regeneron/GSA/GSA_hg19_QC_FINAL --keep superPop_SAS.txt --make-bed --out extracted_SuperPop/subsetted_SAS")



#5. PRSCS
#python PRScs.py --ref_dir=/sc/arion/work/daniej08/ldblk_1kg_afr --bim_prefix=/sc/arion/projects/rg_HPIMS/user/daniej08/extracted_SuperPop/subsetted_AFR --sst_file=/sc/arion/projects/rg_HPIMS/user/daniej08/finngen_sst.tsv --n_gwas=4867068 --out_dir=/sc/arion/projects/rg_HPIMS/user/daniej08/prscs_AFR_BioME/





#REPEAT
#REPEAT
#REPEAT


#All BioMe Genetic Ancestries

#Final_PCA_QCed_BioMe_population <- read.table(file = "/sc/arion/projects/rg_HPIMS/user/eolia01/Ancestry/Final_PCA_QCed_BioMe_ancestry.txt", sep = "\t", header = TRUE)
Final_PCA_QCed_BioMe_population <- fread(file = "Final_PCA_with_ancestry.txt")
colnames(Final_PCA_QCed_BioMe_population)
View(Final_PCA_QCed_BioMe_population)
#Ancestry Groups - Genetic Super Populations
superPop_AFR <- filter(Final_PCA_QCed_BioMe_population, SuperPop=="AFR")
superPop_AFR <-superPop_AFR[,c("IID", "FID", "SuperPop", "SP_prob", "GENDER", "RACE", "RACE_OTHER", "ETHICITY_2")]#, "ETHNICITY_2_simpl"
write.table(superPop_AFR, "superPop_AFR.txt", quote=F, row.names=F)

superPop_AMR <- filter(Final_PCA_QCed_BioMe_population, SuperPop=="AMR")
superPop_AMR <-superPop_AMR[,c("IID", "FID", "SuperPop", "SP_prob", "GENDER", "RACE", "RACE_OTHER", "ETHICITY_2")]#, "ETHNICITY_2_simpl"
write.table(superPop_AMR, "superPop_AMR.txt", quote=F, row.names=F)

superPop_EAS <- filter(Final_PCA_QCed_BioMe_population, SuperPop=="EAS")
superPop_EAS <-superPop_EAS[,c("IID", "FID", "SuperPop", "SP_prob", "GENDER", "RACE", "RACE_OTHER", "ETHICITY_2")]#, "ETHNICITY_2_simpl"
write.table(superPop_EAS, "superPop_EAS.txt", quote=F, row.names=F)

superPop_EUR <- filter(Final_PCA_QCed_BioMe_population, SuperPop=="EUR")
superPop_EUR <-superPop_EUR[,c("IID", "FID", "SuperPop", "SP_prob", "GENDER", "RACE", "RACE_OTHER", "ETHICITY_2")]#, "ETHNICITY_2_simpl"
write.table(superPop_EUR, "superPop_EUR.txt", quote=F, row.names=F)

superPop_SAS <- filter(Final_PCA_QCed_BioMe_population, SuperPop=="SAS")
superPop_SAS <-superPop_SAS[,c("IID", "FID", "SuperPop", "SP_prob", "GENDER", "RACE", "RACE_OTHER", "ETHICITY_2")]#, "ETHNICITY_2_simpl"
write.table(superPop_SAS, "superPop_SAS.txt", quote=F, row.names=F)
