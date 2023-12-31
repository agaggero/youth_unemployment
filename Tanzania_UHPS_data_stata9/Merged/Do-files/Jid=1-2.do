clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"


 
 gen x =1
 sort wid
 by wid: replace x=sum(x)
 by wid: egen activity=max(x)
sort wid jid
 

*****************************************************************************************************
*************************************** Characterising Jid=1 & Jid=2  ************************************
 *****************************************************************************************************/
*log using "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\log-files\jid=1&2", text replace
xtdes
keep if activity==2


sum duration
sum married
sum children
sum schooling 
sum primary
sum secondary 
sum tertiary
sum vocational
sum fed 
sum med
sum distpri
sum distsec
sum agestart
sum weleftage
sum earn
sum earnstart
sum hhbusiness
sum happy
sum compare
sum expected

clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"


 
 gen x =1
 sort wid
 by wid: replace x=sum(x)
 by wid: egen activity=max(x)
sort wid jid
 

*sjlog using "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\log-files\a", replace

xtdes
*sjlog close



keep if activity==2


sum duration
sum married
sum children
sum schooling 
sum primary
sum secondary 
sum tertiary
sum vocational
sum fed 
sum med
sum distpri
sum distsec
sum agestart
sum weleftage
sum earn
sum earnstart
sum hhbusiness
sum happy
sum compare
sum expected









tab empstatus if jid==1


/*Self at t, Baseline Characteristics*/
sum duration      if self==1 & jid==1
sum married       if self==1 & jid==1
sum children      if self==1 & jid==1
sum schooling     if self==1 & jid==1
sum fed           if self==1 & jid==1
sum med           if self==1 & jid==1
sum weleftage     if self==1 & jid==1
sum primary       if self==1 & jid==1
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




/*Wage at t, Baseline Characteristics*/
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








/*Unemployed at t, Baseline Characteristics*/
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






/*Student at t, Baseline Characteristics*/
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
sum timejobsearch  if dum_student==1 & jid==1



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
sum timejobsearch  if dum_student==1 & jid==2






/**************************************
*******Dynamics  of Self Employed******
**************************************/

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
tab expected      if wage==1 & l.self==1 & jid==2
tab happy         if wage==1 & l.self==1 & jid==2
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




/**************************************
*******Dynamics  of Wage Employed******
**************************************/

/*Wage t, Self t+1*/

tab empstatus if  l.wage==1 & jid==2
asd


sum duration      if self==1 & l.wage==1 & jid==2
sum married       if self==1 & l.wage==1 & jid==2
sum children      if self==1 & l.wage==1 & jid==2
sum schooling     if self==1 & l.wage==1 & jid==2
sum weleftage     if self==1 & l.wage==1 & jid==2
tab  primary      if self==1 & l.wage==1 & jid==2
tab  secondary    if self==1 & l.wage==1 & jid==2
tab  tertiary     if self==1 & l.wage==1 & jid==2
tab  married      if self==1 & l.wage==1 & jid==2
tab whystartself  if self==1 & l.wage==1 & jid==2
tab hhbusiness    if self==1 & l.wage==1 & jid==2
tab commute       if self==1 & l.wage==1 & jid==2
tab expected      if self==1 & l.wage==1 & jid==2
tab happy         if self==1 & l.wage==1 & jid==2
tab compare       if self==1 & l.wage==1 & jid==2
sum earn          if self==1 & l.wage==1 & jid==2
sum earnstart     if self==1 & l.wage==1 & jid==2
tab whystopself   if self==1 & l.wage==1 & jid==2
sum children      if self==1 & l.wage==1 & jid==2
sum fed           if self==1 & l.wage==1 & jid==2
sum med           if self==1 & l.wage==1 & jid==2
sum distprim      if self==1 & l.wage==1 & jid==2
sum distsec       if self==1 & l.wage==1 & jid==2
sum agestart      if self==1 & l.wage==1 & jid==2
tab whyleftwage   if self==1 & l.wage==1 & jid==2





/* Wage t and t+1*/

sum duration      if wage==1 & l.wage==1 & jid==2
sum married       if wage==1 & l.wage==1 & jid==2
sum children      if wage==1 & l.wage==1 & jid==2
sum schooling     if wage==1 & l.wage==1 & jid==2
sum weleftage     if wage==1 & l.wage==1 & jid==2
tab  primary      if wage==1 & l.wage==1 & jid==2
tab  secondary    if wage==1 & l.wage==1 & jid==2
tab  tertiary     if wage==1 & l.wage==1 & jid==2
tab  married      if wage==1 & l.wage==1 & jid==2
tab whystartself  if wage==1 & l.wage==1 & jid==2
tab hhbusiness    if wage==1 & l.wage==1 & jid==2
tab commute       if wage==1 & l.wage==1 & jid==2
tab expected      if wage==1 & l.wage==1 & jid==2
tab happy         if wage==1 & l.wage==1 & jid==2
tab compare       if wage==1 & l.wage==1 & jid==2
sum earn          if wage==1 & l.wage==1 & jid==2
sum earnstart     if wage==1 & l.wage==1 & jid==2
tab whystopself   if wage==1 & l.wage==1 & jid==2
sum children      if wage==1 & l.wage==1 & jid==2
sum fed           if wage==1 & l.wage==1 & jid==2
sum med           if wage==1 & l.wage==1 & jid==2
sum distprim      if wage==1 & l.wage==1 & jid==2
sum distsec       if wage==1 & l.wage==1 & jid==2
sum agestart      if wage==1 & l.wage==1 & jid==2


/*Wage t, Unemp t+1*/

sum duration      if unemp==1 & l.wage==1 & jid==2
sum married       if unemp==1 & l.wage==1 & jid==2
sum children      if unemp==1 & l.wage==1 & jid==2
sum schooling     if unemp==1 & l.wage==1 & jid==2
sum weleftage     if unemp==1 & l.wage==1 & jid==2
tab  primary      if unemp==1 & l.wage==1 & jid==2
tab  secondary    if unemp==1 & l.wage==1 & jid==2
tab  tertiary     if unemp==1 & l.wage==1 & jid==2
tab  married      if unemp==1 & l.wage==1 & jid==2
tab whystartself  if unemp==1 & l.wage==1 & jid==2
tab hhbusiness    if unemp==1 & l.wage==1 & jid==2
tab commute       if unemp==1 & l.wage==1 & jid==2
tab expected      if unemp==1 & l.wage==1 & jid==2
tab happy         if unemp==1 & l.wage==1 & jid==2
tab compare       if unemp==1 & l.wage==1 & jid==2
sum earn          if unemp==1 & l.wage==1 & jid==2
sum earnstart     if unemp==1 & l.wage==1 & jid==2
tab whystopself   if unemp==1 & l.wage==1 & jid==2
sum children      if unemp==1 & l.wage==1 & jid==2
sum fed           if unemp==1 & l.wage==1 & jid==2
sum med           if unemp==1 & l.wage==1 & jid==2
sum distprim      if unemp==1 & l.wage==1 & jid==2
sum distsec       if unemp==1 & l.wage==1 & jid==2
sum agestart      if unemp==1 & l.wage==1 & jid==2



/**************************************
*******Dynamics  of Unemployed ********
**************************************/

/*Unemp t, Self t+1*/

tab empstatus if  l.unemp==1 & jid==2



sum duration      if self==1 & l.unemp==1 & jid==2
sum married       if self==1 & l.unemp==1 & jid==2
sum children      if self==1 & l.unemp==1 & jid==2
sum schooling     if self==1 & l.unemp==1 & jid==2
sum weleftage     if self==1 & l.unemp==1 & jid==2
tab  primary      if self==1 & l.unemp==1 & jid==2
tab  secondary    if self==1 & l.unemp==1 & jid==2
tab  tertiary     if self==1 & l.unemp==1 & jid==2
tab  married      if self==1 & l.unemp==1 & jid==2
tab whystartself  if self==1 & l.unemp==1 & jid==2
tab hhbusiness    if self==1 & l.unemp==1 & jid==2
tab commute       if self==1 & l.unemp==1 & jid==2
tab expected      if self==1 & l.unemp==1 & jid==2
tab happy         if self==1 & l.unemp==1 & jid==2
tab compare       if self==1 & l.unemp==1 & jid==2
sum earn          if self==1 & l.unemp==1 & jid==2
sum earnstart     if self==1 & l.unemp==1 & jid==2
tab whystopself   if self==1 & l.unemp==1 & jid==2
sum children      if self==1 & l.unemp==1 & jid==2
sum fed           if self==1 & l.unemp==1 & jid==2
sum med           if self==1 & l.unemp==1 & jid==2
sum distprim      if self==1 & l.unemp==1 & jid==2
sum distsec       if self==1 & l.unemp==1 & jid==2
sum agestart      if self==1 & l.unemp==1 & jid==2
tab whyleftwage   if self==1 & l.unemp==1 & jid==2


/* Unemp t, wage t+1*/

sum duration      if wage==1 & l.unemp==1 & jid==2
sum married       if wage==1 & l.unemp==1 & jid==2
sum children      if wage==1 & l.unemp==1 & jid==2
sum schooling     if wage==1 & l.unemp==1 & jid==2
sum weleftage     if wage==1 & l.unemp==1 & jid==2
tab  primary      if wage==1 & l.unemp==1 & jid==2
tab  secondary    if wage==1 & l.unemp==1 & jid==2
tab  tertiary     if wage==1 & l.unemp==1 & jid==2
tab  married      if wage==1 & l.unemp==1 & jid==2
tab whystartself  if wage==1 & l.unemp==1 & jid==2
tab hhbusiness    if wage==1 & l.unemp==1 & jid==2
tab commute       if wage==1 & l.unemp==1 & jid==2
tab expected      if wage==1 & l.unemp==1 & jid==2
tab happy         if wage==1 & l.unemp==1 & jid==2
tab compare       if wage==1 & l.unemp==1 & jid==2
sum earn          if wage==1 & l.unemp==1 & jid==2
sum earnstart     if wage==1 & l.unemp==1 & jid==2
tab whystopself   if wage==1 & l.unemp==1 & jid==2
sum children      if wage==1 & l.unemp==1 & jid==2
sum fed           if wage==1 & l.unemp==1 & jid==2
sum med           if wage==1 & l.unemp==1 & jid==2
sum distprim      if wage==1 & l.unemp==1 & jid==2
sum distsec       if wage==1 & l.unemp==1 & jid==2
sum agestart      if wage==1 & l.unemp==1 & jid==2

/*Unemp t & t+1*/

sum duration      if unemp==1 & l.unemp==1 & jid==2
sum married       if unemp==1 & l.unemp==1 & jid==2
sum children      if unemp==1 & l.unemp==1 & jid==2
sum schooling     if unemp==1 & l.unemp==1 & jid==2
sum weleftage     if unemp==1 & l.unemp==1 & jid==2
tab  primary      if unemp==1 & l.unemp==1 & jid==2
tab  secondary    if unemp==1 & l.unemp==1 & jid==2
tab  tertiary     if unemp==1 & l.unemp==1 & jid==2
tab  married      if unemp==1 & l.unemp==1 & jid==2
tab whystartself  if unemp==1 & l.unemp==1 & jid==2
tab hhbusiness    if unemp==1 & l.unemp==1 & jid==2
tab commute       if unemp==1 & l.unemp==1 & jid==2
tab expected      if unemp==1 & l.unemp==1 & jid==2
tab happy         if unemp==1 & l.unemp==1 & jid==2
tab compare       if unemp==1 & l.unemp==1 & jid==2
sum earn          if unemp==1 & l.unemp==1 & jid==2
sum earnstart     if unemp==1 & l.unemp==1 & jid==2
tab whystopself   if unemp==1 & l.unemp==1 & jid==2
sum children      if unemp==1 & l.unemp==1 & jid==2
sum fed           if unemp==1 & l.unemp==1 & jid==2
sum med           if unemp==1 & l.unemp==1 & jid==2
sum distprim      if unemp==1 & l.unemp==1 & jid==2
sum distsec       if unemp==1 & l.unemp==1 & jid==2
sum agestart      if unemp==1 & l.unemp==1 & jid==2




/**************************************
*******Dynamics  of Student      ******
**************************************/

/*Student t, Self t+1*/

tab empstatus if  l.dum_student==1 & jid==2



sum duration      if self==1 & l.dum_student==1 & jid==2
sum married       if self==1 & l.dum_student==1 & jid==2
sum children      if self==1 & l.dum_student==1 & jid==2
sum schooling     if self==1 & l.dum_student==1 & jid==2
sum weleftage     if self==1 & l.dum_student==1 & jid==2
tab  primary      if self==1 & l.dum_student==1 & jid==2
tab  secondary    if self==1 & l.dum_student==1 & jid==2
tab  tertiary     if self==1 & l.dum_student==1 & jid==2
tab  married      if self==1 & l.dum_student==1 & jid==2
tab whystartself  if self==1 & l.dum_student==1 & jid==2
tab hhbusiness    if self==1 & l.dum_student==1 & jid==2
tab commute       if self==1 & l.dum_student==1 & jid==2
tab expected      if self==1 & l.dum_student==1 & jid==2
tab happy         if self==1 & l.dum_student==1 & jid==2
tab compare       if self==1 & l.dum_student==1 & jid==2
sum earn          if self==1 & l.dum_student==1 & jid==2
sum earnstart     if self==1 & l.dum_student==1 & jid==2
tab whystopself   if self==1 & l.dum_student==1 & jid==2
sum children      if self==1 & l.dum_student==1 & jid==2
sum fed           if self==1 & l.dum_student==1 & jid==2
sum med           if self==1 & l.dum_student==1 & jid==2
sum distprim      if self==1 & l.dum_student==1 & jid==2
sum distsec       if self==1 & l.dum_student==1 & jid==2
sum agestart      if self==1 & l.dum_student==1 & jid==2
tab whyleftwage   if self==1 & l.dum_student==1 & jid==2





/* Student t and  Wage t+1*/

sum duration      if wage==1 & l.dum_student==1 & jid==2
sum married       if wage==1 & l.dum_student==1 & jid==2
sum children      if wage==1 & l.dum_student==1 & jid==2
sum schooling     if wage==1 & l.dum_student==1 & jid==2
sum weleftage     if wage==1 & l.dum_student==1 & jid==2
tab  primary      if wage==1 & l.dum_student==1 & jid==2
tab  secondary    if wage==1 & l.dum_student==1 & jid==2
tab  tertiary     if wage==1 & l.dum_student==1 & jid==2
tab  married      if wage==1 & l.dum_student==1 & jid==2
tab whystartself  if wage==1 & l.dum_student==1 & jid==2
tab hhbusiness    if wage==1 & l.dum_student==1 & jid==2
tab commute       if wage==1 & l.dum_student==1 & jid==2
tab expected      if wage==1 & l.dum_student==1 & jid==2
tab happy         if wage==1 & l.dum_student==1 & jid==2
tab compare       if wage==1 & l.dum_student==1 & jid==2
sum earn          if wage==1 & l.dum_student==1 & jid==2
sum earnstart     if wage==1 & l.dum_student==1 & jid==2
tab whystopself   if wage==1 & l.dum_student==1 & jid==2
sum children      if wage==1 & l.dum_student==1 & jid==2
sum fed           if wage==1 & l.dum_student==1 & jid==2
sum med           if wage==1 & l.dum_student==1 & jid==2
sum distprim      if wage==1 & l.dum_student==1 & jid==2
sum distsec       if wage==1 & l.dum_student==1 & jid==2
sum agestart      if wage==1 & l.dum_student==1 & jid==2


/*Student t, Unemp t+1*/

sum duration      if unemp==1 & l.dum_student==1 & jid==2
sum married       if unemp==1 & l.dum_student==1 & jid==2
sum children      if unemp==1 & l.dum_student==1 & jid==2
sum schooling     if unemp==1 & l.dum_student==1 & jid==2
sum weleftage     if unemp==1 & l.dum_student==1 & jid==2
tab  primary      if unemp==1 & l.dum_student==1 & jid==2
tab  secondary    if unemp==1 & l.dum_student==1 & jid==2
tab  tertiary     if unemp==1 & l.dum_student==1 & jid==2
tab  married      if unemp==1 & l.dum_student==1 & jid==2
tab whystartself  if unemp==1 & l.dum_student==1 & jid==2
tab hhbusiness    if unemp==1 & l.dum_student==1 & jid==2
tab commute       if unemp==1 & l.dum_student==1 & jid==2
tab expected      if unemp==1 & l.dum_student==1 & jid==2
tab happy         if unemp==1 & l.dum_student==1 & jid==2
tab compare       if unemp==1 & l.dum_student==1 & jid==2
sum earn          if unemp==1 & l.dum_student==1 & jid==2
sum earnstart     if unemp==1 & l.dum_student==1 & jid==2
tab whystopself   if unemp==1 & l.dum_student==1 & jid==2
sum children      if unemp==1 & l.dum_student==1 & jid==2
sum fed           if unemp==1 & l.dum_student==1 & jid==2
sum med           if unemp==1 & l.dum_student==1 & jid==2
sum distprim      if unemp==1 & l.dum_student==1 & jid==2
sum distsec       if unemp==1 & l.dum_student==1 & jid==2
sum agestart      if unemp==1 & l.dum_student==1 & jid==2




/************* Mean Tests **************/
/*time t self vs wage */
ttest schooling      if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest married        if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest children       if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest fed            if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest med            if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest duration       if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest earn           if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest earnstart      if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest distprim       if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest distsec        if jid==1 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)



/*time t self vs unemp */

ttest schooling      if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest married        if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest children       if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest fed            if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest med            if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest duration       if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest distprim       if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest distsec        if jid==1 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus) 



/*time t+1 self vs wage */
ttest schooling      if jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest married        if jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest children       if jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest fed            if jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest med            if jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest duration       if jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest earn           if jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest earnstart      if jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest distprim       if jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest distsec        if jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest hhbusiness     if jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)



/*time t+1 self vs unemp */

ttest schooling      if jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest married        if jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest children       if jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest fed            if jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest med            if jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest duration       if jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest distprim       if jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest distsec        if jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus) 
ttest hhbusiness     if jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus) 



/*self t-1*/
ttest  schooling      if  l.self==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  fed            if  l.self==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  med            if  l.self==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  married        if  l.self==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  children       if  l.self==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  weleftage      if  l.self==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  earn           if  l.self==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  primary        if  l.self==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  secondary      if  l.self==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  terti          if  l.self==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  duration       if  l.self==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  distprim       if  l.self==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  distsec        if  l.self==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)




*Wage t-1*/
ttest  schooling      if  l.wage==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  fed            if  l.wage==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  med            if  l.wage==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  married        if  l.wage==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  children       if  l.wage==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  weleftage      if  l.wage==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  earn            if  l.wage==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  primary        if  l.wage==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  secondary      if  l.wage==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  terti          if  l.wage==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  duration       if  l.wage==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  distprim       if  l.wage==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  distsec        if  l.wage==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)



*Unemployed t-1*/
ttest  schooling      if  l.unemp==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  fed            if  l.unemp==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  med            if  l.unemp==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  married        if  l.unemp==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  children       if  l.unemp==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  weleftage      if  l.unemp==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  earn           if  l.unemp==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  primary        if  l.unemp==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  secondary      if  l.unemp==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  terti          if  l.unemp==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  duration       if  l.unemp==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  distprim       if  l.unemp==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)
ttest  distsec        if  l.unemp==1 & jid==2 & empstatus!="Unemployed" & empstatus!="Student", by (empstatus)


*Student t-1*/
ttest  schooling      if  l.dum_student==1 & jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest  fed            if  l.dum_student==1 & jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest  med            if  l.dum_student==1 & jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest  married        if  l.dum_student==1 & jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest  children       if  l.dum_student==1 & jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest  weleftage      if  l.dum_student==1 & jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest  earn           if  l.dum_student==1 & jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest  primary        if  l.dum_student==1 & jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest  secondary      if  l.dum_student==1 & jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest  terti          if  l.dum_student==1 & jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest  duration       if  l.dum_student==1 & jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest  distprim       if  l.dum_student==1 & jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
ttest  distsec        if  l.dum_student==1 & jid==2 & empstatus!="Wage employed" & empstatus!="Student", by (empstatus)
