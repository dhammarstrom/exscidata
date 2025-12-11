#' Hemoglobin mass in cyclists
#'
#' Data from Rønnestad (2021). A group of cyclists trained for five weeks
#' in a heat chamber (heat group) or in control conditions (con group).
#'
#' @format A data frame with 46 rows and 4 variables:
#' \describe{
#'  \item{id}{Participant identification}
#'  \item{group}{Grouping, experimental group (heat) and control group (con)}
#'  \item{time}{Time point, pre and post-intervention}
#'  \item{hb}{Hbmass (g)}

#' }
#'
#' @references {Rønnestad, B. R. et al. Five weeks of heat training increases haemoglobin mass in elite cyclists. Experimental Physiology 106, 316–327 (2021).}
"hbmass"


#' Hemoglobin mass in cross coutry skiers - Effects of heat training
#'
#' Data from Rønnestad (2022) where a group of cross country skiers completed either
#' heat suit (n = 13) or control training (n = 12) for five weeks. Hematological variables were
#' measured before and after the intervention along with performance, VO2max and related variables.
#'
#' @format A data frame with 50 rows and 26 variables:
#' \describe{
#'  \item{participant}{Participant identification}
#'  \item{group}{Grouping, experimental group (exp) and control group (con)}
#'  \item{time}{Time point, pre and post-intervention}
#'  \item{weight}{Body mass (kg)}
#'  \item{height}{Stature (cm)}
#'  \item{hb}{Hemoglobin concentration (g/dl)}
#'  \item{hct}{Hematocrit (vol\%)}
#'  \item{hbmass}{Hemoglobin mass (g)}
#'  \item{rbcv}{Red blood cell volume (ml)}
#'  \item{pv}{Plasma volume (ml)}
#'  \item{bv}{Blood volume (ml)}
#'  \item{hf_submax}{Submaximal heart rate (BPM)}
#'  \item{la_submax}{Submaximal lactate (mml L-1)}
#'  \item{borg_submax}{Submaximal Borg RPE (Borg 6-20)}
#'  \item{VO2_submax}{ Submaximal VO2 (ml min-1)}
#'  \item{lt}{Lactate threshold km h-1}
#'  \item{lt_VO2}{Lactate threshold as percentage of VO2max (\%)}
#'  \item{VO2max}{VO2max (ml min-1)}
#'  \item{VO2max_kg}{Relative VO2max (ml kg-1 min-1)}
#'  \item{la_max}{Lactate after maximal test (mmol L-1)}
#'  \item{borg_max}{Borg after maximal test (Borg 6-20)}
#'  \item{hf_max}{ Heart rate at end of maximal test (BPM)}
#'  \item{tte}{Time to exhaustion during maximal test (sec)}
#'  \item{distance_allout}{Distance during all out test (m)}
#'  \item{borg_allout}{Borg after all out test (Borg 6-20)}
#'  \item{lactate_allout}{ Lactate after all out test (mmol l-1)}
#' }
#'
#' @references {Rønnestad BR, Lid OM, Hansen J, et al. Heat suit training increases hemoglobin mass in elite cross-country skiers. Scand J Med Sci Sports. 2022; 32: 1089–1098. doi:10.1111/sms.14156}
"heatxc"


#' Protein synthesis and Total RNA concentration in rat skeletal muscle
#'
#' Data from Millward (1973) to describe the relationship between Total RNA and
#' protein synthesis in rat skeletal muscle. Protein synthesis was measured
#' using constant intravenous infusion of 14C-labelled tyrosine in rats. Rats
#' where either fed a standard diet (10\% protein), starved, or refed after
#' starvation with a protein-free diet or control diet. In the data set, two
#' groups are identified where A represent rats on control diet or refed animals
#' and B represent starved/fasted animals and animals refed with protein-free
#' diet.
#'
#' @format A data frame with 52 rows and 3 variables:
#' \describe{
#'  \item{group}{group identification, A or B}
#'  \item{RNA}{Total RNA concentration in rat skeletal muscle, microgram per milligram protein}
#'  \item{protein_synthesis}{Fractional protein synthesis rate in rat skeletal muscle, Ks day-1}
#' }
#'
#' @references {Millward, D. J., P. J. Garlick, W. P. T. James, D. O. Nnanyelugo, og J. S. Ryatt. 1973. «Relationship between Protein Synthesis and RNA Content in Skeletal Muscle». Nature 241:204. doi: 10.1038/241204a0.}
"millward"

#' Increase in Protein synthesis and muscle wet weight in rat skeletal muscle
#'
#' Data from Goldberg (1968). Muscle growth and incorporation of labelled leucin
#' into protein in rat skeletal muscle (plantaris and soleus) after tenotomy of
#' the gastrocnemius insertions into the Achilles tendon. Values are presented as
#' percentage of the contra-lateral sham-operated limb.
#'
#' @format A data frame with 42 rows and 3 variables:
#' \describe{
#'  \item{muscle.ww}{Muscle wet weight, expressed as a percentage of
#'  the contra-lateral sham-operated limb}
#'  \item{leucin.incorp}{Protein synthesis measured as incorporation of labelled
#'   leucin, expressed as a percentage of the contra-lateral sham-operated limb}
#'  \item{muscle}{Identification of muscle, plantaris or soleus}
#'  }
#'
#'  @references {Goldberg, Alfred L. 1968. “Protein Synthesis during Work-Induced
#'   Growth of Skeletal Muscle.” The Journal of Cell Biology 36(3):653–58}
"goldberg"


#' Physiological variables from a cycling training study.
#'
#' Part of the data from Sylta et al. (2016) describing 20 participants conducting a cycling training study.
#'
#' @format A data frame with 80 rows and 101 variables:
#' \describe{
#'   \item{subject}{participant identification}
#'   \item{group}{group identification, "INCR" trained with increasing intensity, "DECR" trained with decreasing intensity and "MIX" mixed sessions in all meso cycles.}
#'   \item{age}{age at the start of the study, in years}
#'   \item{timepoint}{time-point for data collection. Physiological variables were collected before the study ("pre") and after the completion of three meso cycles of training (each 4 weeks; "meso1"; "meso2"; "meso3")}
#'   \item{height.T1}{participant height at the first test-day in each test-block, cm}
#'   \item{weight.T1}{participant weight at the first test-day in each test-block, kg}
#'   \item{sj.max}{squat-jump maximum height, cm}
#'   \item{cmj.max}{counter-movement jump height, cm}
#'   \item{lac.\*}{lactate values at a specific exercise intensity collected during incremental tests with 5 min steady state ramps, mmol L}
#'   \item{VO2.\*}{oxygen consumption values at a specific exercise intensity collected during incremental tests with 5 min steady state ramps, ml min^-1}
#'   \item{VCO2.\*}{carbon dioxide production values at a specific exercise intensity collected during incremental tests with 5 min steady state ramps, ml min^-1}
#'   \item{VE.\*}{Ventilation during at specific intensity, L min^-1}
#'   \item{HF.\*}{Heart rate at specific exercise intensity from incremental test, beats min^-1}
#'   \item{RPE.\*.\*}{Rating of percieved exertion in "breath" (B) and "legs" (L) at each ramp intensity from incremental test, 6-20 Borg scale}
#'   \item{RPM.\*}{Cycling cadence from incremental tests, Rounds min^-1}
#'   \item{start.load}{Intensity in the first minute of the maximal cycling test. Increase in watt every minute to exhaustion, Watt}
#'   \item{end.load}{Intensity in the last attempted stage of the maximal cycling test. Increase in watt every minute to exhaustion, Watt}
#'   \item{tte}{Time to exhaustion in the maximnal test, sec}
#'   \item{VO2.max}{Maximal aerobic power (VO_2max) as recorded during the maximal test, ml min^-1}
#'   \item{VO2.diff.30sek}{Difference between two consecutive VO_2max recordings, ml min^-1}
#'   \item{VO2.diff.30sek.ml_kg}{Difference between two consecutive VO_2max recordings, ml min^-1 kg^-1}
#'   \item{RER.max}{Maximal respiratory quotient from the maxial test, VCO_2 /VO_2 }
#'   \item{VE.max}{Maximal ventilation during the maximal test, L min^-1}
#'   \item{HF.max}{Maximal heart rate during the maximal test, Beats min^-1}
#'   \item{HF.1min}{Heart rate one minute after the end of the maximal test, Beats min^-1}
#'   \item{RPE.\*.max}{Maximal rating of percieved excertion, Borg 6-20}
#'   \item{lac.\*min}{Lactate 1 and 14 minutes after the maximal test, mmol L ^-1}
#'   \item{torque.factor}{Torque factor during wingate test}
#'   \item{torque}{Torque during the 30-sec maximal test performed 15 min after the maximal incremental test}
#'   \item{peak.power}{Maximal power during the 30-sec test, watt}
#'   \item{mean.power}{Average power during the 30-sec test, watt}
#'   \item{fatigue}{Fatigue index during the 30-sec test, drop in watt}
#'   \item{total.work}{Total work during the 30-sec maximal test, joule}
#'   \item{comment}{comment per observations}
#' }
#' @references {Sylta Ø, Tønnessen E, Hammarström D, Danielsen J, Skovereng K, Ravn T, Rønnestad BR, Sandbakk Ø, Seiler S. The Effect of Different High-Intensity Periodization Models on Endurance Adaptations. Med Sci Sports Exerc. 2016 Nov;48(11):2165-2174. doi: 10.1249/MSS.0000000000001007. PMID: 27300278.}
"cyclingstudy"


#' Dual-energy x-ray absorptiometry (DXA) data from a training study
#'
#' Data from Hammarström et al. (2020)
#'
#' @format A data frame with 80 rows and 101 variables:
#' \describe{
#'   \item{participant}{participant identification}
#'   \item{time}{Time-point of data collection, before (pre) or after (post) 12-weeks of resistance training}
#'   \item{multiple}{Identification of what leg (L, left; R, right) is associated with multiple-set training (three sets per exercise).}
#'   \item{single}{Identification of what leg (L, left; R, right) is associated with single-set training (one sets per exercise).}
#'   \item{sex}{Female/Male}
#'   \item{include}{Participants included or excluded from data analysis.}
#'   \item{age}{Participant age}
#'   \item{height}{Participant height (cm)}
#'   \item{weight}{Participant weight (kg)}
#'   \item{BMD.*}{Bone mineral density, grams per centimeter squared (g/cm2) for body except head (body), ribs, pelvis, spine or whole body (whole).}
#'   \item{fat.*}{Fat mass in grams (g) for left (left_\*) or right (right_\*) side from the whole body (whole), body (except head, body), arm or leg, android and gynoid.}
#'   \item{lean*.}{Lean mass in grams (g) for left (left_\*) or right (right_\*) side from the whole body (whole), body (except head, body), arm or leg, android and gynoid.}
#'   \item{BMC.*}{Bone mineral content in grams (g) for left (left_\*) or right (right_\*) side from the whole body (whole), body (except head, body), arm or leg, android and gynoid.}
#' }
#' @references {Hammarström, D., et al. (2020). "Benefits of higher resistance-training volume are related to ribosome biogenesis." The Journal of Physiology 598(3): 543-565.}
"dxadata"

#' Strength test data from a training study investigating the effect of inter-session training volume
#'
#' Data from Hammarström et al. (2020)
#'
#' @format A data frame with 3276 rows and 8 variables:
#' \describe{
#'   \item{participant}{participant identification}
#'   \item{sex}{female/male}
#'   \item{include}{If participants are included/excluded (incl/excl) in final analysis (performed at least 85\% of scheduled sessions)}
#'   \item{time}{Time-point of data collection, before (pre), after one session (session1), 2, 5, 9 or 12 weeks (week2, week5, week9, post) of resistance training}
#'   \item{sets}{Identification of inter-session training volume one (single) or three (multiple) sets per exercise per session.}
#'   \item{leg}{Left (L) or right (R) leg used in training volume allocation}
#'   \item{exercise}{Type of exercise. Isokinetic strength was tested in knee extension at 60, 120 and 240 degrees per sec (isok.60, isok.120, isok.240), isometric knee extension (isom) and as one repetition maximum in leg press and knee extension (legpress, legext)}
#'   \item{load}{Load lifted in one repetition maximum (kg) or isometric/isokintic (N, N m) tests}
#' }
#' @references {Hammarström, D., et al. (2020). "Benefits of higher resistance-training volume are related to ribosome biogenesis." The Journal of Physiology 598(3): 543-565.}
"strengthvolume"


#' Body composition, strength and molecular data from a resistance training study
#'
#' Data from Haun et al. (2019) and Haun et al. (2018)
#'
#' @format A data frame with 30 rows and 147 variables:
#' \describe{
#'   \item{}{}
#'   \item{PARTICIPANT}{Participant ID}
#'   \item{AGE}{Participants in years}
#'   \item{BODYMASS_\*}{Body mass (kg) at time-point T\*}T1
#'   \item{SQUAT_3RM}{Squat 3 repetition maximum load (kg) at baseline}
#'   \item{SQUAT_VOLUME}{Total back-squat training volume during intervention (kg)}
#'   \item{GROUP}{Intervention group, participants supplemented with 30 g daily maltodextrin (MALTO), 25 g of whey protein (WP) or graded whey protein (GWP, 25 g/day increasing by 25 g/d per week).}
#'   \item{CLUSTER}{Cluster responder grouping based on (a) right leg VL muscle thickness assessed via ultrasound, (b) upper right leg lean soft tissue assessed via DXA, (c) right leg mid-thigh circumference (d) right leg VL mean (type I and type II) muscle fCSA. See Haun et al. (2019)}
#'   \item{PERCENT_TYPE_I_T1}{Percentage Type I fibers at baseline (T1)}
#'   \item{PERCENT_TYPE_II_T1}{Percentage Type II fibers at baseline (T1)}
#'   \item{FAST_CSA_\*}{Type II (FAST) fibers cross sectional area (micrometer^2)}
#'   \item{SLOW_CSA_\*}{Type I (SLOW) fibers cross sectional area (micrometer^2)}
#'   \item{FAST_NUCLEI_T1}{Myonuclei per fiber CSA in Type II (FAST)}
#'   \item{SLOW_NUCLEI_T1}{Myonuclei per fiber CSA in Type I (SLOW)}
#'   \item{AR_PROTEIN_\*}{Androgen receptor protein content at time-point \*}
#'   \item{PROTEASOME_\*}{20S Proteasome Activity at time-point \* (relative fluorometric units)}
#'   \item{GLYCOGEN_\*}{Whole muscle tissue glycogen concentration (nmol glycogen/mg wet muscle weight) at time-point \*}
#'   \item{CS_\*}{Citrate synthase activity at time-point \*, (mM min-1 mg-1)}
#'   \item{CK_\*}{Creatine kinase activity in blood samples (U L-1) at time-point \*}
#'   \item{TESTOSTERONE_\*}{Testosterone concentration at time-point \* (ng dL-1) }
#'   \item{CORTISOL_\*}{Cortisol concentration at time-point \* (ng dL-1) }
#'   \item{PAN4EBP1_\*, PANMTOR_\*, PANAMPK_\*, PANP70S6K_\*}{Total protein (PAN) levels of 4EBP-1, mTOR, AMPK and p70S6K1 proteins at time-point \* (AU)}
#'   \item{PHOSPHO4EBP1_\*, PHOSPHOMTOR_\*, PHOSPHOAMPK_\*, PHOSPHOP70S6K_\*}{Phosphorylated protein (PHOSPHO) levels of 4EBP-1, mTOR, AMPK and p70S6K1 proteins at time-point \* (AU)}
#'   \item{PANPOLYUB_\*}{Ubiquitin-labeled protein levels at time-point \* (AU)}
#'   \item{RNA_\*}{Total RNA concentrations at time-point \*, (micro-gram mg-1)}
#'   \item{MGF_T2T1_FOLD_CHANGE}{Mechano growth factor mRNA, fold-change from baseline (T1) to time-point T2}
#'   \item{MGF_T3T1_FOLD_CHANGE}{Mechano growth factor mRNA, fold-change from baseline (T1) to time-point T3}
#'   \item{MGF_T1}{Baseline mechano growth factor mRNA (AU)}
#'   \item{MSTN_T2T1_FOLD_CHANGE}{Myostatin mRNA, fold-change from baseline (T1) to time-point T2}
#'   \item{MSTN_T3T1_FOLD_CHANGE}{Myostatin mRNA, fold-change from baseline (T1) to time-point T3}
#'   \item{MSTN_T1}{Baseline myostatin mRNA (AU, expressed per "housekeeping genes")}
#'   \item{RNA45S_T1}{rRNA 45S baseline expression (AU, expressed per "housekeeping genes")}
#'   \item{RNA45S_T2T1_FOLD_CHANGE}{rRNA 45S, fold-change from baseline (T1) to time-point T2}
#'   \item{RNA45S_T3T1_FOLD_CHANGE}{rRNA 45S, fold-change from baseline (T1) to time-point T3}
#'   \item{DXA_\*_\*}{Dual x-ray absorptiometry lean body mass (LBM) or fat mass (FM)_\*_ from time-point (_\*)}
#'   \item{HEIGHT}{Participant stature (cm)}
#'   \item{TRAINING_AGE}{Number of years of previous training (years)}
#'   \item{VL_\*}{Vastus lateralis thickness at time-point \*, meassured with ultrasound (cm)}
#'   \item{BICEPS_\*}{Biceps bracchi thickness at time-point \*, meassured with ultrasound (cm)}
#'   \item{ECW_\*, ICW_\*, TBW_\*}{Extracellular (ECW), Intracellular (ICW) or total body water (TBW) meassured at time-point \*, (kg)}
#'   \item{TOTAL_VOLUME_LOAD_WEEK_\*}{Total training volume at week \* (kg)}
#'   \item{CALS_WEEK_\*, PROTEIN_WEEK_\*, CHO_WEEK_\*, FAT_WEEK_\*}{Registred energy (CALS, kcal/day), protein (PROTEIN, g/day), carbohydrate (CHO, g/day), fat (FAT, g/day) at week \*.}
#'   \item{TMD_\*}{Total mood disturbance (POMS score) at time point \*}
#'   \item{PPT_AVG_\*}{Pressure-to-pain threshold (N) at time point \*}
#' }
#' @references {Haun, C. T., et al. (2019). "Pre-training Skeletal Muscle Fiber Size and Predominant Fiber Type Best Predict Hypertrophic Responses to 6 Weeks of Resistance Training in Previously Trained Young Men." Front Physiol 10(297).}
#' @references {Haun, C. T., et al. (2018). "Effects of Graded Whey Supplementation During Extreme-Volume Resistance Training." Front Nutr 5: 84.}
"hypertrophy"

#' Maximal strength test values from a resistance training study
#'
#' Data from Øfsteng et al. (2021)
#'
#' @format A data frame with 243 rows and 5 variables:
#' \describe{
#'   \item{participant}{participant identification}
#'   \item{time}{Time-point of data collection, before (pre), mid-way (mid) or after (post) 14-weeks of resistance training}
#'   \item{group}{Intervention group identification, 10RM or 30RM}
#'   \item{exercise}{The exercise that was tested for 1RM, legpress, benchpress or bicepscurl}
#'   \item{load}{The load lifted in 1RM test (kg)}
#'   }
#' @references {Øfsteng, S., et al. (2021). "Twenty-two weeks of high-load resistance training leads to greater increases in strength and performance than low-load training in a military environment}
"tenthirty"

#' Results from the Boston Marathon
#'
#' Data retrieved from the Boston-Marathon-Data-Project
#' https://github.com/adrian3/Boston-Marathon-Data-Project
#'
#' @format A data frame with 649378 rows and 7 variables:
#' \describe{
#'   \item{display_name}{Runner name}
#'   \item{age}{Age in years}
#'   \item{gender}{Male (M) and female (F)}
#'   \item{seconds}{Time in seconds to complete the marathon}
#'   \item{overall}{Overall place}
#'   \item{gender_result}{Place in gender category}
#'   \item{year}{Year of the race}
#'   }
#' @references {Adrian Hanft (2019) https://tread1st.com/boston.html}
"boston"

#' Results from the Boston Marathon
#'
#' The results from 2000 are aggregated for the top 100 in each age category
#' using several descriptive statistics.
#'
#' Data retrieved from the Boston-Marathon-Data-Project
#' https://github.com/adrian3/Boston-Marathon-Data-Project
#'
#' @format A data frame with 649378 rows and 7 variables:
#' \describe{
#'   \item{gender}{Male (M) and female (F)}
#'   \item{year}{Year of the race}
#'   \item{age_group}{Age group}
#'   \item{mean_seconds}{Time in seconds averaged over age group, gender and year}
#'   \item{sd_seconds}{Time in seconds SD over age group, gender and year}
#'   \item{min_seconds}{Time in seconds MIN over age group, gender and year}
#'   \item{max_seconds}{Time in seconds MAX over age group, gender and year}
#'   \item{n}{Number of observations in each age group, gender and year}
#'   }
#' @references {Adrian Hanft (2019) https://tread1st.com/boston.html}
"boston_aggregated"

#' Chinese university football injuries
#'
#' The data set contains 800 Chinese university football
#' players characteristics and injury occurrence during
#' the next season.
#'
#' Data retreived from Kaggle. Data licensed under CC0: Public Domain.
#' DOI: https://doi.org/10.34740/kaggle/dsv/12653694
#'
#' @format A data frame with 800 rows and 19 variables:
#' \describe{
#'   \item{Age}{Age in years}
#'   \item{Height_cm}{Height (cm)}
#'   \item{Weight_kg}{Weight (kg)}
#'   \item{Position}{Player position; "Midfielder", "Forward", "Defender", "Goalkeeper"}
#'   \item{Training_Hours_Per_Week    }{Training volume (Hours per week)}
#'   \item{Matches_Played_Past_Season }{Number of matches played}
#'   \item{Knee_Strength_Score        }{Knee strength score}
#'   \item{Hamstring_Flexibility      }{Hamstring flexibility score}
#'   \item{Reaction_Time_ms           }{Reaction time (ms)}
#'   \item{Balance_Test_Score         }{Balance test score}
#'   \item{Sprint_Speed_10m_s         }{10 m Sprint (seconds)}
#'   \item{Agility_Score              }{Agility score}
#'   \item{Sleep_Hours_Per_Night      }{Sleep, Hours per night}
#'   \item{Stress_Level_Score         }{Stress score}
#'   \item{Nutrition_Quality_Score    }{Nutrition quality score}
#'   \item{Warmup_Routine_Adherence}{Adherence to warm-up routine}
#'   \item{Injury_Next_Season }{Binary classification where injury is defined
#'    as training/competition-related injury causing ≥7 consecutive days of
#'     absence, verified by university medical center and coaching staff.}
#'   \item{BMI}{weight / height^2 }
#'   }
#' @references {ChunHong Yuan (2025) University Football Injury
#' Prediction Dataset. DOI: 10.34740/KAGGLE/DSV/12653694. Publisher: Kaggle}
"injury"
