clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"


 
 gen x =1
 sort wid
 by wid: replace x=sum(x)
 by wid: egen activity=max(x)

 

/*
/*****************************************************************************************************
*************************************** Characterising Jid=1 only  ************************************
 *****************************************************************************************************/

*log using "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\log-files\jid=1", text replace
xtdes
keep if activity==1 & jid==1

sum duration
tab schooling
tab female

tab empstatus, sum(duration)
tab empstatus, sum(schooling)
tab empstatus, sum(schoolduration)
tab empstatus, sum(westartage)
tab empstatus, sum(weleftage)
tab empstatus, sum(age)
tab empstatus, sum(agestart)
tab schooling, sum(agestart)
tab empstatus, sum(children)
tab empstatus, sum(married)
tab empstatus, sum(hhbusiness)
tab empstatus, sum(fed)
tab empstatus, sum(med)
tab empstatus, sum(promoted)
tab empstatus, sum(happy)
tab schooling, sum(agestart)


sum fed med
tab debt
tab empstatus, sum(distprim)
tab empstatus, sum (distsec)
tab public
tab ngo
tab civil

tab empstatus, sum(distprim)
tab empstatus, sum(distsec)


sum earnstart earn
sum earnstart earn if earnstart!=.

tab empstatus, sum(earn)
sum age
sum agestart
tab schooling, sum(age)
tab primary, sum(age)
tab secondary, sum(age)
tab tertiary, sum(age)
tab vocational, sum(age)
tab hhdeath
tab married
tab children
sum children
tab hhhead female
tab empstatus, sum(female)

tab hhbusiness 
tab hhbustype
tab hhbustype, sum(self)
*log close

*/
*****************************************************************************************************
*************************************** Characterising Jid=1 & Jid=2  ************************************
 *****************************************************************************************************/
*log using "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\log-files\jid=1&2", text replace
xtdes
keep if activity==2
