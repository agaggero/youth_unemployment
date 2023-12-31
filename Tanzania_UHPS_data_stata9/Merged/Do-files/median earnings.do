
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

estpost su  rearn95      if end==1, detail
est store A 

estpost su  rearn95   if   c40==1  & end==1, detail
est store B

estpost su  rearn95   if  c50==1   & end==1, detail
est store C

estpost su  rearn95    if   c60==1  & end==1, detail
est store D


estpost su  rearn95     if   c70==1  & end==1, detail
est store E

estpost su  rearn95    if  c80==1   & end==1, detail
est store F 


esttab A B C D E F  using median1.tex,  replace ///
mtitle("\textbf{Overall}" "\textbf{40s}" "\textbf{50s}"  "\textbf{60s}"  "\textbf{70s}"  "\textbf{80s}" ) ///
cells(p50(fmt(2))) label booktabs nonum collabels(none) gaps noobs	




/*Baseline by cohort*/

estpost su rearn95       if female==0   & end==1, detail
est store A 

estpost su  rearn95 if   c40==1 & female==0  & end==1, detail
est store B

estpost su      rearn95 if  c50==1 & female==0  & end==1, detail
est store C

estpost su  rearn95 if   c60==1 & female==0  & end==1, detail
est store D


estpost su  rearn95 if   c70==1 & female==0  & end==1, detail
est store E

estpost su  rearn95 if   c80==1 & female==0  & end==1, detail
est store F


esttab A B C D E F  using median2.tex,  replace ///
cells(p50(fmt(2))) label booktabs nonum collabels(none) gaps noobs	



/*Baseline by cohort*/

estpost su  rearn95       if female==1  & end==1, detail
est store A 

estpost su  rearn95 if   c40==1 & female==1  & end==1, detail
est store B

estpost su rearn95 if  c50==1 & female==1  & end==1, detail
est store C


estpost su  rearn95 if   c60==1 & female==1  & end==1, detail
est store D


estpost su  rearn95 if   c70==1 & female==1  & end==1, detail
est store E

estpost su  rearn95 if   c80==1 & female==1  & end==1, detail
est store F


esttab A B C D E F  using median3.tex,  replace ///
cells(p50(fmt(2))) label booktabs nonum collabels(none) gaps obs 











/*Switching Job Vs not Switching*/
/*40s*/

estpost su  rearn95 if end==1  & c40==1, detail
est store A

estpost su rearn95  if jid==1  & activity==1 & c40==1, detail
est store B



estpost su rearn95   if jid==1  & activity!=1 & c40==1, detail
est store C


estpost su rearn95  if end==1  & activity!=1 & c40==1, detail
est store D


esttab A B C D using median4.tex, replace ///
mtitle("\textbf{Overall}" "\textbf{Didn't switch}" "\textbf{Switched} (start)"  "\textbf{Switched} (end)") ///
cells(p50(fmt(2))) label booktabs nonum collabels(none) gaps noobs



/*50s*/
estpost su rearn95 if end==1 &  c50==1, detail
est store A

estpost su rearn95 if jid==1 &  activity==1 & c50==1, detail
est store B

estpost su rearn95  if jid==1  & activity!=1 & c50==1, detail
est store C


estpost su rearn95  if end==1  & activity!=1 & c50==1, detail
est store D


esttab A B C D using median5.tex, replace ///
cells(p50(fmt(2))) label booktabs nonum collabels(none) gaps noobs 



/*60s*/
estpost su rearn95 if end==1 & c60==1, detail
est store A

estpost su rearn95 if jid==1  & activity==1 & c60==1, detail
est store B

estpost su rearn95  if jid==1  & activity!=1 & c60==1, detail
est store C


estpost su rearn95  if end==1  & activity!=1 & c60==1, detail
est store D


esttab A B C D using median6.tex, replace ///
cells(p50(fmt(2))) label booktabs nonum collabels(none) gaps noobs 




/*70s*/
estpost su rearn95 if end==1 & c70==1, detail
est store A

estpost su rearn95 if jid==1  & activity==1 & c70==1, detail
est store B

estpost su rearn95 if jid==1  & activity!=1 & c70==1, detail
est store C


estpost su rearn95 if end==1  & activity!=1 & c70==1, detail
est store D


esttab A B C D using median7.tex, replace ///
cells(p50(fmt(2))) label booktabs nonum collabels(none) gaps noobs plain






/*80s*/
estpost su rearn95 if end==1 & c80==1, detail
est store A

estpost su rearn95 if jid==1  & activity==1 & c80==1, detail
est store B

estpost su rearn95  if jid==1  & activity!=1 & c80==1, detail
est store C


estpost su rearn95  if end==1  & activity!=1 & c80==1, detail
est store D


esttab A B C D using median8.tex, replace ///
cells(p50(fmt(2))) label booktabs nonum collabels(none) gaps obs plain




/*By occupational status*/

 
estpost su rearn95 if jid==1 & self==1 & c40==1, detail
	 est store A
	 
estpost su rearn95 if jid==1 &  wage==1 & c40==1, detail
	 est store B
	  

	  
	  esttab A B C  using median9.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}"  "\textbf{Unemployed}") ///
cells(p50(fmt(2))) label booktabs nonum collabels(none) gaps noobs







estpost su rearn95 if end==1 & self==1 & c50==1, detail
	 est store A
	 
estpost su rearn95 if end==1 &  wage==1 & c50==1, detail
	 est store B
	  

	  
	  esttab A B C  using median10.tex, replace ///
cells(p50(fmt(2))) label booktabs nonum collabels(none) gaps noobs plain









estpost su rearn95  if end==1 & self==1 & c60==1, detail 
	 est store A
	 
estpost su rearn95  if end==1 &  wage==1 & c60==1, detail
	 est store B
	  

	  
	  esttab A B C  using median11.tex, replace ///
cells(p50(fmt(2))) label booktabs nonum collabels(none) gaps noobs plain








estpost su rearn95 if end==1 & self==1 & c70==1, detail
	 est store A
	 
estpost su rearn95  if end==1 &  wage==1 & c70==1, detail
	 est store B
	  

	  
	  esttab A B C  using median12.tex, replace ///
cells(p50(fmt(2))) label booktabs nonum collabels(none) gaps noobs plain


	
	
	
	
	
	
	
estpost su rearn95  if end==1 & self==1 & c80==1, detail
	 est store A
	 
estpost su rearn95  if end==1 &  wage==1 & c80==1, detail
	 est store B

	 
	  
	  esttab A B C  using median13.tex, replace ///
cells(p50(fmt(2))) label booktabs nonum collabels(none) gaps obs plain





/*UNEMPLOYED*/




estpost su rearn95  if l.unemp==1    & jid==2  & l.lookingforwork==1, detail
est store A


estpost su rearn95  if l.unemp==1     & jid==2   & l.unpaidfamily==1, detail
est store B

estpost su rearn95  if l.unemp==1    &  jid==2  & l.housewife==1, detail
est store C

estpost su rearn95   if l.student==1  & jid==2, detail
est store D


esttab A B C  D  using median14.tex, replace ///
cells(p50(fmt(2))) label booktabs nonum collabels(none) gaps noobs 



estpost su rearn95 if    jid==3  & ll.lookingforwork==1, detail
est store A


estpost su rearn95  if     jid==3   & ll.unpaidfamily==1, detail
est store B

estpost su rearn95  if    jid==3  & ll.housewife==1, detail
est store C

estpost su rearn95   if ll.student==1  & jid==3, detail
est store D




esttab A B C  D  using median15.tex, replace ///
cells(p50(fmt(2))) label booktabs nonum collabels(none) gaps obs  plain





/*Baseline by cohort PRIMARY EDUCATION */

estpost su rearn95  if   end==1   &      primary==1, detail
est store A 

estpost su rearn95  if   c40==1   &      end==1 & primary==1, detail
est store B

estpost su rearn95   if   c50==1   &      end==1 & primary==1, detail
est store C

estpost su rearn95  if   c60==1   &      end==1 & primary==1, detail
est store D


estpost su rearn95   if   c70==1   &      end==1 & primary==1, detail
est store E
estpost su rearn95  if   c80==1   &      end==1 & primary==1, detail
est store F


esttab A B C D E F  using median16.tex,  replace ///
cells(p50(fmt(2))) label booktabs nonum collabels(none) gaps noobs 





/*Baseline by cohort SECONDARY EDUCATION*/

estpost su rearn95    if   end==1   &      secondary==1, detail
est store A 

estpost su rearn95 if   c40==1   &      end==1 & secondary==1, detail
est store B

estpost su rearn95   if   c50==1   &      end==1 & secondary==1, detail
est store C

estpost su rearn95  if   c60==1   &      end==1 & secondary==1, detail
est store D


estpost su rearn95   if   c70==1   &      end==1 & secondary==1, detail
est store E

estpost su rearn95   if   c80==1   &      end==1 & secondary==1, detail
est store F



esttab A B C D E F  using median17.tex,  replace ///
cells(p50(fmt(2))) label booktabs nonum collabels(none) gaps noobs plain


/*Baseline by cohort VOCATIONAL SCHOOL*/

estpost su rearn95  if   end==1   &      vocational==1, detail
est store A 

estpost su rearn95  if   c40==1   &      end==1 & vocational==1, detail
est store B

estpost su rearn95  if   c50==1   &      end==1 & vocational==1, detail
est store C

estpost su rearn95   if   c60==1   &      end==1 & vocational==1, detail
est store D


estpost su rearn95  if   c70==1   &      end==1 & vocational==1, detail
est store E

estpost su rearn95  if   c80==1   &      end==1 & vocational==1, detail
est store F


esttab A B C D E F  using median18.tex,  replace ///
cells(p50(fmt(2))) label booktabs nonum collabels(none) gaps noobs plain




/*Baseline by cohort TERTIARY EDUCATION*/

estpost su rearn95   if   end==1   &      tertiary==1, detail
est store A 

estpost su rearn95  if   c40==1   &      end==1 & tertiary==1, detail
est store B

estpost su rearn95  if   c50==1   &      end==1 & tertiary==1, detail
est store C

estpost su rearn95   if   c60==1   &      end==1 & tertiary==1, detail
est store D


estpost su rearn95  if   c70==1   &      end==1 & tertiary==1, detail
est store E

estpost su rearn95  if   c80==1   &      end==1 & tertiary==1, detail
est store F



esttab A B C D E F  using median19.tex,  replace ///
cells(p50(fmt(2))) label booktabs nonum collabels(none) gaps obs plain






/*Age/Cohort -  2nd attempt*/
keep wid startdate stopdate empstatus age1jod  activity agestart agestop $z $y $x c40 c50 c60 c70 c80 $occ
sort wid
generate id = _n
expand duration
sort id
gen longage=agestart
quietly by id: replace longage=longage[_n-1]+1 if longage[_n-1]!=.
list wid jid startdate stopdate empstatus id longage, sepby(wid)






estpost su rearn95 if longage==25, detail
est store A 

estpost su rearn95 if     c40==1 & longage==25, detail
est store B

estpost su rearn95 if     c50==1 & longage==25, detail
est store C

estpost su rearn95 if    c60==1 & longage==25, detail
est store D


estpost su rearn95 if    c70==1 & longage==25, detail
est store E

estpost su rearn95 if   c80==1 & longage==25, detail   
est store F



	esttab A B C D E F  using median20.tex, replace ///
	mtitle("\textbf{Overall}" "\textbf{40s}" "\textbf{50s}"  "\textbf{60s}"  "\textbf{70s}" "\textbf{80s}" ) ///
cells(p50(fmt(2))) label booktabs nonum collabels(none) gaps noobs 


estpost su rearn95 if longage==35, detail
est store A 

estpost su rearn95 if   c40==1 & longage==35, detail
est store B

estpost su rearn95 if  c50==1 & longage==35, detail
est store C

estpost su rearn95  if   c60==1 & longage==35, detail
est store D


estpost su rearn95  if   c70==1 & longage==35, detail   
est store E



	esttab A B C D E  using median21.tex,  replace ///
cells(p50(fmt(2))) label booktabs nonum collabels(none) gaps obs plain
