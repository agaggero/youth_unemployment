clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
gen x =1
sort wid
by wid: replace x=sum(x)
by wid: egen activity=max(x)
sort wid jid

/*MACRO*/

global x age    marriedp children   publicp rearn95  schooling raven   fed med  asset earnmembers other_sourcep hhbusinessp
global hhbus  farmingp tradingp servicesp manufacturingp 
global y femalep
global z jid duration
global occup selfp wagep unemp_studentp 


	  /* Baseline diff*/

	  
	 estpost su $z  $y $x    $hhbus $occup
	 est store A
	 
	estpost su  $y $x  $hhbus $occup if jid==1 & activity==1
	 est store B
	  
	  estpost su   $y  $x  $hhbus $occup if jid==1 & activity !=1
	 est store C
	  
	  esttab A B C  using baseline1.tex, replace ///
	mtitle("\textbf{Overall}" "\textbf{Never Switched}"  "\textbf{Switched}") ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(selfp "\textbf{Occupation:}"  farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs  
	  
	  
		 estpost su  $y $x  $hhbus  if jid==1 & self==1
	 est store A
	 
	estpost su  $y $x $hhbus  if jid==1 &  wage==1
	 est store B
	  
	  estpost su   $y  $x $hhbus  if jid==1 & (unemp==1 | student==1)
	 est store C
	  
	  esttab A B C  using baseline2.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}"  "\textbf{Unemployed}") ///
     stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs






	  
estpost su $z  $y $x  $hhbus if jid==1 & unemp==1
	 est store A
	 
	estpost su $z $y $x $hhbus  if jid==1 &  student==1
	 est store B
	  

	  esttab A B   using baseline3.tex, replace ///
	mtitle(  "\textbf{Unemployed}" "\textbf{Student}" ) ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs  
	  
	  
	  
	  
	  /*Gender Dec*/
	  
	  
	  
 estpost su $z $x   $hhbus $occup
est store A 
estpost su $z $x  $hhbus  $occup if female==0
est store B
estpost su $z $x  $hhbus $occup if female==1
est store C


	esttab A B C  using genderdec1.tex, replace ///
	mtitle("\textbf{Overall}" "\textbf{Male}"  "\textbf{Female}") ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(selfp "\textbf{Occupation:}"  farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs


 
	  
	  
 estpost su  $x  $hhbus    if jid==1 & unemp==1
est store A 
estpost su  $x  $hhbus   if female==0 & jid==1 & unemp==1

est store B
estpost su  $x  $hhbus   if female==1 & jid==1 & unemp==1

est store C


	esttab A B C  using genderdec2.tex, replace ///
	mtitle("\textbf{Overall}" "\textbf{Male}"  "\textbf{Female}") ///
  stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs



	  
estpost su  $x  $hhbus    if jid==1 & student==1
est store A 
estpost su  $x  $hhbus   if female==0 & jid==1 & student==1

est store B
estpost su  $x  $hhbus   if female==1 & jid==1 & student==1

est store C


	esttab A B C  using genderdec3.tex, replace ///
	mtitle("\textbf{Overall}" "\textbf{Male}"  "\textbf{Female}") ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs	  
	  
	  
	  
	  

 
	  /*By level of education*/
	  
	  
	  
	  
	  
estpost su  $z  $y age1jod $x  $hhbus  $occup 
est store A 

estpost su  $z  $y  age1jod $x  $hhbus $occup if   primary==1
est store B

estpost su  $z   $y age1jod $x $hhbus $occup  if  secondary==1
est store C

estpost su  $z  $y  age1jod $x  $hhbus $occup if   tertiary==1
est store D


estpost su  $z   $y age1jod  $x $hhbus $occup if   vocational==1
est store E



	esttab A B C D E   using byedu.tex, replace ///
	mtitle("\textbf{Overall}" "\textbf{Primary}" "\textbf{Secondary}"  "\textbf{Tertiary}"  "\textbf{Vocational}"  "\textbf{80s}" ) ///
      stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(selfp "\textbf{Occupation:}"  farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs




/*TRANSITIONS OF DIFFERENT COHORTS*/


/*40s*/

estpost su  $z   $y age1jod $x   $hhbus $occup
est store A 

estpost su  $z   $y age1jod $x $hhbus $occup if   c40==1
est store B

estpost su  $z   $y age1jod  $x  $hhbus $occup if  c50==1
est store C

estpost su  $z   $y age1jod $x $hhbus $occup if   c60==1
est store D


estpost su  $z   $y age1jod $x $hhbus $occup if   c70==1
est store E

estpost su  $z   $y age1jod $x $hhbus $occup if  c80==1
est store F


	esttab A B C D E F  using cohort1.tex, f replace ///
	mtitle("\textbf{Overall}" "\textbf{40s}" "\textbf{50s}"  "\textbf{60s}"  "\textbf{70s}"  "\textbf{80s}" ) ///
      		stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(selfp "\textbf{Occupation:}"  farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs

	  
	  
	  
	  
	  
/*Tables by AGE*/


gen age1620=0
replace age1620=1 if agestart>16 & agestart<=20

gen age2025=0
replace age2025=1 if agestart>20 & agestart<=25

gen age2530=0
replace age2530=1 if agestart>25 & agestart<=30

gen age3035=0
replace age3035=1 if agestart>30 & agestart<=35

gen age3540=0
replace age3540=1 if agestart>35 & agestart<=40




gen age2030=0
replace age2030=1 if agestart>20 & agestart<=30

gen age3040=0
replace age3040=1 if agestart>30 & agestart<=40




estpost su  $z $y $x  if   age1620==1
est store A

estpost su  $z $y $x  if   age2025==1
est store B

estpost su  $z $y $x  if  age2530==1
est store C

estpost su  $z $y $x  if   age3035==1
est store D


estpost su  $z $y $x  if   age3540==1
est store E




	esttab A B C D E using age.tex, replace ///
	mtitle("\textbf{Age 16-20}""\textbf{Age 21-25}" "\textbf{Age 26-30}" "\textbf{Age 36-35}"   "\textbf{Age 36-40}") ///
   stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs
	  	  
		  
		  
		  
estpost su  $z $y $x  if   age1620==1
est store A

estpost su  $z $y $x  if   age2030==1
est store B

estpost su  $z $y $x  if  age3040==1
est store C


	esttab A B C  using age2.tex, replace ///
	mtitle("\textbf{Age 16-20}""\textbf{Age 21-30}" "\textbf{Age 31-40}") ///
   stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs  
		  
		 
		 

		 
		 
		 

/*Age/Cohort -  2nd attempt*/
keep wid startdate stopdate empstatus age1jod  activity agestart agestop $z $y $x c40 c50 c60 c70 c80 $occup $hhbus
sort wid
generate id = _n
expand duration
sort id
gen longage=agestart
quietly by id: replace longage=longage[_n-1]+1 if longage[_n-1]!=.
list wid jid startdate stopdate empstatus id longage, sepby(wid)







estpost su  jid   $y age1jod $x $hhbus $occup if longage>=20 & longage<26    
est store A 

estpost su  jid   $y age1jod $x $hhbus $occup if   c40==1 & longage>=20 &  longage<26 
est store B

estpost su  jid   $y age1jod $x $hhbus $occup if  c50==1 & longage>=20 & longage<26    
est store C

estpost su  jid   $y age1jod $x $hhbus $occup if   c60==1 & longage>=20 & longage<26    
est store D


estpost su  jid   $y age1jod $x $hhbus $occup if   c70==1 & longage>=20 & longage<26    
est store E

estpost su  jid   $y age1jod $x $hhbus $occup if  c80==1 & longage>=20 & longage<26    
est store F



	esttab A B C D E F  using cohort25.tex, f replace ///
	mtitle("\textbf{Overall}" "\textbf{40s}" "\textbf{50s}"  "\textbf{60s}"  "\textbf{70s}"  "\textbf{80s}" ) ///
      		stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(selfp "\textbf{Occupation:}"  farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs



estpost su  jid   $y age1jod $x $hhbus $occup if longage>=30 & longage<36  
est store A 

estpost su  jid   $y age1jod $x $hhbus $occup if   c40==1 & longage>=30 & longage<36  
est store B

estpost su  jid   $y age1jod $x $hhbus $occup if  c50==1 & longage>=30 & longage<36     
est store C

estpost su  jid   $y age1jod $x $hhbus $occup if   c60==1 & longage>=30 & longage<36  
est store D


estpost su  jid  $y age1jod $x $hhbus $occup if   c70==1 & longage>=30 & longage<36   
est store E



	esttab A B C D E   using cohort35.tex, f replace ///
	mtitle("\textbf{Overall}" "\textbf{40s}" "\textbf{50s}"  "\textbf{60s}"  "\textbf{70s}"  ) ///
      		stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(selfp "\textbf{Occupation:}"  farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs




*/

	 
