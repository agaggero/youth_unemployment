
/*jid=1 time t*/

clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
gen x =1
sort wid
by wid: replace x=sum(x)
by wid: egen activity=max(x)
sort wid jid
keep if activity==1 

tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if jid==1, by(empstatus) format(%9.2fc) save
tabstatmat jid1t
matrix jid1t= jid1t'
mat colnames jid1t= Self,  Wage,  Unemployed, Student, Overall
mat list jid1t, noheader
outtable using jid1t, mat(jid1t) format(%9.2fc)




/*jid=2 time t*/
clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
gen x =1
sort wid
by wid: replace x=sum(x)
by wid: egen activity=max(x)
sort wid jid
keep if activity==2

tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if jid==1, by(empstatus) format(%9.2fc) save
tabstatmat jid2t
matrix jid2t= jid2t'
mat colnames jid2t= Self,  Wage,  Unemployed, Student, Overall
mat list jid2t, noheader
outtable using jid2t, mat(jid2t) format(%9.2fc)

/*jid=2 time t+1*/
tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if jid==2, by(empstatus) format(%9.2fc) save
tabstatmat jid2t1
matrix jid2t1= jid2t1'
mat colnames jid2t1= Self,  Wage,  Unemployed, Student, Overall
mat list jid2t1, noheader
outtable using jid2t1, mat(jid2t1) format(%9.2fc)




/*jid=3 time t*/
clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
gen x =1
sort wid
by wid: replace x=sum(x)
by wid: egen activity=max(x)
sort wid jid
keep if activity==3


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if jid==1, by(empstatus) format(%9.2fc) save
tabstatmat jid3t
matrix jid3t= jid3t'
mat colnames jid3t= Self,  Wage,  Unemployed, Student, Overall
mat list jid3t, noheader
outtable using jid3t, mat(jid3t) format(%9.2fc)

/*jid=3 time t+1*/
tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if jid==2, by(empstatus) format(%9.2fc) save
tabstatmat jid3t1
matrix jid3t1= jid3t1'
mat colnames jid3t1= Self,  Wage,  Unemployed, Student, Overall
mat list jid3t1, noheader
outtable using jid3t1, mat(jid3t1) format(%9.2fc)


/*jid=3 time t+2*/
tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if jid==3, by(empstatus) format(%9.2fc) save
tabstatmat jid3t2
matrix jid3t2= jid3t2'
mat colnames jid3t2= Self,  Wage,  Unemployed, Overall
mat list jid3t2, noheader
outtable using jid3t2, mat(jid3t2) format(%9.2fc)





/*jid=4 time t*/
clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
gen x =1
sort wid
by wid: replace x=sum(x)
by wid: egen activity=max(x)
sort wid jid
keep if activity==4

tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if jid==1, by(empstatus) format(%9.2fc) save
tabstatmat jid4t
matrix jid4t= jid4t'
mat colnames jid4t= Self,  Wage,  Unemployed, Student, Overall
mat list jid4t, noheader
outtable using jid4t, mat(jid4t) format(%9.2fc)

/*jid=4 time t+1*/
tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if jid==2, by(empstatus) format(%9.2fc) save
tabstatmat jid4t1
matrix jid4t1= jid4t1'
mat colnames jid4t1= Self,  Wage,  Unemployed, Student, Overall
mat list jid4t1, noheader
outtable using jid4t1, mat(jid4t1) format(%9.2fc)


/*jid=4 time t+2*/
tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if jid==3, by(empstatus) format(%9.2fc) save
tabstatmat jid4t2
matrix jid4t2= jid4t2'
mat colnames jid4t2= Self,  Wage,  Unemployed, Student, Overall
mat list jid4t2, noheader
outtable using jid4t2, mat(jid4t2) format(%9.2fc)


/*jid=4 time t+3*/
tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if jid==4, by(empstatus) format(%9.2fc) save
tabstatmat jid4t3
matrix jid4t3= jid4t3'
mat colnames jid4t3= Self,  Wage,  Unemployed, Overall
mat list jid4t3, noheader
outtable using jid4t3, mat(jid4t3) format(%9.2fc)












******* Following the Unemployed ******
/*jid2*/
/*unemp time t, after*/

clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
gen x =1
sort wid
by wid: replace x=sum(x)
by wid: egen activity=max(x)
sort wid jid
keep if activity==2
tab empstatus if l.unemp==1


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if jid==2 & l.unemp==1, by(empstatus) format(%9.2fc) save
tabstatmat unempjid2t1
matrix unempjid2t1= unempjid2t1'
mat colnames unempjid2t1= Self,  Wage,  Unemployed, Overall
mat list unempjid2t1, noheader
outtable using unempjid2t1, mat(unempjid2t1) format(%9.2fc)







/*jid3*/
/*unemp time t, after*/

clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
gen x =1
sort wid
by wid: replace x=sum(x)
by wid: egen activity=max(x)
sort wid jid
keep if activity==3
tab empstatus if l.unemp==1 & jid==2


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if jid==2 & l.unemp==1, by(empstatus) format(%9.2fc) save
tabstatmat jid3ut
matrix jid3ut= jid3ut'
mat colnames jid3ut= Self,  Wage,  Unemployed, Student,  Overall
mat list jid3ut, noheader
outtable using jid3ut, mat(jid3ut) format(%9.2fc)



/*jid3*/
/*unemp time t, self t+1 */



tab empstatus if ll.unemp==1 & l.self==1 &  jid==3


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if ll.unemp==1 & l.self==1 &  jid==3,  by(empstatus) format(%9.2fc) save
tabstatmat jid3utst1
matrix jid3utst1= jid3utst1'
mat colnames jid3utst1= Self,  Wage, Unemployed,   Overall
mat list jid3utst1, noheader
outtable using jid3utst1, mat(jid3utst1) format(%9.2fc)



/*jid3*/
/*unemp time t, wage t+1 */



tab empstatus if ll.unemp==1 & l.wage==1 &  jid==3


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if ll.unemp==1 & l.wage==1 &  jid==3,  by(empstatus) format(%9.2fc) save
tabstatmat jid3utwt1
matrix jid3utwt1= jid3utwt1'
mat colnames jid3utwt1= Self,  Wage, Unemployed,   Overall
mat list jid3utwt1, noheader
outtable using jid3utwt1, mat(jid3utwt1) format(%9.2fc)


/*jid3*/
/*unemp time t, unemp t+1 */



tab empstatus if ll.unemp==1 & l.unemp==1 &  jid==3


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if ll.unemp==1 & l.unemp==1 &  jid==3,  by(empstatus) format(%9.2fc) save
tabstatmat jid3utut1
matrix jid3utut1= jid3utut1'
mat colnames jid3utut1= Self,  Wage,    Overall
mat list jid3utut1, noheader
outtable using jid3utut1, mat(jid3utut1) format(%9.2fc)



/*jid3*/
/*unemp time t, student t+1 */



tab empstatus if ll.unemp==1 & l.student==1 &  jid==3


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if ll.unemp==1 & l.student==1 &  jid==3,  by(empstatus) format(%9.2fc) save
tabstatmat jid3utstt1
matrix jid3utstt1= jid3utstt1'
mat colnames jid3utstt1=  Wage,    Overall
mat list jid3utstt1, noheader
outtable using jid3utstt1, mat(jid3utstt1) format(%9.2fc)










/*jid4*/
/*unemp time t, after*/

clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
gen x =1
sort wid
by wid: replace x=sum(x)
by wid: egen activity=max(x)
sort wid jid
keep if activity==4
tab empstatus if l.unemp==1 & jid==2


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if jid==2 & l.unemp==1, by(empstatus) format(%9.2fc) save
tabstatmat jid4ut
matrix jid4ut= jid4ut'
mat colnames jid4ut= Self,  Wage,  Unemployed,   Overall
mat list jid4ut, noheader
outtable using jid4ut, mat(jid4ut) format(%9.2fc)


tab empstatus if ll.unemp==1 & l.self==1 & jid==3


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if ll.unemp==1 & l.self==1 & jid==3, by(empstatus) format(%9.2fc) save
tabstatmat jid4utst1
matrix jid4utst1= jid4utst1'
mat colnames jid4utst1= Self,  Wage,  Unemployed,  Overall
mat list jid4utst1, noheader
outtable using jid4utst1, mat(jid4utst1) format(%9.2fc)



tab empstatus if ll.unemp==1 & l.wage==1 & jid==3


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if ll.unemp==1 & l.wage==1 & jid==3, by(empstatus) format(%9.2fc) save
tabstatmat jid4utwt1
matrix jid4utwt1= jid4utwt1'
mat colnames jid4utwt1= Self,  Wage,  Unemployed, Student,  Overall
mat list jid4utwt1, noheader
outtable using jid4utwt1, mat(jid4utwt1) format(%9.2fc)


tab empstatus if ll.unemp==1 & l.unemp==1 & jid==3


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if ll.unemp==1 & l.unemp==1 & jid==3, by(empstatus) format(%9.2fc) save
tabstatmat jid4utut1
matrix jid4utut1= jid4utut1'
mat colnames jid4utut1= Self,  Student,  Overall
mat list jid4utut1, noheader
outtable using jid4utut1, mat(jid4utut1) format(%9.2fc)







tab empstatus if lll.unemp==1 & ll.self==1& l.self==1& jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.unemp==1 & ll.self==1& l.self==1& jid==4, by(empstatus) format(%9.2fc) save
tabstatmat jid4utst1st2
matrix jid4utst1st2= jid4utst1st2'
mat colnames jid4utst1st2=   Self,   Overall
mat list jid4utst1st2, noheader
outtable using jid4utst1st2, mat(jid4utst1st2) format(%9.2fc)


tab empstatus if lll.unemp==1 & ll.self==1& l.wage==1& jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.unemp==1 & ll.self==1& l.wage==1& jid==4, by(empstatus) format(%9.2fc) save
tabstatmat jid4utst1wt2
matrix jid4utst1wt2= jid4utst1wt2'
mat colnames jid4utst1wt2=  Self,  Wage,   Overall
mat list jid4utst1wt2, noheader
outtable using jid4utst1wt2, mat(jid4utst1wt2) format(%9.2fc)



tab empstatus if lll.unemp==1 & ll.self==1& l.unemp==1& jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.unemp==1 & ll.self==1& l.unemp==1& jid==4, by(empstatus) format(%9.2fc) save
tabstatmat jid4utst1ut2
matrix jid4utst1ut2= jid4utst1ut2'
mat colnames jid4utst1ut2=   Wage,   Overall
mat list jid4utst1ut2, noheader
outtable using jid4utst1ut2, mat(jid4utst1ut2) format(%9.2fc)





tab empstatus if lll.unemp==1 & ll.wage==1& l.self==1& jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.unemp==1 & ll.wage==1& l.self==1& jid==4, by(empstatus) format(%9.2fc) save
tabstatmat jid4utwt1st2
matrix jid4utwt1st2= jid4utwt1st2'
mat colnames jid4utwt1st2= Self,   Wage, Unemp,    Overall
mat list jid4utwt1st2, noheader
outtable using jid4utwt1st2, mat(jid4utwt1st2) format(%9.2fc)






tab empstatus if lll.unemp==1 & ll.wage==1& l.wage==1 & jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.unemp==1 & ll.wage==1& l.wage==1 & jid==4, by(empstatus) format(%9.2fc) save
tabstatmat jid4utwt1wt2
matrix jid4utwt1wt2= jid4utwt1wt2'
mat colnames jid4utwt1wt2=   Self, Wage,   Overall
mat list jid4utwt1wt2, noheader
outtable using jid4utwt1wt2, mat(jid4utwt1wt2) format(%9.2fc)





tab empstatus if lll.unemp==1 & ll.wage==1& l.unemp==1 & jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.unemp==1 & ll.wage==1& l.unemp==1 & jid==4,  by(empstatus) format(%9.2fc) save
tabstatmat jid4utwt1ut2
matrix jid4utwt1ut2= jid4utwt1ut2'
mat colnames jid4utwt1ut2=  Self,  Wage,   Overall
mat list jid4utwt1ut2, noheader
outtable using jid4utwt1ut2, mat(jid4utwt1ut2) format(%9.2fc)



tab empstatus if lll.unemp==1 & ll.wage==1& l.student==1& jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.unemp==1 & ll.wage==1& l.student==1& jid==4, by(empstatus) format(%9.2fc) save
tabstatmat jid4utwt1stt2
matrix jid4utwt1stt2= jid4utwt1stt2'
mat colnames jid4utwt1stt2=   Self, Wage,   Overall
mat list jid4utwt1stt2, noheader
outtable using jid4utwt1stt2, mat(jid4utwt1stt2) format(%9.2fc)





tab empstatus if lll.unemp==1 & ll.unemp==1& l.self==1& jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.unemp==1 & ll.unemp==1& l.self==1& jid==4, by(empstatus) format(%9.2fc) save
tabstatmat jid4utut1st2
matrix jid4utut1st2= jid4utut1st2'
mat colnames jid4utut1st2=  Self, Unemp,   Overall
mat list jid4utut1st2, noheader
outtable using jid4utut1st2, mat(jid4utut1st2) format(%9.2fc)




tab empstatus if lll.unemp==1 & ll.unemp==1& l.student==1& jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.unemp==1 & ll.unemp==1& l.student==1& jid==4, by(empstatus) format(%9.2fc) save
tabstatmat jid4utut1stt2
matrix jid4utut1stt2= jid4utut1stt2'
mat colnames jid4utut1stt2=   Wage,   Overall
mat list jid4utut1stt2, noheader
outtable using jid4utut1stt2, mat(jid4utut1stt2) format(%9.2fc)





******* Following the Student ******
/*jid2*/
/*student time t, after*/

clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
gen x =1
sort wid
by wid: replace x=sum(x)
by wid: egen activity=max(x)
sort wid jid
keep if activity==2
tab empstatus if l.student==1


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if jid==2 & l.student==1, by(empstatus) format(%9.2fc) save
tabstatmat studentjid2t1
matrix studentjid2t1= studentjid2t1'
mat colnames studentjid2t1= Self,  Wage,  Unemployed, Overall
mat list studentjid2t1, noheader
outtable using studentjid2t1, mat(studentjid2t1) format(%9.2fc)




/*jid3*/
/*student time t, after*/

clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
gen x =1
sort wid
by wid: replace x=sum(x)
by wid: egen activity=max(x)
sort wid jid
keep if activity==3
tab empstatus if l.student==1 & jid==2


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if jid==2 & l.student==1, by(empstatus) format(%9.2fc) save
tabstatmat jid3stt
matrix jid3stt= jid3stt'
mat colnames jid3stt= Self,  Wage,  Unemployed, Student,  Overall
mat list jid3stt, noheader
outtable using jid3stt, mat(jid3stt) format(%9.2fc)



/*jid3*/
/*student time t, self t+1 */



tab empstatus if ll.student==1 & l.self==1 &  jid==3


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if ll.student==1 & l.self==1 &  jid==3,  by(empstatus) format(%9.2fc) save
tabstatmat jid3sttst1
matrix jid3sttst1= jid3sttst1'
mat colnames jid3sttst1= Self,  Unemployed,   Overall
mat list jid3sttst1, noheader
outtable using jid3sttst1, mat(jid3sttst1) format(%9.2fc)



/*jid3*/
/*student time t, wage t+1 */



tab empstatus if ll.student==1 & l.wage==1 &  jid==3


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if ll.student==1 & l.wage==1 &  jid==3,  by(empstatus) format(%9.2fc) save
tabstatmat jid3sttwt1
matrix jid3sttwt1= jid3sttwt1'
mat colnames jid3sttwt1= Self,  Wage, Unemployed,   Overall
mat list jid3sttwt1, noheader
outtable using jid3sttwt1, mat(jid3sttwt1) format(%9.2fc)


/*jid3*/
/*student time t, unemp t+1 */



tab empstatus if ll.student==1 & l.unemp==1 &  jid==3


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if ll.student==1 & l.unemp==1 &  jid==3,  by(empstatus) format(%9.2fc) save
tabstatmat jid3sttut1
matrix jid3sttut1= jid3sttut1'
mat colnames jid3sttut1= Self,  Wage,    Overall
mat list jid3sttut1, noheader
outtable using jid3sttut1, mat(jid3sttut1) format(%9.2fc)



/*jid3*/
/*student time t, student t+1 */



tab empstatus if ll.student==1 & l.student==1 &  jid==3


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if ll.student==1 & l.student==1 &  jid==3,  by(empstatus) format(%9.2fc) save
tabstatmat jid3sttstt1
matrix jid3sttstt1= jid3sttstt1'
mat colnames jid3sttstt1=  Wage,  Unemployed  Overall
mat list jid3sttstt1, noheader
outtable using jid3sttstt1, mat(jid3sttstt1) format(%9.2fc)








/*jid4*/
/*student time t, after*/

clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"
gen x =1
sort wid
by wid: replace x=sum(x)
by wid: egen activity=max(x)
sort wid jid
keep if activity==4


tab empstatus if l.student==1 & jid==2


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if jid==2 & l.student==1, by(empstatus) format(%9.2fc) save
tabstatmat jid4stt
matrix jid4stt= jid4stt'
mat colnames jid4stt= Self,  Wage,  Unemployed, Student  Overall
mat list jid4stt, noheader
outtable using jid4stt, mat(jid4stt) format(%9.2fc)


tab empstatus if ll.student==1 & l.self==1 & jid==3


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if ll.student==1 & l.self==1 & jid==3, by(empstatus) format(%9.2fc) save
tabstatmat jid4sttst1
matrix jid4sttst1= jid4sttst1'
mat colnames jid4sttst1= Wage,  Overall
mat list jid4sttst1, noheader
outtable using jid4sttst1, mat(jid4sttst1) format(%9.2fc)



tab empstatus if ll.student==1 & l.wage==1 & jid==3


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if ll.student==1 & l.wage==1 & jid==3, by(empstatus) format(%9.2fc) save
tabstatmat jid4sttwt1
matrix jid4sttwt1= jid4sttwt1'
mat colnames jid4sttwt1= Self,  Wage,  Unemployed, Student,  Overall
mat list jid4sttwt1, noheader
outtable using jid4sttwt1, mat(jid4sttwt1) format(%9.2fc)


tab empstatus if ll.student==1 & l.unemp==1 & jid==3


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if ll.student==1 & l.unemp==1 & jid==3, by(empstatus) format(%9.2fc) save
tabstatmat jid4sttut1
matrix jid4sttut1= jid4sttut1'
mat colnames jid4sttut1= Self, Wage, Unemployed,  Student,  Overall
mat list jid4sttut1, noheader
outtable using jid4sttut1, mat(jid4sttut1) format(%9.2fc)







tab empstatus if lll.student==1 & ll.self==1& l.wage==1 & jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.student==1 & ll.self==1& l.wage==1& jid==4, by(empstatus) format(%9.2fc) save
tabstatmat jid4sttst1wt2
matrix jid4sttst1wt2= jid4sttst1wt2'
mat colnames jid4sttst1wt2=   Self, Wage  Overall
mat list jid4sttst1wt2, noheader
outtable using jid4sttst1wt2, mat(jid4sttst1wt2) format(%9.2fc)


tab empstatus if lll.student==1 & ll.wage==1& l.self==1& jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.student==1 & ll.wage==1& l.self==1& jid==4, by(empstatus) format(%9.2fc) save
tabstatmat jid4sttwt1st2
matrix jid4sttwt1st2= jid4sttwt1st2'
mat colnames jid4sttwt1st2=  Self,  Wage,   Overall
mat list jid4sttwt1st2, noheader
outtable using jid4sttwt1st2, mat(jid4sttwt1st2) format(%9.2fc)



tab empstatus if lll.student==1 & ll.wage==1& l.wage==1& jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.student==1 & ll.wage==1& l.wage==1& jid==4, by(empstatus) format(%9.2fc) save
tabstatmat jid4sttwt1wt2
matrix jid4sttwt1wt2= jid4sttwt1wt2'
mat colnames jid4sttwt1wt2= Self,   Wage,   Overall
mat list jid4sttwt1wt2, noheader
outtable using jid4sttwt1wt2, mat(jid4sttwt1wt2) format(%9.2fc)


tab empstatus if lll.student==1 & ll.wage==1& l.unemp==1& jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.student==1 & ll.wage==1& l.unemp==1& jid==4, by(empstatus) format(%9.2fc) save
tabstatmat jid4sttwt1ut2
matrix jid4sttwt1ut2= jid4sttwt1ut2'
mat colnames jid4sttwt1ut2= Self,     Overall
mat list jid4sttwt1ut2, noheader
outtable using jid4sttwt1ut2, mat(jid4sttwt1ut2) format(%9.2fc)


tab empstatus if lll.student==1 & ll.wage==1& l.student==1 & jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.student==1 & ll.wage==1& l.student==1 & jid==4, by(empstatus) format(%9.2fc) save
tabstatmat jid4sttwt1stt2
matrix jid4sttwt1stt2= jid4sttwt1stt2'
mat colnames jid4sttwt1stt2=   Wage,    Overall
mat list jid4sttwt1stt2, noheader
outtable using jid4sttwt1stt2, mat(jid4sttwt1stt2) format(%9.2fc)






tab empstatus if lll.student==1 & ll.unemp==1& l.self==1 & jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.student==1 & ll.unemp==1& l.self==1 & jid==4, by(empstatus) format(%9.2fc) save
tabstatmat jid4sttut1st2
matrix jid4sttut1st2= jid4sttut1st2'
mat colnames jid4sttut1st2=   Self, Wage, Unemployed  Overall
mat list jid4sttut1st2, noheader
outtable using jid4sttut1st2, mat(jid4sttut1st2) format(%9.2fc)





tab empstatus if lll.student==1 & ll.unemp==1& l.wage==1 & jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.student==1 & ll.unemp==1& l.wage==1 & jid==4,  by(empstatus) format(%9.2fc) save
tabstatmat jid4sttut1wt2
matrix jid4sttut1wt2= jid4sttut1wt2'
mat colnames jid4sttut1wt2=  Self,  Wage, Unemployed,    Overall
mat list jid4sttut1wt2, noheader
outtable using jid4sttut1wt2, mat(jid4sttut1wt2) format(%9.2fc)



tab empstatus if lll.student==1 & ll.unemp==1& l.unemp==1& jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.student==1 & ll.unemp==1& l.unemp==1& jid==4, by(empstatus) format(%9.2fc) save
tabstatmat jid4sttut1ut2
matrix jid4sttut1ut2= jid4sttut1ut2'
mat colnames jid4sttut1ut2=   Self, Wage,   Overall
mat list jid4sttut1ut2, noheader
outtable using jid4sttut1ut2, mat(jid4sttut1ut2) format(%9.2fc)





tab empstatus if lll.student==1 & ll.unemp==1& l.student==1& jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.student==1 & ll.unemp==1& l.student==1& jid==4, by(empstatus) format(%9.2fc) save
tabstatmat jid4sttut1stt2
matrix jid4sttut1stt2= jid4sttut1stt2'
mat colnames jid4sttut1stt2=  Wage   Overall
mat list jid4sttut1stt2, noheader
outtable using jid4sttut1stt2, mat(jid4sttut1stt2) format(%9.2fc)






tab empstatus if lll.student==1 & ll.student==1 &  jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.student==1 & ll.student==1 &  jid==4, by(empstatus) format(%9.2fc) save
tabstatmat jid4sttstt1
matrix jid4sttstt1= jid4sttstt1'
mat colnames jid4sttstt1=   Self, Wage, Student,  Overall
mat list jid4sttstt1, noheader
outtable using jid4sttstt1, mat(jid4sttstt1) format(%9.2fc)






tab empstatus if lll.student==1 & ll.student==1 & l.self==1& jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.student==1 & ll.student==1 & l.self==1& jid==4, by(empstatus) format(%9.2fc) save
tabstatmat jid4sttstt1st2
matrix jid4sttstt1st2= jid4sttstt1st2'
mat colnames jid4sttstt1st2=   Self,   Overall
mat list jid4sttstt1st2, noheader
outtable using jid4sttstt1st2, mat(jid4sttstt1st2) format(%9.2fc)




tab empstatus if lll.student==1 & ll.student==1 & l.wage==1& jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.student==1 & ll.student==1 & l.wage==1& jid==4, by(empstatus) format(%9.2fc) save
tabstatmat jid4sttstt1wt2
matrix jid4sttstt1wt2= jid4sttstt1wt2'
mat colnames jid4sttstt1wt2=  Self,  Wage,  Unemp,  Overall
mat list jid4sttstt1wt2, noheader
outtable using jid4sttstt1wt2, mat(jid4sttstt1wt2) format(%9.2fc)


tab empstatus if lll.student==1 & ll.student==1 & l.student==1& jid==4


tabstat duration married children schooling speed fed med distprim distsec earn hhbusiness agestart if lll.student==1 & ll.student==1 & l.student==1& jid==4, by(empstatus) format(%9.2fc) save
tabstatmat jid4sttstt1stt2
matrix jid4sttstt1stt2= jid4sttstt1stt2'
mat colnames jid4sttstt1stt2=   Unemployed,   Overall
mat list jid4sttstt1stt2, noheader
outtable using jid4sttstt1stt2, mat(jid4sttstt1stt2) format(%9.2fc)



