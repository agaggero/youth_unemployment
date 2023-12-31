/*********************************
* Means Tests jid=1 vs jid=1&2*
********************************/
clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
xtdes



 
 gen x =1
 sort wid
 by wid: replace x=sum(x)
 by wid: egen activity=max(x)
 sort wid jid
drop if activity>5

gen earn1 = earn  if jid==1 & activity==1

gen earn21= earn if  jid==1 & activity==2
gen earn22= earn if  jid==2 & activity==2

gen earn31= earn if  jid==1 & activity==3
gen earn32= earn if  jid==2 & activity==3
gen earn33= earn if  jid==3 & activity==3

gen earn41= earn if  jid==1 & activity==4
gen earn42= earn if  jid==2 & activity==4
gen earn43= earn if  jid==3 & activity==4
gen earn44= earn if  jid==4 & activity==4

gen earn51= earn if  jid==1 & activity==5
gen earn52= earn if  jid==2 & activity==5
gen earn53= earn if  jid==3 & activity==5
gen earn54= earn if  jid==4 & activity==5
gen earn55= earn if  jid==5 & activity==5


	esttab A B C D E using earnings.tex, replace ///
	mtitle("Jid= 1" "Jid= 1" "Jid= 1" "Jid= 1" "Jid= 1") ///
      cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs

	  


/*earnings*/
estpost su   earn   
est store A

estpost su  earn21 earn21
est store B

estpost su earn31 earn32 earn33
est store C

estpost su earn41 earn42 earn43 earn44
est store D

estpost su  earn51 earn52 earn53 earn54 earn55
est store E



	esttab A B C D E using baseline2.tex, replace ///
	mtitle("Jid= 1" "Jid= 1" "Jid= 1" "Jid= 1" "Jid= 1") ///
      cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs



estpost su   $x   if jid==1 & activity==1
est store A

estpost su  $x  jid==1 & activity==2
est store B

estpost su  $x jid==1 & activity==3
est store C

estpost su $x  if jid==1 & activity==4
est store D

estpost su  $x  if jid==1 & activity==5
est store E



	esttab A B C D E using baseline2.tex, replace ///
	mtitle("Jid= 1" "Jid= 1" "Jid= 1" "Jid= 1" "Jid= 1") ///
      cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs




/*jid=1 Jid=1 vs Jid=2 Baseline*/
ttest duration,     by (activity)
ttest schooling,    by (activity)
ttest married,      by (activity)
ttest children,     by (activity)
ttest agestart,     by (activity)
ttest primary,      by (activity)
ttest secondary,    by (activity)
ttest weleftage,    by (activity)
ttest fed,          by (activity)
ttest med,          by (activity)
ttest distprim,     by (activity)
ttest distsec,      by (activity)
ttest primary,      by (activity)
ttest secondary,    by (activity)
ttest tertiary,     by (activity)
ttest vocational,   by (activity)
ttest earn,         by (activity)
ttest earnstart,    by (activity)
ttest hhbusiness,   by (activity)
ttest happy,        by (activity)
ttest compare,      by (activity)
*ttest expected,    by (activity)
ttest speedstudy,   by (activity)



/*jid=1 Jid=1 vs Jid=2 Baseline*/
ttest duration   if jid==1,      by (activity)
ttest schooling  if jid==1,      by (activity)
ttest married    if jid==1,      by (activity)
ttest children   if jid==1,      by (activity)
ttest agestart   if jid==1,      by (activity)
ttest primary    if jid==1,      by (activity)
ttest secondary  if jid==1,      by (activity)
ttest weleftage  if jid==1,      by (activity)
ttest fed        if jid==1,      by (activity)
ttest med        if jid==1,      by (activity)
ttest distprim   if jid==1,      by (activity)
ttest distsec    if jid==1,      by (activity)
ttest primary    if jid==1,      by (activity)
ttest secondary  if jid==1,      by (activity)
ttest tertiary   if jid==1,      by (activity)
ttest vocational if jid==1,      by (activity)
ttest earn       if jid==1,      by (activity)
ttest earnstart  if jid==1,      by (activity)
ttest hhbusiness if jid==1,      by (activity)
ttest happy      if jid==1,      by (activity)
ttest compare    if jid==1,      by (activity)
*ttest expected  if jid==1,      by (activity)
ttest speedstudy if jid==1,      by (activity)
*ttest wborn      if jid==1,      by (activity)


	 
	 
/*jid=1 wage vs self*/
ttest duration      if activity==1 &  empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest schooling     if activity==1 &  empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest married       if activity==1 &  empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest children      if activity==1 &  empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest earn          if activity==1 &  empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest agestart      if activity==1 &  empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest primary       if activity==1 &  empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest secondary     if activity==1 &  empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest weleftage     if activity==1 &  empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest fed           if activity==1 &  empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest med           if activity==1 &  empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest distprim      if activity==1 &  empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest distsec       if activity==1 &  empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest hhbusiness    if activity==1 &  empstatus!="Wage employed" & empstatus!="Student", by (empstatus)




clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
xtdes


 
 gen x =1
 sort wid
 by wid: replace x=sum(x)
 by wid: egen activity=max(x)
 sort wid jid
drop if activity>2

/*jid=1 unemp vs self*/
ttest duration      if activity==1 &  empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest schooling     if activity==1 &  empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest married       if activity==1 &  empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest children      if activity==1 &  empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest agestart      if activity==1 &  empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest primary       if activity==1 &  empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest secondary     if activity==1 &  empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest weleftage     if activity==1 &  empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest fed           if activity==1 &  empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest med           if activity==1 &  empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest distprim      if activity==1 &  empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest distsec       if activity==1 &  empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest earn          if activity==1 &  empstatus!="Wage employed" & empstatus!="Student", by (empstatus)

clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
xtdes


 
 gen x =1
 sort wid
 by wid: replace x=sum(x)
 by wid: egen activity=max(x)
 sort wid jid
drop if activity>2


/*jid=1 vs jid=2 self*/
ttest duration      if self==1 & jid==1, by (activity)
ttest schooling     if self==1 & jid==1 , by (activity)
ttest married       if self==1 & jid==1, by (activity)
ttest children      if self==1 & jid==1 , by (activity)
ttest agestart      if self==1 & jid==1, by (activity)
ttest primary       if self==1 & jid==1, by (activity)
ttest secondary     if self==1 & jid==1, by (activity)
ttest weleftage     if self==1 & jid==1, by (activity)
ttest fed           if self==1 & jid==1, by (activity)
ttest med           if self==1 & jid==1, by (activity)
ttest distprim      if self==1 & jid==1, by (activity)
ttest distsec       if self==1 & jid==1, by (activity)
ttest earn          if self==1 & jid==1, by (activity)

/*jid=1 vs jid=2 wage*/
ttest duration      if wage==1 & jid==1, by (activity)
ttest schooling     if wage==1 & jid==1 , by (activity)
ttest married       if wage==1 & jid==1, by (activity)
ttest children      if wage==1 & jid==1 , by (activity)
ttest agestart      if wage==1 & jid==1, by (activity)
ttest primary       if wage==1 & jid==1, by (activity)
ttest secondary     if wage==1 & jid==1, by (activity)
ttest weleftage     if wage==1 & jid==1, by (activity)
ttest fed           if wage==1 & jid==1, by (activity)
ttest med           if wage==1 & jid==1, by (activity)
ttest distprim      if wage==1 & jid==1, by (activity)
ttest distsec       if wage==1 & jid==1, by (activity)
ttest earn          if wage==1 & jid==1, by (activity)
ttest happy         if wage==1 & jid==1, by (activity)
ttest compare       if wage==1 & jid==1, by (activity)
ttest expected      if wage==1 & jid==1, by (activity)




/*jid=1 vs jid=2 unemp*/
ttest duration      if unemp==1 & jid==1, by (activity)
ttest schooling     if unemp==1 & jid==1 , by (activity)
ttest married       if unemp==1 & jid==1, by (activity)
ttest children      if unemp==1 & jid==1 , by (activity)
ttest agestart      if unemp==1 & jid==1, by (activity)
ttest primary       if unemp==1 & jid==1, by (activity)
ttest secondary     if unemp==1 & jid==1, by (activity)
ttest weleftage     if unemp==1 & jid==1, by (activity)
ttest fed           if unemp==1 & jid==1, by (activity)
ttest med           if unemp==1 & jid==1, by (activity)
ttest distprim      if unemp==1 & jid==1, by (activity)
ttest distsec       if unemp==1 & jid==1, by (activity)
ttest earn          if unemp==1 & jid==1, by (activity)




/*********************************
* Means Tests jid=1 vs jid=1-3***
**********************************/


clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
xtdes


 
 gen x =1
 sort wid
 by wid: replace x=sum(x)
 by wid: egen activity=max(x)
 sort wid jid
keep if activity==1 | activity==3



/*jid=1 Jid=1 vs Jid=3 Baseline*/
ttest duration   if jid==1,      by (activity)
ttest schooling  if jid==1,      by (activity)
ttest married    if jid==1,      by (activity)
ttest children   if jid==1,      by (activity)
ttest agestart   if jid==1,      by (activity)
ttest primary    if jid==1,      by (activity)
ttest secondary  if jid==1,      by (activity)
ttest weleftage  if jid==1,      by (activity)
ttest fed        if jid==1,      by (activity)
ttest med        if jid==1,      by (activity)
ttest distprim   if jid==1,      by (activity)
ttest distsec    if jid==1,      by (activity)
ttest primary    if jid==1,      by (activity)
ttest secondary  if jid==1,      by (activity)
ttest tertiary   if jid==1,      by (activity)
ttest vocational if jid==1,      by (activity)
ttest earn       if jid==1,      by (activity)
ttest earnstart  if jid==1,      by (activity)
ttest hhbusiness if jid==1,      by (activity)
ttest happy      if jid==1,      by (activity)
ttest compare    if jid==1,      by (activity)
*ttest expected  if jid==1,      by (activity)
ttest speedstudy if jid==1,      by (activity)
ttest wborn      if jid==1,      by (activity)



/*jid=1 vs jid=1-3 self*/
ttest duration      if self==1 & jid==1, by (activity)
ttest schooling     if self==1 & jid==1 , by (activity)
ttest married       if self==1 & jid==1, by (activity)
ttest children      if self==1 & jid==1 , by (activity)
ttest agestart      if self==1 & jid==1, by (activity)
ttest primary       if self==1 & jid==1, by (activity)
ttest secondary     if self==1 & jid==1, by (activity)
ttest weleftage     if self==1 & jid==1, by (activity)
ttest fed           if self==1 & jid==1, by (activity)
ttest med           if self==1 & jid==1, by (activity)
ttest distprim      if self==1 & jid==1, by (activity)
ttest distsec       if self==1 & jid==1, by (activity)
ttest earn          if self==1 & jid==1, by (activity)

/*jid=1 vs jid=1-3 wage*/
ttest duration      if wage==1 & jid==1, by (activity)
ttest schooling     if wage==1 & jid==1 , by (activity)
ttest married       if wage==1 & jid==1, by (activity)
ttest children      if wage==1 & jid==1 , by (activity)
ttest agestart      if wage==1 & jid==1, by (activity)
ttest primary       if wage==1 & jid==1, by (activity)
ttest secondary     if wage==1 & jid==1, by (activity)
ttest weleftage     if wage==1 & jid==1, by (activity)
ttest fed           if wage==1 & jid==1, by (activity)
ttest med           if wage==1 & jid==1, by (activity)
ttest distprim      if wage==1 & jid==1, by (activity)
ttest distsec       if wage==1 & jid==1, by (activity)
ttest earn          if wage==1 & jid==1, by (activity)
ttest happy         if wage==1 & jid==1, by (activity)
ttest compare       if wage==1 & jid==1, by (activity)
ttest expected      if wage==1 & jid==1, by (activity)




/*jid=1 vs jid=1-3 unemp*/
ttest duration      if unemp==1 & jid==1, by (activity)
ttest schooling     if unemp==1 & jid==1 , by (activity)
ttest married       if unemp==1 & jid==1, by (activity)
ttest children      if unemp==1 & jid==1 , by (activity)
ttest agestart      if unemp==1 & jid==1, by (activity)
ttest primary       if unemp==1 & jid==1, by (activity)
ttest secondary     if unemp==1 & jid==1, by (activity)
ttest weleftage     if unemp==1 & jid==1, by (activity)
ttest fed           if unemp==1 & jid==1, by (activity)
ttest med           if unemp==1 & jid==1, by (activity)
ttest distprim      if unemp==1 & jid==1, by (activity)
ttest distsec       if unemp==1 & jid==1, by (activity)
ttest earn          if unemp==1 & jid==1, by (activity)
ttest timejobsearch if unemp==1 & jid==1, by (activity)
ttest hhbusiness    if unemp==1 & jid==1, by (activity)







/*********************************
* Means Tests jid=1-2 vs jid=1-3***
**********************************/


clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
xtdes


 
 gen x =1
 sort wid
 by wid: replace x=sum(x)
 by wid: egen activity=max(x)
 sort wid jid
drop if activity>3 | activity<2





/*jid=1 Jid=1 vs Jid=3 Baseline*/
ttest duration   if jid==1,      by (activity)
ttest schooling  if jid==1,      by (activity)
ttest married    if jid==1,      by (activity)
ttest children   if jid==1,      by (activity)
ttest agestart   if jid==1,      by (activity)
ttest primary    if jid==1,      by (activity)
ttest secondary  if jid==1,      by (activity)
ttest weleftage  if jid==1,      by (activity)
ttest fed        if jid==1,      by (activity)
ttest med        if jid==1,      by (activity)
ttest distprim   if jid==1,      by (activity)
ttest distsec    if jid==1,      by (activity)
ttest primary    if jid==1,      by (activity)
ttest secondary  if jid==1,      by (activity)
ttest tertiary   if jid==1,      by (activity)
ttest vocational if jid==1,      by (activity)
ttest earn       if jid==1,      by (activity)
ttest earnstart  if jid==1,      by (activity)
ttest hhbusiness if jid==1,      by (activity)
ttest happy      if jid==1,      by (activity)
ttest compare    if jid==1,      by (activity)
*ttest expected  if jid==1,      by (activity)
ttest speedstudy if jid==1,      by (activity)
ttest wborn      if jid==1,      by (activity)


/*jid=1-2 vs jid=1-3 self*/
ttest duration      if self==1 & jid==1, by (activity)
ttest schooling     if self==1 & jid==1 , by (activity)
ttest married       if self==1 & jid==1, by (activity)
ttest children      if self==1 & jid==1 , by (activity)
ttest agestart      if self==1 & jid==1, by (activity)
ttest primary       if self==1 & jid==1, by (activity)
ttest secondary     if self==1 & jid==1, by (activity)
ttest weleftage     if self==1 & jid==1, by (activity)
ttest fed           if self==1 & jid==1, by (activity)
ttest med           if self==1 & jid==1, by (activity)
ttest distprim      if self==1 & jid==1, by (activity)
ttest distsec       if self==1 & jid==1, by (activity)
ttest earn          if self==1 & jid==1, by (activity)
ttest earnstart     if self==1 & jid==1, by (activity)

/*jid=1-2 vs jid=1-3 wage*/
ttest duration      if wage==1 & jid==1, by (activity)
ttest schooling     if wage==1 & jid==1 , by (activity)
ttest married       if wage==1 & jid==1, by (activity)
ttest children      if wage==1 & jid==1 , by (activity)
ttest agestart      if wage==1 & jid==1, by (activity)
ttest primary       if wage==1 & jid==1, by (activity)
ttest secondary     if wage==1 & jid==1, by (activity)
ttest weleftage     if wage==1 & jid==1, by (activity)
ttest fed           if wage==1 & jid==1, by (activity)
ttest med           if wage==1 & jid==1, by (activity)
ttest distprim      if wage==1 & jid==1, by (activity)
ttest distsec       if wage==1 & jid==1, by (activity)
ttest earn          if wage==1 & jid==1, by (activity)
ttest happy         if wage==1 & jid==1, by (activity)
ttest compare       if wage==1 & jid==1, by (activity)
ttest expected      if wage==1 & jid==1, by (activity)





/*jid=1-2 vs jid=1-3 unemp*/
ttest duration      if unemp==1 & jid==1, by (activity)
ttest schooling     if unemp==1 & jid==1 , by (activity)
ttest married       if unemp==1 & jid==1, by (activity)
ttest children      if unemp==1 & jid==1 , by (activity)
ttest agestart      if unemp==1 & jid==1, by (activity)
ttest primary       if unemp==1 & jid==1, by (activity)
ttest secondary     if unemp==1 & jid==1, by (activity)
ttest weleftage     if unemp==1 & jid==1, by (activity)
ttest fed           if unemp==1 & jid==1, by (activity)
ttest med           if unemp==1 & jid==1, by (activity)
ttest distprim      if unemp==1 & jid==1, by (activity)
ttest distsec       if unemp==1 & jid==1, by (activity)
ttest earn          if unemp==1 & jid==1, by (activity)
ttest timejobsearch if unemp==1 & jid==1, by (activity)
ttest hhbusiness    if unemp==1 & jid==1, by (activity)






/*jid=1-2 vs jid=1-3 unemp*/
ttest duration      if unemp==1 & jid==1, by (activity)
ttest schooling     if unemp==1 & jid==1 , by (activity)
ttest married       if unemp==1 & jid==1, by (activity)
ttest children      if unemp==1 & jid==1 , by (activity)
ttest agestart      if unemp==1 & jid==1, by (activity)
ttest primary       if unemp==1 & jid==1, by (activity)
ttest secondary     if unemp==1 & jid==1, by (activity)
ttest weleftage     if unemp==1 & jid==1, by (activity)
ttest fed           if unemp==1 & jid==1, by (activity)
ttest med           if unemp==1 & jid==1, by (activity)
ttest distprim      if unemp==1 & jid==1, by (activity)
ttest distsec       if unemp==1 & jid==1, by (activity)
ttest earn          if unemp==1 & jid==1, by (activity)
ttest timejobsearch if unemp==1 & jid==1, by (activity)
ttest hhbusiness    if unemp==1 & jid==1, by (activity)







/*jid=1-2 vs jid=1-3 student*/
ttest duration      if student==1 & jid==1, by (activity)
ttest schooling     if student==1 & jid==1 , by (activity)
ttest married       if student==1 & jid==1, by (activity)
ttest children      if student==1 & jid==1 , by (activity)
ttest agestart      if student==1 & jid==1, by (activity)
ttest primary       if student==1 & jid==1, by (activity)
ttest secondary     if student==1 & jid==1, by (activity)
ttest weleftage     if student==1 & jid==1, by (activity)
ttest fed           if student==1 & jid==1, by (activity)
ttest med           if student==1 & jid==1, by (activity)
ttest distprim      if student==1 & jid==1, by (activity)
ttest distsec       if student==1 & jid==1, by (activity)
ttest earn          if student==1 & jid==1, by (activity)
ttest timejobsearch if student==1 & jid==1, by (activity)
ttest hhbusiness    if student==1 & jid==1, by (activity)






/*********************************
* Means Tests jid=1 vs jid=1-4***
**********************************/


clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
xtdes


 
 gen x =1
 sort wid
 by wid: replace x=sum(x)
 by wid: egen activity=max(x)
 sort wid jid
keep if activity==1 | activity==4



/*jid=1 Jid=1 vs Jid=4 Baseline*/
ttest duration   if jid==1,      by (activity)
ttest schooling  if jid==1,      by (activity)
ttest married    if jid==1,      by (activity)
ttest children   if jid==1,      by (activity)
ttest agestart   if jid==1,      by (activity)
ttest primary    if jid==1,      by (activity)
ttest secondary  if jid==1,      by (activity)
ttest weleftage  if jid==1,      by (activity)
ttest fed        if jid==1,      by (activity)
ttest med        if jid==1,      by (activity)
ttest distprim   if jid==1,      by (activity)
ttest distsec    if jid==1,      by (activity)
ttest primary    if jid==1,      by (activity)
ttest secondary  if jid==1,      by (activity)
ttest tertiary   if jid==1,      by (activity)
ttest vocational if jid==1,      by (activity)
ttest earn       if jid==1,      by (activity)
ttest earnstart  if jid==1,      by (activity)
ttest hhbusiness if jid==1,      by (activity)
ttest happy      if jid==1,      by (activity)
ttest compare    if jid==1,      by (activity)
*ttest expected  if jid==1,      by (activity)
ttest speedstudy if jid==1,      by (activity)
ttest wborn      if jid==1,      by (activity)



clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
xtdes


 
 gen x =1
 sort wid
 by wid: replace x=sum(x)
 by wid: egen activity=max(x)
 sort wid jid
keep if activity==2 | activity==4



/*jid=1 Jid=2 vs Jid=4 Baseline*/
ttest duration   if jid==1,      by (activity)
ttest schooling  if jid==1,      by (activity)
ttest married    if jid==1,      by (activity)
ttest children   if jid==1,      by (activity)
ttest agestart   if jid==1,      by (activity)
ttest primary    if jid==1,      by (activity)
ttest secondary  if jid==1,      by (activity)
ttest weleftage  if jid==1,      by (activity)
ttest fed        if jid==1,      by (activity)
ttest med        if jid==1,      by (activity)
ttest distprim   if jid==1,      by (activity)
ttest distsec    if jid==1,      by (activity)
ttest primary    if jid==1,      by (activity)
ttest secondary  if jid==1,      by (activity)
ttest tertiary   if jid==1,      by (activity)
ttest vocational if jid==1,      by (activity)
ttest earn       if jid==1,      by (activity)
ttest earnstart  if jid==1,      by (activity)
ttest hhbusiness if jid==1,      by (activity)
ttest happy      if jid==1,      by (activity)
ttest compare    if jid==1,      by (activity)
*ttest expected  if jid==1,      by (activity)
ttest speedstudy if jid==1,      by (activity)
ttest wborn      if jid==1,      by (activity)





clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
xtdes


 
 gen x =1
 sort wid
 by wid: replace x=sum(x)
 by wid: egen activity=max(x)
 sort wid jid
keep if activity==4 | activity==5



/*jid=1 Jid=3 vs Jid=4 Baseline*/
ttest duration   if jid==1,      by (activity)
ttest schooling  if jid==1,      by (activity)
ttest married    if jid==1,      by (activity)
ttest children   if jid==1,      by (activity)
ttest agestart   if jid==1,      by (activity)
ttest primary    if jid==1,      by (activity)
ttest secondary  if jid==1,      by (activity)
ttest weleftage  if jid==1,      by (activity)
ttest fed        if jid==1,      by (activity)
ttest med        if jid==1,      by (activity)
ttest distprim   if jid==1,      by (activity)
ttest distsec    if jid==1,      by (activity)
ttest primary    if jid==1,      by (activity)
ttest secondary  if jid==1,      by (activity)
ttest tertiary   if jid==1,      by (activity)
ttest vocational if jid==1,      by (activity)
ttest earn       if jid==1,      by (activity)
*ttest earnstart  if jid==1,      by (activity)
ttest hhbusiness if jid==1,      by (activity)
ttest happy      if jid==1,      by (activity)
ttest compare    if jid==1,      by (activity)
*ttest expected  if jid==1,      by (activity)
ttest speedstudy if jid==1,      by (activity)
ttest wborn      if jid==1,      by (activity)




