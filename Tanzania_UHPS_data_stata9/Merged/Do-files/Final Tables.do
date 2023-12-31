
clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
gen x =1
sort wid
by wid: replace x=sum(x)
by wid: egen activity=max(x)
gen end=0
replace end=1 if jid==activity 


sort wid jid
gen lookingforwork=0
replace lookingforwork=1 if job=="Unemployed: looking for work and unable to find any" & unemp==1
gen unpaidfamily=0
replace unpaidfamily=1 if job=="Unpaid family worker, helping with domestic and other family work." & unemp==1
gen housewife=0

replace housewife=1 if  job=="House wife" & unemp==1



/*MACRO*/

global x age    marriedp children   publicp rearn95  schooling raven   fed med  asset earnmembers other_sourcep hhbusinessp
global hh farmingp tradingp servicesp manufacturingp 
global y femalep
global z jid duration
global restricted  jid duration femalep marriedp children  rearn95 hhbusinessp selfp wagep unemp_studentp
global restrictedd  duration femalep marriedp children  rearn95 hhbusinessp 
global occ selfp wagep unemp_studentp




/*Baseline by cohort*/

estpost su  $z   $y age1jod $x    $hh  $occ        if end==1
est store A 

estpost su  $z   $y age1jod $x    $hh  $occ    if   c40==1  & end==1
est store B

estpost su  $z   $y age1jod  $x  $hh   $occ    if  c50==1   & end==1
est store C

estpost su  $z   $y age1jod $x  $hh    $occ    if   c60==1  & end==1
est store D


estpost su  $z   $y age1jod $x $hh   $occ      if   c70==1  & end==1
est store E

estpost su  $z   $y age1jod $x  $hh  $occ      if  c80==1   & end==1
est store F 


esttab A B C D E F  using cohort.tex,  replace ///
mtitle("\textbf{Overall}" "\textbf{40s}" "\textbf{50s}"  "\textbf{60s}"  "\textbf{70s}"  "\textbf{80s}" ) ///
refcat(selfp "\textbf{Occupation:}" farmingp "\textbf{Type of HH Business:}", nolabel) ///
title(\textsc{Cohort Differences}) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs	///
addnotes("\textit{This table reports summary statistics  of the main variables of interest, dinstiguishing by cohort.}"  "\textit{In particular,  we are interested in five cohorts: individual born in the 40s, 50s, 60s, 70s, 80s.}")




/*Baseline by cohort*/

estpost su  $z    age1jod $x     $occ       if female==0   & end==1
est store A 

estpost su  $z   age1jod $x $occ  if   c40==1 & female==0  & end==1
est store B

estpost su  $z    age1jod  $x  $occ if  c50==1 & female==0  & end==1
est store C

estpost su  $z    age1jod $x $occ if   c60==1 & female==0  & end==1
est store D


estpost su  $z    age1jod $x $occ if   c70==1 & female==0  & end==1
est store E

estpost su  $z    age1jod $x $occ if   c80==1 & female==0  & end==1
est store F


esttab A B C D E F  using cohortmale.tex,  replace ///
mtitle("\textbf{Overall}" "\textbf{40s}" "\textbf{50s}"  "\textbf{60s}"  "\textbf{70s}"  "\textbf{80s}" ) ///
refcat(selfp "\textbf{Occupation:}" , nolabel) ///
title(\textsc{Cohort Differences - Men}) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs	///
addnotes("\textit{This table reports summery statistics of the main variable of interest. We focus now on men.}" "\textit{Again, we distinguish between individuals of different cohorts. }")



/*Baseline by cohort*/

estpost su  $z    age1jod      $x  $occ           if female==1  & end==1
est store A 

estpost su  $z   age1jod      $x $occ if   c40==1 & female==1  & end==1
est store B

estpost su  $z    age1jod     $x $occ if  c50==1 & female==1  & end==1
est store C


estpost su  $z    age1jod   $x $occ if   c60==1 & female==1  & end==1
est store D


estpost su  $z    age1jod  $x $occ if   c70==1 & female==1  & end==1
est store E

estpost su  $z    age1jod $x $occ if   c80==1 & female==1  & end==1
est store F


esttab A B C D E F  using cohortfemale.tex,  replace ///
mtitle("\textbf{Overall}" "\textbf{40s}" "\textbf{50s}"  "\textbf{60s}"  "\textbf{70s}"  "\textbf{80s}" ) ///
refcat(selfp "\textbf{Occupation:}" , nolabel) ///
title(\textsc{Cohort Differences - Women}) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs ///
addnotes("\textit{In this table,  we report summary statistics for women, distinguishing by cohort.}")











/*Switching Job Vs not Switching*/
/*40s*/

estpost su  $z $y $x   $occ if end==1  & c40==1
est store A

estpost su $z $y $x $occ  if jid==1  & activity==1 & c40==1
est store B



estpost su $z $y $x  $occ  if jid==1  & activity!=1 & c40==1
est store C


estpost su $z $y $x  $occ  if end==1  & activity!=1 & c40==1
est store D


esttab A B C D using baseline40.tex, replace ///
mtitle("\textbf{Overall}" "\textbf{Didn't switch}" "\textbf{Switched} (start)"  "\textbf{Switched} (end)") ///
refcat(selfp "\textbf{Occupation:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs	///
title(\textsc{Differences between individuals who never switched  and  switched job - born in the 40s}) ///
addnotes("\textit{This table reports differences between individuals who never switched and switched job.}" "\textit{ This is done for the subsample of the population which is born in the 40s.}")



/*50s*/
estpost su $z  $y $x  $occ if end==1 &  c50==1
est store A

estpost su $z $y  $x   $occ if jid==1 &  activity==1 & c50==1
est store B

estpost su $z $y $x  $occ  if jid==1  & activity!=1 & c50==1
est store C


estpost su $z $y $x  $occ  if end==1  & activity!=1 & c50==1
est store D


esttab A B C D using baseline50.tex, replace ///
mtitle("\textbf{Overall}" "\textbf{Didn't switch}" "\textbf{Switched} (start)"  "\textbf{Switched} (end)") ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs	///
refcat(selfp "\textbf{Occupation:}", nolabel) ///
title(\textsc{Differences between individuals who never switched  and  switched job - born in the 50s}) ///
addnotes("\textit{This table reports differences between individuals who never switched and switched job.}" "\textit{ This is done for the subsample of the population which is born in the 50s.}")




/*60s*/
estpost su $z $y $x  $occ if end==1 & c60==1
est store A

estpost su $z $y $x   $occ if jid==1  & activity==1 & c60==1
est store B

estpost su $z $y $x  $occ  if jid==1  & activity!=1 & c60==1
est store C



estpost su $z $y $x  $occ  if end==1  & activity!=1 & c60==1
est store D


esttab A B C D using baseline60.tex, replace ///
mtitle("\textbf{Overall}" "\textbf{Didn't switch}" "\textbf{Switched} (start)"  "\textbf{Switched} (end)") ///
refcat(selfp "\textbf{Occupation:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs	///
title(\textsc{Differences between individuals who never switched  and  switched job - born in the 60s}) ///
addnotes("\textit{This table reports differences between individuals who never switched and switched job.}"  "\textit{ This is done for the subsample of the population which is born in the 60s.}")





/*70s*/
estpost su $z $y $x $occ if end==1 & c70==1
est store A

estpost su $z $y $x   $occ if jid==1  & activity==1 & c70==1
est store B

estpost su $z $y $x  $occ  if jid==1  & activity!=1 & c70==1
est store C


estpost su $z $y $x  $occ  if end==1  & activity!=1 & c70==1
est store D


esttab A B C D using baseline70.tex, replace ///
mtitle("\textbf{Overall}" "\textbf{Didn't switch}" "\textbf{Switched} (start)"  "\textbf{Switched} (end)") ///
refcat(selfp "\textbf{Occupation:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs	///
title(\textsc{Differences between individuals who never switched  and  switched job - born in the 70s}) ///
addnotes("\textit{This table reports differences between individuals who never switched and switched job.}" "\textit{ This is done for the subsample of the population which is born in the 70s.}")







/*80s*/
estpost su $z $y $x  $occ if end==1 & c80==1
est store A

estpost su $z $y $x   $occ if jid==1  & activity==1 & c80==1
est store B

estpost su $z $y $x  $occ  if jid==1  & activity!=1 & c80==1
est store C


estpost su $z $y $x  $occ  if end==1  & activity!=1 & c80==1
est store D


esttab A B C D using baseline80.tex, replace ///
mtitle("\textbf{Overall}" "\textbf{Didn't switch}" "\textbf{Switched} (start)"  "\textbf{Switched} (end)") ///
refcat(selfp "\textbf{Occupation:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs	///
title(\textsc{Differences between individuals who never switched  and  switched job - born in the 80s}) ///
addnotes("\textit{This table reports differences between individuals who never switched  and switched job.}" "\textit{ This is done for the subsample of the population which is born in the 80s.}")



/*By occupational status*/

 
	 estpost su     $restrictedd schooling if jid==1 & self==1 & c40==1
	 est store A
	 
	 estpost su     $restrictedd  schooling if jid==1 &  wage==1 & c40==1
	 est store B
	  
	 estpost su     $restrictedd schooling if jid==1 & (unemp==1 | student==1) & c40==1
	 est store C
	  
	  esttab A B C  using occstatus40.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}"  "\textbf{Unemployed}") ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs ///
title(\textsc{By occupational status-  born in the 40s}) ///
addnotes("\textit{In this table,  we report differences between individuals who were either}" "\textit{self-employed or  wage employed or unemployed when they first entered}" "\textit{the labour market. We consider individuals born in the 40s}.")







	 estpost su     $restrictedd schooling if end==1 & self==1 & c50==1
	 est store A
	 
	 estpost su     $restrictedd  schooling if end==1 &  wage==1 & c50==1
	 est store B
	  
	 estpost su     $restrictedd schooling if end==1 & (unemp==1 | student==1) & c50==1
	 est store C
	  
	  esttab A B C  using occstatus50.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}"  "\textbf{Unemployed}") ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs ///
title(\textsc{By occupational status-  born in the 50s}) ///
addnotes("\textit{In this table,  we report differences between individuals who were either}" "\textit{self-employed or  wage employed or unemployed when they first entered}" "\textit{the labour market. We consider individuals born in the 50s}.")










	 estpost su     $restrictedd schooling if end==1 & self==1 & c60==1
	 est store A
	 
	 estpost su     $restrictedd schooling if end==1 &  wage==1 & c60==1
	 est store B
	  
	 estpost su     $restrictedd schooling if end==1 & (unemp==1 | student==1) & c60==1
	 est store C
	  
	  esttab A B C  using occstatus60.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}"  "\textbf{Unemployed}") ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs ///
title(\textsc{By occupational status-  born in the 60s}) ///
addnotes("\textit{In this table,  we report differences between individuals who were either}" "\textit{self-employed or  wage employed or unemployed when they first entered}" "\textit{the labour market. We consider individuals born in the 60s}.")










	 estpost su     $restrictedd schooling if end==1 & self==1 & c70==1
	 est store A
	 
	 estpost su     $restrictedd schooling if end==1 &  wage==1 & c70==1
	 est store B
	  
	 estpost su     $restrictedd schooling if end==1 & (unemp==1 | student==1) & c70==1
	 est store C
	  
	  esttab A B C  using occstatus70.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}"  "\textbf{Unemployed}") ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs ///
title(\textsc{By occupational status- born in the 70s}) ///
addnotes("\textit{In this table,  we report differences between individuals who were either}" "\textit{self-employed or  wage employed or unemployed when they first entered}" "\textit{the labour market. We consider individuals born in the 70s}.")



	
	
	
	
	
	
	
	estpost su     $restrictedd schooling if end==1 & self==1 & c80==1
	 est store A
	 
	 estpost su     $restrictedd schooling if end==1 &  wage==1 & c80==1
	 est store B
	  
	 estpost su     $restrictedd schooling if end==1 & (unemp==1 | student==1) & c80==1
	 est store C
	  
	  esttab A B C  using occstatus80.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}"  "\textbf{Unemployed}") ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs ///
title(\textsc{By occupational status- for those born in the 80s}) ///
addnotes("\textit{In this table,  we report differences between individuals who were either}" "\textit{self-employed or  wage employed or unemployed when they first entered}" "\textit{the labour market. We consider individuals born in the 80s}.")





/*UNEMPLOYED*/

estpost su   $restrictedd fed med if unemp==1 &  job=="Unemployed: looking for work and unable to find any" & jid==1
 est store A

estpost su  $restrictedd fed med if unemp==1 &    job== "Unpaid family worker, helping with domestic and other family work." & jid==1
 est store B
 
estpost su  $restrictedd  fed med if unemp==1 &  job== "House wife" & jid==1
 est store C
 
 
estpost su  $restrictedd fed med if student==1   & jid==1
 est store D

esttab A B C D using unemployed1.tex, replace ///
	mtitle("\textbf{Looking for Work}" "\textbf{Unpaid family Worker}"  "\textbf{Housewife}" "\textbf{Student}") ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs ///
title(\textsc{Baseline differences across Unemployed}) ///
addnotes("\textit{This table compares individuals who were unemployed when they first entered  the labour market.}" "\textit{We distinguish between  different activities.}")



estpost  su schooling $restricted  if l.unemp==1    & jid==2  & l.lookingforwork==1
est store A


estpost su schooling $restricted  if l.unemp==1     & jid==2   & l.unpaidfamily==1
est store B

estpost su schooling  $restricted  if l.unemp==1    &  jid==2  & l.housewife==1
est store C

estpost su  schooling $restricted   if l.student==1  & jid==2
est store D


esttab A B C  D  using unemployed2.tex, replace ///
	mtitle("\textbf{Looking for Work}" "\textbf{Unpaid family Worker}"  "\textbf{Housewife}" "\textbf{Student}") ///
	 refcat(selfp "\textbf{Occupation:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs ///
title(\textsc{Differences across unemployed - One period ahead}) ///
addnotes("\textit{In this table,  we follow the individuals of the above table one period ahead}.")


estpost  su schooling $restricted  if    jid==3  & ll.lookingforwork==1
est store A


estpost su schooling $restricted  if     jid==3   & ll.unpaidfamily==1
est store B

estpost su schooling  $restricted  if    jid==3  & ll.housewife==1 & rearn95<1000
est store C

estpost su  schooling $restricted   if ll.student==1  & jid==3
est store D




esttab A B C  D  using unemployed3.tex, replace ///
	mtitle("\textbf{Looking for Work}" "\textbf{Unpaid family Worker}"  "\textbf{Housewife}" "\textbf{Student}") ///
	 refcat(selfp "\textbf{Occupation:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs  ///
title(\textsc{Differences across unemployed - Two periods ahead}) ///
addnotes("\textit{In this table,  we follow the individuals of the above table two periods ahead}" "\textit{and  we observe the differences on the main variables of interest.}")






/*Baseline by cohort PRIMARY EDUCATION */

estpost su $restricted    if   end==1   &      primary==1
est store A 

estpost su  $restricted   if   c40==1   &      end==1 & primary==1
est store B

estpost su  $restricted   if   c50==1   &      end==1 & primary==1
est store C

estpost su  $restricted   if   c60==1   &      end==1 & primary==1
est store D


estpost su  $restricted   if   c70==1   &      end==1 & primary==1
est store E

estpost su  $restricted   if   c80==1   &      end==1 & primary==1
est store F


esttab A B C D E F  using cohortprimary.tex,  replace ///
mtitle("\textbf{Overall}" "\textbf{40s}" "\textbf{50s}"  "\textbf{60s}"  "\textbf{70s}"  "\textbf{80s}" ) ///
refcat(selfp "\textbf{Occupation:}", nolabel) ///
title(\textsc{Cohort differences- Primary Education}) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs ///
addnote("\textit{In this table,  we compare inviduals whose highest level of education is primary school across cohorts.}")









/*Baseline by cohort SECONDARY EDUCATION*/

estpost su $restricted    if   end==1   &      secondary==1
est store A 

estpost su  $restricted   if   c40==1   &      end==1 & secondary==1
est store B

estpost su  $restricted   if   c50==1   &      end==1 & secondary==1
est store C

estpost su  $restricted   if   c60==1   &      end==1 & secondary==1
est store D


estpost su  $restricted   if   c70==1   &      end==1 & secondary==1
est store E

estpost su  $restricted   if   c80==1   &      end==1 & secondary==1
est store F



esttab A B C D E F  using cohortsecondary.tex,  replace ///
mtitle("\textbf{Overall}" "\textbf{40s}" "\textbf{50s}"  "\textbf{60s}"  "\textbf{70s}"  "\textbf{80s}" ) ///
refcat(selfp "\textbf{Occupation:}", nolabel) ///
title(\textsc{Cohort differences- Secondary Education}) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs ///
addnote("\textit{In this table,  we compare inviduals whose highest level of education is secondary school across cohorts.}")



/*Baseline by cohort VOCATIONAL SCHOOL*/

estpost su $restricted    if   end==1   &      vocational==1
est store A 

estpost su  $restricted   if   c40==1   &      end==1 & vocational==1
est store B

estpost su  $restricted   if   c50==1   &      end==1 & vocational==1
est store C

estpost su  $restricted   if   c60==1   &      end==1 & vocational==1
est store D


estpost su  $restricted   if   c70==1   &      end==1 & vocational==1
est store E

estpost su  $restricted   if   c80==1   &      end==1 & vocational==1
est store F


esttab A B C D E F  using cohortvocational.tex,  replace ///
mtitle("\textbf{Overall}" "\textbf{40s}" "\textbf{50s}"  "\textbf{60s}"  "\textbf{70s}"  "\textbf{80s}" ) ///
refcat(selfp "\textbf{Occupation:}", nolabel) ///
title(\textsc{Cohort differences- Vocational School}) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs ///
addnote("\textit{In this table,  we compare inviduals whose highest level of education is vocational school across cohorts.}")




/*Baseline by cohort TERTIARY EDUCATION*/

estpost su $restricted    if   end==1   &      tertiary==1
est store A 

estpost su  $restricted   if   c40==1   &      end==1 & tertiary==1
est store B

estpost su  $restricted   if   c50==1   &      end==1 & tertiary==1
est store C

estpost su  $restricted   if   c60==1   &      end==1 & tertiary==1
est store D


estpost su  $restricted   if   c70==1   &      end==1 & tertiary==1
est store E

estpost su  $restricted   if   c80==1   &      end==1 & tertiary==1
est store F



esttab A B C D E F  using cohorttertiary.tex,  replace ///
mtitle("\textbf{Overall}" "\textbf{40s}" "\textbf{50s}"  "\textbf{60s}"  "\textbf{70s}"  "\textbf{80s}" ) ///
refcat(selfp "\textbf{Occupation:}", nolabel) ///
title(\textsc{Cohort differences- Tertiary Education}) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs ///
addnote("\textit{In this table,  we compare inviduals whose highest level of education is tertiary school across cohorts.}")







/*Age/Cohort -  2nd attempt*/
keep wid startdate stopdate empstatus age1jod  activity agestart agestop $z $y $x c40 c50 c60 c70 c80 $occ
sort wid
generate id = _n
expand duration
sort id
gen longage=agestart
quietly by id: replace longage=longage[_n-1]+1 if longage[_n-1]!=.
list wid jid startdate stopdate empstatus id longage, sepby(wid)






estpost su  jid    age1jod $x  $occ if longage==25
est store A 

estpost su  jid    age1jod $x $occ if     c40==1 & longage==25
est store B

estpost su  jid    age1jod $x $occ if     c50==1 & longage==25
est store C

estpost su  jid    age1jod $x $occ if    c60==1 & longage==25
est store D


estpost su  jid    age1jod $x  $occ if    c70==1 & longage==25
est store E

estpost su  jid   age1jod $x  $occ  if   c80==1 & longage==25   
est store F



	esttab A B C D E F  using cohort25.tex, replace ///
	mtitle("\textbf{Overall}" "\textbf{40s}" "\textbf{50s}"  "\textbf{60s}"  "\textbf{70s}" "\textbf{80s}" ) ///
			 refcat(selfp "\textbf{Occupation:}" , nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs ///
title(\textsc{By Cohorts- At the age of 25}) ///
addnotes("\textit{In this table,  we try to go even more in depth in considering potential age/cohort effects}" "\textit{ that  might affects the data. Specifically, we compare individuals of different cohorts}" "\textit{ when they were 25 years old.}")


estpost su  jid    age1jod $x  $occ if longage==35
est store A 

estpost su  jid    age1jod $x  $occ if   c40==1 & longage==35
est store B

estpost su  jid   age1jod $x   $occ if  c50==1 & longage==35
est store C

estpost su  jid   age1jod $x  $occ  if   c60==1 & longage==35
est store D


estpost su  jid   age1jod $x  $occ  if   c70==1 & longage==35   
est store E



	esttab A B C D E  using cohort35.tex,  replace ///
	mtitle("\textbf{Overall}" "\textbf{40s}" "\textbf{50s}"  "\textbf{60s}"  "\textbf{70s}") ///
			 refcat(selfp "\textbf{Occupation:}" , nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps obs ///
title(\textsc{By Cohorts- At the age of 35}) ///
addnotes("\textit{In this table,  we try to go even more in depth in considering potential age/cohort effects}" "\textit{ that  might affects the data. Specifically, we compare individuals of different cohorts}" "\textit{ when they were 35 years old.}")

