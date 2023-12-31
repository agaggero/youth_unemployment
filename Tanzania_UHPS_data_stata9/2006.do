
********************************************************************************
*************************  EDUCATION  ******************************************
********************************************************************************
clear all
set mem 1000m
use "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Tanz06Public.dta", clear

gen weprimever=0
replace weprimever=1 if weprimaryever== "Yes"
gen wfemale=0
replace wfemale =1 if wsex== "Female"


tab jwwagebt
gen age= 2006 - wdoby
gen age2= age^2
gen ljwwagebt= ln(jwwagebt)

tab wehighest

*********************************************************************************
*************************  Highest level of education  **************************
*************************     Categorical Variable     **************************
*********************************************************************************


gen alevel=0
replace alevel=1 if wehighest=="A Level"
gen adiploma =0
replace adiploma=1 if wehighest=="Advanced diploma"
gen tertiary=0
replace tertiary=1 if wehighest=="Bachelor"
gen mschool=0
replace mschool=1 if  wehighest== "Middle School cert."
gen olevel=0
replace olevel=1 if wehighest=="O Level"
gen pricert=0
replace pricert=1 if wehighest== "Primary Certificate"
gen voctraining=0
replace voctraining=1 if wehighest=="Vocational training cert."

*********************************************************************************
*************************  Highest level of education  **************************
*************************     Years of schooling       **************************
*********************************************************************************

gen schooling=0
replace schooling=4 if pricert==1
replace schooling=8 if mschool==1
replace schooling=12 if olevel==1 & wdoby<=1956
replace schooling=11 if olevel==1 & wdoby>1956
replace schooling=14 if alevel==1 & wdoby<=1956
replace schooling=13 if alevel==1 & wdoby>1956
replace schooling=17 if tertiary==1 & wdoby<=1956
replace schooling=16 if tertiary==1 & wdoby>1956


tab schooling
gen schooling2= schooling^2
*notice, convex returns to education. Zero for primary school*



**********************  Preliminary Regression ********************************

reg ljwwagebt   pricert mschool olevel alevel adiploma tertiary  voctraining age age2 wfemale 
reg ljwwagebt   schooling schooling2 voctraining age age2 wfemale

*schooling-earnings profile*
display -_b[age]/(2*_b[schooling2])
twoway (function y = _b[_cons] + _b[schooling]*x + _b[schooling2]*x^2, range(0 20) xline(-11.855344))



*age-earnings profile*
display -_b[age]/(2*_b[age2])
twoway (function y = _b[_cons] + _b[age]*x + _b[age2]*x^2, range(35 60) xline(50.459331))


**********************      Cohorts    ********************************
gen cohortb40=1 if wdoby<1940
replace cohortb40=0 if wdoby>=1950 
tab cohortb40

gen cohort40 = 1 if wdoby>= 1940
replace cohort40=0 if wdoby>=1950
tab cohort40

gen cohort50 = 1 if wdoby>= 1950
replace cohort50=0 if wdoby<1950 | wdoby>=1960
tab cohort50

gen cohort60 = 1 if wdoby>= 1960
replace cohort60=0 if wdoby<1960 | wdoby>=1970
tab cohort60

gen cohort70 = 1 if wdoby>= 1970
replace cohort70=0 if wdoby<1970 | wdoby>=1980
tab cohort70

gen cohort80 = 1 if wdoby>= 1980
replace cohort80=0 if wdoby<1980 | wdoby>=1990
tab cohort80

**********************  Preliminary Regressions by Cohort ********************************


reg ljwwagebt   pricert mschool olevel alevel adiploma tertiary  voctraining age if cohortb40==1
reg ljwwagebt   pricert mschool olevel alevel adiploma tertiary  voctraining age if cohort50==1
reg ljwwagebt   pricert mschool olevel alevel adiploma tertiary  voctraining age if cohort60==1
reg ljwwagebt   pricert mschool olevel alevel adiploma tertiary  voctraining age if cohort70==1
reg ljwwagebt   pricert mschool olevel alevel adiploma tertiary  voctraining age if cohort80==1


wait!

********************** Possible instrument Z ********************************

gen z=0 if wdoby>= 1959 | wdoby>=1971
replace z=1 if wdoby >=1965
drop if wdoby>1971 
tab z
su wdoby if z==0
su wdoby if z==1


ivreg ljwwagebt age age2 (pricert=z)  mschool olevel alevel adiploma tertiary  voctraining
ivreg2 ljwwagebt age age2 (schooling=z)  voctraining, firststage











