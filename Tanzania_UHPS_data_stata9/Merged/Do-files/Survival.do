clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
gen x =1
sort wid
by wid: replace x=sum(x)
by wid: egen activity=max(x)
sort wid jid






******************************************************************************************************************************************************
*************************************            Probability of exit EMPLOYMENT              *******************************************************
******************************************************************************************************************************************************
/*Survival Analysis*/
clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
gen x =1
sort wid
by wid: replace x=sum(x)
by wid: egen activity=max(x)
sort wid jid

/*Self + Wage*/
gen employed =0
replace employed=1 if self==1 | wage==1

by wid: gen censored=0
by wid: replace censored=1 if  jid==activity
keep if employed==1
stset duration, failure(censored==0)
streg female schooling experience married children earnmember hhbusiness,  distribution(weibull) nohr
streg female schooling experience married children earnmember hhbusiness,  distribution(weibull) nohr cluster(city)




/*Table*/
quietly  streg female schooling experience married children earnmember hhbusiness,  distribution(exponential) nohr cluster(city)
est store A

quietly  streg female schooling experience married children earnmember hhbusiness,  distribution(weibull) nohr cluster(city)
est store B

quietly  stcox female schooling experience married children earnmember hhbusiness,   nohr cluster(city)
est store C


quietly esttab A B C ///
  using emp_unemp.tex,  replace ///
label mtitles("\textbf{Exponential}" "\textbf{Weibull}" "\textbf{Cox}") ///
star(* 0.10 ** 0.05 *** 0.01) title(\textsc{Transition from Employment to Unemployment}) 





/*Self*/ 
 
 clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
gen x =1
sort wid
by wid: replace x=sum(x)
by wid: egen activity=max(x)
sort wid jid


by wid: gen censored=0
by wid: replace censored=1 if  jid==activity
keep if self==1
stset duration, failure(censored==0)
streg female schooling experience married children earnmember hhbusiness,  distribution(weibull) nohr
streg female schooling experience married children earnmember hhbusiness,  distribution(weibull) nohr cluster(city)
 
 
 
 
 
 
 
 /*Wage*/ 
 
 clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
gen x =1
sort wid
by wid: replace x=sum(x)
by wid: egen activity=max(x)
sort wid jid


by wid: gen censored=0
by wid: replace censored=1 if  jid==activity
keep if wage==1
stset duration, failure(censored==0)
streg female schooling experience married children earnmember hhbusiness,  distribution(weibull) nohr
streg female schooling experience married children earnmember hhbusiness,  distribution(weibull) nohr cluster(city)


 
 ******************************************************************************************************************************************************
*************************************            Probability of exit UNEMPLOYMENT              *******************************************************
******************************************************************************************************************************************************
/*Survival Analysis*/
clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
gen x =1
sort wid
by wid: replace x=sum(x)
by wid: egen activity=max(x)
sort wid jid


/*Unemployed + Students*/
by wid: gen censored=0
by wid: replace censored=1 if  jid==activity
keep if unemp_student==1
stset duration, failure(censored==0)
streg female schooling experience married children earnmember hhbusiness,  distribution(weibull) nohr
streg female schooling experience married children earnmember hhbusiness,  distribution(weibull) nohr cluster(city)


/*Table*/

streg female schooling experience married children earnmember hhbusiness,  distribution(exponential) nohr cluster(city)
est store A

streg female schooling experience married children earnmember hhbusiness,  distribution(weibull) nohr cluster(city)
est store B


stcox female schooling experience married children earnmember hhbusiness,  nohr cluster(city)
est store C

quietly esttab A B C ///
  using unempstude_emp.tex,  replace ///
label mtitles("\textbf{Exponential}" "\textbf{Weibull}" "\textbf{Cox}") ///
star(* 0.10 ** 0.05 *** 0.01) title(\textsc{Transition from Unemployment to Employment})





/*Unemployed*/
clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
gen x =1
sort wid
by wid: replace x=sum(x)
by wid: egen activity=max(x)
sort wid jid
by wid: gen censored=0
by wid: replace censored=1 if  jid==activity
keep if unemp==1
stset duration, failure(censored==0)
streg female schooling experience married children earnmember hhbusiness,  distribution(weibull) nohr
streg female schooling experience married children earnmember hhbusiness,  distribution(weibull) nohr cluster(city)






/*Table*/

streg female schooling experience married children earnmember hhbusiness,  distribution(exponential) nohr cluster(city)
est store A

streg female schooling experience married children earnmember hhbusiness,  distribution(weibull) nohr cluster(city)
est store B


stcox female schooling experience married children earnmember hhbusiness,  nohr cluster(city)
est store C

quietly esttab A B C ///
  using unemp_emp.tex,  replace ///
label mtitles("\textbf{Exponential}" "\textbf{Weibull}" "\textbf{Cox}") ///
star(* 0.10 ** 0.05 *** 0.01) title(\textsc{Transition from Unemployment to Employment})



/*Students*/clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
gen x =1
sort wid
by wid: replace x=sum(x)
by wid: egen activity=max(x)
sort wid jid

by wid: gen censored=0
by wid: replace censored=1 if  jid==activity
keep if student==1
stset duration, failure(censored==0)
streg female schooling experience married children earnmember hhbusiness,  distribution(weibull) nohr
streg female schooling experience married children earnmember hhbusiness,  distribution(weibull) nohr cluster(city)
