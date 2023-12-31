clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"


 
 gen x =1
 sort wid
 by wid: replace x=sum(x)
 by wid: egen activity=max(x)
sort wid jid
 

*****************************************************************************************************
*************************************** Characterising Jid=1-3  ************************************
 *****************************************************************************************************/
*log using "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\log-files\jid=1&2", text replace
xtdes
keep if activity==3
tab empstatus if jid==1

/*time t*/
sum duration   if jid==1
sum married    if jid==1
sum children   if jid==1 
sum schooling  if jid==1
sum primary    if jid==1
sum secondary  if jid==1
sum tertiary   if jid==1
sum vocational if jid==1
sum fed        if jid==1
sum med        if jid==1
sum distpri    if jid==1
sum distsec    if jid==1
sum agestart   if jid==1
sum weleftage  if jid==1
sum earn       if jid==1
sum earnstart  if jid==1
sum hhbusiness if jid==1
sum happy      if jid==1
sum compare    if jid==1
sum expected   if jid==1



/*time t+1*/

tab empstatus if jid==2


sum duration   if jid==2
sum married    if jid==2
sum children   if jid==2 
sum schooling  if jid==2
sum primary    if jid==2
sum secondary  if jid==2
sum tertiary   if jid==2
sum vocational if jid==2
sum fed        if jid==2
sum med        if jid==2
sum distpri    if jid==2
sum distsec    if jid==2
sum agestart   if jid==2
sum weleftage  if jid==2
sum earn       if jid==2
sum earnstart  if jid==2
sum hhbusiness if jid==2
sum happy      if jid==2
sum compare    if jid==2
sum expected   if jid==2



/*time t+2*/

tab empstatus if jid==3


sum duration   if jid==3
sum married    if jid==3
sum children   if jid==3 
sum schooling  if jid==3
sum primary    if jid==3
sum secondary  if jid==3
sum tertiary   if jid==3
sum vocational if jid==3
sum fed        if jid==3
sum med        if jid==3
sum distpri    if jid==3
sum distsec    if jid==3
sum agestart   if jid==3
sum weleftage  if jid==3
sum earn       if jid==3
sum earnstart  if jid==3
sum hhbusiness if jid==3
sum happy      if jid==3
sum compare    if jid==3
sum expected   if jid==3








/*Self at t=1, Baseline Characteristics*/
sum duration      if self==1 & jid==1
sum married       if self==1 & jid==1
sum children      if self==1 & jid==1
sum schooling     if self==1 & jid==1
sum fed           if self==1 & jid==1
sum med           if self==1 & jid==1
sum weleftage     if self==1 & jid==1
tab  primary      if self==1 & jid==1
tab  secondary    if self==1 & jid==1
tab  tertiary     if self==1 & jid==1
tab  married      if self==1 & jid==1
tab whystartself  if self==1 & jid==1
tab hhbusiness    if self==1 & jid==1
tab commute       if self==1 & jid==1
tab expected      if self==1 & jid==1
tab happy         if self==1 & jid==1
tab compare       if self==1 & jid==1
sum earn          if self==1 & jid==1
sum earnstart     if self==1 & jid==1
tab whystopself   if self==1 & jid==1
sum distprim      if self==1 & jid==1
sum distsec       if self==1 & jid==1



/*Wage at t=1, Baseline Characteristics*/
sum duration       if wage==1 & jid==1
sum married        if wage==1 & jid==1
sum children       if wage==1 & jid==1
sum schooling      if wage==1 & jid==1
sum fed            if wage==1 & jid==1
sum med            if wage==1 & jid==1
sum weleftage      if wage==1 & jid==1
sum primary        if wage==1 & jid==1
tab  primary       if wage==1 & jid==1
tab  secondary     if wage==1 & jid==1
tab  tertiary      if wage==1 & jid==1
tab  married       if wage==1 & jid==1
tab whystartself   if wage==1 & jid==1
tab hhbusiness     if wage==1 & jid==1
tab commute        if wage==1 & jid==1
tab expected       if wage==1 & jid==1
tab happy          if wage==1 & jid==1
tab compare        if wage==1 & jid==1
sum earn           if wage==1 & jid==1
sum earnstart      if wage==1 & jid==1
tab whystopself    if wage==1 & jid==1
sum distprim       if wage==1 & jid==1
sum  distsec       if wage==1 & jid==1








/*Unemployed at t=1, Baseline Characteristics*/
sum duration         if unemp==1 & jid==1
sum married          if unemp==1 & jid==1
sum children         if unemp==1 & jid==1
sum schooling        if unemp==1 & jid==1
sum fed              if unemp==1 & jid==1
sum med              if unemp==1 & jid==1
sum weleftage        if unemp==1 & jid==1
sum primary          if unemp==1 & jid==1
tab  primary         if unemp==1 & jid==1
tab  secondary       if unemp==1 & jid==1
tab  tertiary        if unemp==1 & jid==1
tab  married         if unemp==1 & jid==1
tab whystartself     if unemp==1 & jid==1
tab hhbusiness       if unemp==1 & jid==1
tab commute          if unemp==1 & jid==1
tab expected         if unemp==1 & jid==1
tab happy            if unemp==1 & jid==1
tab compare          if unemp==1 & jid==1
sum earn             if unemp==1 & jid==1
sum earnstart        if unemp==1 & jid==1
tab whystopself      if unemp==1 & jid==1
tab cashunemp        if unemp==1 & jid==1
sum timejobsearch    if unemp==1 & jid==1
sum distprim         if unemp==1 & jid==1
sum distsec          if unemp==1 & jid==1






/*Student at t=1, Baseline Characteristics*/
sum duration       if dum_student==1 & jid==1
sum agestart       if dum_student==1 & jid==1
sum married        if dum_student==1 & jid==1
sum children       if dum_student==1 & jid==1
sum schooling      if dum_student==1 & jid==1
sum fed            if dum_student==1 & jid==1
sum med            if dum_student==1 & jid==1
sum weleftage      if dum_student==1 & jid==1
sum primary        if dum_student==1 & jid==1
tab  primary       if dum_student==1 & jid==1
tab  secondary     if dum_student==1 & jid==1
tab  tertiary      if dum_student==1 & jid==1
tab  married       if dum_student==1 & jid==1
tab whystartself   if dum_student==1 & jid==1
tab hhbusiness     if dum_student==1 & jid==1
tab commute        if dum_student==1 & jid==1
tab expected       if dum_student==1 & jid==1
tab happy          if dum_student==1 & jid==1
tab compare        if dum_student==1 & jid==1
sum earn           if dum_student==1 & jid==1
sum earnstart      if dum_student==1 & jid==1
tab whystopself    if dum_student==1 & jid==1
tab cashunemp      if dum_student==1 & jid==1
tab timejobsearch  if dum_student==1 & jid==1
sum distprim       if dum_student==1 & jid==1
sum distsec        if dum_student==1 & jid==1






/*Self at t+1, Baseline Characteristics*/
sum duration      if self==1 & jid==2
sum married       if self==1 & jid==2
sum children      if self==1 & jid==2
sum schooling     if self==1 & jid==2
sum fed           if self==1 & jid==2
sum med           if self==1 & jid==2
sum weleftage     if self==1 & jid==2
sum primary       if self==1 & jid==2
tab  primary      if self==1 & jid==2
tab  secondary    if self==1 & jid==2
tab  tertiary     if self==1 & jid==2
tab  married      if self==1 & jid==2
tab whystartself  if self==1 & jid==2
tab hhbusiness    if self==1 & jid==2
tab commute       if self==1 & jid==2
tab expected      if self==1 & jid==2
tab happy         if self==1 & jid==2
tab compare       if self==1 & jid==2
sum earn          if self==1 & jid==2
sum earnstart     if self==1 & jid==2
tab whystopself   if self==1 & jid==2
sum distprim      if self==1 & jid==2
sum distsec       if self==1 & jid==2



/*Wage at t+1, Baseline Characteristics*/
sum duration       if wage==1 & jid==2
sum married        if wage==1 & jid==2
sum children       if wage==1 & jid==2
sum schooling      if wage==1 & jid==2
sum fed            if wage==1 & jid==2
sum med            if wage==1 & jid==2
sum weleftage      if wage==1 & jid==2
sum primary        if wage==1 & jid==2
tab  primary       if wage==1 & jid==2
tab  secondary     if wage==1 & jid==2
tab  tertiary      if wage==1 & jid==2
tab  married       if wage==1 & jid==2
tab whystartself   if wage==1 & jid==2
tab hhbusiness     if wage==1 & jid==2
tab commute        if wage==1 & jid==2
tab expected       if wage==1 & jid==2
tab happy          if wage==1 & jid==2
tab compare        if wage==1 & jid==2
sum earn           if wage==1 & jid==2
sum earnstart      if wage==1 & jid==2
tab whystopself    if wage==1 & jid==2
sum distprim       if wage==1 & jid==2
sum  distsec       if wage==1 & jid==2








/*Unemployed at t+1, Baseline Characteristics*/
sum duration         if unemp==1 & jid==2
sum married          if unemp==1 & jid==2
sum children         if unemp==1 & jid==2
sum schooling        if unemp==1 & jid==2
sum fed              if unemp==1 & jid==2
sum med              if unemp==1 & jid==2
sum weleftage        if unemp==1 & jid==2
sum primary          if unemp==1 & jid==2
tab  primary         if unemp==1 & jid==2
tab  secondary       if unemp==1 & jid==2
tab  tertiary        if unemp==1 & jid==2
tab  married         if unemp==1 & jid==2
tab whystartself     if unemp==1 & jid==2
tab hhbusiness       if unemp==1 & jid==2
tab commute          if unemp==1 & jid==2
tab expected         if unemp==1 & jid==2
tab happy            if unemp==1 & jid==2
tab compare          if unemp==1 & jid==2
sum earn             if unemp==1 & jid==2
sum earnstart        if unemp==1 & jid==2
tab whystopself      if unemp==1 & jid==2
tab cashunemp        if unemp==1 & jid==2
sum timejobsearch    if unemp==1 & jid==2
sum distprim         if unemp==1 & jid==2
sum distsec          if unemp==1 & jid==2






/*Student at t+1, Baseline Characteristics*/
sum duration       if dum_student==1 & jid==2
sum agestart       if dum_student==1 & jid==2
sum married        if dum_student==1 & jid==2
sum children       if dum_student==1 & jid==2
sum schooling      if dum_student==1 & jid==2
sum fed            if dum_student==1 & jid==2
sum med            if dum_student==1 & jid==2
sum weleftage      if dum_student==1 & jid==2
sum primary        if dum_student==1 & jid==2
tab  primary       if dum_student==1 & jid==2
tab  secondary     if dum_student==1 & jid==2
tab  tertiary      if dum_student==1 & jid==2
tab  married       if dum_student==1 & jid==2
tab whystartself   if dum_student==1 & jid==2
tab hhbusiness     if dum_student==1 & jid==2
tab commute        if dum_student==1 & jid==2
tab expected       if dum_student==1 & jid==2
tab happy          if dum_student==1 & jid==2
tab compare        if dum_student==1 & jid==2
sum earn           if dum_student==1 & jid==2
sum earnstart      if dum_student==1 & jid==2
tab whystopself    if dum_student==1 & jid==2
tab cashunemp      if dum_student==1 & jid==2
tab timejobsearch  if dum_student==1 & jid==2
sum distprim       if dum_student==1 & jid==2
sum distsec        if dum_student==1 & jid==2





/*Self at t+2, Baseline Characteristics*/
sum duration      if self==1 & jid==3
sum married       if self==1 & jid==3
sum children      if self==1 & jid==3
sum schooling     if self==1 & jid==3
sum fed           if self==1 & jid==3
sum med           if self==1 & jid==3
sum weleftage     if self==1 & jid==3
sum primary       if self==1 & jid==3
tab  primary      if self==1 & jid==3
tab  secondary    if self==1 & jid==3
tab  tertiary     if self==1 & jid==3
tab  married      if self==1 & jid==3
tab whystartself  if self==1 & jid==3
tab hhbusiness    if self==1 & jid==3
tab commute       if self==1 & jid==3
tab expected      if self==1 & jid==3
tab happy         if self==1 & jid==3
tab compare       if self==1 & jid==3
sum earn          if self==1 & jid==3
sum earnstart     if self==1 & jid==3
tab whystopself   if self==1 & jid==3
sum distprim      if self==1 & jid==3
sum distsec       if self==1 & jid==3



/*Wage at t+2, Baseline Characteristics*/
sum duration       if wage==1 & jid==3
sum married        if wage==1 & jid==3
sum children       if wage==1 & jid==3
sum schooling      if wage==1 & jid==3
sum fed            if wage==1 & jid==3
sum med            if wage==1 & jid==3
sum weleftage      if wage==1 & jid==3
sum primary        if wage==1 & jid==3
tab  primary       if wage==1 & jid==3
tab  secondary     if wage==1 & jid==3
tab  tertiary      if wage==1 & jid==3
tab  married       if wage==1 & jid==3
tab whystartself   if wage==1 & jid==3
tab hhbusiness     if wage==1 & jid==3
tab commute        if wage==1 & jid==3
tab expected       if wage==1 & jid==3
tab happy          if wage==1 & jid==3
tab compare        if wage==1 & jid==3
sum earn           if wage==1 & jid==3
sum earnstart      if wage==1 & jid==3
tab whystopself    if wage==1 & jid==3
sum distprim       if wage==1 & jid==3
sum  distsec       if wage==1 & jid==3








/*Unemployed at t+2, Baseline Characteristics*/
sum duration         if unemp==1 & jid==3
sum married          if unemp==1 & jid==3
sum children         if unemp==1 & jid==3
sum schooling        if unemp==1 & jid==3
sum fed              if unemp==1 & jid==3
sum med              if unemp==1 & jid==3
sum weleftage        if unemp==1 & jid==3
sum primary          if unemp==1 & jid==3
tab  primary         if unemp==1 & jid==3
tab  secondary       if unemp==1 & jid==3
tab  tertiary        if unemp==1 & jid==3
tab  married         if unemp==1 & jid==3
tab whystartself     if unemp==1 & jid==3
tab hhbusiness       if unemp==1 & jid==3
tab commute          if unemp==1 & jid==3
tab expected         if unemp==1 & jid==3
tab happy            if unemp==1 & jid==3
tab compare          if unemp==1 & jid==3
sum earn             if unemp==1 & jid==3
sum earnstart        if unemp==1 & jid==3
tab whystopself      if unemp==1 & jid==3
tab cashunemp        if unemp==1 & jid==3
sum timejobsearch    if unemp==1 & jid==3
sum distprim         if unemp==1 & jid==3
sum distsec          if unemp==1 & jid==3






/*Student at t+2, Baseline Characteristics*/
sum duration       if dum_student==1 & jid==3
sum agestart       if dum_student==1 & jid==3
sum married        if dum_student==1 & jid==3
sum children       if dum_student==1 & jid==3
sum schooling      if dum_student==1 & jid==3
sum fed            if dum_student==1 & jid==3
sum med            if dum_student==1 & jid==3
sum weleftage      if dum_student==1 & jid==3
sum primary        if dum_student==1 & jid==3
tab  primary       if dum_student==1 & jid==3
tab  secondary     if dum_student==1 & jid==3
tab  tertiary      if dum_student==1 & jid==3
tab  married       if dum_student==1 & jid==3
tab whystartself   if dum_student==1 & jid==3
tab hhbusiness     if dum_student==1 & jid==3
tab commute        if dum_student==1 & jid==3
tab expected       if dum_student==1 & jid==3
tab happy          if dum_student==1 & jid==3
tab compare        if dum_student==1 & jid==3
sum earn           if dum_student==1 & jid==3
sum earnstart      if dum_student==1 & jid==3
tab whystopself    if dum_student==1 & jid==3
tab cashunemp      if dum_student==1 & jid==3
tab timejobsearch  if dum_student==1 & jid==3
sum distprim       if dum_student==1 & jid==3
sum distsec        if dum_student==1 & jid==3






/*

/************* Pretest Mean Tests **************/
/* self vs wage */
ttest schooling      if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest primary        if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest secondary      if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest tertiary      if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest weleftage      if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest married        if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest children       if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest fed            if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest med            if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest duration       if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest earn           if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest distprim       if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest distsec        if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest earnstart      if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)



/* self vs unemp */

ttest schooling      if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest primary        if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest secondary      if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest tertiary       if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest weleftage      if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest married        if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest children       if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest fed            if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest med            if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest duration       if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest earn           if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest distprim       if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest distsec        if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest earnstart      if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)


/* self vs student */

ttest schooling      if jid==1 & empstatus!="Wage employed" & empstatus!="Unemployed", by (empstatus)
ttest primary        if jid==1 & empstatus!="Wage employed" & empstatus!="Unemployed", by (empstatus)
ttest secondary      if jid==1 & empstatus!="Wage employed" & empstatus!="Unemployed", by (empstatus)
ttest tertiary       if jid==1 & empstatus!="Wage employed" & empstatus!="Unemployed", by (empstatus)
ttest weleftage      if jid==1 & empstatus!="Wage employed" & empstatus!="Unemployed", by (empstatus)
ttest married        if jid==1 & empstatus!="Wage employed" & empstatus!="Unemployed", by (empstatus)
ttest children       if jid==1 & empstatus!="Wage employed" & empstatus!="Unemployed", by (empstatus)
ttest fed            if jid==1 & empstatus!="Wage employed" & empstatus!="Unemployed", by (empstatus)
ttest med            if jid==1 & empstatus!="Wage employed" & empstatus!="Unemployed", by (empstatus)
ttest duration       if jid==1 & empstatus!="Wage employed" & empstatus!="Unemployed", by (empstatus)
ttest earn           if jid==1 & empstatus!="Wage employed" & empstatus!="Unemployed", by (empstatus)
ttest distprim       if jid==1 & empstatus!="Wage employed" & empstatus!="Unemployed", by (empstatus)
ttest distsec        if jid==1 & empstatus!="Wage employed" & empstatus!="Unemployed", by (empstatus)
ttest earnstart      if jid==1 & empstatus!="Wage employed" & empstatus!="Unemployed", by (empstatus)

*/



/**************************************
*******Dynamics  of Self Employed******
**************************************/
clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"


 
 gen x =1
 sort wid
 by wid: replace x=sum(x)
 by wid: egen activity=max(x)
sort wid jid

xtdes
keep if activity==3
tab empstatus if jid==1
 
/*Self t, Self t+1*/

tab empstatus if  l.self==1 & jid==2



sum duration      if self==1 & l.self==1 & jid==2
sum married       if self==1 & l.self==1 & jid==2
sum children      if self==1 & l.self==1 & jid==2
sum schooling     if self==1 & l.self==1 & jid==2
sum weleftage     if self==1 & l.self==1 & jid==2
tab  primary      if self==1 & l.self==1 & jid==2
tab  secondary    if self==1 & l.self==1 & jid==2
tab  tertiary     if self==1 & l.self==1 & jid==2
tab  married      if self==1 & l.self==1 & jid==2
tab whystartself  if self==1 & l.self==1 & jid==2
tab hhbusiness    if self==1 & l.self==1 & jid==2
tab commute       if self==1 & l.self==1 & jid==2
tab expected      if self==1 & l.self==1 & jid==2
tab happy         if self==1 & l.self==1 & jid==2
tab compare       if self==1 & l.self==1 & jid==2
sum earn          if self==1 & l.self==1 & jid==2
sum earnstart     if self==1 & l.self==1 & jid==2
tab whystopself   if self==1 & l.self==1 & jid==2
sum children      if self==1 & l.self==1 & jid==2
sum fed           if self==1 & l.self==1 & jid==2
sum med           if self==1 & l.self==1 & jid==2
sum distprim      if self==1 & l.self==1 & jid==2
sum distsec       if self==1 & l.self==1 & jid==2
sum agestart      if self==1 & l.self==1 & jid==2
tab whyleftwage   if self==1 & l.self==1 & jid==2





/* Self t and  Wage t+1*/

sum duration      if wage==1 & l.self==1 & jid==2
sum married       if wage==1 & l.self==1 & jid==2
sum children      if wage==1 & l.self==1 & jid==2
sum schooling     if wage==1 & l.self==1 & jid==2
sum weleftage     if wage==1 & l.self==1 & jid==2
tab  primary      if wage==1 & l.self==1 & jid==2
tab  secondary    if wage==1 & l.self==1 & jid==2
tab  tertiary     if wage==1 & l.self==1 & jid==2
tab  married      if wage==1 & l.self==1 & jid==2
tab whystartself  if wage==1 & l.self==1 & jid==2
tab hhbusiness    if wage==1 & l.self==1 & jid==2
tab commute       if wage==1 & l.self==1 & jid==2
sum expected      if wage==1 & l.self==1 & jid==2
sum happy         if wage==1 & l.self==1 & jid==2
tab compare       if wage==1 & l.self==1 & jid==2
sum earn          if wage==1 & l.self==1 & jid==2
sum earnstart     if wage==1 & l.self==1 & jid==2
tab whystopself   if wage==1 & l.self==1 & jid==2
sum children      if wage==1 & l.self==1 & jid==2
sum fed           if wage==1 & l.self==1 & jid==2
sum med           if wage==1 & l.self==1 & jid==2
sum distprim      if wage==1 & l.self==1 & jid==2
sum distsec       if wage==1 & l.self==1 & jid==2
sum agestart      if wage==1 & l.self==1 & jid==2


/*Self t, Unemp t+1*/

sum duration      if unemp==1 & l.self==1 & jid==2
sum married       if unemp==1 & l.self==1 & jid==2
sum children      if unemp==1 & l.self==1 & jid==2
sum schooling     if unemp==1 & l.self==1 & jid==2
sum weleftage     if unemp==1 & l.self==1 & jid==2
tab  primary      if unemp==1 & l.self==1 & jid==2
tab  secondary    if unemp==1 & l.self==1 & jid==2
tab  tertiary     if unemp==1 & l.self==1 & jid==2
tab  married      if unemp==1 & l.self==1 & jid==2
tab whystartself  if unemp==1 & l.self==1 & jid==2
tab hhbusiness    if unemp==1 & l.self==1 & jid==2
tab commute       if unemp==1 & l.self==1 & jid==2
tab expected      if unemp==1 & l.self==1 & jid==2
tab happy         if unemp==1 & l.self==1 & jid==2
tab compare       if unemp==1 & l.self==1 & jid==2
sum earn          if unemp==1 & l.self==1 & jid==2
sum earnstart     if unemp==1 & l.self==1 & jid==2
tab whystopself   if unemp==1 & l.self==1 & jid==2
sum children      if unemp==1 & l.self==1 & jid==2
sum fed           if unemp==1 & l.self==1 & jid==2
sum med           if unemp==1 & l.self==1 & jid==2
sum distprim      if unemp==1 & l.self==1 & jid==2
sum distsec       if unemp==1 & l.self==1 & jid==2
sum agestart      if unemp==1 & l.self==1 & jid==2

/*t, t+1, t+2*/
clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"


 
 gen x =1
 sort wid
 by wid: replace x=sum(x)
 by wid: egen activity=max(x)
sort wid jid

xtdes
keep if activity==3
 
/*Self t, Self t+1, Self t+2*/

tab empstatus if  ll.self==1 & l.wage==1 & self==1 & jid==3



sum duration      if ll.self==1 & l.self==1 & jid==3 & self==1
sum married       if ll.self==1 & l.self==1 & jid==3 & self==1
sum children      if ll.self==1 & l.self==1 & jid==3 & self==1
sum schooling     if ll.self==1 & l.self==1 & jid==3 & self==1
sum weleftage     if ll.self==1 & l.self==1 & jid==3 & self==1
tab primary       if ll.self==1 & l.self==1 & jid==3 & self==1
tab secondary     if ll.self==1 & l.self==1 & jid==3 & self==1
tab tertiary      if ll.self==1 & l.self==1 & jid==3 & self==1
tab married       if ll.self==1 & l.self==1 & jid==3 & self==1
tab whystartself  if ll.self==1 & l.self==1 & jid==3 & self==1
tab hhbusiness    if ll.self==1 & l.self==1 & jid==3 & self==1
tab commute       if ll.self==1 & l.self==1 & jid==3 & self==1
sum expected      if ll.self==1 & l.self==1 & jid==3 & self==1
sum happy         if ll.self==1 & l.self==1 & jid==3 & self==1
sum compare       if ll.self==1 & l.self==1 & jid==3 & self==1
sum earn          if ll.self==1 & l.self==1 & jid==3 & self==1
sum earnstart     if ll.self==1 & l.self==1 & jid==3 & self==1
tab whystopself   if ll.self==1 & l.self==1 & jid==3 & self==1
sum children      if ll.self==1 & l.self==1 & jid==3 & self==1
sum fed           if ll.self==1 & l.self==1 & jid==3 & self==1
sum med           if ll.self==1 & l.self==1 & jid==3 & self==1
sum distprim      if ll.self==1 & l.self==1 & jid==3 & self==1
sum distsec       if ll.self==1 & l.self==1 & jid==3 & self==1
sum agestart      if ll.self==1 & l.self==1 & jid==3 & self==1
tab whyleftwage   if ll.self==1 & l.self==1 & jid==3 & self==1




/*Self t, Wage t+1, Self t+2*/

tab empstatus if  ll.self==1 & l.wage==1 & jid==3 & wage==1



sum duration      if ll.self==1 & l.wage==1 & jid==3 & self==1
sum married       if ll.self==1 & l.wage==1 & jid==3 & self==1
sum children      if ll.self==1 & l.wage==1 & jid==3 & self==1
sum schooling     if ll.self==1 & l.wage==1 & jid==3 & self==1
sum weleftage     if ll.self==1 & l.wage==1 & jid==3 & self==1
tab primary       if ll.self==1 & l.wage==1 & jid==3 & self==1
tab secondary     if ll.self==1 & l.wage==1 & jid==3 & self==1
tab tertiary      if ll.self==1 & l.wage==1 & jid==3 & self==1
tab married       if ll.self==1 & l.wage==1 & jid==3 & self==1
tab whystartself  if ll.self==1 & l.wage==1 & jid==3 & self==1
tab hhbusiness    if ll.self==1 & l.wage==1 & jid==3 & self==1
tab commute       if ll.self==1 & l.wage==1 & jid==3 & self==1
sum expected      if ll.self==1 & l.wage==1 & jid==3 & self==1
sum happy         if ll.self==1 & l.wage==1 & jid==3 & self==1
sum compare       if ll.self==1 & l.wage==1 & jid==3 & self==1
sum earn          if ll.self==1 & l.wage==1 & jid==3 & self==1
sum earnstart     if ll.self==1 & l.wage==1 & jid==3 & self==1
tab whystopself   if ll.self==1 & l.wage==1 & jid==3 & self==1
sum children      if ll.self==1 & l.wage==1 & jid==3 & self==1
sum fed           if ll.self==1 & l.wage==1 & jid==3 & self==1
sum med           if ll.self==1 & l.wage==1 & jid==3 & self==1
sum distprim      if ll.self==1 & l.wage==1 & jid==3 & self==1
sum distsec       if ll.self==1 & l.wage==1 & jid==3 & self==1
sum agestart      if ll.self==1 & l.wage==1 & jid==3 & self==1
tab whyleftwage   if ll.self==1 & l.wage==1 & jid==3 & self==1



/*Self t, Wage t+1, Wage t+2*/

tab empstatus if  ll.self==1 & l.wage==1 & jid==3 & wage==1



sum duration      if ll.self==1 & l.wage==1 & jid==3 & wage==1
sum married       if ll.self==1 & l.wage==1 & jid==3 & wage==1
sum children      if ll.self==1 & l.wage==1 & jid==3 & wage==1
sum schooling     if ll.self==1 & l.wage==1 & jid==3 & wage==1
sum weleftage     if ll.self==1 & l.wage==1 & jid==3 & wage==1
tab primary       if ll.self==1 & l.wage==1 & jid==3 & wage==1
tab secondary     if ll.self==1 & l.wage==1 & jid==3 & wage==1
tab tertiary      if ll.self==1 & l.wage==1 & jid==3 & wage==1
tab married       if ll.self==1 & l.wage==1 & jid==3 & wage==1
tab whystartself  if ll.self==1 & l.wage==1 & jid==3 & wage==1
tab hhbusiness    if ll.self==1 & l.wage==1 & jid==3 & wage==1
tab commute       if ll.self==1 & l.wage==1 & jid==3 & wage==1
sum expected      if ll.self==1 & l.wage==1 & jid==3 & wage==1
sum happy         if ll.self==1 & l.wage==1 & jid==3 & wage==1
sum compare       if ll.self==1 & l.wage==1 & jid==3 & wage==1
sum earn          if ll.self==1 & l.wage==1 & jid==3 & wage==1
sum earnstart     if ll.self==1 & l.wage==1 & jid==3 & wage==1
tab whystopself   if ll.self==1 & l.wage==1 & jid==3 & wage==1
sum children      if ll.self==1 & l.wage==1 & jid==3 & wage==1
sum fed           if ll.self==1 & l.wage==1 & jid==3 & wage==1
sum med           if ll.self==1 & l.wage==1 & jid==3 & wage==1
sum distprim      if ll.self==1 & l.wage==1 & jid==3 & wage==1
sum distsec       if ll.self==1 & l.wage==1 & jid==3 & wage==1
sum agestart      if ll.self==1 & l.wage==1 & jid==3 & wage==1
tab whyleftwage   if ll.self==1 & l.wage==1 & jid==3 & wage==1



/*Self t, Wage t+1, Unemp t+2*/

tab empstatus if  ll.self==1 & l.wage==1 & jid==3 & unemp==1



sum duration      if ll.self==1 & l.wage==1 & jid==3 & unemp==1
sum married       if ll.self==1 & l.wage==1 & jid==3 & unemp==1
sum children      if ll.self==1 & l.wage==1 & jid==3 & unemp==1
sum schooling     if ll.self==1 & l.wage==1 & jid==3 & unemp==1
sum weleftage     if ll.self==1 & l.wage==1 & jid==3 & unemp==1
tab primary       if ll.self==1 & l.wage==1 & jid==3 & unemp==1
tab secondary     if ll.self==1 & l.wage==1 & jid==3 & unemp==1
tab tertiary      if ll.self==1 & l.wage==1 & jid==3 & unemp==1
tab married       if ll.self==1 & l.wage==1 & jid==3 & unemp==1
tab whystartself  if ll.self==1 & l.wage==1 & jid==3 & unemp==1
tab hhbusiness    if ll.self==1 & l.wage==1 & jid==3 & unemp==1
tab commute       if ll.self==1 & l.wage==1 & jid==3 & unemp==1
sum expected      if ll.self==1 & l.wage==1 & jid==3 & unemp==1
sum happy         if ll.self==1 & l.wage==1 & jid==3 & unemp==1
sum compare       if ll.self==1 & l.wage==1 & jid==3 & unemp==1
sum earn          if ll.self==1 & l.wage==1 & jid==3 & unemp==1
sum earnstart     if ll.self==1 & l.wage==1 & jid==3 & unemp==1
tab whystopself   if ll.self==1 & l.wage==1 & jid==3 & unemp==1
sum children      if ll.self==1 & l.wage==1 & jid==3 & unemp==1
sum fed           if ll.self==1 & l.wage==1 & jid==3 & unemp==1
sum med           if ll.self==1 & l.wage==1 & jid==3 & unemp==1
sum distprim      if ll.self==1 & l.wage==1 & jid==3 & unemp==1
sum distsec       if ll.self==1 & l.wage==1 & jid==3 & unemp==1
sum agestart      if ll.self==1 & l.wage==1 & jid==3 & unemp==1
tab whyleftwage   if ll.self==1 & l.wage==1 & jid==3 & unemp==1

/*Self t, Unemp t+1, Self t+2*/

tab empstatus if  ll.self==1 & l.unemp==1 & jid==3 & self==1



sum duration      if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum married       if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum children      if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum schooling     if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum weleftage     if  ll.self==1 & l.unemp==1 & jid==3 & self==1
tab primary       if  ll.self==1 & l.unemp==1 & jid==3 & self==1
tab secondary     if  ll.self==1 & l.unemp==1 & jid==3 & self==1
tab tertiary      if  ll.self==1 & l.unemp==1 & jid==3 & self==1
tab married       if  ll.self==1 & l.unemp==1 & jid==3 & self==1
tab whystartself  if  ll.self==1 & l.unemp==1 & jid==3 & self==1
tab hhbusiness    if  ll.self==1 & l.unemp==1 & jid==3 & self==1
tab commute       if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum expected      if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum happy         if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum compare       if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum earn          if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum earnstart     if  ll.self==1 & l.unemp==1 & jid==3 & self==1
tab whystopself   if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum children      if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum fed           if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum med           if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum distprim      if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum distsec       if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum agestart      if  ll.self==1 & l.unemp==1 & jid==3 & self==1
tab whyleftwage   if  ll.self==1 & l.unemp==1 & jid==3 & self==1





/*Self t, Unemp t+1, Wage t+2*/

tab empstatus if  ll.self==1 & l.unemp==1 & jid==3 & wage==1



sum duration      if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
sum married       if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
sum children      if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
sum schooling     if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
sum weleftage     if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
tab primary       if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
tab secondary     if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
tab tertiary      if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
tab married       if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
tab whystartself  if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
tab hhbusiness    if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
tab commute       if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
sum expected      if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
sum happy         if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
sum compare       if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
sum earn          if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
sum earnstart     if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
tab whystopself   if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
sum children      if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
sum fed           if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
sum med           if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
sum distprim      if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
sum distsec       if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
sum agestart      if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
tab whyleftwage   if  ll.self==1 & l.unemp==1 & jid==3 & wage==1
/*Self t, Unemp t+1, Self t+2*/

tab empstatus if  ll.self==1 & l.unemp==1 & jid==3 & self==1



sum duration      if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum married       if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum children      if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum schooling     if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum weleftage     if  ll.self==1 & l.unemp==1 & jid==3 & self==1
tab primary       if  ll.self==1 & l.unemp==1 & jid==3 & self==1
tab secondary     if  ll.self==1 & l.unemp==1 & jid==3 & self==1
tab tertiary      if  ll.self==1 & l.unemp==1 & jid==3 & self==1
tab married       if  ll.self==1 & l.unemp==1 & jid==3 & self==1
tab whystartself  if  ll.self==1 & l.unemp==1 & jid==3 & self==1
tab hhbusiness    if  ll.self==1 & l.unemp==1 & jid==3 & self==1
tab commute       if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum expected      if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum happy         if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum compare       if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum earn          if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum earnstart     if  ll.self==1 & l.unemp==1 & jid==3 & self==1
tab whystopself   if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum children      if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum fed           if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum med           if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum distprim      if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum distsec       if  ll.self==1 & l.unemp==1 & jid==3 & self==1
sum agestart      if  ll.self==1 & l.unemp==1 & jid==3 & self==1
tab whyleftwage   if  ll.self==1 & l.unemp==1 & jid==3 & self==1





/*Self t, Student t+1, Unemp t+2*/

tab empstatus if  ll.self==1 & l.student==1 & jid==3 & unemp==1



sum duration      if  ll.self==1 & l.student==1 & jid==3 & unemp==1
sum married       if  ll.self==1 & l.student==1 & jid==3 & unemp==1
sum children      if  ll.self==1 & l.student==1 & jid==3 & unemp==1
sum schooling     if  ll.self==1 & l.student==1 & jid==3 & unemp==1
sum weleftage     if  ll.self==1 & l.student==1 & jid==3 & unemp==1
tab primary       if  ll.self==1 & l.student==1 & jid==3 & unemp==1
tab secondary     if  ll.self==1 & l.student==1 & jid==3 & unemp==1
tab tertiary      if  ll.self==1 & l.student==1 & jid==3 & unemp==1
tab married       if  ll.self==1 & l.student==1 & jid==3 & unemp==1
tab whystartself  if  ll.self==1 & l.student==1 & jid==3 & unemp==1
tab hhbusiness    if  ll.self==1 & l.student==1 & jid==3 & unemp==1
tab commute       if  ll.self==1 & l.student==1 & jid==3 & unemp==1
sum expected      if  ll.self==1 & l.student==1 & jid==3 & unemp==1
sum happy         if  ll.self==1 & l.student==1 & jid==3 & unemp==1
sum compare       if  ll.self==1 & l.student==1 & jid==3 & unemp==1
sum earn          if  ll.self==1 & l.student==1 & jid==3 & unemp==1
sum earnstart     if  ll.self==1 & l.student==1 & jid==3 & unemp==1
tab whystopself   if  ll.self==1 & l.student==1 & jid==3 & unemp==1
sum children      if  ll.self==1 & l.student==1 & jid==3 & unemp==1
sum fed           if  ll.self==1 & l.student==1 & jid==3 & unemp==1
sum med           if  ll.self==1 & l.student==1 & jid==3 & unemp==1
sum distprim      if  ll.self==1 & l.student==1 & jid==3 & unemp==1
sum distsec       if  ll.self==1 & l.student==1 & jid==3 & unemp==1
sum agestart      if  ll.self==1 & l.student==1 & jid==3 & unemp==1
tab whyleftwage   if  ll.self==1 & l.student==1 & jid==3 & unemp==1

/**************************************
*******Dynamics  of Wage Employed******
**************************************/

/*Wage t,  Self t+1, Self t+2*/

tab empstatus if  ll.wage==1 & l.self==1 & jid==3 & self==1



sum duration      if ll.wage==1 & l.self==1 & jid==3 & self==1
sum married       if ll.wage==1 & l.self==1 & jid==3 & self==1
sum children      if ll.wage==1 & l.self==1 & jid==3 & self==1
sum schooling     if ll.wage==1 & l.self==1 & jid==3 & self==1
sum weleftage     if ll.wage==1 & l.self==1 & jid==3 & self==1
tab primary       if ll.wage==1 & l.self==1 & jid==3 & self==1
tab secondary     if ll.wage==1 & l.self==1 & jid==3 & self==1
tab tertiary      if ll.wage==1 & l.self==1 & jid==3 & self==1
tab married       if ll.wage==1 & l.self==1 & jid==3 & self==1
tab whystartself  if ll.wage==1 & l.self==1 & jid==3 & self==1
tab hhbusiness    if ll.wage==1 & l.self==1 & jid==3 & self==1
tab commute       if ll.wage==1 & l.self==1 & jid==3 & self==1
sum expected      if ll.wage==1 & l.self==1 & jid==3 & self==1
sum happy         if ll.wage==1 & l.self==1 & jid==3 & self==1
sum compare       if ll.wage==1 & l.self==1 & jid==3 & self==1
sum earn          if ll.wage==1 & l.self==1 & jid==3 & self==1
sum earnstart     if ll.wage==1 & l.self==1 & jid==3 & self==1
tab whystopself   if ll.wage==1 & l.self==1 & jid==3 & self==1
sum children      if ll.wage==1 & l.self==1 & jid==3 & self==1
sum fed           if ll.wage==1 & l.self==1 & jid==3 & self==1
sum med           if ll.wage==1 & l.self==1 & jid==3 & self==1
sum distprim      if ll.wage==1 & l.self==1 & jid==3 & self==1
sum distsec       if ll.wage==1 & l.self==1 & jid==3 & self==1
sum agestart      if ll.wage==1 & l.self==1 & jid==3 & self==1
tab whyleftwage   if ll.wage==1 & l.self==1 & jid==3 & self==1


/*Wage t,  Self t+1, Wage t+2*/

tab empstatus if  ll.wage==1 & l.self==1 & jid==3 & wage==1



sum duration      if ll.wage==1 & l.self==1 & jid==3 & wage==1
sum married       if ll.wage==1 & l.self==1 & jid==3 & wage==1
sum children      if ll.wage==1 & l.self==1 & jid==3 & wage==1
sum schooling     if ll.wage==1 & l.self==1 & jid==3 & wage==1
sum weleftage     if ll.wage==1 & l.self==1 & jid==3 & wage==1
tab primary       if ll.wage==1 & l.self==1 & jid==3 & wage==1
tab secondary     if ll.wage==1 & l.self==1 & jid==3 & wage==1
tab tertiary      if ll.wage==1 & l.self==1 & jid==3 & wage==1
tab married       if ll.wage==1 & l.self==1 & jid==3 & wage==1
tab whystartself  if ll.wage==1 & l.self==1 & jid==3 & wage==1
tab hhbusiness    if ll.wage==1 & l.self==1 & jid==3 & wage==1
tab commute       if ll.wage==1 & l.self==1 & jid==3 & wage==1
sum expected      if ll.wage==1 & l.self==1 & jid==3 & wage==1
sum happy         if ll.wage==1 & l.self==1 & jid==3 & wage==1
sum compare       if ll.wage==1 & l.self==1 & jid==3 & wage==1
sum earn          if ll.wage==1 & l.self==1 & jid==3 & wage==1
sum earnstart     if ll.wage==1 & l.self==1 & jid==3 & wage==1
tab whystopself   if ll.wage==1 & l.self==1 & jid==3 & wage==1
sum children      if ll.wage==1 & l.self==1 & jid==3 & wage==1
sum fed           if ll.wage==1 & l.self==1 & jid==3 & wage==1
sum med           if ll.wage==1 & l.self==1 & jid==3 & wage==1
sum distprim      if ll.wage==1 & l.self==1 & jid==3 & wage==1
sum distsec       if ll.wage==1 & l.self==1 & jid==3 & wage==1
sum agestart      if ll.wage==1 & l.self==1 & jid==3 & wage==1
tab whyleftwage   if ll.wage==1 & l.self==1 & jid==3 & wage==1


/*Wage t,  Self t+1, Unemp t+2*/

tab empstatus if  ll.wage==1 & l.self==1 & jid==3 & unemp==1



sum duration      if ll.wage==1 & l.self==1 & jid==3 & unemp==1
sum married       if ll.wage==1 & l.self==1 & jid==3 & unemp==1
sum children      if ll.wage==1 & l.self==1 & jid==3 & unemp==1
sum schooling     if ll.wage==1 & l.self==1 & jid==3 & unemp==1
sum weleftage     if ll.wage==1 & l.self==1 & jid==3 & unemp==1
tab primary       if ll.wage==1 & l.self==1 & jid==3 & unemp==1
tab secondary     if ll.wage==1 & l.self==1 & jid==3 & unemp==1
tab tertiary      if ll.wage==1 & l.self==1 & jid==3 & unemp==1
tab married       if ll.wage==1 & l.self==1 & jid==3 & unemp==1
tab whystartself  if ll.wage==1 & l.self==1 & jid==3 & unemp==1
tab hhbusiness    if ll.wage==1 & l.self==1 & jid==3 & unemp==1
tab commute       if ll.wage==1 & l.self==1 & jid==3 & unemp==1
sum expected      if ll.wage==1 & l.self==1 & jid==3 & unemp==1
sum happy         if ll.wage==1 & l.self==1 & jid==3 & unemp==1
sum compare       if ll.wage==1 & l.self==1 & jid==3 & unemp==1
sum earn          if ll.wage==1 & l.self==1 & jid==3 & unemp==1
sum earnstart     if ll.wage==1 & l.self==1 & jid==3 & unemp==1
tab whystopself   if ll.wage==1 & l.self==1 & jid==3 & unemp==1
sum children      if ll.wage==1 & l.self==1 & jid==3 & unemp==1
sum fed           if ll.wage==1 & l.self==1 & jid==3 & unemp==1
sum med           if ll.wage==1 & l.self==1 & jid==3 & unemp==1
sum distprim      if ll.wage==1 & l.self==1 & jid==3 & unemp==1
sum distsec       if ll.wage==1 & l.self==1 & jid==3 & unemp==1
sum agestart      if ll.wage==1 & l.self==1 & jid==3 & unemp==1
tab whyleftwage   if ll.wage==1 & l.self==1 & jid==3 & unemp==1


/*Wage t,  Wage t+1, Self t+2*/

tab empstatus if  ll.wage==1 & l.wage==1 & jid==3 & self==1



sum duration      if ll.wage==1 & l.wage==1 & jid==3 & self==1
sum married       if ll.wage==1 & l.wage==1 & jid==3 & self==1
sum children      if ll.wage==1 & l.wage==1 & jid==3 & self==1
sum schooling     if ll.wage==1 & l.wage==1 & jid==3 & self==1
sum weleftage     if ll.wage==1 & l.wage==1 & jid==3 & self==1
tab primary       if ll.wage==1 & l.wage==1 & jid==3 & self==1
tab secondary     if ll.wage==1 & l.wage==1 & jid==3 & self==1
tab tertiary      if ll.wage==1 & l.wage==1 & jid==3 & self==1
tab married       if ll.wage==1 & l.wage==1 & jid==3 & self==1
tab whystartself  if ll.wage==1 & l.wage==1 & jid==3 & self==1
tab hhbusiness    if ll.wage==1 & l.wage==1 & jid==3 & self==1
tab commute       if ll.wage==1 & l.wage==1 & jid==3 & self==1
sum expected      if ll.wage==1 & l.wage==1 & jid==3 & self==1
sum happy         if ll.wage==1 & l.wage==1 & jid==3 & self==1
sum compare       if ll.wage==1 & l.wage==1 & jid==3 & self==1
sum earn          if ll.wage==1 & l.wage==1 & jid==3 & self==1
sum earnstart     if ll.wage==1 & l.wage==1 & jid==3 & self==1
tab whystopself   if ll.wage==1 & l.wage==1 & jid==3 & self==1
sum children      if ll.wage==1 & l.wage==1 & jid==3 & self==1
sum fed           if ll.wage==1 & l.wage==1 & jid==3 & self==1
sum med           if ll.wage==1 & l.wage==1 & jid==3 & self==1
sum distprim      if ll.wage==1 & l.wage==1 & jid==3 & self==1
sum distsec       if ll.wage==1 & l.wage==1 & jid==3 & self==1
sum agestart      if ll.wage==1 & l.wage==1 & jid==3 & self==1
tab whyleftwage   if ll.wage==1 & l.wage==1 & jid==3 & self==1


/*Wage t,  Wage t+1, Wage t+2*/

tab empstatus if  ll.wage==1 & l.wage==1 & jid==3 & wage==1



sum duration      if ll.wage==1 & l.wage==1 & jid==3 & wage==1
sum married       if ll.wage==1 & l.wage==1 & jid==3 & wage==1
sum children      if ll.wage==1 & l.wage==1 & jid==3 & wage==1
sum schooling     if ll.wage==1 & l.wage==1 & jid==3 & wage==1
sum weleftage     if ll.wage==1 & l.wage==1 & jid==3 & wage==1
tab primary       if ll.wage==1 & l.wage==1 & jid==3 & wage==1
tab secondary     if ll.wage==1 & l.wage==1 & jid==3 & wage==1
tab tertiary      if ll.wage==1 & l.wage==1 & jid==3 & wage==1
tab married       if ll.wage==1 & l.wage==1 & jid==3 & wage==1
tab whystartself  if ll.wage==1 & l.wage==1 & jid==3 & wage==1
tab hhbusiness    if ll.wage==1 & l.wage==1 & jid==3 & wage==1
tab commute       if ll.wage==1 & l.wage==1 & jid==3 & wage==1
sum expected      if ll.wage==1 & l.wage==1 & jid==3 & wage==1
sum happy         if ll.wage==1 & l.wage==1 & jid==3 & wage==1
sum compare       if ll.wage==1 & l.wage==1 & jid==3 & wage==1
sum earn          if ll.wage==1 & l.wage==1 & jid==3 & wage==1
sum earnstart     if ll.wage==1 & l.wage==1 & jid==3 & wage==1
tab whystopself   if ll.wage==1 & l.wage==1 & jid==3 & wage==1
sum children      if ll.wage==1 & l.wage==1 & jid==3 & wage==1
sum fed           if ll.wage==1 & l.wage==1 & jid==3 & wage==1
sum med           if ll.wage==1 & l.wage==1 & jid==3 & wage==1
sum distprim      if ll.wage==1 & l.wage==1 & jid==3 & wage==1
sum distsec       if ll.wage==1 & l.wage==1 & jid==3 & wage==1
sum agestart      if ll.wage==1 & l.wage==1 & jid==3 & wage==1
tab whyleftwage   if ll.wage==1 & l.wage==1 & jid==3 & wage==1


/*Wage t,  Unemp t+1, Unemp t+2*/

tab empstatus if  ll.wage==1 & l.unemp==1 & jid==3 & unemp==1



sum duration      if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
sum married       if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
sum children      if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
sum schooling     if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
sum weleftage     if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
tab primary       if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
tab secondary     if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
tab tertiary      if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
tab married       if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
tab whystartself  if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
tab hhbusiness    if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
tab commute       if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
sum expected      if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
sum happy         if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
sum compare       if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
sum earn          if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
sum earnstart     if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
tab whystopself   if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
sum children      if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
sum fed           if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
sum med           if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
sum distprim      if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
sum distsec       if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
sum agestart      if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1
tab whyleftwage   if ll.wage==1 & l.unemp==1 & jid==3 & unemp==1


/**************************************
*******Dynamics  of Unemployed ********
**************************************/

/*Unemp t,  Self t+1, Self t+2*/

tab empstatus if  ll.unemp==1 & l.self==1 & jid==3 & self==1



sum duration      if ll.unemp==1 & l.self==1 & jid==3 & self==1
sum married       if ll.unemp==1 & l.self==1 & jid==3 & self==1
sum children      if ll.unemp==1 & l.self==1 & jid==3 & self==1
sum schooling     if ll.unemp==1 & l.self==1 & jid==3 & self==1
sum weleftage     if ll.unemp==1 & l.self==1 & jid==3 & self==1
tab primary       if ll.unemp==1 & l.self==1 & jid==3 & self==1
tab secondary     if ll.unemp==1 & l.self==1 & jid==3 & self==1
tab tertiary      if ll.unemp==1 & l.self==1 & jid==3 & self==1
tab married       if ll.unemp==1 & l.self==1 & jid==3 & self==1
tab whystartself  if ll.unemp==1 & l.self==1 & jid==3 & self==1
tab hhbusiness    if ll.unemp==1 & l.self==1 & jid==3 & self==1
tab commute       if ll.unemp==1 & l.self==1 & jid==3 & self==1
sum expected      if ll.unemp==1 & l.self==1 & jid==3 & self==1
sum happy         if ll.unemp==1 & l.self==1 & jid==3 & self==1
sum compare       if ll.unemp==1 & l.self==1 & jid==3 & self==1
sum earn          if ll.unemp==1 & l.self==1 & jid==3 & self==1
sum earnstart     if ll.unemp==1 & l.self==1 & jid==3 & self==1
tab whystopself   if ll.unemp==1 & l.self==1 & jid==3 & self==1
sum children      if ll.unemp==1 & l.self==1 & jid==3 & self==1
sum fed           if ll.unemp==1 & l.self==1 & jid==3 & self==1
sum med           if ll.unemp==1 & l.self==1 & jid==3 & self==1
sum distprim      if ll.unemp==1 & l.self==1 & jid==3 & self==1
sum distsec       if ll.unemp==1 & l.self==1 & jid==3 & self==1
sum agestart      if ll.unemp==1 & l.self==1 & jid==3 & self==1
tab whyleftwage   if ll.unemp==1 & l.self==1 & jid==3 & self==1
  
  /*Unemp t,  Self t+1, Wage t+2*/

tab empstatus if  ll.unemp==1 & l.self==1 & jid==3 & wage==1



sum duration      if ll.unemp==1 & l.self==1 & jid==3 & wage==1
sum married       if ll.unemp==1 & l.self==1 & jid==3 & wage==1
sum children      if ll.unemp==1 & l.self==1 & jid==3 & wage==1
sum schooling     if ll.unemp==1 & l.self==1 & jid==3 & wage==1
sum weleftage     if ll.unemp==1 & l.self==1 & jid==3 & wage==1
tab primary       if ll.unemp==1 & l.self==1 & jid==3 & wage==1
tab secondary     if ll.unemp==1 & l.self==1 & jid==3 & wage==1
tab tertiary      if ll.unemp==1 & l.self==1 & jid==3 & wage==1
tab married       if ll.unemp==1 & l.self==1 & jid==3 & wage==1
tab whystartself  if ll.unemp==1 & l.self==1 & jid==3 & wage==1
tab hhbusiness    if ll.unemp==1 & l.self==1 & jid==3 & wage==1
tab commute       if ll.unemp==1 & l.self==1 & jid==3 & wage==1
sum expected      if ll.unemp==1 & l.self==1 & jid==3 & wage==1
sum happy         if ll.unemp==1 & l.self==1 & jid==3 & wage==1
sum compare       if ll.unemp==1 & l.self==1 & jid==3 & wage==1
sum earn          if ll.unemp==1 & l.self==1 & jid==3 & wage==1
sum earnstart     if ll.unemp==1 & l.self==1 & jid==3 & wage==1
tab whystopself   if ll.unemp==1 & l.self==1 & jid==3 & wage==1
sum children      if ll.unemp==1 & l.self==1 & jid==3 & wage==1
sum fed           if ll.unemp==1 & l.self==1 & jid==3 & wage==1
sum med           if ll.unemp==1 & l.self==1 & jid==3 & wage==1
sum distprim      if ll.unemp==1 & l.self==1 & jid==3 & wage==1
sum distsec       if ll.unemp==1 & l.self==1 & jid==3 & wage==1
sum agestart      if ll.unemp==1 & l.self==1 & jid==3 & wage==1
tab whyleftwage   if ll.unemp==1 & l.self==1 & jid==3 & wage==1
  
  
  /*Unemp t,  Self t+1, Unemp t+2*/

tab empstatus if  ll.unemp==1 & l.self==1 & jid==3 & unemp==1



sum duration      if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
sum married       if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
sum children      if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
sum schooling     if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
sum weleftage     if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
tab primary       if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
tab secondary     if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
tab tertiary      if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
tab married       if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
tab whystartself  if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
tab hhbusiness    if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
tab commute       if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
sum expected      if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
sum happy         if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
sum compare       if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
sum earn          if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
sum earnstart     if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
tab whystopself   if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
sum children      if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
sum fed           if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
sum med           if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
sum distprim      if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
sum distsec       if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
sum agestart      if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
tab whyleftwage   if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
  
  
  /*Unemp t,  Wage t+1, Self t+2*/

tab empstatus if  ll.unemp==1 & l.wage==1 & jid==3 & self==1



sum duration      if ll.unemp==1 & l.wage==1 & jid==3 & self==1
sum married       if ll.unemp==1 & l.wage==1 & jid==3 & self==1
sum children      if ll.unemp==1 & l.wage==1 & jid==3 & self==1
sum schooling     if ll.unemp==1 & l.wage==1 & jid==3 & self==1
sum weleftage     if ll.unemp==1 & l.wage==1 & jid==3 & self==1
tab primary       if ll.unemp==1 & l.wage==1 & jid==3 & self==1
tab secondary     if ll.unemp==1 & l.wage==1 & jid==3 & self==1
tab tertiary      if ll.unemp==1 & l.wage==1 & jid==3 & self==1
tab married       if ll.unemp==1 & l.wage==1 & jid==3 & self==1
tab whystartself  if ll.unemp==1 & l.wage==1 & jid==3 & self==1
tab hhbusiness    if ll.unemp==1 & l.wage==1 & jid==3 & self==1
tab commute       if ll.unemp==1 & l.wage==1 & jid==3 & self==1
sum expected      if ll.unemp==1 & l.wage==1 & jid==3 & self==1
sum happy         if ll.unemp==1 & l.wage==1 & jid==3 & self==1
sum compare       if ll.unemp==1 & l.wage==1 & jid==3 & self==1
sum earn          if ll.unemp==1 & l.wage==1 & jid==3 & self==1
sum earnstart     if ll.unemp==1 & l.wage==1 & jid==3 & self==1
tab whystopself   if ll.unemp==1 & l.wage==1 & jid==3 & self==1
sum children      if ll.unemp==1 & l.wage==1 & jid==3 & self==1
sum fed           if ll.unemp==1 & l.wage==1 & jid==3 & self==1
sum med           if ll.unemp==1 & l.wage==1 & jid==3 & self==1
sum distprim      if ll.unemp==1 & l.wage==1 & jid==3 & self==1
sum distsec       if ll.unemp==1 & l.wage==1 & jid==3 & self==1
sum agestart      if ll.unemp==1 & l.wage==1 & jid==3 & self==1
tab whyleftwage   if ll.unemp==1 & l.wage==1 & jid==3 & self==1
  
  /*Unemp t,  Wage t+1, Wage t+2*/

tab empstatus if  ll.unemp==1 & l.wage==1 & jid==3 & wage==1



sum duration      if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
sum married       if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
sum children      if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
sum schooling     if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
sum weleftage     if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
tab primary       if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
tab secondary     if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
tab tertiary      if ll.unemp==1 & l.self==1 & jid==3 & wage==1
tab married       if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
tab whystartself  if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
tab hhbusiness    if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
tab commute       if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
sum expected      if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
sum happy         if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
sum compare       if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
sum earn          if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
sum earnstart     if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
tab whystopself   if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
sum children      if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
sum fed           if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
sum med           if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
sum distprim      if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
sum distsec       if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
sum agestart      if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
tab whyleftwage   if ll.unemp==1 & l.wage==1 & jid==3 & wage==1
  
  /*Unemp t,  Wage t+1, Unemp t+2*/

tab empstatus if  ll.unemp==1 & l.wage==1 & jid==3 & unemp==1


sum duration      if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
sum married       if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
sum children      if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
sum schooling     if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
sum weleftage     if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
tab primary       if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
tab secondary     if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
tab tertiary      if ll.unemp==1 & l.self==1 & jid==3 & unemp==1
tab married       if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
tab whystartself  if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
tab hhbusiness    if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
tab commute       if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
sum expected      if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
sum happy         if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
sum compare       if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
sum earn          if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
sum earnstart     if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
tab whystopself   if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
sum children      if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
sum fed           if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
sum med           if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
sum distprim      if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
sum distsec       if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
sum agestart      if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
tab whyleftwage   if ll.unemp==1 & l.wage==1 & jid==3 & unemp==1
  
  /*Unemp t,  Unemp t+1, Self t+2*/

tab empstatus if  ll.unemp==1 & l.unemp==1 & jid==3 & self==1



sum duration      if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
sum married       if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
sum children      if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
sum schooling     if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
sum weleftage     if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
tab primary       if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
tab secondary     if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
tab tertiary      if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
tab married       if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
tab whystartself  if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
tab hhbusiness    if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
tab commute       if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
sum expected      if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
sum happy         if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
sum compare       if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
sum earn          if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
sum earnstart     if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
tab whystopself   if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
sum children      if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
sum fed           if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
sum med           if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
sum distprim      if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
sum distsec       if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
sum agestart      if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
tab whyleftwage   if ll.unemp==1 & l.unemp==1 & jid==3 & self==1
  
  /*Unemp t,  Self t+1, Wage t+2*/

tab empstatus if  ll.unemp==1 & l.unemp==1 & jid==3 & wage==1



sum duration      if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
sum married       if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
sum children      if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
sum schooling     if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
sum weleftage     if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
tab primary       if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
tab secondary     if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
tab tertiary      if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
tab married       if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
tab whystartself  if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
tab hhbusiness    if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
tab commute       if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
sum expected      if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
sum happy         if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
sum compare       if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
sum earn          if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
sum earnstart     if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
tab whystopself   if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
sum children      if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
sum fed           if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
sum med           if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
sum distprim      if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
sum distsec       if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
sum agestart      if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
tab whyleftwage   if ll.unemp==1 & l.unemp==1 & jid==3 & wage==1
  
  /*Unemp t,  Student t+1, Wage t+2*/

tab empstatus if  ll.unemp==1 & l.student==1 & jid==3 & wage==1


sum duration      if ll.unemp==1 & l.student==1 & jid==3 & wage==1
sum married       if ll.unemp==1 & l.student==1 & jid==3 & wage==1
sum children      if ll.unemp==1 & l.student==1 & jid==3 & wage==1
sum schooling     if ll.unemp==1 & l.student==1 & jid==3 & wage==1
sum weleftage     if ll.unemp==1 & l.student==1 & jid==3 & wage==1
tab primary       if ll.unemp==1 & l.student==1 & jid==3 & wage==1
tab secondary     if ll.unemp==1 & l.student==1 & jid==3 & wage==1
tab tertiary      if ll.unemp==1 & l.student==1 & jid==3 & wage==1
tab married       if ll.unemp==1 & l.student==1 & jid==3 & wage==1
tab whystartself  if ll.unemp==1 & l.student==1 & jid==3 & wage==1
tab hhbusiness    if ll.unemp==1 & l.student==1 & jid==3 & wage==1
tab commute       if ll.unemp==1 & l.student==1 & jid==3 & wage==1
sum expected      if ll.unemp==1 & l.student==1 & jid==3 & wage==1
sum happy         if ll.unemp==1 & l.student==1 & jid==3 & wage==1
sum compare       if ll.unemp==1 & l.student==1 & jid==3 & wage==1
sum earn          if ll.unemp==1 & l.student==1 & jid==3 & wage==1
sum earnstart     if ll.unemp==1 & l.student==1 & jid==3 & wage==1
tab whystopself   if ll.unemp==1 & l.student==1 & jid==3 & wage==1
sum children      if ll.unemp==1 & l.student==1 & jid==3 & wage==1
sum fed           if ll.unemp==1 & l.student==1 & jid==3 & wage==1
sum med           if ll.unemp==1 & l.student==1 & jid==3 & wage==1
sum distprim      if ll.unemp==1 & l.student==1 & jid==3 & wage==1
sum distsec       if ll.unemp==1 & l.student==1 & jid==3 & wage==1
sum agestart      if ll.unemp==1 & l.student==1 & jid==3 & wage==1
tab whyleftwage   if ll.unemp==1 & l.student==1 & jid==3 & wage==1
 

/**************************************
*******Dynamics  of Students      ******
**************************************/

/*Student t,  Self t+1, Self t+2*/

tab empstatus if  ll.student==1 & l.self==1 & jid==3 & self==1



sum duration      if ll.student==1 & l.self==1 & jid==3 & self==1
sum married       if ll.student==1 & l.self==1 & jid==3 & self==1
sum children      if ll.student==1 & l.self==1 & jid==3 & self==1
sum schooling     if ll.student==1 & l.self==1 & jid==3 & self==1
sum weleftage     if ll.student==1 & l.self==1 & jid==3 & self==1
tab primary       if ll.student==1 & l.self==1 & jid==3 & self==1
tab secondary     if ll.student==1 & l.self==1 & jid==3 & self==1
tab tertiary      if ll.student==1 & l.self==1 & jid==3 & self==1
tab married       if ll.student==1 & l.self==1 & jid==3 & self==1
tab whystartself  if ll.student==1 & l.self==1 & jid==3 & self==1
tab hhbusiness    if ll.student==1 & l.self==1 & jid==3 & self==1
tab commute       if ll.student==1 & l.self==1 & jid==3 & self==1
sum expected      if ll.student==1 & l.self==1 & jid==3 & self==1
sum happy         if ll.student==1 & l.self==1 & jid==3 & self==1
sum compare       if ll.student==1 & l.self==1 & jid==3 & self==1
sum earn          if ll.student==1 & l.self==1 & jid==3 & self==1
sum earnstart     if ll.student==1 & l.self==1 & jid==3 & self==1
tab whystopself   if ll.student==1 & l.self==1 & jid==3 & self==1
sum children      if ll.student==1 & l.self==1 & jid==3 & self==1
sum fed           if ll.student==1 & l.self==1 & jid==3 & self==1
sum med           if ll.student==1 & l.self==1 & jid==3 & self==1
sum distprim      if ll.student==1 & l.self==1 & jid==3 & self==1
sum distsec       if ll.student==1 & l.self==1 & jid==3 & self==1
sum agestart      if ll.student==1 & l.self==1 & jid==3 & self==1
tab whyleftwage   if ll.student==1 & l.self==1 & jid==3 & self==1
  

  /*Student t,  Self t+1, Unemp t+2*/

tab empstatus if  ll.student==1 & l.self==1 & jid==3 & unemp==1



sum duration      if ll.student==1 & l.self==1 & jid==3 & unemp==1
sum married       if ll.student==1 & l.self==1 & jid==3 & unemp==1
sum children      if ll.student==1 & l.self==1 & jid==3 & unemp==1
sum schooling     if ll.student==1 & l.self==1 & jid==3 & unemp==1
sum weleftage     if ll.student==1 & l.self==1 & jid==3 & unemp==1
tab primary       if ll.student==1 & l.self==1 & jid==3 & unemp==1
tab secondary     if ll.student==1 & l.self==1 & jid==3 & unemp==1
tab tertiary      if ll.student==1 & l.self==1 & jid==3 & unemp==1
tab married       if ll.student==1 & l.self==1 & jid==3 & unemp==1
tab whystartself  if ll.student==1 & l.self==1 & jid==3 & unemp==1
tab hhbusiness    if ll.student==1 & l.self==1 & jid==3 & unemp==1
tab commute       if ll.student==1 & l.self==1 & jid==3 & unemp==1
sum expected      if ll.student==1 & l.self==1 & jid==3 & unemp==1
sum happy         if ll.student==1 & l.self==1 & jid==3 & unemp==1
sum compare       if ll.student==1 & l.self==1 & jid==3 & unemp==1
sum earn          if ll.student==1 & l.self==1 & jid==3 & unemp==1
sum earnstart     if ll.student==1 & l.self==1 & jid==3 & unemp==1
tab whystopself   if ll.student==1 & l.self==1 & jid==3 & unemp==1
sum children      if ll.student==1 & l.self==1 & jid==3 & unemp==1
sum fed           if ll.student==1 & l.self==1 & jid==3 & unemp==1
sum med           if ll.student==1 & l.self==1 & jid==3 & unemp==1
sum distprim      if ll.student==1 & l.self==1 & jid==3 & unemp==1
sum distsec       if ll.student==1 & l.self==1 & jid==3 & unemp==1
sum agestart      if ll.student==1 & l.self==1 & jid==3 & unemp==1
tab whyleftwage   if ll.student==1 & l.self==1 & jid==3 & unemp==1
  
  
  /*Student t,  Wage t+1, Self t+2*/

tab empstatus if  ll.student==1 & l.wage==1 & jid==3 & self==1



sum duration      if ll.student==1 & l.wage==1 & jid==3 & self==1
sum married       if ll.student==1 & l.wage==1 & jid==3 & self==1
sum children      if ll.student==1 & l.wage==1 & jid==3 & self==1
sum schooling     if ll.student==1 & l.wage==1 & jid==3 & self==1
sum weleftage     if ll.student==1 & l.wage==1 & jid==3 & self==1
tab primary       if ll.student==1 & l.wage==1 & jid==3 & self==1
tab secondary     if ll.student==1 & l.wage==1 & jid==3 & self==1
tab tertiary      if ll.student==1 & l.wage==1 & jid==3 & self==1
tab married       if ll.student==1 & l.wage==1 & jid==3 & self==1
tab whystartself  if ll.student==1 & l.wage==1 & jid==3 & self==1
tab hhbusiness    if ll.student==1 & l.wage==1 & jid==3 & self==1
tab commute       if ll.student==1 & l.wage==1 & jid==3 & self==1
sum expected      if ll.student==1 & l.wage==1 & jid==3 & self==1
sum happy         if ll.student==1 & l.wage==1 & jid==3 & self==1
sum compare       if ll.student==1 & l.wage==1 & jid==3 & self==1
sum earn          if ll.student==1 & l.wage==1 & jid==3 & self==1
sum earnstart     if ll.student==1 & l.wage==1 & jid==3 & self==1
tab whystopself   if ll.student==1 & l.wage==1 & jid==3 & self==1
sum children      if ll.student==1 & l.wage==1 & jid==3 & self==1
sum fed           if ll.student==1 & l.wage==1 & jid==3 & self==1
sum med           if ll.student==1 & l.wage==1 & jid==3 & self==1
sum distprim      if ll.student==1 & l.wage==1 & jid==3 & self==1
sum distsec       if ll.student==1 & l.wage==1 & jid==3 & self==1
sum agestart      if ll.student==1 & l.wage==1 & jid==3 & self==1
tab whyleftwage   if ll.student==1 & l.wage==1 & jid==3 & self==1
  
  /*Student t,  Wage t+1, Wage t+2*/

tab empstatus if  ll.student==1 & l.wage==1 & jid==3 & wage==1



sum duration      if ll.student==1 & l.wage==1 & jid==3 & wage==1
sum married       if ll.student==1 & l.wage==1 & jid==3 & wage==1
sum children      if ll.student==1 & l.wage==1 & jid==3 & wage==1
sum schooling     if ll.student==1 & l.wage==1 & jid==3 & wage==1
sum weleftage     if ll.student==1 & l.wage==1 & jid==3 & wage==1
tab primary       if ll.student==1 & l.wage==1 & jid==3 & wage==1
tab secondary     if ll.student==1 & l.wage==1 & jid==3 & wage==1
tab tertiary      if ll.student==1 & l.self==1 & jid==3 & wage==1
tab married       if ll.student==1 & l.wage==1 & jid==3 & wage==1
tab whystartself  if ll.student==1 & l.wage==1 & jid==3 & wage==1
tab hhbusiness    if ll.student==1 & l.wage==1 & jid==3 & wage==1
tab commute       if ll.student==1 & l.wage==1 & jid==3 & wage==1
sum expected      if ll.student==1 & l.wage==1 & jid==3 & wage==1
sum happy         if ll.student==1 & l.wage==1 & jid==3 & wage==1
sum compare       if ll.student==1 & l.wage==1 & jid==3 & wage==1
sum earn          if ll.student==1 & l.wage==1 & jid==3 & wage==1
sum earnstart     if ll.student==1 & l.wage==1 & jid==3 & wage==1
tab whystopself   if ll.student==1 & l.wage==1 & jid==3 & wage==1
sum children      if ll.student==1 & l.wage==1 & jid==3 & wage==1
sum fed           if ll.student==1 & l.wage==1 & jid==3 & wage==1
sum med           if ll.student==1 & l.wage==1 & jid==3 & wage==1
sum distprim      if ll.student==1 & l.wage==1 & jid==3 & wage==1
sum distsec       if ll.student==1 & l.wage==1 & jid==3 & wage==1
sum agestart      if ll.student==1 & l.wage==1 & jid==3 & wage==1
tab whyleftwage   if ll.student==1 & l.wage==1 & jid==3 & wage==1
  
  /*Student t,  Wage t+1, Unemp t+2*/

tab empstatus if  ll.student==1 & l.wage==1 & jid==3 & unemp==1


sum duration      if ll.student==1 & l.wage==1 & jid==3 & unemp==1
sum married       if ll.student==1 & l.wage==1 & jid==3 & unemp==1
sum children      if ll.student==1 & l.wage==1 & jid==3 & unemp==1
sum schooling     if ll.student==1 & l.wage==1 & jid==3 & unemp==1
sum weleftage     if ll.student==1 & l.wage==1 & jid==3 & unemp==1
tab primary       if ll.student==1 & l.wage==1 & jid==3 & unemp==1
tab secondary     if ll.student==1 & l.wage==1 & jid==3 & unemp==1
tab tertiary      if ll.student==1 & l.self==1 & jid==3 & unemp==1
tab married       if ll.student==1 & l.wage==1 & jid==3 & unemp==1
tab whystartself  if ll.student==1 & l.wage==1 & jid==3 & unemp==1
tab hhbusiness    if ll.student==1 & l.wage==1 & jid==3 & unemp==1
tab commute       if ll.student==1 & l.wage==1 & jid==3 & unemp==1
sum expected      if ll.student==1 & l.wage==1 & jid==3 & unemp==1
sum happy         if ll.student==1 & l.wage==1 & jid==3 & unemp==1
sum compare       if ll.student==1 & l.wage==1 & jid==3 & unemp==1
sum earn          if ll.student==1 & l.wage==1 & jid==3 & unemp==1
sum earnstart     if ll.student==1 & l.wage==1 & jid==3 & unemp==1
tab whystopself   if ll.student==1 & l.wage==1 & jid==3 & unemp==1
sum children      if ll.student==1 & l.wage==1 & jid==3 & unemp==1
sum fed           if ll.student==1 & l.wage==1 & jid==3 & unemp==1
sum med           if ll.student==1 & l.wage==1 & jid==3 & unemp==1
sum distprim      if ll.student==1 & l.wage==1 & jid==3 & unemp==1
sum distsec       if ll.student==1 & l.wage==1 & jid==3 & unemp==1
sum agestart      if ll.student==1 & l.wage==1 & jid==3 & unemp==1
tab whyleftwage   if ll.student==1 & l.wage==1 & jid==3 & unemp==1
  
  /*Student t,  Unemp t+1, Self t+2*/

tab empstatus if  ll.unemp==1 & l.unemp==1 & jid==3 & self==1



sum duration      if ll.student==1 & l.unemp==1 & jid==3 & self==1
sum married       if ll.student==1 & l.unemp==1 & jid==3 & self==1
sum children      if ll.student==1 & l.unemp==1 & jid==3 & self==1
sum schooling     if ll.student==1 & l.unemp==1 & jid==3 & self==1
sum weleftage     if ll.student==1 & l.unemp==1 & jid==3 & self==1
tab primary       if ll.student==1 & l.unemp==1 & jid==3 & self==1
tab secondary     if ll.student==1 & l.unemp==1 & jid==3 & self==1
tab tertiary      if ll.student==1 & l.unemp==1 & jid==3 & self==1
tab married       if ll.student==1 & l.unemp==1 & jid==3 & self==1
tab whystartself  if ll.student==1 & l.unemp==1 & jid==3 & self==1
tab hhbusiness    if ll.student==1 & l.unemp==1 & jid==3 & self==1
tab commute       if ll.student==1 & l.unemp==1 & jid==3 & self==1
sum expected      if ll.student==1 & l.unemp==1 & jid==3 & self==1
sum happy         if ll.student==1 & l.unemp==1 & jid==3 & self==1
sum compare       if ll.student==1 & l.unemp==1 & jid==3 & self==1
sum earn          if ll.student==1 & l.unemp==1 & jid==3 & self==1
sum earnstart     if ll.student==1 & l.unemp==1 & jid==3 & self==1
tab whystopself   if ll.student==1 & l.unemp==1 & jid==3 & self==1
sum children      if ll.student==1 & l.unemp==1 & jid==3 & self==1
sum fed           if ll.student==1 & l.unemp==1 & jid==3 & self==1
sum med           if ll.student==1 & l.unemp==1 & jid==3 & self==1
sum distprim      if ll.student==1 & l.unemp==1 & jid==3 & self==1
sum distsec       if ll.student==1 & l.unemp==1 & jid==3 & self==1
sum agestart      if ll.student==1 & l.unemp==1 & jid==3 & self==1
tab whyleftwage   if ll.student==1 & l.unemp==1 & jid==3 & self==1
  
  /*Stundet t,  Unemp t+1, Wage t+2*/

tab empstatus if  ll.student==1 & l.unemp==1 & jid==3 & wage==1



sum duration      if ll.student==1 & l.unemp==1 & jid==3 & wage==1
sum married       if ll.student==1 & l.unemp==1 & jid==3 & wage==1
sum children      if ll.student==1 & l.unemp==1 & jid==3 & wage==1
sum schooling     if ll.student==1 & l.unemp==1 & jid==3 & wage==1
sum weleftage     if ll.student==1 & l.unemp==1 & jid==3 & wage==1
tab primary       if ll.student==1 & l.unemp==1 & jid==3 & wage==1
tab secondary     if ll.student==1 & l.unemp==1 & jid==3 & wage==1
tab tertiary      if ll.student==1 & l.unemp==1 & jid==3 & wage==1
tab married       if ll.student==1 & l.unemp==1 & jid==3 & wage==1
tab whystartself  if ll.student==1 & l.unemp==1 & jid==3 & wage==1
tab hhbusiness    if ll.student==1 & l.unemp==1 & jid==3 & wage==1
tab commute       if ll.student==1 & l.unemp==1 & jid==3 & wage==1
sum expected      if ll.student==1 & l.unemp==1 & jid==3 & wage==1
sum happy         if ll.student==1 & l.unemp==1 & jid==3 & wage==1
sum compare       if ll.student==1 & l.unemp==1 & jid==3 & wage==1
sum earn          if ll.student==1 & l.unemp==1 & jid==3 & wage==1
sum earnstart     if ll.student==1 & l.unemp==1 & jid==3 & wage==1
tab whystopself   if ll.student==1 & l.unemp==1 & jid==3 & wage==1
sum children      if ll.student==1 & l.unemp==1 & jid==3 & wage==1
sum fed           if ll.student==1 & l.unemp==1 & jid==3 & wage==1
sum med           if ll.student==1 & l.unemp==1 & jid==3 & wage==1
sum distprim      if ll.student==1 & l.unemp==1 & jid==3 & wage==1
sum distsec       if ll.student==1 & l.unemp==1 & jid==3 & wage==1
sum agestart      if ll.student==1 & l.unemp==1 & jid==3 & wage==1
tab whyleftwage   if ll.student==1 & l.unemp==1 & jid==3 & wage==1



  /*Stundet t,  Unemp t+1, Unemp t+2*/

tab empstatus if  ll.student==1 & l.unemp==1 & jid==3 & unemp==1



sum duration      if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
sum married       if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
sum children      if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
sum schooling     if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
sum weleftage     if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
tab primary       if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
tab secondary     if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
tab tertiary      if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
tab married       if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
tab whystartself  if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
tab hhbusiness    if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
tab commute       if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
sum expected      if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
sum happy         if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
sum compare       if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
sum earn          if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
sum earnstart     if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
tab whystopself   if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
sum children      if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
sum fed           if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
sum med           if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
sum distprim      if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
sum distsec       if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
sum agestart      if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
tab whyleftwage   if ll.student==1 & l.unemp==1 & jid==3 & unemp==1
  
  
  /*Student t,  Student t+1, Wage t+2*/

tab empstatus if  ll.student==1 & l.student==1 & jid==3 & wage==1


sum duration      if ll.student==1 & l.student==1 & jid==3 & wage==1
sum married       if ll.student==1 & l.student==1 & jid==3 & wage==1
sum children      if ll.student==1 & l.student==1 & jid==3 & wage==1
sum schooling     if ll.student==1 & l.student==1 & jid==3 & wage==1
sum weleftage     if ll.student==1 & l.student==1 & jid==3 & wage==1
tab primary       if ll.student==1 & l.student==1 & jid==3 & wage==1
tab secondary     if ll.student==1 & l.student==1 & jid==3 & wage==1
tab tertiary      if ll.student==1 & l.student==1 & jid==3 & wage==1
tab married       if ll.student==1 & l.student==1 & jid==3 & wage==1
tab whystartself  if ll.student==1 & l.student==1 & jid==3 & wage==1
tab hhbusiness    if ll.student==1 & l.student==1 & jid==3 & wage==1
tab commute       if ll.student==1 & l.student==1 & jid==3 & wage==1
sum expected      if ll.student==1 & l.student==1 & jid==3 & wage==1
sum happy         if ll.student==1 & l.student==1 & jid==3 & wage==1
sum compare       if ll.student==1 & l.student==1 & jid==3 & wage==1
sum earn          if ll.student==1 & l.student==1 & jid==3 & wage==1
sum earnstart     if ll.student==1 & l.student==1 & jid==3 & wage==1
tab whystopself   if ll.student==1 & l.student==1 & jid==3 & wage==1
sum children      if ll.student==1 & l.student==1 & jid==3 & wage==1
sum fed           if ll.student==1 & l.student==1 & jid==3 & wage==1
sum med           if ll.student==1 & l.student==1 & jid==3 & wage==1
sum distprim      if ll.student==1 & l.student==1 & jid==3 & wage==1
sum distsec       if ll.student==1 & l.student==1 & jid==3 & wage==1
sum agestart      if ll.student==1 & l.student==1 & jid==3 & wage==1
tab whyleftwage   if ll.student==1 & l.student==1 & jid==3 & wage==1



  /*Student t,  Student t+1, Unemp t+2*/

tab empstatus if  ll.student==1 & l.student==1 & jid==3 & unemp==1


sum duration      if ll.student==1 & l.student==1 & jid==3 & unemp==1
sum married       if ll.student==1 & l.student==1 & jid==3 & unemp==1
sum children      if ll.student==1 & l.student==1 & jid==3 & unemp==1
sum schooling     if ll.student==1 & l.student==1 & jid==3 & unemp==1
sum weleftage     if ll.student==1 & l.student==1 & jid==3 & unemp==1
tab primary       if ll.student==1 & l.student==1 & jid==3 & unemp==1
tab secondary     if ll.student==1 & l.student==1 & jid==3 & unemp==1
tab tertiary      if ll.student==1 & l.student==1 & jid==3 & unemp==1
tab married       if ll.student==1 & l.student==1 & jid==3 & unemp==1
tab whystartself  if ll.student==1 & l.student==1 & jid==3 & unemp==1
tab hhbusiness    if ll.student==1 & l.student==1 & jid==3 & unemp==1
tab commute       if ll.student==1 & l.student==1 & jid==3 & unemp==1
sum expected      if ll.student==1 & l.student==1 & jid==3 & unemp==1
sum happy         if ll.student==1 & l.student==1 & jid==3 & unemp==1
sum compare       if ll.student==1 & l.student==1 & jid==3 & unemp==1
sum earn          if ll.student==1 & l.student==1 & jid==3 & unemp==1
sum earnstart     if ll.student==1 & l.student==1 & jid==3 & unemp==1
tab whystopself   if ll.student==1 & l.student==1 & jid==3 & unemp==1
sum children      if ll.student==1 & l.student==1 & jid==3 & unemp==1
sum fed           if ll.student==1 & l.student==1 & jid==3 & unemp==1
sum med           if ll.student==1 & l.student==1 & jid==3 & unemp==1
sum distprim      if ll.student==1 & l.student==1 & jid==3 & unemp==1
sum distsec       if ll.student==1 & l.student==1 & jid==3 & unemp==1
sum agestart      if ll.student==1 & l.student==1 & jid==3 & unemp==1
tab whyleftwage   if ll.student==1 & l.student==1 & jid==3 & unemp==1
 

