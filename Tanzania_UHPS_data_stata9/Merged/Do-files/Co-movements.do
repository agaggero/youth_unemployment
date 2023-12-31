

do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\Final- Data Ready to Use.do"

*****************************************************************************
**************   Co-movements Dummy variable  *******************************
*****************************************************************************
/* We want to create a dummy variable which equals one if another member of the household switch empstatus x years before*/

duplicates report wid startdate
duplicates tag wid startdate, gen(isdup2)
drop if isdup2==1
tsset wid startdate


sort hid startdate


 gen startdate_star= startdate + 60
 gen past=0
 by hid: replace past=1 if startdate>= f.startdate_star & l.startdate==startdate
 




