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



