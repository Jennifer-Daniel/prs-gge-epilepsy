##TARGET DATA
#Demographics #21,445 x 8
demographics <- read.table("/sc/private/regen/data/BioMe/BRSPD/Demographics.txt", sep = "|")
colnames(demographics) <- c("rgnid",
                            "gender",
                            "ethnic_group_c",
                            "country",
                            "marital_status",
                            "religion",
                            "patient_race_c",
                            "self_reported_race")

demographics <- demographics[c("rgnid",
                               "gender",
                               "self_reported_race")]


#Questionnaire #32,119 x 157
questionnaire <- read.table("/sc/private/regen/data/BioMe/BRSPD/Questionnaire.txt", sep = "|", quote = "", fill = TRUE) 
colnames(questionnaire) <- c("rgnid",
                             "YEAR_OF_BIRTH",
                             "GENDER",
                             "RACE",
                             "RACE_OTHER",
                             "ETHNICITY",
                             "HEIGHT",
                             "WEIGHT_LBS",
                             "PERS_HX_SMOKING",
                             "ETHICITY_2",
                             "ETHNICITY_OTHER",
                             "COUNTRY_OF_BIRTH",
                             "ADOPTED",
                             "LANGUAGE_PREFERENCE",
                             "PERS_HX_HIGH_BLOOD_PRESSURE",
                             "PERS_HX_HIGH_CHOLESTEROL",
                             "PERS_HX_STROKE",
                             "PERS_HX_DIABETES",
                             "PERS_HX_HEART_DISEASE",
                             "PERS_HX_BREAST_CANCER",
                             "PERS_HX_UTERINE_CANCER",
                             "PERS_HX_OVARIAN_CANCER",
                             "PERS_HX_PROSTATE_CANCER",
                             "PERS_HX_COLON_CANCER",
                             "PERS_HX_LIVER_CANCER",
                             "PERS_HX_LUNG_CANCER",
                             "PERS_HX_CANCER_OF_BLOOD",
                             "PERS_HX_OTHER_CANCER",
                             "PERS_HX_OTHER_CANCER_2",
                             "PERS_HX_KIDNEY_DISEASE",
                             "PERS_HX_LIVER_DISEASE",
                             "PERS_HX_LUNG_DISEASE",
                             "PERS_HX_ASTHMA",
                             "PERS_HX_ALLERGIES",
                             "PERS_HX_PSORIASIS",
                             "PERS_HX_RHEUMATOID_ARTHRITIS",
                             "PERS_HX_LUPUS",
                             "PERS_HX_SARCOIDOSIS",
                             "PERS_HX_INFLAMMATORY_BOWEL",
                             "PERS_HX_MULTIPLE_SCLEROSIS",
                             "PERS_HX_BLEEDING_PROBLEMS",
                             "PERS_HX_CLOTTING_PROBLEMS",
                             "PERS_HX_BONE_DISEASE",
                             "PERS_HX_AUTHISM",
                             "PERS_HX_DEPRESSION",
                             "PERS_HX_SCHIZOPHRENIA",
                             "PERS_HX_PARKINSONS_DISEASE",
                             "PERS_HX_EPILEPSY_OR_SEIZURES",
                             "PERS_HX_ALZHEIMERS_DISEASE",
                             "PERS_HX_OBESITY",
                             "COUNTRY_OF_BIRTH_2",
                             "YEARS_LIVED_IN_US",
                             "HISPANIC_OR_LATINO",
                             "DESCRIPT_OF_HERITAGE",
                             "HERITAGE_OTHER",
                             "DESCRIPT_HISP_LATINO_HERITAGE",
                             "HISP_LATINO_HERITAGE_OTHER",
                             "DESCRIPT_OF_HERITAGE_OTHER",
                             "ADOPTED_2",
                             "MOTHER_BIRTHPLACE",
                             "MAT_GRANDMOTHER_BIRTHPLACE",
                             "MAT_GRANDFATHER_BIRTHPLACE",
                             "FATHER_BIRTHPLACE",
                             "PAT_GRANDMOTHER_BIRTHPLACE",
                             "PAT_GRANDFATHER_BIRTHPLACE",
                             "EDUCATION_HIGHEST_GRADE",
                             "EDUCATION_LEVEL_OTHER",
                             "INTENSIVE_ACTIVITY_WORK",
                             "DAYS_INTENSIVE_ACTIVITY_WORK",
                             "TIME_INTENSIVE_ACTIVITY_WORK",
                             "MODERATE_ACTIVITY_WORK",
                             "DAYS_MODERATE_ACTIVITY_WORK",
                             "TIME_MODERATE_ACTIVITY_WORK",
                             "WALK_OR_PEDAL_GT_10_MINUTES",
                             "DAYS_WALK_OR_PEDAL",
                             "TIME_WALK_OR_PEDAL",
                             "VIGOROUS_ACTIVITY",
                             "VIGOROUS_ACTIVITY_SPECIFY",
                             "VIGOROUS_ACTIVITY_OTHER",
                             "DAYS_VIGOROUS_ACTIVITY",
                             "TIME_VIGOROUS_ACTIVITY",
                             "MODERATE_ACTIVITY",
                             "MODERATE_ACTIVITY_SPECIFY",
                             "MODERATE_ACTIVITY_OTHER",
                             "DAYS_MODERATE_ACTIVITY",
                             "TIME_MODERATE_ACTIVITY",
                             "TIME_SITTING_OR_RECLINING",
                             "SMOKED_GT_100_CIGARETTES_EVER",
                             "AGE_FIRST_SMOKED_REGULARLY",
                             "NEVER_SMOKED_CIGARETTES_REG",
                             "SMOKE_NOW",
                             "NUMBER_CIGARETTES_SMOKED_NOW",
                             "DAYS_SMOKED_CIGARET_IN_LAST_30",
                             "NUM_CIGARET_PER_DAY_IN_LAST_30",
                             "AGE_STOPPED_SMOKING_COMPLETELY",
                             "NUM_CIGARET_PER_DAY_LIFETIME",
                             "SMOKE_PIPE_REGULARLY",
                             "SMOKE_CIGARS_REGULARLY",
                             "FREQ_DINING_OUT_OR_TAKE_OUT",
                             "DRINK_ALCOHOLIC_BEVERAGES_NOW",
                             "FREQ_DRINK_ALCOHOLIC_BEVERAGES",
                             "DRINK_ALCOHOLIC_BEVERAGES_EVER",
                             "WHEN_STOPPED_ALCOHOL",
                             "AGE_LT_21_NOW",
                             "HEIGHT_AT_AGE_21",
                             "HEIGHT_AT_AGE_21_UNITS",
                             "WEIGHT_AT_AGE_21",
                             "WEIGHT_AT_AGE_21_UNITS",
                             "WEIGHT_AT_AGE_45",
                             "WEIGHT_AT_AGE_45_UNITS",
                             "WEIGHT_AT_AGE_65",
                             "WEIGHT_AT_AGE_65_UNITS",
                             "WEIGHT_CHANGE_IN_LAST_12_MOS",
                             "WEIGHT_CHANGE_IN_12_MOS_UNITS",
                             "WEIGHT_LOSS_OR_GAIN",
                             "TRYING_TO_LOSE_OR_GAIN_WEIGHT",
                             "FAM_HX_HIGH_BLOOD_PRESSURE",
                             "FAM_HX_HIGH_CHOLESTEROL",
                             "FAM_HX_STROKE",
                             "FAM_HX_DIABETES",
                             "FAM_HX_HEART_DISEASE",
                             "FAM_HX_BREAST_CANCER",
                             "FAM_HX_UTERINE_CANCER",
                             "FAM_HX_OVARIAN_CANCER",
                             "FAM_HX_PROSTATE_CANCER",
                             "FAM_HX_COLON_CANCER",
                             "FAM_HX_LIVER_CANCER",
                             "FAM_HX_LUNG_CANCER",
                             "FAM_HX_CANCER_OF_BLOOD",
                             "FAM_HX_OTHER_CANCER_SPECIFY",
                             "FAM_HX_OTHER_CANCER",
                             "FAM_HX_KIDNEY_DISEASE",
                             "FAM_HX_LIVER_DISEASE",
                             "FAM_HX_LUNG_DISEASE",
                             "FAM_HX_ASTHMA",
                             "FAM_HX_ALLERGIES",
                             "FAM_HX_PSORIASIS",
                             "FAM_HX_RHEUMATOID_ARTHRITIS",
                             "FAM_HX_LUPUS",
                             "FAM_HX_SARCOIDOSIS",
                             "FAM_HX_INFLAM_BOWEL_DISEASE",
                             "FAM_HX_MULTIPLE_SCLEROSIS",
                             "FAM_HX_BLEEDING_PROBLEMS",
                             "FAM_HX_CLOTTING_PROBLEMS",
                             "FAM_HX_BONE_DISEASE",
                             "FAM_HX_AUTISM",
                             "FAM_HX_DEPRESSION",
                             "FAM_HX_SCHIZOPHRENIA",
                             "FAM_HX_PARKINSONS_DISEASE",
                             "FAM_HX_EPILEPSY_OR_SEIZURES",
                             "FAM_HX_ALZHEIMERS_OR_DEMENTIA",
                             "FAM_HX_OBESITY",
                             "BELIEVE_IMPORTANT_TO_VOLUNTEER",
                             "WOULD_PARTICIP_FUTURE_RESEARCH",
                             "I_VOLUNTEER_FOR_RESEARCH",
                             "SPECIMEN_COLLECTION_DATE_TIME",
                             "ENROLLMENT_DATE")

questionnaire <- questionnaire[c("rgnid",
                                 "YEAR_OF_BIRTH",
                                 "GENDER",
                                 "RACE",
                                 "ETHICITY_2",
                                 "PERS_HX_EPILEPSY_OR_SEIZURES",
                                 "FAM_HX_EPILEPSY_OR_SEIZURES",
                                 "ENROLLMENT_DATE")]




#Diagnosis #3,373,418 x 9
encounter_diagnosis <- read.table("/sc/private/regen/data/BioMe/BRSPD/Encounter_Diagnosis.txt", sep = "|")
colnames(encounter_diagnosis) <- c("rgnid",
                                   "dx_code1",
                                   "dx_code_type",
                                   "dx_name",
                                   "contact_date",
                                   "dx_qualifier",
                                   "primary_dx_yn",
                                   "dx_chronic_yn",
                                   "encounter_date")

encounter_diagnosis <- encounter_diagnosis[c("rgnid",
                                             "dx_code1",
                                             "dx_code_type",
                                             "dx_name",
                                             "contact_date",
                                             "encounter_date")]

encounter_diagnosis$contact_date <- as.Date(encounter_diagnosis$contact_date, format = "%m/%d/%Y")
encounter_diagnosis$contact_year <- as.numeric(format(encounter_diagnosis$contact_date, "%Y"))

#Compute age at diagnosis : longer object length is not a multiple of shorter object length. Hence do this after merged table
#encounter_diagnosis$age_at_diagnosis <- encounter_diagnosis$contact_year - questionnaire$YEAR_OF_BIRTH

#check where diagnosis is equal to "epilepsy"

#check where diagnosis is equal to ICD10 codes for epilepsy




#Family History #1,399,125 x 5
#help(read.table)
family_history <- read.table("/sc/private/regen/data/BioMe/BRSPD/Family_History.txt", sep = "|")
colnames(family_history) <- c("rgnid",
                              "entry_date",
                              "problem_description",
                              "relation_c",
                              "encounter_date")



#Medical History #2,744,880 x 8
medical_history <- read.table("/sc/private/regen/data/BioMe/BRSPD/Medical_History.txt", sep = "|", quote = "", fill = TRUE)
colnames(medical_history) <- c("rgnid",
                               "MEDICAL_HX_DX_ID",
                               "MEDICAL_HX_DESCRIPTION",
                               "MEDICAL_HX_DATE",
                               "DX_NAME",
                               "ICD9_CODE",
                               "CODE_TYPE",
                               "encounter_date")



#Medications #6,569,239 x 17
#Removed

#Problem List #1,513,612 x 6
problem_list <- read.table("/sc/private/regen/data/BioMe/BRSPD/Problem_List.txt", sep = "|", quote = "", fill = TRUE)
head(problem_list)
colnames(problem_list) <- c("rgnid",
                            "description",
                            "noted_date",
                            "resolved_date",
                            "entry_date",
                            "hospital_pl_yn",
                            "principal_pl_yn",
                            "status",
                            "dx_name",
                            "icd9_code",
                            "code_type")
problem_list <- problem_list[c("rgnid",
                               "description",
                               "noted_date",
                               "dx_name",
                               "icd9_code",
                               "code_type")]



#Surgical History #435,169 x 8
#Removed Surgical History


##Merge Multiple data tables by their patient ID (pk)
#Demographics + Questionnaire + Encounter_Diagnosis + Family_History + Medical_History + Medications + Surgical_History
#install.packages("tidyverse")
library(tidyverse)
library(plyr)
library(dplyr)
target_data_1 <- plyr::join_all(list(demographics, questionnaire, family_history), by="rgnid", type="full")
target_data_2 <- plyr::join_all(list(encounter_diagnosis, medical_history, problem_list), by="rgnid", type="full")

target_data_final <- dplyr::left_join(x=target_data_2, y=target_data_1, by="rgnid")

write.table(target_data_final, "Epilepsy_Phenotype", quote=F, row.names=F)


