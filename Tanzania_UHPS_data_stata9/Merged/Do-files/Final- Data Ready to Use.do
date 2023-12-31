clear all



set matsize 800
set mem 1000m
****************************************************************************************
******************************* Shaping the Dataset  ***********************************
****************************************************************************************




*******************************   Tanzania 2004  ***************************************
*sjlog using "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\log-files\merging2", replace
use "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Tanz04Public.dta", clear



gen hid=int(wid/100)
rename age age04
gen female04=0 if gender=="Male"
replace female04=1 if gender=="Female"
rename hhregnam city
rename bornhere wborn
rename hh1a7 warrive
tab hh2a1_

rename hh2a7a_ apprentice04
rename hh2a16a_  relative
rename hh2c15p apppayperiod
rename hh2c16a appwage
rename  hh2c16d appwagestart

 *******************************   missin values in stopdate  ***************************************



replace hh2ab2a2y_ = 2000 in 176
replace hh2ab2a2y_ = 1985 in 210
replace hh2ab2a2y_ = 2003 in 463
replace hh2e1a2y_ = 2003 in 489
replace hh2ab2a2y_ = 1995 in 676
replace hh2ab2a2y_ = 2004 in 774
replace hh2e1a1y_ = . in 859
replace hh2e1a2y_ = . in 859
replace hh2a2a2y_ = 2000 in 861
replace hh2ab2a2m_ = 1 in 176
replace hh2ab2a2m_ = 6 in 210
replace hh2ab2a2y_ = 1991 in 343
replace hh2ab2a2m_ = 4 in 343
replace hh2ab2a2y_ = 2004 in 359
replace hh2ab2a2m_ = 1 in 359
replace hh2ab2a2y_ = 2004 in 357
replace hh2ab2a2m_ = 2 in 357
replace hh2e1a2m_ = 1 in 489
replace hh2ab2a2y_ = 1999 in 560
replace hh2ab2a2m_ = 1 in 560
replace hh2ab2a2m_ = 1 in 676
replace hh2ab2a2m_ = 1 in 774
replace hh2a2a2m_ = 3 in 861
replace hh2ab2a2y_ = 2001 in 888
replace hh2ab2a2m_ = 3 in 888
replace hh2ab2a2y_ = 2000 in 840
replace hh2ab2a2m_ = 6 in 840
replace hh2e1a2y_ = 1972 in 1151
replace hh2a2a2y_ = 1979 in 1152
replace hh2a2a2m_ = 2 in 1152
replace hh2ab2a2y_ = 2003 in 1179
replace hh2ab2a2m_ = 1 in 1179
replace hh2ab2a2y_ = 2000 in 1210
replace hh2ab2a2m_ = 3 in 1210
replace hh2ab2a2y_ = 2001 in 1380
replace hh2ab2a2m_ = 1 in 1380
replace hh2ab2a2y_ = 1996 in 1349
replace hh2ab2a2m_ = 6 in 1349
replace hh2a2a2y_ = 1995 in 1285
replace hh2a2a2m_ = 2 in 1285
replace hh2ab2a2y_ = 1998 in 1423
replace hh2ab2a2m_ = 3 in 1423
replace hh2ab2a2y_ = 2000 in 1425
replace hh2ab2a2m_ = 11 in 1425
replace hh2ab2a2y_ = 1999 in 1590
replace hh2ab2a2m_ = 2 in 1590
replace hh2ab2a2m_ = 1 in 463









gen starty= hh2a2a1y 
replace starty= hh2ab2a1y_ if hh2a2a1y== .
replace starty= hh2e1a1y_ if hh2a2a1y==.& hh2ab2a1y_==.



gen startm= hh2a2a1m
replace startm= hh2ab2a1m_ if hh2a2a1m==.
replace startm= hh2e1a1m_ if hh2a2a1m==. & hh2ab2a1m_==.
replace startm = 10 in 49
replace startm = 2 in 40
replace startm = 1 in 27

gen stopy= hh2a2a2y
replace stopy= hh2ab2a2y_ if hh2a2a2y==.
replace stopy= hh2e1a2y_ if hh2a2a2y==. & hh2ab2a2y_==.
replace stopy= 2004 if hh2e1a2y_ ==. &  hh2a2a2y==. & hh2ab2a2y_==.

gen stopm= hh2a2a2m
replace stopm= hh2ab2a2m_ if hh2a2a2m==.
replace stopm= hh2e1a2m_ if hh2a2a2m==. & hh2ab2a2m_==.
replace stopm= 7 if hh2e1a2m_ ==. & hh2a2a2m==. & hh2ab2a2m_==.



*rename hh2a2a1y  starty
*rename hh2a2a1m  startm
*rename hh2a2a2y  stopy
*rename hh2a2a2m  stopm














gen startdate = ym(starty, startm)
format startdate %tm

gen stopdate = ym(stopy, stopm)
format stopdate %tm





drop hh3c6s
drop hh3c5s 
drop hh3b10bs
drop hh2a3a_ 
drop hh1a13s 
drop hh1a16s 
drop hh1a20s 
drop hh3a26a
drop hh3a26b 
drop hh3a26c 
drop hh3a26d 
drop hh3a26e 
drop hh3a26f 
drop hh3a26g 
drop hh3a26h
drop hh3a26i
drop hh3a26k
drop hh3a26j
drop hh3a26m
drop hh3a26l 
drop hh3b5c 
drop hh3b4dp
drop hh3b7c 



********************* Firm Size ****************************

gen firmsize=.
replace firmsize=1 if hh2a21a_=="<5 employees"
replace firmsize=2 if hh2a21a_=="6-10 employees "
replace firmsize=3 if hh2a21a_=="11-20 employees"
replace firmsize=4 if hh2a21a_=="21-50 employees"
replace firmsize=5 if hh2a21a_=="51-100 employees"
replace firmsize=6 if hh2a21a_==">100 employees"/*** Clean manager/employer variables ***/
gen manager=1 if hh2a48a=="Yes"
replace manager=0 if hh2a48a=="No"
drop hh2a48a
rename hh2ab1x1 employs
gen employs_num=0 if employs=="No"
replace employs_num=hh2ab1x2 if hh2ab1x2!=.
*replace hours=80 if hours>80 & hours!=.




/*** Create occupational dummies  ***/
gen dum_self=0
gen dum_emp=0
gen dum_unemp=0
gen dum_not=0
gen dum_student=0
replace dum_student=1 if hh2e2a_=="Student (at school)" | hh2e2a_=="Student (at university)" | hh2e2a_=="Student (at university, or other post-secondary education)"
replace dum_self=1 if hh2a1_=="Self employed"
replace dum_emp=1 if hh2a1_=="Employed"
replace dum_unemp=1 if hh2a1_=="Unemployed (including students, housewives etc)" & hh2e2a_=="Unemployed: looking for work and unable to find any"
replace dum_not=1 if dum_emp==0 & dum_self==0 & dum_unemp==0

gen unemp=dum_unemp
gen wage=dum_emp
gen self=dum_self



gen empstatus= hh2a1_
replace empstatus="Unemployed" if empstatus=="Unemployed (including students, housewives etc)" | empstatus=="Retired"
replace empstatus= "Wage employed" if empstatus=="Employed" 
replace empstatus= "Self employed" if empstatus=="Self employed" 

tab empstatus

/*JOB*/


gen job ="."
replace job=hh2a6a_ if wage==1
replace job= hh2ab1a_ if self==1
replace job= hh2e2a_ if empstatus=="Unemployed"





gen fulltime=0 if hh2ab5a_=="No" | hh2a5a=="No"
replace fulltime=1 if hh2ab5a_=="Yes" | hh2a5a=="Yes"
rename hh2a5a permanentjob 
rename hh2a33a mafia
rename hh2a44a expected
rename hh2a46a promoted
gen expectedwage=0 if expected=="No"
replace expectedwage=1 if expected=="Yes"
rename hh2a59a happyatwork

rename hh2a57a comparejob

gen happy=0 if happyatwork=="Very unhappy"
replace happy=1 if happyatwork=="A bit unhappy"
replace happy=2 if happyatwork=="Neither happy nor unhappy"
replace happy=3 if happyatwork=="Reasonably happy"
replace happy=4 if happyatwork=="Very happy"




gen compare=0 if wage==1
replace compare=0 if comparejob=="Not hard at all"
replace compare=1 if comparejob=="Not as hard"
replace compare=2 if comparejob=="Just as hard"
replace compare=3 if comparejob=="A bit harder"
replace compare=4 if comparejob=="Much harder"
replace compare=. if comparejob=="No previous job"




/*** Why Occupational Choices  ***/
rename hh2ab62a_ whystartself
rename hh2ab62as whystartselfs
rename hh2ab63a_ whystopself
rename hh2ab63as whystopselfs
rename hh2a60a_ whyleftwage
rename hh2b1 ratherself
rename hh2b2 whyratherself
rename hh2b2s whyratherselfs
rename hh2b6 whyrathernotself
rename hh2b6s whyrathernotselfs



/*** Unemployment  ***/
rename hh2e3a_ timejobsearch
rename hh2e4a_ cashjobsearch
rename hh2e5as_ lookingfor
rename hh2e12a1_ cashunemp
gen familycash=0
replace familycash=1 if cashunemp=="Family income"



/*** Public sector dummy ***/
gen public04=0
replace public04=1 if hh2a26a=="State owned" | hh2a26a=="State and Private"
replace public04=1 if hh2a23a_=="Government"
replace public04=1 if hh2a61a_=="Public enterprise employee"

gen civil=0
replace civil=1 if hh2a61a_=="Civil servant"
gen ngo=0
replace ngo=1 if hh2a61a_=="International organisation employee"

gen foreign=0
replace foreign=1 if hh2a27a_!="Tanzanian" & hh2a27a_!=""
gen limited=0
replace limited=1 if hh2a23a_=="Limited company" 
gen union=0
replace union=1 if hh2a40a_=="Yes"





/*** Parental Variables ***/
rename hh3d1 dadedraw 
rename hh3d3 dadoccup
rename hh3d2 momedraw
rename hh3d4 momoccup
replace dadoccup=hh3d3s if dadoccup=="Other"
drop hh3d3s 
replace momoccup=hh3d4s if momoccup=="Other"
drop hh3d4s
foreach par in dad mom{
	gen `par'educ04=. if `par'edraw=="Don't know"
	replace `par'educ04=0 if `par'edraw=="None"
	replace `par'educ04=4 if `par'edraw=="Adult literacy"
	replace `par'educ04=6 if `par'edraw=="Primary"
	replace `par'educ04=6 if `par'edraw=="Koranic"
	replace `par'educ04=12 if `par'edraw=="Middle/dss"
	replace `par'educ04=14 if `par'edraw=="O Level"
	replace `par'educ04=16 if `par'edraw=="A Level"
	replace `par'educ04=14 if `par'edraw=="Vocational/Tech"
	replace `par'educ04=18 if `par'edraw=="Training college"
	replace `par'educ04=20 if `par'edraw=="University"
}
   
/*** Distance to Schooling ***/
gen distprim = .
gen distsec = .
replace distprim = .5  if hh1a9=="less than 1 km"
replace distprim = 2   if hh1a9=="1-3 km"
replace distprim = 4.5 if hh1a9=="3-6 km"
replace distprim = 8   if hh1a9=="6-10 km"
replace distprim = 15  if hh1a9=="more than 10km"
replace distsec = .5   if hh1a10=="less than 1 km"
replace distsec = 2    if hh1a10=="1-3 km"
replace distsec = 4.5  if hh1a10=="3-6 km"
replace distsec = 8    if hh1a10=="6-10 km"
replace distsec = 15    if hh1a10=="more than 10km"


/*** Married and Children ***/
gen children=hh3a3
replace children=0 if hh3a2=="No" & children==.
gen married=0 if hh3a1=="No"
replace married=1 if hh3a1=="Yes"
gen hhincwid=hh3a15






/*** Earnings (stopdate) ***/

gen rawearn_tanz04 = hh2c5a_
replace rawearn_tanz04 = hh2c31a_ if hh2c5a_==. & self==1
replace rawearn_tanz04 = hh2c36a_ if hh2c5a_==. & hh2c31a_==. & self==1
replace rawearn_tanz04 = rawearn_tanz04/4 if hh2c3a_ =="Month" | hh2c28a_=="Month"
replace rawearn_tanz04 = rawearn_tanz04*7 if hh2c3a_ =="Day" | hh2c28a_=="Day"
gen earn04= rawearn_tanz04  if hh2c3a_=="Hour" | hh2c28a_=="Hour"
replace earn04= rawearn_tanz04/hh2a54a_ if hh2c3a_!="Hour" | hh2c28a_!="Hour"
replace earn04= rawearn_tanz04/ hh2ab54a_ if hh2a54a_==.



gen other_source=0 if hh2c36x1a_=="No"
replace other_source=1 if hh2c36x1a_=="Yes"
gen what_other= hh2c36x2a_
gen other_earn= hh2c36x3a_



/*** Earnings (startdate) ***/
gen rawearnstart_tanz04 = hh2c5d_
replace rawearnstart_tanz04 = hh2c31c_ if hh2c5d_==. & self==1
replace rawearnstart_tanz04 = hh2c36c_ if hh2c5d_==. & hh2c31c_==. & self==1
replace rawearnstart_tanz04 = rawearnstart_tanz04/4 if hh2c3a_ =="Month" | hh2c28a_=="Month"
replace rawearnstart_tanz04 = rawearnstart_tanz04*7 if hh2c3a_ =="Day" | hh2c28a_=="Day"
gen earnstart04= rawearnstart_tanz04  if hh2c3a_=="Hour" | hh2c28a_=="Hour"
replace earnstart04= rawearnstart_tanz04/hh2a54a_ if hh2c3a_!="Hour" | hh2c28a_!="Hour"
replace earnstart04= rawearnstart_tanz04/hh2ab54a_ if hh2a54a_==.


gen hours_worked =.
replace hours_worked= hh2a54a_ if wage==1
replace hours_worked=hh2ab54a_ if self==1



/*Household */
gen hhhead=.
replace hhhead=0 if hh3a6=="No"
replace hhhead=1 if hh3a6=="Yes"
gen ownhouse=0 if hh3a16=="No"
replace ownhouse=1 if hh3a16=="Yes"
rename hh3a17 whenhouse
gen memberownhouse=0 if hh3a18=="No"
replace memberownhouse=1 if hh3a18=="Yes"


*additionaly to  employment
gen hhbusiness=0 if hh3a8=="No"
replace hhbusiness=1 if hh3a8=="Yes"
rename hh3a9 hhbustype



gen farming=0
replace farming=1 if hhbustype=="Farming"

gen manufacturing=0
replace manufacturing=1 if hhbustype=="Manufacturing"

gen services=0
replace services=1 if hhbustype=="Services"

gen trading=0
replace trading=1 if hhbustype=="Trading"


rename  hh3a10 hhbusstart 
gen othermemberearn=0 if hh3a12p=="No"
replace othermemberearn=1 if hh3a12p=="Yes"


/*Household Borrowing & Savings*/
gen memberborrow=0 if hh3b18=="No"
replace memberborrow=1 if hh3b18=="Yes"
gen debt=0 if hh3b8=="No"
replace debt=1 if hh3b8=="Yes"
gen debtcons=0
replace debtcons=1 if  hh3b9=="Meet current consumption needs"
gen debtbus=0
replace debtbus=1 if  hh3b9s=="business"
rename hh3b12ay debtduey
rename hh3b12am debtduem

gen debtdue = ym(debtduey, debtduem)
format debtdue %tm
gen save=0 if hh3c1=="No"
replace save=1 if hh3c1=="Yes"
gen jointsave=0 if hh3c7=="No"
replace jointsave=1 if hh3c7=="Yes"



/***Clean startup costs for self-employed (and deflate below)***/
gen startup=hh2c33a
replace startup=0 if hh2c32a=="No" & startup==.
sort wid stopdate startdate
gen survey=2004
rename hhinc hinc
rename hhhead xhhhead
*drop hh*
rename hinc hhincwid
rename xhhhead hhhead









save "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\04.dta", replace








*******************************   Tanzania 2005  ***************************************

clear all
use "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Tanz05Public.dta", clear

gen female05=0 if wsex=="Male"
replace female05=1 if wsex=="Female"
rename wregion city
rename js11_ employs
rename js12_ employs_num
replace  hid=int(wid/100) if hid==.

rename age age05



replace ju01_ = . in 4
replace ju02_ = . in 4
replace ju01_ = . in 8
replace ju02_ = . in 8
replace ju01_ = . in 10
replace ju02_ = . in 10
replace js06_ = 2005 in 30
replace js07_ = 3 in 30
replace je03_ = 1991 in 127
replace je04_ = 2 in 127
replace js03_ = . in 158
replace js04_ = . in 158
replace ju04_ = 2001 in 223
replace ju05_ = 6 in 223
replace js06_ = 2004 in 197
replace js07_ = 7 in 197
replace js06_ = 2004 in 234
replace js07_ = 10 in 234
replace js03_ = . in 293
replace js04_ = . in 293
replace js03_ = 2002 in 293
replace js04_ = 7 in 293
replace js06_ = 2002 in 292
replace js07_ = 7 in 292
replace ju01_ = . in 323
replace ju02_ = . in 323
replace ju02_ = . in 322
replace ju01_ = . in 344
replace js03_ = . in 406
replace js04_ = . in 406
replace ju02_ = . in 855
replace ju01_ = . in 855
replace ju01_ = . in 857
replace ju02_ = . in 857
replace ju02_ = . in 859
replace ju01_ = . in 859







gen starty= je05_ 
replace starty= js03_ if je05_== .
replace starty= ju01_ if je05_==.& js03_==.



gen startm= je06_
replace startm= js04_ if je06_==.
replace startm= ju02_ if je06_==. & js04_==.

gen stopy= je03_
replace stopy= js06_ if je03_==.
replace stopy= ju04_ if je03_==. & js06_==.
replace stopy= 2005 if ju04_ ==. &  je03_==. & js06_==.


gen stopm= je04_
replace stopm= js07_ if je04_==.
replace stopm= ju05_ if je04_==. & js07==.
replace stopm= 08 if ju05_==. &  je04_==. & js07==.











gen startdate = ym(starty, startm)
format startdate %tm

gen stopdate = ym(stopy, stopm)
format stopdate %tm

drop hh2a3a_

/*** Clean firm size variable ***/
gen firmsize=.
replace firmsize=1 if je18=="<5 employees" 
replace firmsize=2 if je18=="6-10 employees" 
replace firmsize=3 if je18=="11-20 employees" 
replace firmsize=4 if je18=="21-50 employees" 
replace firmsize=5 if je18=="51-100 employees" 
replace firmsize=6 if je18==">100 employees" 

/*** Clean manager/employer variables ***/


gen manager=1 if je50=="Yes" /*find hh variable name*/
replace manager=0 if je50=="No"
gen unemp=0
replace unemp=1 if ju08_=="Unemployed: looking for work"|ju08_=="Unemployed: looking for work and unable to find any"

/*** Create occupational dummies  ***/

gen wage=dum_emp
gen self=dum_self



gen empstatus= j1_ 
replace empstatus="Unemployed" if empstatus=="Unemployed (including students, housewives etc)"  | empstatus=="Retired"  |  dum_student==1 
replace empstatus= "Wage employed" if empstatus=="Employed" 
replace empstatus= "Self employed" if empstatus=="Self employed" 

tab empstatus

/*Job*/



gen job ="."
replace job=je11 if wage==1
replace job= js01 if self==1
replace job= ju08 if empstatus=="Unemployed"

tab empstatus



gen fulltime=0 if je10=="No" | js13_=="No"
replace fulltime=1 if je10=="Yes" | js13_=="Yes"
rename je10 permanentjob 
rename je32 mafia
rename je43 expected
rename je48 promoted
gen expectedwage=0 if expected=="No"
replace expectedwage=1 if expected=="Yes"
rename  je65 happyatwork
rename  je63 comparejob


/*Job*/





gen happy=0 if happyatwork=="Very unhappy"
replace happy=1 if happyatwork=="A bit unhappy"
replace happy=2 if happyatwork=="Neither happy nor unhappy"
replace happy=3 if happyatwork=="Reasonably happy "
replace happy=4 if happyatwork=="Very happy"



gen compare=0 if wage==1
replace compare=0 if comparejob=="Not hard at all"
replace compare=1 if comparejob=="Not as hard"
replace compare=2 if comparejob=="Just as hard"
replace compare=3 if comparejob=="A bit harder"
replace compare=4 if comparejob=="Much harder"
replace compare=. if comparejob=="No other jobs to compare "






/*** Why occupational choices  ***/
rename js15 whystartself
rename js16 whystartselfs
rename js17 whystopself
rename js18 whystopselfs
rename je66 whyleftwage
rename je68_ ratherself
rename je69_ whyratherself
rename je70_ whyratherselfs
rename je73_ whyrathernotself
rename je74_ whyrathernotselfs



/*** Unemployment  ***/
rename ju11 timejobsearch
rename ju12 cashjobsearch
rename ju13 lookingfor
rename ju25_ cashunemp
gen familycash=0
replace familycash=1 if cashunemp=="Family income"




/*** Public sector dummy ***/
gen public05=0
replace public05=1 if je20=="Government"
replace public05=1 if je22=="State owned" | je22=="State and Private"
replace public05=1 if je14=="Public enterprise employee"


gen civil=0
replace civil=1 if je14=="Civil servant"
gen ngo=0
replace ngo=1 if je14=="International organisation employee"

gen foreign=0
replace foreign=1 if je23_!="Tanzanian" & je23_!=""
gen limited=0
replace limited=1 if je20_=="Limited company"
gen union=0
replace union=1 if je39_=="Yes"


/*** Parental Variables ***/
rename hh3d1 dadedraw 
rename hh3d3 dadoccup
rename hh3d2 momedraw
rename hh3d4 momoccup
foreach par in dad mom{
	gen `par'educ05=. if `par'edraw=="Don't know"
	replace `par'educ05=0 if `par'edraw=="None"
	replace `par'educ05=4 if `par'edraw=="Adult literacy"
	replace `par'educ05=6 if `par'edraw=="Primary"
	replace `par'educ05=6 if `par'edraw=="Koranic"
	replace `par'educ05=12 if `par'edraw=="Middle/dss"
	replace `par'educ05=14 if `par'edraw=="O Level"
	replace `par'educ05=16 if `par'edraw=="A Level"
	replace `par'educ05=14 if `par'edraw=="Vocational/Tech"
	replace `par'educ05=18 if `par'edraw=="Training college"
	replace `par'educ05=20 if `par'edraw=="University"
}

/*** Distance to School ***/
*Note 4 observations where enumerators used wrong version of survey (distance in Km)
gen distprim = .
gen distsec = .
replace distprim = 2.5 if wl6dist=="0 to 5 minutes"  | wl6dist=="less than 1 km"
replace distprim = 13  if wl6dist=="6 to 20 minutes" | wl6dist=="1-3 km"
replace distprim = 40  if wl6dist=="21 minutes to an hour" 
replace distprim = 90  if wl6dist=="more than an hour" 
replace distsec = 2.5 if wl6dist_1=="0 to 5 minutes" 
replace distsec = 13  if wl6dist_1=="6 to 20 minutes" 
replace distsec = 40  if wl6dist_1=="21 minutes to an hour" 
replace distsec = 90  if wl6dist_1=="more than an hour" 


/*** Married and Children ***/
gen children=hh3a3
replace children=0 if hh3a2=="No" & children==.
gen married=0 if hh3a1=="No"
replace married=1 if hh3a1=="Yes"
gen hhincwid=hh3a15
replace hhincwid=.	if hhincwid==999999999
replace hhincwid=300000 if hhincwid==999300000
replace hhincwid=90000	if hhincwid==900009999
replace hhincwid=80000	if hhincwid==800009999
replace hhincwid=70000	if hhincwid==700009999
replace hhincwid=45000	if hhincwid==450009999
replace hhincwid=350000 if hhincwid==350000999
replace hhincwid=340000 if hhincwid==340000999
replace hhincwid=320000 if hhincwid==320000999
replace hhincwid=310000 if hhincwid==310000999
replace hhincwid=240000 if hhincwid==240000999
replace hhincwid=230000 if hhincwid==230000999
replace hhincwid=200000 if hhincwid==200000999
replace hhincwid=160000 if hhincwid==160000999
replace hhincwid=156000 if hhincwid==156000999
replace hhincwid=120000 if hhincwid==120000999
replace hhincwid=10000	if hhincwid==100009999




/*** Earnings (stopdate) ***/
gen rawearn_tanz05 = jrn05_
replace rawearn_tanz05 = js27_ if jrn05_==. & self==1
replace rawearn_tanz05 = js23_ if js27_==.  & self==1
replace rawearn_tanz05 = rawearn_tanz05/4 if jr01_ =="Month"| js19_=="Month"
replace rawearn_tanz05 = rawearn_tanz05*7 if jr01_ =="Day" | js19_=="Day"
gen earn05=rawearn_tanz05 if jr01_=="Hour" | js19_=="Hour"
replace earn05= rawearn_tanz05/je60_ if jr01_!="Hour" | js19_!="Hour"
replace earn05= rawearn_tanz05/ js14_ if je60_==.


gen other_source=0 if js30=="No"
replace other_source=1 if js30=="Yes"
gen what_other= js31
gen other_earn= js33


/*** Earnings (startdate) ***/
gen rawearnstart_tanz05 = jrs05_
replace rawearnstart_tanz05 = js47_ if jrs05_==. & self==1
replace rawearnstart_tanz05 = js49_ if jrs05_==. & js47_==. & self==1
replace rawearnstart_tanz05 = rawearnstart_tanz05/4 if jr01_ =="Month"| js19_=="Month"
replace rawearnstart_tanz05 = rawearnstart_tanz05*7 if jr01_ =="Day"   | js19_=="Day"
gen earnstart05=rawearnstart_tanz05 if jr01_=="Hour" | js19_=="Hour"
replace earnstart05= rawearnstart_tanz05/je60_ if jr01_!="Hour" | js19_!="Hour"
replace earnstart05= rawearnstart_tanz05/ js14_ if je60_==.


gen hours_worked=.
replace hours_worked=je60_ if wage==1
replace hours_worked=js14_ if self==1





/*
/*Household */
gen hhhead=.
replace hhhead=0 if hh3a6=="No"
replace hhhead=1 if hh3a6=="Yes"
rename hh3a16 ownhouse
rename hh3a17 whenhouse
rename hh3a18 memberownhouse
*additionaly to wage employment
rename hh3a8 hhbusiness
rename hh3a9 hhbustype
gen hhfarming=0
replace hhfarming=1 if hhbustype=="Farming"

gen hhmanufacturing=0
replace hhmanufacturing=1 if hhbustype=="Manufacturing"

gen hhservices=0
replace hhservices=1 if hhbustype=="Services"

gen hhtrading=0
replace hhtrading=1 if hhbustype=="Trading"

rename  hh3a10 hhbusstart 



/*Household Borrowing & Savings*/
rename hh3b18 memberborrow
rename hh3b8 debt
gen debtcons=0
replace debtcons=1 if  hh3b9=="Meet current consumption needs"
gen debtbus=0
replace debtbus=1 if  hh3b9s=="business"
rename hh3b12ay debtdueyear
drop  if debtdueyear=="Already overdue"
gen debtduey=0
replace debtduey=2005 if debtdueyear=="2005"
replace debtduey=2006 if debtdueyear=="2006"
replace debtduey=2007 if debtdueyear=="2007"

tab debtduey
rename hh3b12am debtduem

gen debtdue = ym(debtduey, debtduem)
format debtdue %tm


rename hh3c1 save
rename hh3c7 jointsave

*/

/*Household */
gen hhhead=.
replace hhhead=0 if hh3a6=="No"
replace hhhead=1 if hh3a6=="Yes"
gen ownhouse=0 if hh3a16=="No"
replace ownhouse=1 if hh3a16=="Yes"
rename hh3a17 whenhouse
gen memberownhouse=0 if hh3a18=="No"
replace memberownhouse=1 if hh3a18=="Yes"


*additionaly to wage employment
gen hhbusiness=0 if hh3a8=="No"
replace hhbusiness=1 if hh3a8=="Yes"
rename hh3a9 hhbustype
gen farming=0
replace farming=1 if hhbustype=="Farming"

gen manufacturing=0
replace manufacturing=1 if hhbustype=="Manufacturing"

gen services=0
replace services=1 if hhbustype=="Services"

gen trading=0
replace trading=1 if hhbustype=="Trading"


rename  hh3a10 hhbusstart 

/*Household Borrowing & Savings*/
gen memberborrow=0 if hh3b18=="No"
replace memberborrow=1 if hh3b18=="Yes"
gen debt=0 if hh3b8=="No"
replace debt=1 if hh3b8=="Yes"
gen debtcons=0
replace debtcons=1 if  hh3b9=="Meet current consumption needs"
gen debtbus=0
replace debtbus=1 if  hh3b9s=="business"
rename hh3b12ay debtdueyear
drop  if debtdueyear=="Already overdue"
gen debtduey=0
replace debtduey=2005 if debtdueyear=="2005"
replace debtduey=2006 if debtdueyear=="2006"
replace debtduey=2007 if debtdueyear=="2007"

tab debtduey
rename hh3b12am debtduem

gen debtdue = ym(debtduey, debtduem)
format debtdue %tm

gen save=0 if hh3c1=="No"
replace save=1 if hh3c1=="Yes"
gen jointsave=0 if hh3c7=="No"
replace jointsave=1 if hh3c7=="Yes"



/*** Start-up capital ***/
/*note that this question was not asked of those who described themselves as "traders"*/
gen startup=js26
replace startup=1000000 if startup==100000099
replace startup=100000  if startup==100000999
replace startup=10000   if startup==100009999
replace startup=12000   if startup==120009999
replace startup=15000   if startup==150009999
replace startup=200000  if startup==200000999
replace startup=24000   if startup==240009999
replace startup=300000  if startup==300000000
replace startup=300000  if startup==300000999
replace startup=340000  if startup==340000999
replace startup=35000   if startup==350009999
replace startup=40000   if startup==400009999
replace startup=4000    if startup==400099999
replace startup=50000   if startup==500009999
replace startup=5000    if startup==500099999
replace startup=500     if startup==500999999
replace startup=60000   if startup==600009999
replace startup=700000  if startup==700000999
replace startup=7000    if startup==700099999
replace startup=8000    if startup==800099999
replace startup=.       if startup==999999999
replace startup=10000   if startup==100001000
replace startup=10000   if startup==100010000
replace startup=10000   if startup==120010000
replace startup=15000   if startup==150010000
replace startup=200000   if startup==20000099
replace startup=24000   if startup==240010000
replace startup=300000   if startup==30000099
replace startup=340000   if startup==34000099
replace startup=40000   if startup==400009984
replace startup=400000   if startup==40010000
replace startup=500000   if startup==50010000
replace startup=50000   if startup==501000000
replace startup=60000   if startup==600009984
replace startup=7000   if startup==700099968 
replace startup=8000   if startup==800099968 
replace startup=200000 if startup==200000992
replace startup=300000 if startup==300000992
replace startup=340000 if startup==340000992
replace startup=400000 if startup==400100000
replace startup=500000 if startup==500100000

gen survey=2005
sort wid stopdate startdate
rename hhinc hinc
rename hhhead xhhhead
*drop je* js* jr* ju*
/*hh*/
rename hinc hhincwid
rename xhhhead hhhead
duplicates report wid startdate
duplicates tag wid startdate, gen(isdup)
drop if isdup
duplicates report wid startdate





save "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\05.dta", replace







*******************************   Tanzania 2006  ***************************************

clear all
use "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Tanz06Public.dta", clear
drop  wlarusha wldar wldodoma wliringa wlkagera wlkigoma wlkilimanjaro wllindi wlmanyara wlmara wlmbeya wlmorogoro wlmtwara wlmwanza wlpwani
drop wlrukwa wlruvuma wlshinyanga wlsingida wlsabora wltanga wlunguja wlnortha wlmkoani wlchakechake wlarushaward wlmonduli
drop wlarumeru wlkaratu  wlkinodoni wlilala wltemeke wliringau wliringar wlmufundi wlnjombe wlmakete wlkilolo wlludewa wlulanga
drop wlkilombero wlmorogorou wlmorogoror wlmvomero wlkilosa wlkorogwe wlmuheza wltangaward wlhandeni wlpangani wllushoto 
drop wl6dist  wl6dist_1 

gen female06=0 if wsex=="Male"
replace female06=1 if wsex=="Female"
gen empstatus=jwageself




gen age06= wdoby - 2006

replace empstatus = "Wage job" in 23
replace empstatus = "Wage job" in 24
replace empstatus = "Wage job" in 204
replace empstatus = "Wage job" in 228
replace empstatus = "Self-employed business" in 239
replace empstatus = "Wage job" in 262
replace empstatus = "Self-employed business" in 650
replace empstatus = "Self-employed busines" in 1014
replace empstatus = "Self-employed business" in 1014
replace empstatus = "Self-employed business" in 1023
replace empstatus = "Self-employed business" in 1028
replace empstatus = "Self-employed business" in 1030
replace empstatus = "Self-employed business" in 1119
replace empstatus = "Wage job" in 455
replace empstatus = "Wage job" in 468
replace empstatus = "Wage job" in 481
replace empstatus = "Wage job" in 489
replace empstatus = "Wage job" in 491
replace empstatus = "Wage job" in 927
replace empstatus = "Wage job" in 1061
replace empstatus = "Wage job" in 1108
replace empstatus = "Wage job" in 1173


replace empstatus="Self employed" if empstatus=="Self-employed business"
gen self=0
replace self=1 if empstatus=="Self employed"
replace empstatus="Wage employed" if empstatus=="Wage job"
gen wage=0
replace wage=1 if empstatus=="Wage employed"
replace empstatus="Unemployed" if jnres!=. |  juhours!=.


/*** Clean firm size variable ***/
gen firmsize=.
replace firmsize=1 if jwfirmsize=="<5 employees" 
replace firmsize=2 if jwfirmsize=="6-10 employees" 
replace firmsize=3 if jwfirmsize=="11-20 employees" 
replace firmsize=4 if jwfirmsize=="21-50 employees" 
replace firmsize=5 if jwfirmsize=="51-100 employees" 
replace firmsize=6 if jwfirmsize==">100 employees" 




/*Sector*/
gen public06=0
replace public06=1 if jwsector=="Government" | jwsector=="State-owned firm"






gen starty= jsstarty
replace starty=jwstarty if jsstarty==.
replace starty=justarty if jwstarty==. & jsstarty==.



gen startm= 8

gen stopy=2006


gen stopm= 7


gen startdate = ym(starty, startm)
format startdate %tm

gen stopdate = ym(stopy, stopm)
format stopdate %tm



/*** Preserve raw earnings for cleaning & checks ***/


gen  rawearn_tanz06= jwwagebt
replace rawearn_tanz06= jsprofit*4 if rawearn_tanz06==. & self==1
replace rawearn_tanz06= rawearn_tanz06*4 if jwpayperiod=="per week"
replace rawearn_tanz06= rawearn_tanz06*12 if jwpayperiod=="per day"
gen earn06 = rawearn_tanz06/jshours
replace earn06=rawearn_tanz06/jwhours if jshours==.



gen survey=2006
sort wid startdate
duplicates report wid startdate
duplicates tag wid startdate, gen(isdup)
drop if isdup==1






save "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\06.dta", replace



/***************************************
 ********* Append 2004 & 2005 ***********
 ***************************************/

use "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\04.dta", clear
append using "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\05.dta"
sort wid stopdate startdate


gen jid=1
by wid: replace jid=2 if startdate[_n-1]!=.
by wid: replace jid=3 if startdate[_n-2]!=.
by wid: replace jid=4 if startdate[_n-3]!=.
by wid: replace jid=5 if startdate[_n-4]!=.
by wid: replace jid=6 if startdate[_n-5]!=.
by wid: replace jid=7 if startdate[_n-6]!=.
by wid: replace jid=8 if startdate[_n-7]!=.
by wid: replace jid=9 if startdate[_n-8]!=.
by wid: replace jid=10 if startdate[_n-9]!=.
by wid: replace jid=11 if startdate[_n-10]!=.
sort wid jid
tsset wid jid
xtdes



/*We drop individuals who tell us the same informations at the second interview because they didnt change job*/
*In order to do that we first create a consistent variable which tells us which activity the individual is performing*
gen activity=""
replace activity="Non-manufacturing (Salaried/waged)" if job=="Non-manufacturing (Salaried/waged)" |  job=="Manufacturing" | hh2a6as_!="" | je14!="" |je15!=""
replace activity="Own account worker (self employed)" if job=="Own account worker (self employed)" | job=="Own business" | job=="Other non-salaried"| job=="Trading" |hh2ab1as_!=""
replace activity="Disabled, or sick, and unable to work" if job=="Disabled, or sick, and unable to work" | job=="partly I was sick and then later looking 4 job"
replace activity="Agriculture" if job=="Farming / livestock" | hh2e2as_=="farming" | hh2e2as_=="farming "
replace activity="House wife" if job=="House wife" | job=="as unpaid family worker and later house" | job=="part as a family worker and later h/wife"
replace activity="Student" if job=="Student (at school)" | job=="Student (at university)" | job=="Student (at university, or other post-secondary education)"
replace activity="Looking for work and unable" if hh2e2as=="apprinters/looking forjob" | job=="Unemployed: looking for work and unable to find any" | job=="looking for a job"
replace activity="Too young to work" if job=="Too young to work" | hh2e2as_=="too young to work and later as house wife"
replace activity="Unpaid family worker, helping with domestic and other family work." if hh2e2as=="working under my relatives without payment" | hh2e2as=="guarding training" | job=="Unpaid family worker, helping with domestic and other family work." |job=="as family worker and later as house wife"| job=="as a family worker later as a housewife"
replace activity="Not looking" if job=="Unemployed: not at paid work and not looking for work"
replace activity="Retired" if job=="waiting to get capital from his son" | job=="decided to stop working due to lucky  of energy" |job=="Retreched looking for capital to establish busines"
















replace empstatus= "Wage employed" if empstatus=="" & (ratherself=="Rather work for own account" |  ratherself=="Rather not work for own account")
replace startdate= l.startdate if startdate==. & stopdate==l.stopdate & survey==2005
by wid: gen j=1 if startdate== f.startdate & survey==2004 & stopdate==534


replace startdate = 514 in 1041

*Out of 490 of individuals interviewed twice, 425 did not switch activity in during the following wave*
drop if j==1 & empstatus==""
by wid: gen b=1 if startdate== f.startdate & survey==2004 & stopdate==534
by wid: gen c=1 if startdate== l.startdate & survey==2005 & stopdate==547
by wid: replace stopdate=547 if stopdate==534 & b==1
drop if c==1

by wid: gen d=1 if whyleftwage=="Still in job" | whystopself=="Still in this activity"
by wid: gen e=1 if d==1 & l.d==1
by wid: replace stopdate=547 if stopdate==534 & e==1
drop if e==1


drop jid
sort wid stopdate startdate
gen jid=1
by wid: replace jid=2 if startdate[_n-1]!=.
by wid: replace jid=3 if startdate[_n-2]!=.
by wid: replace jid=4 if startdate[_n-3]!=.
by wid: replace jid=5 if startdate[_n-4]!=.
by wid: replace jid=6 if startdate[_n-5]!=.
by wid: replace jid=7 if startdate[_n-6]!=.
by wid: replace jid=8 if startdate[_n-7]!=.
by wid: replace jid=9 if startdate[_n-8]!=.
by wid: replace jid=10 if startdate[_n-9]!=.
by wid: replace jid=11 if startdate[_n-10]!=.
sort wid jid
tsset wid jid
xtdes

duplicates tag wid startdate, gen(iddup)
drop if iddup==1 & job=="."






****************************************************************
***************** Define variables of interest *****************
****************************************************************


/* Female */
gen female=female04
replace female= female05 if female04==.

/*Married and Children*/
by wid: egen maxmarried= max(married)
by wid: egen maxchildren= max(children)


/*Why left job*/
gen whyleftjob= whyleftwage
replace whyleftjob= whystopself if self==1
replace whyleftjob=whystopselfs if  whystopself=="Other"



/* Parental education*/
gen fed= dadeduc04
replace fed=dadeduc05 if survey==2005
by wid: egen fedmax=max(fed)
by wid: replace fed= fedmax

gen med= momeduc04
replace med=momeduc05 if survey==2005
by wid: egen medmax=max(med)
by wid: replace med= medmax 

/*Commutant*/

rename hh2a4a_ commute
replace commute= je09 if survey==2005



rename hh3a12 earnmembers
rename hh3a15 hhoverearn


/*Public Sector*/
gen public=public04 if survey==2004
replace public=public05 if survey==2005


/* EARNINGS (end job) */
gen earn=earn04
replace earn= earn05 if earn04==.
gen learn= ln(earn)


gen earnstart=earnstart04
replace earnstart= earnstart05 if earnstart04==.
gen learnstart= ln(earnstart)


drop unemp
gen unemp=0
replace unemp=1 if empstatus=="Unemployed"

/* AGE */

gen age= age04
replace age= age05 if age04==.
replace age=age05 if age04==. & age05==.
replace age = 58 in 1232
replace age = 58 in 1233
replace age = 58 in 1234
gen age2= age^2/100
by wid: egen minage= min(age)
by wid: egen maxage= max(age)


/* TENURE */
gen temp=startdate if startdate>stopdate
replace startdate=stopdate if temp!=.
replace stopdate=temp if temp!=.
drop temp
replace startdate=. if startdate==-240
replace stopdate=. if stopdate==-240
gen startyear=(23520+startdate)/12
gen stopyear=(23520+stopdate)/12
recast int startyear stopyear, force




*sjlog using "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\log-files\6", replace
gen  tenure=.
replace  tenure = (stopyear - startyear) if (empstatus=="Wage employed"| activity=="Unpaid family worker, helping with domestic and other family work." |  empstatus=="Self employed")



gen tenure2=tenure^2/100 
by wid: gen experience= sum(tenure) 
gen experience2=experience^2/100
sort wid jid
list wid startdate stopdate empstatus tenure experience in 16/35, sepby(wid)
*sjlog close


***NEW****
*DUMMY VARIABLE CURRENT*
by wid: gen x =_n
by wid: egen max_activity= max(x)
gen current=0
replace current=1 if jid==max_activity


/*Whyleft*/
tab whystopself  whyleftwage
gen whyleft_= whyleftwage if f.wage==0
replace whyleft_=whystopself if f.self==0                    


           



/*Consumption*/
gen cons_meat= hh3ax4a
gen cons_fish= hh3ax4b
gen cons_eggs= hh3ax4c
gen cons_milk= hh3ax4d
gen cons_bean= hh3ax4e

pca  cons_meat cons_fish cons_eggs cons_milk cons_bean
predict pc1, score
rename pc1 hhconsumption
gen hh_cons= hhconsumption + 2.577171 

sum hh_cons





*Household DEATHS*
gen hhdeath=1 if hh3a28=="Yes"
replace hhdeath=0 if hh3a28=="No"


gen datedeath= hh3a30a
replace datedeath=hh3a30b if hh3a30b!=.
replace datedeath=hh3a30c if hh3a30c!=.
replace datedeath=hh3a30d if hh3a30d!=.

******************************
*** Hours worked per week ****
******************************

gen hours_week= hh2a54a_  if wage==1 & survey==2004
replace hours_week= je60_ if wage==1 & survey==2005
replace hours_week= hh2ab54a_ if self==1 & survey==2004
replace hours_week= js14_ if self==1 & survey==2005




*on hhbusiness*
sort hid
by hid: egen hbus=max(hhbusiness)
by hid: replace hhbusiness=hbus

sort wid jid


****NEW END***



/*Duration*/
gen duration = (stopyear - startyear)
gen astart04= survey - starty if survey==2004
gen astart05= survey - starty  if survey==2005
by wid: gen agestart= age - astart04 
by wid: replace agestart= age - astart05 if agestart==.
by wid: replace agestart=.  if agestart<0
by wid: gen agestart2=agestart^2/100
by wid: gen agestop=agestart + duration
tab agestart if jid==1


sort wid jid


*fix up the mess from letting enumerators enter free text on highest ed variable
tab  hh1a15
gen highested=""
replace highested="None" if hh1a15=="Didn't go to school"
replace highested="" if hh1a15=="HH1A11A"
replace highested="Masters" if hh1a15=="Masters"
replace highested="Bachelor" if hh1a15=="Bachelor"
replace highested="Ordinary diploma" if hh1a15=="Ordinary diploma"
replace highested="Advanced diploma" if hh1a15=="Advanced diploma"
replace highested="Middle School cert." if hh1a15=="cambridge certicate and middle shool ce"
replace highested="Middle School cert." if hh1a15=="Middle School cert."
replace highested="O Level" if hh1a15=="O Level"
replace highested="A Level" if hh1a15=="A Level"
replace highested="Bachelor" if hh1a15=="cerificate in teaching"
replace highested="None" if hh1a15=="didn't go school"
replace highested="None" if hh1a15=="didn't go to sc"
replace highested="None" if hh1a15=="didn't go to school"
replace highested="None" if hh1a15=="didn’t go to school"
replace highested="Primary" if hh1a15=="form two"
replace highested="Primary" if hh1a15=="never completed form four"
replace highested="None" if hh1a15=="never got any certificate since did not"
replace highested="None" if hh1a15=="None"
replace highested="None" if hh1a15=="none"
replace highested="None" if hh1a15=="nothing"
replace highested="Ordinary diploma" if hh1a15=="ordinary diploma"
replace highested="Primary" if hh1a15=="standard eight"
replace highested="Primary" if hh1a15=="std 10 certificate"
replace highested="Primary" if hh1a15=="std 2"
replace highested="Primary" if hh1a15=="std 5"
replace highested="Primary" if hh1a15=="std 6"
replace highested="Primary" if hh1a15=="Primary Certificate"
replace highested="Bachelor" if hh1a15=="teaching certificate"
replace highested="Bachelor" if hh1a15=="two years technical college"
replace highested="Vocational" if hh1a15=="Vocational training cert."
replace highested="Vocational" if hh1a15=="T/T Certificate"



gen wdoby = survey - age

tab highested
gen schooling= 0 if highested=="None"
replace schooling=7  if highested=="Primary" & wdoby>1962
replace schooling=4  if highested=="Primary" & wdoby<=1962
replace schooling=8 if highested=="Middle School cert."
replace schooling=11  if highested=="O Level" & wdoby>1962
replace schooling=12  if highested=="O Level" & wdoby<=1962
replace schooling=13  if highested=="A Level" & wdoby>1962
replace schooling=14  if highested=="A Level" & wdoby<=1962
replace schooling=12  if highested=="Ordinary diploma" 
replace schooling=13  if highested=="Advanced diploma" 
replace schooling=16  if highested=="Bachelor" & wdoby>1962
replace schooling=17  if highested=="Bachelor" & wdoby<=1962
replace schooling=17  if highested=="Masters" 
replace schooling=12  if highested=="Vocational" 

gen schooling04= schooling if survey==2004
gen schooling05= schooling if survey==2005
gen p=0
by wid: replace p=1 if schooling!= l.schooling & jid!=1
by wid: egen pmax=max(p)
list wid jid schooling p if pmax==1, sepby(wid)
by wid: replace schooling=schooling04 if pmax==1
by wid:egen mschool= max(schooling)
by wid: replace schooling= mschool if schooling==.

tab schooling
gen schooling2= schooling^2/100



/*MOREOVER*/


gen primary=0
replace primary=1 if schooling<8

gen secondary=0
replace secondary=1 if schooling>=8 & schooling<=13 & highested!="Vocational" 

gen tertiary=0
replace tertiary=1 if schooling>13

gen	 vocational=0
replace vocational=1 if highested=="Vocational"

sum primary secondary tertiary vocational


/*Age Left Schooling*/
		 
rename hh1a8 leftschool

  
by wid: gen z= survey - leftschool if survey==2004
by wid: gen weleftage= age- z	 if  survey==2004
by wid: replace weleftage= (7 + weprim + wesecond) if survey==2005
replace weleftage=. if weleftage<5
by wid: egen mweleftage=max(weleftage)
by wid: replace weleftage=mweleftage
rename weleftage ageleftschool


/*****************************************************************************************************
 *************************************** Cohorts   ************************************************
 *****************************************************************************************************/



 


 rename wdoby doby
 
  gen bc40=0
 replace bc40=1 if doby<1940
 gen c40=0 
 replace c40=1 if doby >=1940 & doby<1945
 gen c45=0 
 replace c45=1 if doby >=1945 & doby<=1949
 gen c50=0 
 replace c50=1 if doby >=1950 & doby<1955
 gen c55=0 
 replace c55=1 if doby >=1955 & doby<=1959
 gen c60=0 
 replace c60=1 if doby >=1960 & doby<1965
 gen c65=0 
 replace c65=1 if doby >=1965 & doby<= 1969
 gen c70=0 
 replace c70=1 if doby >=1970 & doby< 1975
 gen c75=0 
 replace c75=1 if doby >=1975 & doby<= 1979
 gen c80=0 
 replace c80=1 if doby >=1980 & doby< 1985
 gen c85=0 
 replace c85=1 if doby >=1985 & doby<= 1989
  gen c90=0 
 replace c90=1 if doby >=1990 & doby<= 1999
 
 

 gen cohort=0
 replace cohort=40 if c40==1
 replace cohort=45 if c45==1
 replace cohort=50 if c50==1
 replace cohort=55 if c55==1
 replace cohort=60 if c60==1
 replace cohort=65 if c65==1
 replace cohort=70 if c70==1
 replace cohort=75 if c75==1
 replace cohort=80 if c80==1
 replace cohort=85 if c85==1
 replace cohort=90 if c90==1
 
 
 
 
*sjlog using "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\log-files\4", replace
tab cohort, sum(schooling)




********************************************************************************
****Creating a household asset business. Following Filmer and  Pritchett******
********************************************************************************




list wid jid hhove hh3a27a hh3a27b hh3a27c hh3a27d hh3a27e hh3a27f hh3a27g hh3a27h hh3a27i  hh3a27j hh3a27k  hh3a27l hh3a27m , sepby(wid)

gen watch=0 if hh3a24a=="No"
replace watch=1 if hh3a24a=="Yes"
tab watch hh3a24a


gen bicycle=0 if hh3a24b=="No"
replace bicycle=1 if hh3a24b=="Yes"
tab bicycle hh3a24b

gen radio=0 if hh3a24c=="No"
replace radio=1 if hh3a24c=="Yes"
tab radio hh3a24c

gen music_system=0 if hh3a24d=="No"
replace music_system=1 if hh3a24d=="Yes"
tab music_system hh3a24d

gen jewellery=0 if hh3a24e=="No"
replace jewellery=1 if hh3a24e=="Yes"
tab jewellery hh3a24e

gen motor_vehicle=0 if hh3a24f=="No"
replace motor_vehicle=1 if hh3a24f=="Yes"
tab motor_vehicle hh3a24f

gen fridge=0 if hh3a24g=="No"
replace fridge=1 if hh3a24g=="Yes"
tab fridge hh3a24g

gen television=0 if hh3a24h=="No"
replace television=1 if hh3a24h=="Yes"
tab television hh3a24h

gen mobile_phone=0 if hh3a24i=="No"
replace mobile_phone=1 if hh3a24i=="Yes"
tab mobile_phone hh3a24i

gen video_recorder=0 if hh3a24j=="No"
replace video_recorder=1 if hh3a24j=="Yes"
tab video_recorder hh3a24j

gen telephone=0 if hh3a24k=="No"
replace telephone=1 if hh3a24k=="Yes"
tab telephone hh3a24k

gen farm=0 if hh3a24l=="No"
replace farm=1 if hh3a24l=="Yes"
tab farm hh3a24l

gen charcoal_iron=0 if hh3a24m=="No"
replace charcoal_iron=1 if hh3a24m=="Yes"
tab charcoal_iron hh3a24m


pca  watch bicycle radio music_system motor_vehicle jewellery  fridge television mobile_phone  video_recorder telephone farm charcoal_iron
predict pc1, score
rename pc1 hhassetts
gen asset= hhassetts + 2.9



*********************************************************
******************* Deflator ***************************
*********************************************************

*1)Consumer price index (2005 = 100)*

gen  cpi65= 0.15   
gen  cpi66= 0.16   
gen  cpi67= 0.18   
gen  cpi68= 0.21    
gen  cpi69= 0.25   
gen  cpi70= 0.25   
gen  cpi71= 0.27    
gen  cpi72= 0.29   
gen  cpi73= 0.32    
gen  cpi74= 0.38    
gen  cpi75= 0.48   
gen  cpi76= 0.51   
gen  cpi77= 0.57   
gen  cpi78= 0.61    
gen  cpi79= 0.68    
gen  cpi80= 0.89    
gen  cpi81= 1.12    
gen  cpi82= 1.44    
gen  cpi83= 1.83    
gen  cpi84= 2.49    
gen  cpi85= 3.32    
gen  cpi86= 4.40    
gen  cpi87= 5.72    
gen  cpi88= 7.50    
gen  cpi89= 9.44    
gen  cpi90= 12.83  
gen  cpi91= 16.51   
gen  cpi92= 20.12   
gen  cpi93= 25.20   
gen  cpi94= 33.79   
gen  cpi95= 43.06   
gen  cpi96= 52.09   
gen  cpi97= 60.47   
gen  cpi98= 68.21   
gen  cpi99= 73.59   
gen  cpi00= 77.95   
gen  cpi01= 81.96   
gen  cpi02= 86.32   
gen  cpi03= 90.90   
gen  cpi04= 95.21   
gen  cpi05= 100.00  
gen  cpi06= 107.25  



gen earnPV= earn*(cpi06/cpi65) if stopy==1965 & earn!=.
replace earnPV= earn*(cpi06/cpi66) if stopy==1966 & earn!=.
replace earnPV= earn*(cpi06/cpi67) if stopy==1967 & earn!=.
replace earnPV= earn*(cpi06/cpi68) if stopy==1968 & earn!=.
replace earnPV= earn*(cpi06/cpi69) if stopy==1969 & earn!=.
replace earnPV= earn*(cpi06/cpi70) if stopy==1970 & earn!=.
replace earnPV= earn*(cpi06/cpi71) if stopy==1971 & earn!=.
replace earnPV= earn*(cpi06/cpi72) if stopy==1972 & earn!=.
replace earnPV= earn*(cpi06/cpi73) if stopy==1973 & earn!=.
replace earnPV= earn*(cpi06/cpi74) if stopy==1974 & earn!=.
replace earnPV= earn*(cpi06/cpi75) if stopy==1975 & earn!=.
replace earnPV= earn*(cpi06/cpi76) if stopy==1976 & earn!=.
replace earnPV= earn*(cpi06/cpi77) if stopy==1977 & earn!=.
replace earnPV= earn*(cpi06/cpi78) if stopy==1978 & earn!=.
replace earnPV= earn*(cpi06/cpi79) if stopy==1979 & earn!=.
replace earnPV= earn*(cpi06/cpi80) if stopy==1980 &  earn!=.
replace earnPV= earn*(cpi06/cpi81) if stopy==1981& earn!=.
replace earnPV= earn*(cpi06/cpi82) if stopy==1982& earn!=.
replace earnPV= earn*(cpi06/cpi83) if stopy==1983& earn!=.
replace earnPV= earn*(cpi06/cpi84) if stopy==1984& earn!=.
replace earnPV= earn*(cpi06/cpi85) if stopy==1985& earn!=.
replace earnPV= earn*(cpi06/cpi86) if stopy==1986& earn!=.
replace earnPV= earn*(cpi06/cpi87) if stopy==1987& earn!=.
replace earnPV= earn*(cpi06/cpi88) if stopy==1988& earn!=.
replace earnPV= earn*(cpi06/cpi89) if stopy==1989& earn!=.
replace earnPV= earn*(cpi06/cpi90) if stopy==1990& earn!=.
replace earnPV= earn*(cpi06/cpi91) if stopy==1991& earn!=.
replace earnPV= earn*(cpi06/cpi92) if stopy==1992& earn!=.
replace earnPV= earn*(cpi06/cpi93) if stopy==1993& earn!=.
replace earnPV= earn*(cpi06/cpi94) if stopy==1994& earn!=.
replace earnPV= earn*(cpi06/cpi95) if stopy==1995& earn!=.
replace earnPV= earn*(cpi06/cpi96) if stopy==1996& earn!=.
replace earnPV= earn*(cpi06/cpi97) if stopy==1997& earn!=.
replace earnPV= earn*(cpi06/cpi98) if stopy==1998& earn!=.
replace earnPV= earn*(cpi06/cpi99) if stopy==1999& earn!=.
replace earnPV= earn*(cpi06/cpi00) if stopy==2000& earn!=.
replace earnPV= earn*(cpi06/cpi01) if stopy==2001& earn!=.
replace earnPV= earn*(cpi06/cpi02) if stopy==2002& earn!=.
replace earnPV= earn*(cpi06/cpi03) if stopy==2003& earn!=.
replace earnPV= earn*(cpi06/cpi04) if stopy==2004& earn!=.
replace earnPV= earn*(cpi06/cpi05) if stopy==2005& earn!=.
replace earnPV= earn*(cpi06/cpi06) if stopy==2006& earn!=.





/* 2) Justin's */





gen rearn95=earn/268.3385 if stopyear==1980
replace rearn95=(earn/299.7498)*100    if stopyear==1981
replace rearn95=(earn/315.0255)*100    if stopyear==1982
replace rearn95=(earn/298.3527)*100    if stopyear==1983
replace rearn95=(earn/243.2069)*100    if stopyear==1984
replace rearn95=(earn/273.5972)*100    if stopyear==1985
replace rearn95=(earn/170.5359)*100    if stopyear==1986
replace rearn95=(earn/94.08943)*100    if stopyear==1987
replace rearn95=(earn/137.126)*100     if stopyear==1988
replace rearn95=(earn/121.1823)*100    if stopyear==1989
replace rearn95=(earn/102.9367)*100    if stopyear==1990
replace rearn95=(earn/110.2863)*100    if stopyear==1991
replace rearn95=(earn/114.1856)*100    if stopyear==1992
replace rearn95=(earn/91.50463)*100    if stopyear==1993
replace rearn95=(earn/90.07996)*100    if stopyear==1994
replace rearn95=(earn/100)*100         if stopyear==1995
replace rearn95=(earn/119.1778)*100    if stopyear==1996
replace rearn95=(earn/175.067)*100     if stopyear==1997
replace rearn95=(earn/171.8895)*100    if stopyear==1998
replace rearn95=(earn/169.1953)*100    if stopyear==1999
replace rearn95=(earn/166.4025357)*100 if stopyear==2000
replace rearn95=(earn/174.3264659)*100 if stopyear==2001
replace rearn95=(earn/183.0427892)*100 if stopyear==2002
replace rearn95=(earn/189.3819334)*100 if stopyear==2003
replace rearn95=(earn/199.6830428)*100 if stopyear==2004
replace rearn95=(earn/211.5689382)*100 if stopyear==2005
replace rearn95=(earn/215.8623)*100    if stopyear==2006






gen rearnstart95=earnstart/268.3385 if startyear==1980
replace rearnstart95=earnstart/299.7498 if startyear==1981
replace rearnstart95=earnstart/315.0255 if startyear==1982
replace rearnstart95=earnstart/298.3527 if startyear==1983
replace rearnstart95=earnstart/243.2069 if startyear==1984
replace rearnstart95=earnstart/273.5972 if startyear==1985
replace rearnstart95=earnstart/170.5359 if startyear==1986
replace rearnstart95=earnstart/94.08943 if startyear==1987
replace rearnstart95=earnstart/137.126 if startyear==1988
replace rearnstart95=earnstart/121.1823 if startyear==1989
replace rearnstart95=earnstart/102.9367 if startyear==1990
replace rearnstart95=earnstart/110.2863 if startyear==1991
replace rearnstart95=earnstart/114.1856 if startyear==1992
replace rearnstart95=earnstart/91.50463 if startyear==1993
replace rearnstart95=earnstart/90.07996 if startyear==1994
replace rearnstart95=earnstart/100 if startyear==1995
replace rearnstart95=earnstart/119.1778 if startyear==1996
replace rearnstart95=earnstart/175.067 if startyear==1997
replace rearnstart95=earnstart/171.8895 if startyear==1998
replace rearnstart95=earnstart/169.1953 if startyear==1999
replace rearnstart95=earnstart/166.4025357 if startyear==2000
replace rearnstart95=earnstart/174.3264659 if startyear==2001
replace rearnstart95=earnstart/183.0427892 if startyear==2002
replace rearnstart95=earnstart/189.3819334 if startyear==2003
replace rearnstart95=earnstart/199.6830428 if startyear==2004
replace rearnstart95=earnstart/215.8623    if stopyear==2006

gen rstartup=startup/268.3385 if startyear==1980
replace rstartup=startup/299.7498 if startyear==1981
replace rstartup=startup/315.0255 if startyear==1982
replace rstartup=startup/298.3527 if startyear==1983
replace rstartup=startup/243.2069 if startyear==1984
replace rstartup=startup/273.5972 if startyear==1985
replace rstartup=startup/170.5359 if startyear==1986
replace rstartup=startup/94.08943 if startyear==1987
replace rstartup=startup/137.126 if startyear==1988
replace rstartup=startup/121.1823 if startyear==1989
replace rstartup=startup/102.9367 if startyear==1990
replace rstartup=startup/110.2863 if startyear==1991
replace rstartup=startup/114.1856 if startyear==1992
replace rstartup=startup/91.50463 if startyear==1993
replace rstartup=startup/90.07996 if startyear==1994
replace rstartup=startup/100 if startyear==1995
replace rstartup=startup/119.1778 if startyear==1996
replace rstartup=startup/175.067 if startyear==1997
replace rstartup=startup/171.8895 if startyear==1998
replace rstartup=startup/169.1953 if startyear==1999
replace rstartup=startup/166.4025357 if startyear==2000
replace rstartup=startup/174.3264659 if startyear==2001
replace rstartup=startup/183.0427892 if startyear==2002
replace rstartup=startup/189.3819334 if startyear==2003
replace rstartup=startup/199.6830428 if startyear==2004
replace rstartup=startup/211.5689382 if startyear==2005
replace rstartup=startup/215.8623    if stopyear==2006




label variable  asset "\textit{Asset Index}"
label variable  age "\textit{Age (current)}"
label variable  age2 "\textit{Age squared/100 (current)}"

label variable  earnmembers "\textit{Other Earning Members}"
label variable  female "\textit{Female}"
label variable  agestart "\textit{Age when started current state}"
label variable  agestart2 "\textit{(Age when started current state)$^{2}$}"

label variable  married "\textit{Married}"
label variable  hhbusiness "\textit{HH Business}"
label variable  other_source "\textit{Other Sources of Income}"
label variable  public "\textit{Public}"
label variable  children "\textit{Children}"
label variable  rearn95 "\textit{Earnings}"

label variable  schooling "\textit{Years of schooling}"

label variable  fed "\textit{Father years of schooling}"
label variable  med "\textit{Mother years of schooling}"
label variable distprim "\textit{Distance Primary}"
label variable distsec "\textit{Distance Secondary}"
label variable jid "\textit{N$^{0}$ jobs switched}"
label variable farming "\textit{Farming}"
label variable services "\textit{Services}"
label variable manufacturing "\textit{Manufacturing}"
label variable trading "\textit{Trading}"
label variable duration "\textit{Duration}"
label variable experience"\textit{Experience}"
label variable experience2"\textit{Experience$^{2}$}"
label variable tenure"\textit{Tenure}"
label variable tenure2"\textit{Tenure$^{2}$}"




gen  femalep = female*100
gen  marriedp = married*100
gen hhbusinessp= hhbusiness*100
gen other_sourcep= other_source*100
gen publicp= public*100
gen farmingp= farming*100
gen servicesp= services*100
gen manufacturingp= manufacturing*100
gen tradingp= trading*100

label variable  femalep"\textit{Female ($\%$)}"
label variable  marriedp "\textit{Married ($\%$)}"
label variable  hhbusinessp "\textit{HH Business ($\%$)}"
label variable  other_sourcep "\textit{Other Sources of Income ($\%$)}"
label variable  publicp "\textit{Public ($\%$)}"
label variable farmingp "\textit{Farming ($\%$)}"
label variable servicesp "\textit{Services ($\%$)}"
label variable manufacturingp "\textit{Manufacturing ($\%$)}"
label variable tradingp "\textit{Trading ($\%$)}"




*****************************************************************************
****************Potential Instrument for education***************************
*************DUMMY FOR COHORT EXPOSED TO EDUCATION ACT***********************
*****************************************************************************

 
gen log_earn= log(rearn95)
drop t
gen t=0
replace t=1 if doby>=1965 & doby<=1978
tab t if current==1, sum(schooling)
tab t if current==1, sum(rearn95)
reg log_earn schooling age experience tenure if current==1, robust
ivreg log_earn (schooling=t)  age experience tenure  if current==1 , robust
ivreg2 log_earn (schooling=t)  age experience tenure  if current==1, robust


*****************************************************************************
****************Reducing measurament Errors in Earnings**********************
*************************Only consider montly earnings***********************
*****************************************************************************




/*** Earnings (stopdate) ***/

gen month_earn04 = hh2c5a_
replace month_earn04 = hh2c31a_ if hh2c5a_==. & self==1
replace month_earn04 = hh2c36a_ if hh2c5a_==. & hh2c31a_==. & self==1
replace month_earn04 = month_earn04*4 if hh2c3a_ =="Week" | hh2c28a_=="Week"
replace month_earn04 = month_earn04*31 if hh2c3a_ =="Day" | hh2c28a_=="Day"





/*** Earnings (stopdate) ***/
gen month_earn05 = jrn05_
replace month_earn05 = js27_ if jrn05_==. & self==1
replace month_earn05 = js23_ if js27_==.  & self==1
replace month_earn05 = month_earn05*4 if jr01_ =="Week"| js19_=="Week"
replace month_earn05 = month_earn05*31 if jr01_ =="Day" | js19_=="Day"


gen month_earn=month_earn04 if survey==2004
replace month_earn=month_earn05 if survey==2005  & month_earn04==.



/*Justin's Deflator*/

gen rmearn95=month_earn/268.3385 if stopyear==1980
replace rmearn95=(month_earn/299.7498)*100    if stopyear==1981
replace rmearn95=(month_earn/315.0255)*100    if stopyear==1982
replace rmearn95=(month_earn/298.3527)*100    if stopyear==1983
replace rmearn95=(month_earn/243.2069)*100    if stopyear==1984
replace rmearn95=(month_earn/273.5972)*100    if stopyear==1985
replace rmearn95=(month_earn/170.5359)*100    if stopyear==1986
replace rmearn95=(month_earn/94.08943)*100    if stopyear==1987
replace rmearn95=(month_earn/137.126)*100     if stopyear==1988
replace rmearn95=(month_earn/121.1823)*100    if stopyear==1989
replace rmearn95=(month_earn/102.9367)*100    if stopyear==1990
replace rmearn95=(month_earn/110.2863)*100    if stopyear==1991
replace rmearn95=(month_earn/114.1856)*100    if stopyear==1992
replace rmearn95=(month_earn/91.50463)*100    if stopyear==1993
replace rmearn95=(month_earn/90.07996)*100    if stopyear==1994
replace rmearn95=(month_earn/100)*100         if stopyear==1995
replace rmearn95=(month_earn/119.1778)*100    if stopyear==1996
replace rmearn95=(month_earn/175.067)*100     if stopyear==1997
replace rmearn95=(month_earn/171.8895)*100    if stopyear==1998
replace rmearn95=(month_earn/169.1953)*100    if stopyear==1999
replace rmearn95=(month_earn/166.4025357)*100 if stopyear==2000
replace rmearn95=(month_earn/174.3264659)*100 if stopyear==2001
replace rmearn95=(month_earn/183.0427892)*100 if stopyear==2002
replace rmearn95=(month_earn/189.3819334)*100 if stopyear==2003
replace rmearn95=(month_earn/199.6830428)*100 if stopyear==2004
replace rmearn95=(month_earn/211.5689382)*100 if stopyear==2005
replace rmearn95=(month_earn/215.8623)*100    if stopyear==2006

label variable  rmearn95 "\textit{Current Monthly Earnings}"
gen earnings2= ln(rmearn95)

