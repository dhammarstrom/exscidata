## code to prepare `hypertrophy` dataset goes here

# download.file(url = "https://ndownloader.figstatic.com/files/14702420", destfile = "./data-raw/hypertrophy.csv")

library(tidyverse)



hypertrophy2 <- readr::read_csv("./data-raw/hypertrophy2.csv") %>%
        select(PARTICIPANT = SUB_ID, 
               GROUP = GROUP_STRING,
               AGE, 
               HEIGHT, 
               TRAINING_AGE, 
               BODYMASS_T2 = `T2_BODY_MASS_(KILOGRAMS)`, 
                       VL_T1 = VL_1,
                       VL_T2 = VL_2,
                       VL_T3 = VL_3,
                       VL_T4 = VL_4,
               BICEPS_T1 = BICEP_1, 
               BICEPS_T2 = BICEP_2, 
               BICEPS_T3 = BICEP_3, 
               BICEPS_T4 = BICEP_4, 
               
               ECW_T1 = T1_ECW,
               ECW_T2 = T2_ECW,
               ECW_T3 = T3_ECW,
               ECW_T4 = T4_ECW,
               
               ICW_T1 = T1_ICW,
               ICW_T2 = T2_ICW,
               ICW_T3 = T3_ICW,
               ICW_T4 = T4_ICW,
               
               TBW_T1 = T1_TBW,
               TBW_T2 = T2_TBW,
               TBW_T3 = T3_TBW,
               TBW_T4 = T4_TBW,
               
               TOTAL_VOLUME_LOAD_WEEK_1,
               TOTAL_VOLUME_LOAD_WEEK_2,
               TOTAL_VOLUME_LOAD_WEEK_3,
               TOTAL_VOLUME_LOAD_WEEK_4,
               TOTAL_VOLUME_LOAD_WEEK_5,
               TOTAL_VOLUME_LOAD_WEEK_6,
               
           
               CALS_WEEK_1    =  ENTERED_CALS_WEEK_1,   
               CALS_WEEK_2    =  ENTERED_CALS_WEEK_2,   
               CALS_WEEK_3    =  ENTERED_CALS_WEEK_3,   
               CALS_WEEK_4    =  ENTERED_CALS_WEEK_4,   
               CALS_WEEK_5    =  ENTERED_CALS_WEEK_5,   
               CALS_WEEK_6    =  ENTERED_CALS_WEEK_6,   
               PROTEIN_WEEK_1 =  ENTERED_PROTEIN_WEEK_1,
               PROTEIN_WEEK_2 =  ENTERED_PROTEIN_WEEK_2,
               PROTEIN_WEEK_3 =  ENTERED_PROTEIN_WEEK_3,
               PROTEIN_WEEK_4 =  ENTERED_PROTEIN_WEEK_4,
               PROTEIN_WEEK_5 =  ENTERED_PROTEIN_WEEK_5,
               PROTEIN_WEEK_6 =  ENTERED_PROTEIN_WEEK_6,
               CHO_WEEK_1     =  ENTERED_CHO_WEEK_1,      
               CHO_WEEK_2     =  ENTERED_CHO_WEEK_2,      
               CHO_WEEK_3     =  ENTERED_CHO_WEEK_3,      
               CHO_WEEK_4     =  ENTERED_CHO_WEEK_4,      
               CHO_WEEK_5     =  ENTERED_CHO_WEEK_5,      
               CHO_WEEK_6     =  ENTERED_CHO_WEEK_6,      
               FAT_WEEK_1     =  ENTERED_FAT_WEEK_1,      
               FAT_WEEK_2     =  ENTERED_FAT_WEEK_2,      
               FAT_WEEK_3     =  ENTERED_FAT_WEEK_3,      
               FAT_WEEK_4     =  ENTERED_FAT_WEEK_4,      
               FAT_WEEK_5     =  ENTERED_FAT_WEEK_5,      
               FAT_WEEK_6     =  ENTERED_FAT_WEEK_6, 
               
               TMD_T1 = T1_TMD,
               TMD_T2 = T2_TMD,
               TMD_T3 = T3_TMD,
               
               PPT_AVG_T1 = PPT_AVG_1 , 
               PPT_AVG_T2 = PPT_AVG_2 , 
               PPT_AVG_T3 = PPT_AVG_3)
               
               
hypertrophy1 <- readr::read_csv("./data-raw/hypertrophy.csv") %>%
        select(PARTICIPANT = SUB_ID...1, 
               AGE, 
               BODYMASS_T1 = T1_BODY_MASS, 
               BODYMASS_T3 = T3_BODY_MASS,
               SQUAT_3RM = Squat_3RM_kg, 
               SQUAT_VOLUME,
               GROUP = GROUP...2, 
               CLUSTER = CLUSTER...3, 
               PERCENT_TYPE_I_T1, 
               PERCENT_TYPE_II_T1,
               FAST_CSA_T1, 
               FAST_CSA_T2,
               FAST_CSA_T3,
               SLOW_CSA_T1, 
               SLOW_CSA_T2, 
               SLOW_CSA_T3,
               FAST_NUCLEI_T1, 
               FAST_NUCLEI_T2, 
               FAST_NUCLEI_T3, 
               SLOW_NUCLEI_T1, 
               SLOW_NUCLEI_T2, 
               SLOW_NUCLEI_T3, 
               AR_PROTEIN_T1, 
               AR_PROTEIN_T2, 
               AR_PROTEIN_T3, 
               PROTEASOME_T1,
               PROTEASOME_T2,
               PROTEASOME_T3,
               GLYCOGEN_T1 = T1_GLYCOGEN_nnmolmg, 
               GLYCOGEN_T2 = T2_GLYCOGEN_nnmolmg, 
               GLYCOGEN_T3 = T3_GLYCOGEN_nnmolmg, 
               CS_T1, 
               CS_T2, 
               CS_T3,
               CK_T1 = T1_CK_ACTIVITY_IUL, 
               CK_T2 = T2_CK_ACTIVITY_IUL, 
               CK_T3 = T3_CK_ACTIVITY_IUL, 
               
               TESTOSTERONE_T1 = T1_TESTOSTERONE_ngdl, 
               TESTOSTERONE_T2 = T2_TESTOSTERONE_ngdl, 
               TESTOSTERONE_T3 = T3_TESTOSTERONE_ngdl, 
               
               CORTISOL_T1 = T1_CORTISOL_microgrdl,
               CORTISOL_T2 = T2_CORTISOL_microgrdl, 
               CORTISOL_T3 = T3_CORTISOL_microgrdl, 
               
               PAN4EBP1_T1 = T1_PAN_4EBP1, 
               PAN4EBP1_T2 = T2_PAN_4EBP1,
               PAN4EBP1_T3 = T3_PAN_4EBP1,
               
               PHOSPHO4EBP1_T1 = T1_PHOSPHO_4EBP1,
               PHOSPHO4EBP1_T2 = T2_PHOSPHO_4EBP1,
               PHOSPHO4EBP1_T3 = T3_PHOSPHO_4EBP1,
               
               PANMTOR_T1 = T1_PAN_MTOR, 
               PANMTOR_T2 = T2_PAN_MTOR, 
               PANMTOR_T3 = T3_PAN_MTOR, 
               
               PHOSPHOMTOR_T1 = T1_PHOSPHO_MTOR, 
               PHOSPHOMTOR_T2 = T2_PHOSPHO_MTOR, 
               PHOSPHOMTOR_T3 = T3_PHOSPHO_MTOR, 
               
               PANAMPK_T1 = T1_PAN_AMPK, 
               PANAMPK_T2 = T2_PAN_AMPK, 
               PANAMPK_T3 = T3_PAN_AMPK, 
               
               PHOSPHOAMPK_T1 = T1_PHOSPHO_AMPK, 
               PHOSPHOAMPK_T2 = T2_PHOSPHO_AMPK, 
               PHOSPHOAMPK_T3 = T3_PHOSPHO_AMPK, 
               
               PANP70S6K_T1 = T1_PAN_P70S6K,
               PANP70S6K_T2 = T2_PAN_P70S6K,
               PANP70S6K_T3 = T3_PAN_P70S6K,
               
               PHOSPHOP70S6K_T1 = T1_PHOSPHO_P70S6K,
               PHOSPHOP70S6K_T2 = T2_PHOSPHO_P70S6K,
               PHOSPHOP70S6K_T3 = T3_PHOSPHO_P70S6K,
               
               PANPOLYUB_T1 = T1_PAN_POLYUB, 
               PANPOLYUB_T2 = T2_PAN_POLYUB, 
               PANPOLYUB_T3 = T3_PAN_POLYUB, 
               
               RNA_T1 = T1_RNA,
               RNA_T2 = T2_RNA,
               RNA_T3 = T3_RNA,
               
               
               MGF_T2T1_FOLD_CHANGE,
               MGF_T3T1_FOLD_CHANGE,
               MGF_T1 = T1_MGF,
               
               
               MSTN_T2T1_FOLD_CHANGE,
               MSTN_T3T1_FOLD_CHANGE,
               MSTN_T1 = MSTN_1,
               
               RNA45S_T1 = T1_45S,
               RNA45S_T2T1_FOLD_CHANGE = `@45S_T2T1_FOLD_CHANGE`, 
               RNA45S_T3T1_FOLD_CHANGE = `@45S_T3T1_FOLD_CHANGE`,
               
               DXA_LBM_T1 =  DXA_LBM_1, 
               DXA_LBM_T2 =  DXA_LBM_2, 
               DXA_LBM_T3 =  DXA_LBM_3,
               
               DXA_FM_T1,
               DXA_FM_T2,
               DXA_FM_T3) 
        



hypertrophy <- hypertrophy2 %>%
        full_join(hypertrophy1) 


hypertrophy %>%
        group_by(GROUP) %>%
        summarise(n = n())


               
usethis::use_data(hypertrophy, overwrite = TRUE)

               
               
               
               
               
               
               
               
               
               
               

