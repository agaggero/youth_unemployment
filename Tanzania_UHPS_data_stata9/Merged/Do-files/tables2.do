clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
gen x =1
sort wid
by wid: replace x=sum(x)
by wid: egen activity=max(x)
sort wid jid

/*MACRO*/

global x age agestart   marriedp children   publicp rearn95  schooling raven   fed med  asset earnmembers other_sourcep hhbusinessp farmingp tradingp servicesp manufacturingp 
global y femalep
global z jid duration




*$x*
/****************Following the Unemployed****************/
/*OVERALL*/
/* In the overall sample we report  almost 400 individuals whos started off as unemployed. 85% of them  swtiched activity, while 15% did not switch. Let us first compare these two types of individuals.*/


estpost su $x $y if jid==1 & unemp==1 
est store A

estpost su $x  $y if jid==1 & unemp==1 & activity==1
est store B

estpost su $x $y if jid==1 & unemp==1 & activity!=1
est store C


	esttab A B C using baseline_unemp_1.tex, replace ///
	mtitle("\textbf{Overall}" "\textbf{Didn't switch}" "\textbf{Switched}") ///
   stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs


	  
	  
estpost su $y $x  if jid==2 & l.unemp==1 & self==1
est store A

estpost  su  $y $x   if jid==2 & l.unemp==1 & wage==1
est store B

estpost su $y $x  if jid==2 & l.unemp==1 & unemp==1
est store C

estpost su $y $x   if jid==2 & l.unemp==1 & student==1
est store D


	esttab A B C D using unempt1.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" "\textbf{Student}") ///
	stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs
  
	  
	  
 estpost su $y $x   if jid==3 & ll.unemp==1  & l.self==1 & self==1
est store A

estpost su $y $x   if jid==3& ll.unemp==1    & l.self==1 & wage==1
est store B

estpost su $y $x   if jid==3 & ll.unemp==1   & l.self==1 & unemp==1
est store C



	esttab A B C using unempt1selft2.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" ) ///
      		stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs

	  
	  
	  
	  
	  
 estpost su $y $x if jid==3 & ll.unemp==1   & l.wage==1 & self==1
est store A

estpost su $y $x if jid==3 & ll.unemp==1    & l.wage==1 & wage==1
est store B

estpost su $y $x  if jid==3 & ll.unemp==1    & l.wage==1 & unemp==1
est store C

estpost su $y $x  if jid==3 & ll.unemp==1    & l.wage==1 & student==1
est store D

	esttab A B C D using unempt1waget2.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" "\textbf{Student}") ///
     		stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs

	  
	  
	  
	  
	  
estpost su $y $x  if jid==3 & ll.unemp==1  & l.unemp==1 & self==1
est store A

estpost su $y $x  if jid==3 & ll.unemp==1    & l.unemp==1 & wage==1
est store B

estpost su $y $x  if jid==3 & ll.unemp==1   & l.unemp==1 & unemp==1
est store C

estpost su $y $x  if jid==3 & ll.unemp==1   & l.unemp==1 & student==1
est store D

	esttab A B C D using unempt1unempt2.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" "\textbf{Student}") ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs
	  
	  
	  
	  
estpost su $y $x  if jid==3 & ll.unemp==1   & l.student==1 & self==1
est store A

estpost su $y $x   if jid==3 & ll.unemp==1    & l.student==1 & wage==1
est store B

estpost su $y $x  if jid==3 & ll.unemp==1    & l.student==1 & unemp==1
est store C

estpost su $y $x   if jid==3 & ll.unemp==1    & l.student==1 & student==1
est store D

	esttab A B C D using unempt1studet2.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" "\textbf{Student}") ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs
	
	
	
	

	
	
	
/*MALE*/





estpost su $x if jid==1 & unemp==1  & female==0
est store A

estpost su $x if jid==1 & unemp==1 & activity==1 & female==0
est store B

estpost su $x if jid==1 & unemp==1 & activity!=1 & female==0
est store C


	esttab A B C using baseline_unemp_1m.tex, replace ///
	mtitle("\textbf{Overall}" "\textbf{Didn't switch}" "\textbf{Switched}") ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs

	  
	  
estpost su $x if jid==2 & l.unemp==1 & self==1 & female==0
est store A

estpost  su $x if jid==2 & l.unemp==1 & wage==1 & female==0
est store B

estpost su $x if jid==2 & l.unemp==1 & unemp==1 & female==0
est store C

estpost su $x if jid==2 & l.unemp==1 & student==1 & female==0
est store D


	esttab A B C D using unempt1m.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" "\textbf{Student}") ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs
	  
	  
 estpost su $x if jid==3 & ll.unemp==1  & l.self==1 & self==1 & female==0
est store A

estpost su $x if jid==3& ll.unemp==1    & l.self==1 & wage==1 & female==0
est store B

estpost su $x if jid==3 & ll.unemp==1   & l.self==1 & unemp==1 & female==0
est store C



	esttab A B C using unempt1selft2m.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" ) ///
stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs  

	  
	  
	  
	  
	  
 estpost su $x if jid==3 & ll.unemp==1   & l.wage==1 & self==1 & female==0
est store A

estpost su $x if jid==3 & ll.unemp==1    & l.wage==1 & wage==1 & female==0
est store B

estpost su $x if jid==3 & ll.unemp==1    & l.wage==1 & unemp==1 & female==0
est store C

estpost su $x if jid==3 & ll.unemp==1    & l.wage==1 & student==1 & female==0
est store D

	esttab A B C D using unempt1waget2m.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" "\textbf{Student}") ///
stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs  

	  
	  
	  
	  
	  
estpost su $x if jid==3 & ll.unemp==1  & l.unemp==1 & self==1 & female==0
est store A



	esttab A  using unempt1unempt2m.tex, replace ///
	mtitle("\textbf{Self}" ) ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs  
	  
	  
	  
estpost su $x if jid==3 & ll.unemp==1   & l.student==1 & self==1 & female==0
est store A

estpost su $x if jid==3 & ll.unemp==1    & l.student==1 & wage==1 & female==0
est store B

estpost su $x if jid==3 & ll.unemp==1    & l.student==1 & student==1 & female==0
est store C

	esttab A B C  using unempt1studet2m.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Student}") ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs
	
	
	












	
	
	
	
	
/*FEMALE*/


estpost su $x if jid==1 & unemp==1 & female==1
est store A

estpost su $x if jid==1 & unemp==1 & activity==1 & female==1
est store B

estpost su $x if jid==1 & unemp==1 & activity!=1 & female==1
est store C


	esttab A B C using baseline_unemp_1f.tex, replace ///
	mtitle("\textbf{Overall}" "\textbf{Didn't switch}" "\textbf{Switched}") ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs

	  
	  
estpost su $x if jid==2 & l.unemp==1 & self==1 & female==1
est store A

estpost  su $x if jid==2 & l.unemp==1 & wage==1 & female==1
est store B

estpost su $x if jid==2 & l.unemp==1 & unemp==1 & female==1
est store C

estpost su $x if jid==2 & l.unemp==1 & student==1 & female==1
est store D


	esttab A B C D using unempt1f.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" "\textbf{Student}") ///
   stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs
	  
	  
 estpost su $x if jid==3 & ll.unemp==1  & l.self==1 & self==1 & female==1
est store A

estpost su $x if jid==3& ll.unemp==1    & l.self==1 & wage==1 & female==1
est store B

estpost su $x if jid==3 & ll.unemp==1   & l.self==1 & unemp==1 & female==1
est store C



	esttab A B C using unempt1selft2f.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" ) ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs

	  
	  
	  
	  
	  
 estpost su $x if jid==3 & ll.unemp==1   & l.wage==1 & self==1 & female==1
est store A

estpost su $x if jid==3 & ll.unemp==1    & l.wage==1 & wage==1 & female==1
est store B

estpost su $x if jid==3 & ll.unemp==1    & l.wage==1 & unemp==1 & female==1
est store C

estpost su $x if jid==3 & ll.unemp==1    & l.wage==1 & student==1 & female==1
est store D

	esttab A B C D using unempt1waget2f.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" "\textbf{Student}") ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs

	  
	  
	  
	  
	  
estpost su $x if jid==3 & ll.unemp==1  & l.unemp==1 & self==1 & female==1
est store A

estpost su $x if jid==3 & ll.unemp==1    & l.unemp==1 & wage==1 & female==1
est store B

estpost su $x if jid==3 & ll.unemp==1   & l.unemp==1 & student==1 & female==1
est store C

	esttab A B C using unempt1unempt2f.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}"  "\textbf{Student}") ///
  stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs
	  
	  

estpost su $x if jid==3 & ll.unemp==1    & l.student==1 & unemp==1 & female==1
est store A



	esttab A  using unempt1studet2f.tex, replace ///
	mtitle( "\textbf{Unemployed}" ) ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs
	  
	  
	  
	  
	  
	  
	  
	  
/****************Following the Student****************/
/*OVERALL*/
/* In the overall sample we report  almost 250 individuals whos started off as unemployed. 97% of them  swtiched activity, while 3% did not switch. Let us first compare these two types of individuals.*/


estpost su $y $x  if jid==1 & student==1 
est store A

estpost su $y $x  if jid==1 & student==1 & activity==1
est store B

estpost su $y $x  if jid==1 & student==1 & activity!=1
est store C


	esttab A B C using baseline_stude_1.tex, replace ///
	mtitle("\textbf{Overall}" "\textbf{Didn't switch}" "\textbf{Switched}") ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs


	  
	  
estpost su $y $x  if jid==2 & l.student==1 & self==1
est store A

estpost  su $y $x  if jid==2 & l.student==1 & wage==1
est store B

estpost su $y $x  if jid==2 & l.student==1 & unemp==1
est store C

estpost su $y $x  if jid==2 & l.student==1 & student==1
est store D


	esttab A B C D using studet1.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" "\textbf{Student}") ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs
	  
	  
 estpost su $y $x   if jid==3 & ll.student==1  & l.self==1 & self==1
est store A

estpost su $y $x   if jid==3& ll.student==1    & l.self==1 & wage==1
est store B

estpost su $y $x  if jid==3 & ll.student==1   & l.self==1 & unemp==1
est store C



	esttab A B C using studet1selft2.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" ) ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs  

	  
	  
	  
	  
	  
 estpost su $y $x  if jid==3 & ll.student==1   & l.wage==1 & self==1
est store A

estpost su $y $x  if jid==3 & ll.student==1    & l.wage==1 & wage==1
est store B

estpost su $y $x  if jid==3 & ll.student==1    & l.wage==1 & unemp==1
est store C

estpost su $y $x  if jid==3 & ll.student==1    & l.wage==1 & student==1
est store D

	esttab A B C D using studet1waget2.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" "\textbf{Student}") ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs  

	  
	  
	  
	  
	  
estpost su $y $x   if jid==3 & ll.student==1  & l.unemp==1 & self==1
est store A

estpost su $y $x if jid==3 & ll.student==1    & l.unemp==1 & wage==1
est store B

estpost su $y $x  if jid==3 & ll.student==1   & l.unemp==1 & unemp==1
est store C

estpost su $y $x  if jid==3 & ll.student==1   & l.unemp==1 & student==1
est store D

	esttab A B C D using studet1unempt2.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" "\textbf{Student}") ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs  
	  
	  
	  
estpost su $y $x  if jid==3 & ll.student==1   & l.student==1 & self==1
est store A

estpost su $y $x  if jid==3 & ll.student==1    & l.student==1 & wage==1
est store B

estpost su $y $x  if jid==3 & ll.student==1    & l.student==1 & unemp==1
est store C

estpost su $y $x  if jid==3 & ll.student==1    & l.student==1 & student==1
est store D

	esttab A B C D using studet1studet2.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" "\textbf{Student}") ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs  
	
	
	
	

	
	
	
/*MALE*/





estpost su $x if jid==1 & student==1  & female==0
est store A

estpost su $x if jid==1 & student==1 & activity==1 & female==0
est store B

estpost su $x if jid==1 & student==1 & activity!=1 & female==0
est store C


	esttab A B C using baseline_stude_1m.tex, replace ///
	mtitle("\textbf{Overall}" "\textbf{Didn't switch}" "\textbf{Switched}") ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs

	  
	  
estpost su $x if jid==2 & l.student==1 & self==1 & female==0
est store A

estpost  su $x if jid==2 & l.student==1 & wage==1 & female==0
est store B

estpost su $x if jid==2 & l.student==1 & unemp==1 & female==0
est store C

estpost su $x if jid==2 & l.student==1 & student==1 & female==0
est store D


	esttab A B C D using studet1m.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" "\textbf{Student}") ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs
	  
	  
 estpost su $x if jid==3 & ll.student==1  & l.self==1 & self==1 & female==0
est store A

estpost su $x if jid==3& ll.student==1    & l.self==1 & wage==1 & female==0
est store B




	esttab A B  using studet1selft2m.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}") ///
  stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs 

	  
	  
	  
	  
	  
 estpost su $x if jid==3 & ll.student==1   & l.wage==1 & self==1 & female==0
est store A

estpost su $x if jid==3 & ll.student==1    & l.wage==1 & wage==1 & female==0
est store B

estpost su $x if jid==3 & ll.student==1    & l.wage==1 & unemp==1 & female==0
est store C

estpost su $x if jid==3 & ll.student==1    & l.wage==1 & student==1 & female==0
est store D

	esttab A B C D using studet1waget2m.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" "\textbf{Student}") ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs 

	  
	  
	  
	  
	  
estpost su $x if jid==3 & ll.student==1  & l.unemp==1 & self==1 & female==0
est store A
estpost su $x if jid==3 & ll.student==1  & l.unemp==1 & wage==1 & female==0
est store B
estpost su $x if jid==3 & ll.student==1  & l.unemp==1 & unemp==1 & female==0
est store C
estpost su $x if jid==3 & ll.student==1  & l.unemp==1 & student==1 & female==0
est store D



	esttab A B C D  using studet1unempt2m.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" "\textbf{Student}") ///
  stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs 
	  
	  
	  
estpost su $x if jid==3 & ll.student==1   & l.student==1 & self==1 & female==0
est store A

estpost su $x if jid==3 & ll.student==1    & l.student==1 & wage==1 & female==0
est store B

estpost su $x if jid==3 & ll.student==1    & l.student==1 & unemp==1 & female==0
est store C

estpost su $x if jid==3 & ll.student==1    & l.student==1 & student==1 & female==0
est store D

	esttab A B C D using studet1studet2m.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" "\textbf{Student}") ///
    stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs
	
	
	
	












	
	
	
	
	
/*FEMALE*/


estpost su $x if jid==1 & student==1  & female==1
est store A




	esttab A  using baseline_stude_1f.tex, replace ///
	mtitle("\textbf{Overall}") ///
   stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs

	  
	  
estpost su $x if jid==2 & l.student==1 & self==1 & female==1
est store A

estpost  su $x if jid==2 & l.student==1 & wage==1 & female==1
est store B

estpost su $x if jid==2 & l.student==1 & unemp==1 & female==1
est store C

estpost su $x if jid==2 & l.student==1 & student==1 & female==1
est store D


	esttab A B C D using studet1f.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" "\textbf{Student}") ///
  stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs
	  
	  
estpost su $x if jid==3 & ll.student==1    &  l.self==1 & self==1 & female==1
est store A

estpost su $x if jid==3 & ll.student==1    &  l.self==1 & wage==1 & female==1
est store B

estpost su $x if jid==3 & ll.student==1    &  l.self==1 & unemp==1 & female==1
est store C



	esttab A B C using studet1selft2f.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" ) ///
    stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs
	  
	  
	  
	  
	  
 estpost su $x if jid==3 & ll.student==1   & l.wage==1 & self==1 & female==1
est store A

estpost su $x if jid==3 & ll.student==1    & l.wage==1 & wage==1 & female==1
est store B

estpost su $x if jid==3 & ll.student==1    & l.wage==1 & unemp==1 & female==1
est store C

estpost su $x if jid==3 & ll.student==1    & l.wage==1 & student==1 & female==1
est store D

	esttab A B C D using studet1waget2f.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" "\textbf{Student}") ///
  stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs  

	  
	  
	  
	  
	  
estpost su $x if jid==3 & ll.student==1  & l.unemp==1 & self==1 & female==1
est store A

estpost su $x if jid==3 & ll.student==1    & l.unemp==1 & wage==1 & female==1
est store B

estpost su $x if jid==3 & ll.student==1   & l.unemp==1 & unemp==1 & female==1
est store C

estpost su $x if jid==3 & ll.student==1   & l.unemp==1 & student==1 & female==1
est store D

	esttab A B C D using studet1unempt2f.tex, replace ///
mtitle("\textbf{Self}" "\textbf{Wage}" "\textbf{Unemployed}" "\textbf{Student}") ///
stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs  
	  

estpost su $x if jid==3 & ll.student==1    & l.student==1 & self==1 & female==1
est store A
estpost su $x if jid==3 & ll.student==1    & l.student==1 & wage==1 & female==1
est store B
estpost su $x if jid==3 & ll.student==1    & l.student==1 & student==1 & female==1
est store C


	esttab A B C  using studet1studet2f.tex, replace ///
	mtitle("\textbf{Self}" "\textbf{Wage}"  "\textbf{Student}") ///
 stats(N, fmt(%18.0g) labels("Observations")) ///
 refcat(farmingp "\textbf{Type of HH Business:}", nolabel) ///
cells(mean(fmt(2))) label booktabs nonum collabels(none) gaps noobs  
	  
	  
	  
	  

