*********************************************************************************************************************************************************
************************************************************* Shaping the Dataset ***********************************************************************
*********************************************************************************************************************************************************
clear all
use "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Tanz04Public.dta", clear
rename hh1a15 whighest
rename hh2x1 ia1
rename hh2x2 ia2
rename hh2x3 ia3
rename hh2a2a1y_ je05_
rename hh2a2a1m_ je06_
rename hh2a2a2y_ je03_
rename hh2a2a2m_ je04_
rename hh2a3a_ je07_
rename hh2a4a_ je09_
rename hh2a5a_ je10_
rename hh2a6a_ je11_
rename hh2a19a_ je16_
rename hh2a20a_ je17_
rename hh2a21a_ je18_
rename hh2a22a_ je19_
rename hh2a23a_ je20_
rename hh2a26a_ je22_
rename hh2a27a_ je23_
rename hh2a27as_ je24_
rename hh2a28a_  je25_
rename hh2a29a_ je27_
rename hh2a29as_ je28_
rename hh2a30a_ je29_
rename hh2a31a_ je30_
rename hh2a32a_ je31_
rename hh2a33a_ je32_
rename hh2a35a_ je33_
rename hh2a36a_ je34_
rename hh2a37a_ je35_
rename hh2a37as_ je36_
rename hh2a38a_ je37_
rename hh2a39a_ je38_
rename hh2a40a_ je39_
rename hh2a41a_ je40_
rename hh2a42a_ je41_
rename hh2a43a_ je42_
rename hh2a44a_ je43_
rename hh2a46a_ je48_
rename hh2a47a_ je49_
rename hh2a48a_ je50_
rename hh2a54a_ je60_
rename hh2a55a_ je61_
rename hh2a56a_ je62_
rename hh2a57a_ je63_
rename hh2a58a_ je64_
rename hh2a59a_ je65_
rename hh2a60a_ je66_
rename hh2a60as_ je67_
rename hh2b1 je68_
rename hh2b2 je69_
rename hh2b4b je70_
rename hh2b4bs je71_
rename hh2b5 je72_
rename hh2b6 je73_
rename hh2b6s je74_
rename hh2c3a_ jro1_
rename hh2c3an_ jro2_
rename gender wsex
rename age wage
rename bornhere wborn
rename hh1a7 warrive
rename hh2c2a_ jrn01_
rename hh2c4a_ jrn05_
rename hh2c5a_ jrn06_
rename hh2c6a_ jrn07_
rename hh2c7a_ jrn08_
rename hh2c8a_ jrn09_
rename hh2c9a_ jrn10_
rename hh2c10a_ jrn11_
rename hh2c11a_ jrn12_
rename hh2c12a_ jrn13_
rename hh2c13a_ jrn14_
rename hh2c14a_ jrn15_
rename hh2cx1a_ jrn16_
rename hh2cx2a_ jrn17_
rename hh2cx2as_ jr18_
rename hh2cx3a_ jrn19_
rename hh2c2b_ jrl02_
rename hh2c4b_ jrl04_
rename hh2c5b_ jrl05_
rename hh2c6b_ jrl06_
rename hh2c7b_ jrl07_
rename hh2c8b_ jrl08_
rename hh2c9b_ jrl09_
rename hh2c10b_ jrl10_
rename hh2c11b_ jrl11_
rename hh2c12b_ jrl12_
rename hh2c13b_ jrl13_
rename hh2c14b_ jrl14_
rename hh2cx1b_ jrl15_
rename hh2cx2b_ jrl16_
rename hh2cx2bs_ jrl17_
rename hh2cx3b_ jrl18_
rename hh2c2c_ jrt02_
rename hh2c4c_ jrt04_
rename hh2c5c_ jrt05_
rename hh2c6c_ jrt06_
rename hh2c7c_ jrt07_
rename hh2c8c_ jrt08_
rename hh2c9c_ jrt09_
rename hh2c10c_ jrt10_
rename hh2c11c_ jrt11_
rename hh2c12c_ jrt12_
rename hh2c13c_ jrt13_
rename hh2c14c_ jrt14_
rename hh2cx1c_ jrt15_
rename hh2cx2c_ jrt16_
rename hh2cx2cs_ jrt17_
rename hh2cx3c_ jrt18_
rename hh2c2d_ jrs01_
rename hh2c4dp_ jrs03_
rename hh2c4d_ jrs04_
rename hh2c5d_ jrs05_
rename hh2c6d_ jrs06_
rename hh2c7d_ jrs07_
rename hh2c8d_ jrs08_
rename hh2c9d_ jrs09_
rename hh2c10d_ jrs10_
rename hh2c11d_ jrs11_
rename hh2c12d_ jrs12_
rename hh2c13d_ jrs13_
rename hh2c14d_ jrs14_
rename hh2cx1d_ jrs15_
rename hh2cx2d_ jrs16_
rename hh2cx3d_ jrs18_

rename hh2ab1x1 js11_
rename hh2ab1x2 js12_
rename hh2a61ab_ js01_
rename hh2a61abs_ js02_
rename hh2ab2a1y_ js03_
rename hh2ab2a1m_ js04_
rename hh2ab2a2y_ js06_
rename hh2ab2a2m_ js07_
rename hh2ab3as_ js09_
rename hh2ab4a_ js10_
rename hh2ab5a_ js13_
rename hh2ab54a_ js14_
rename hh2ab62a_ js15_
rename hh2ab62as_ js16_
rename hh2ab63a_ js17_
rename hh2ab63as_ js18_


rename  hh2c28a_ js19_
rename hh2c28as_ js20_
rename hh2c27a_  js21_
rename hh2c29a_  js22_
rename hh2c31a_  js23_
rename hh2c30a_  js24_
rename hh2c32a_  js25_
rename hh2c33a_  js26_
rename hh2c36a_  js27_
rename hh2c34a_  js28_
rename hh2c35a_  js29_

rename hh2c36x1a_  js30_
rename hh2c36x2a_  js31_
rename hh2c36x2as_  js32_
rename hh2c36x3a_  js33_

rename hh2c27b_  js34_
rename hh2c31b_  js36_
rename hh2c30b_  js37_
rename hh2c36b_  js38_
rename hh2c34b_  js39_
rename hh2c35b_  js40_
rename hh2c36x1b_ js41_
rename hh2c36x2b_ js42_
rename hh2c36x2bs_ js43_
rename hh2c36x3b_ js44_



rename hh2c27c_  js45_
rename hh2c31c_  js47_
rename hh2c30c_  js48_
rename hh2c36c_  js49_
rename hh2c34c_  js50_
rename hh2c35c_  js51_
rename hh2c36x1c_ js52_
rename hh2c36x2c_ js53_
rename hh2c36x2cs_ js54_
rename hh2c36x3c_ js55_

rename hh2e1a1y_ ju01_
rename hh2e1a1m_ ju02_
rename hh2e1a2y_ ju04_
rename hh2e1a2m_ ju05_
rename hh2e3xas_ ju07_
rename hh2e3a_ ju11
rename hh2e4a_ ju12
rename hh2e5a_ ju13



gen jobstartdate = ym(je05_, je06_)
format jobstartdate %tm

gen jobendate = ym(je03_, je04_)
format jobendate %tm

















clear
use "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Tanz05Public.dta"

*We notice the presence of repeated obervation, that is  some observations are present more than once in the same wave. We detect this as follows:*
*after creating a  time dummy variable t=2005, we proceed by the isid command (i.e. isid wid t)*

*This command check whether each combination of identifier  and time is indeed unique. As we know, the error when performing this command suggest the*
*presence of repeated time values within panel. In order to cope with this problem we proceed as follows:*

duplicates report wid t
duplicates list wid t
duplicates tag wid t, gen(isdup)
edit if isdup


*From the edit command, we give a closer look at the data, and we presume the duplicates are exactly identical. Our (momentary) idea is to drop the duplicates.*
drop if isdup>=1
drop isdup
sort wid t
isid wid t

*Every data now uniquely identifies a combination of identifier and time. We now go to the second wave and shape the panel*
rename hh1a15 whighest



save "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\a.dta", replace


use "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Tanz06Public.dta"
drop  wlarusha wldar wldodoma wliringa wlkagera wlkigoma wlkilimanjaro wllindi wlmanyara wlmara wlmbeya wlmorogoro wlmtwara wlmwanza wlpwani
drop wlrukwa wlruvuma wlshinyanga wlsingida wlsabora wltanga wlunguja wlnortha wlmkoani wlchakechake wlarushaward wlmonduli
drop wlarumeru wlkaratu  wlkinodoni wlilala wltemeke wliringau wliringar wlmufundi wlnjombe wlmakete wlkilolo wlludewa wlulanga
drop wlkilombero wlmorogorou wlmorogoror wlmvomero wlkilosa wlkorogwe wlmuheza wltangaward wlhandeni wlpangani wllushoto 
drop wl6dist  wl6dist_1  
gen age = t - wdoby
drop if wipanel=="No"

sort wid t
append using  "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\a.dta"


count
*After Merging the 2 waves we have  a total number of observation of 1158.*
sort wid t
list wid t wsex age in 1/10, sepby(wid)

tab wsex
tab wsex t
*we know tell stata that we are using indeed a panel dataset*
xtset wid t
*as expected the balance is unbalanced, as certain units do now appear in both waves.*

xtdes
*from this command we see that the total number of information is 839, and that almost 40 percent of individuals appear in both waves (may be too little!)*






*********************************************************************************************************************************************************
********************************************* Descriptives and Data  Analysis   *************************************************************************
*********************************************************************************************************************************************************




