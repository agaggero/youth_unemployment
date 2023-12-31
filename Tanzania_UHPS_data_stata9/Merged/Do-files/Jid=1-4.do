clear all
do "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\Do-files\merging2"


 
 gen x =1
 sort wid
 by wid: replace x=sum(x)
 by wid: egen activity=max(x)
sort wid jid
 

*****************************************************************************************************
*************************************** Characterising Jid=1-4  ************************************
 *****************************************************************************************************/
*log using "C:\Users\lexag14\Desktop\University\PhD\Returns To Educatio - Tanzania\Tanzania DataSet\Tanzania_UHPS_data_stata9\Merged\log-files\jid=1&2", text replace
xtdes
keep if activity==4
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
sum agestart      if self==1 & jid==1



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
sum  agestart      if wage==1 & jid==1








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
sum agestart         if unemp==1 & jid==1






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





/*Self at t+3, Baseline Characteristics*/
sum duration      if self==1 & jid==4
sum married       if self==1 & jid==4
sum children      if self==1 & jid==4
sum schooling     if self==1 & jid==4
sum fed           if self==1 & jid==4
sum med           if self==1 & jid==4
sum weleftage     if self==1 & jid==4
sum primary       if self==1 & jid==4
tab  primary      if self==1 & jid==4
tab  secondary    if self==1 & jid==4
tab  tertiary     if self==1 & jid==4
tab  married      if self==1 & jid==4
tab whystartself  if self==1 & jid==4
tab hhbusiness    if self==1 & jid==4
tab commute       if self==1 & jid==4
tab expected      if self==1 & jid==4
tab happy         if self==1 & jid==4
tab compare       if self==1 & jid==4
sum earn          if self==1 & jid==4
sum earnstart     if self==1 & jid==4
tab whystopself   if self==1 & jid==4
sum distprim      if self==1 & jid==4
sum distsec       if self==1 & jid==4



/*Wage at t+3, Baseline Characteristics*/
sum duration       if wage==1 & jid==4
sum married        if wage==1 & jid==4
sum children       if wage==1 & jid==4
sum schooling      if wage==1 & jid==4
sum fed            if wage==1 & jid==4
sum med            if wage==1 & jid==4
sum weleftage      if wage==1 & jid==4
sum primary        if wage==1 & jid==4
tab  primary       if wage==1 & jid==4
tab  secondary     if wage==1 & jid==4
tab  tertiary      if wage==1 & jid==4
tab  married       if wage==1 & jid==4
tab whystartself   if wage==1 & jid==4
tab hhbusiness     if wage==1 & jid==4
tab commute        if wage==1 & jid==4
tab expected       if wage==1 & jid==4
tab happy          if wage==1 & jid==4
tab compare        if wage==1 & jid==4
sum earn           if wage==1 & jid==4
sum earnstart      if wage==1 & jid==4
tab whystopself    if wage==1 & jid==4
sum distprim       if wage==1 & jid==4
sum  distsec       if wage==1 & jid==4







/*Unemployed at t+3, Baseline Characteristics*/
sum duration         if unemp==1 & jid==4
sum married          if unemp==1 & jid==4
sum children         if unemp==1 & jid==4
sum schooling        if unemp==1 & jid==4
sum fed              if unemp==1 & jid==4
sum med              if unemp==1 & jid==4
sum weleftage        if unemp==1 & jid==4
sum primary          if unemp==1 & jid==4
tab  primary         if unemp==1 & jid==4
tab  secondary       if unemp==1 & jid==4
tab  tertiary        if unemp==1 & jid==4
tab  married         if unemp==1 & jid==4
tab whystartself     if unemp==1 & jid==4
tab hhbusiness       if unemp==1 & jid==4
tab commute          if unemp==1 & jid==4
tab expected         if unemp==1 & jid==4
tab happy            if unemp==1 & jid==4
tab compare          if unemp==1 & jid==4
sum earn             if unemp==1 & jid==4
sum earnstart        if unemp==1 & jid==4
tab whystopself      if unemp==1 & jid==4
tab cashunemp        if unemp==1 & jid==4
sum timejobsearch    if unemp==1 & jid==4
sum distprim         if unemp==1 & jid==4
sum distsec          if unemp==1 & jid==4






/*Student at t+3, Baseline Characteristics*/
sum duration       if dum_student==1 & jid==4
sum agestart       if dum_student==1 & jid==4
sum married        if dum_student==1 & jid==4
sum children       if dum_student==1 & jid==4
sum schooling      if dum_student==1 & jid==4
sum fed            if dum_student==1 & jid==4
sum med            if dum_student==1 & jid==4
sum weleftage      if dum_student==1 & jid==4
sum primary        if dum_student==1 & jid==4
tab  primary       if dum_student==1 & jid==4
tab  secondary     if dum_student==1 & jid==4
tab  tertiary      if dum_student==1 & jid==4
tab  married       if dum_student==1 & jid==4
tab whystartself   if dum_student==1 & jid==4
tab hhbusiness     if dum_student==1 & jid==4
tab commute        if dum_student==1 & jid==4
tab expected       if dum_student==1 & jid==4
tab happy          if dum_student==1 & jid==4
tab compare        if dum_student==1 & jid==4
sum earn           if dum_student==1 & jid==4
sum earnstart      if dum_student==1 & jid==4
tab whystopself    if dum_student==1 & jid==4
tab cashunemp      if dum_student==1 & jid==4
tab timejobsearch  if dum_student==1 & jid==4
sum distprim       if dum_student==1 & jid==4
sum distsec        if dum_student==1 & jid==4



/*
