##BASE DATA
getwd()
setwd("/sc/arion/projects/rg_HPIMS/user/daniej08")

#Import Summary Statistics #4,867,068 x 15
gge_summary_stats <- read.table("/hpc/users/daniej08/generalised_epilepsy_METAL", header = T)
head(gge_summary_stats)


#Select columns
gge_summary_stats1 <- gge_summary_stats[,c(1:6,7:9)]
head(gge_summary_stats1)
colnames(gge_summary_stats1) <- c('CHR', 'BP', 'MarkerName', 'Allele1', 'Allele2', 'Freq1', 'Weight', 'Zscore', 'Pvalue')

#Calculate Odds Ratios <- Beta <- Zscore
#from Zscore to beta: Beta = Zscore / sqrt( 2 * MAF * ( 1 - MAF) * ( N + Zscore^2 ) )
gge_summary_stats1$Freq2 <- 1 - gge_summary_stats1$Freq1
head(gge_summary_stats1)


install.packages("matrixStats")
library(matrixStats)

gge_summary_stats1$MAF <- rowMins(as.matrix(gge_summary_stats1[,c(6,10)]))
gge_summary_stats1$BETA <- gge_summary_stats1$Zscore / sqrt(2*gge_summary_stats1$MAF*(1-gge_summary_stats1$MAF)*(nrow(gge_summary_stats1)+gge_summary_stats1$Zscore^2))
gge_summary_stats1$OddsRatio <- exp(gge_summary_stats1$BETA)
head(gge_summary_stats1)

#Save resulting file
#write.table(gge_summary_stats1, "GGEsummarystatistics.QC.Transformed", quote=F, row.names=F)
write.table(gge_summary_stats1, "GGE_summarystatistics.txt", quote=F, row.names=F)


#BETA SST_FILE
gge_sst_beta <- gge_summary_stats1[,c(3:5,12,9)]
head(gge_sst_beta)
colnames(gge_sst_beta) <- c('SNP', 'A1', 'A2', 'BETA', 'P')
gge_sst_beta$A1 <- toupper(gge_sst_beta$A1)
gge_sst_beta$A2 <- toupper(gge_sst_beta$A2)
write.table(gge_sst_beta, "GGE_SST_BETA.txt", quote=F, row.names=F)


##ODD RATIOS SST_FILE
gge_sum_stats<- gge_summary_stats1[,c(3:5,13,9)]
head(gge_sum_stats)
colnames(gge_sum_stats) <- c('SNP', 'A1', 'A2', 'OR', 'P')
#gge_sum_stats$A1 <- toupper(gge_sum_stats$A1)
#gge_sum_stats$A2 <- toupper(gge_sum_stats$A2)

gge_sum_stats[,2] = toupper(gge_sum_stats[,2])
gge_sum_stats[,3] = toupper(gge_sum_stats[,3])
#Number of GWAS Sample #4867068
nrow(gge_sum_stats)

#Save file
write.table(gge_sum_stats, "GGE_SUM_STATS.txt", quote=F, row.names=F)
fwrite(gge_sum_stats, "GGE_SUM_STATS.tsv", sep = "\t")

gge_sum_stats[1,]

str(gge_sum_stats)
summary(gge_sum_stats)
dplyr::count(gge_sum_stats, A1)
nrow(gge_sum_stats$P)

any(is.na(gge_sum_stats))
any(is.infinite(gge_sum_stats$OR))
any(is.infinite(gge_sum_stats$P))
which(is.na(as.numeric(as.character(gge_sum_stats[[4]]))))
#integer(0)
which(is.na(as.numeric(as.character(gge_sum_stats[[5]]))))
#integer(0)



#Extracting Chromosome 22 for Ge Tian
sst_chr22 <- subset(gge_summary_stats1, CHR == 22)
write.table(sst_chr22, "sst_chr22.txt", quote=F, row.names=F)


test_sst <- read.table("/sc/arion/work/daniej08/PRScs-master/test_data/sumstats.txt", header = T)
head(test_sst)
str(test_sst)
summary(test_sst)




#Use FINNGEN Summary Statistics file
finngen_sst_file <- read.table("/sc/arion/work/daniej08/generalised_epilepsy_METAL_4finngen.txt.gz", header = T)
head(finngen_sst_file)

#beta to odd ratio
finngen_sst_file$or <- exp(finngen_sst_file$beta)

finngen_sst <- finngen_sst_file[ ,c(2:4,8,7)]
head(finngen_sst)
colnames(finngen_sst) <- c('SNP', 'A1', 'A2', 'OR', 'P')
finngen_sst[,2] = toupper(finngen_sst[,2])
finngen_sst[,3] = toupper(finngen_sst[,3])

fwrite(finngen_sst, "finngen_sst.tsv", sep = "\t")
nrow(finngen_sst)
#4867068
