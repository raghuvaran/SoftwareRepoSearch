[menu]
cls
print "****************************************************************"
print "1)>>> New Entry"
print "2)>>> Edit Info"
print "3)>>> Search"
print "4)>>> Disk Details"
print "5)>>> EXIT"
print "****************************************************************"
print "Please choose from the List!!"
print ">>";
answer$ = input$(1)
if answer$ = "1" then goto [newup]
if answer$ = "2" then goto [editup]
if answer$ = "3" then goto [search]
if answer$ = "4" then goto [diskdetails]
if answer$ = "5" then end
print "Incorrect Entry!!"
print "Press Enter to continue..."
abc$=input$(1)
goto [menu]

[newup]
input "Name of the  file:"; filename$
print
input "File Extension:"; ext$
print
input "Company Name:"; company$
print
print "Status: 1) Working"
print         "2) Yet to be tested"
print         "3) Not Working"
print         "4) Spam"
status$ = input$(1)
if status$ = "1" then status$ = "Working"
if status$ = "2" then status$ = "Yet to be tested"
if status$ = "3" then status$ = "Not Working"
if status$ = "4" then status$ = "Spam"
if status$ <> "1","2","3","4" then status$ = "**Not Mentioned**"
print "Time:"
input "press[enter] to record as ("+time$()+")"; time$
if time$ = "" then time$ = time$()
print "Date:"
input "press[enter] to record as ("+date$()+")"; date$
if date$ = "" then date$ = date$()
[con]
print "Save/Edit/Cancel  (S/E/C)"
con$ = INPUT$(1)
if con$ = "S" or con$ = "s" then gosub [save] :Print "Enrty saved!!" :goto [menu]
if con$ = "E" or con$ = "e" then gosub [edit]
if con$ = "C" or con$ = "c" then print "Enrty Cancelled!!" : goto [menu]
if con$<>"s","e","c","S","E","C" then print "Incorrect Enrty!!"
goto [con]

[re_enter]
print "Name of the  file:"; filename$;
input filename1$
if filename1$<>"0" then filename$=filename1$
print
print "File Extension:"; ext$;
input ext1$
if ext1$<>"0" then ext$=ext1$
print
print "Company Name:"; company$;
input company1$
if company1$ <> " " then company$=company1$
print
print status$
print "Status: 1) Working"
print         "2) Yet to be tested"
print         "3) Not Working"
print         "4) Spam"
status1$ = input$(1)
if status1$ = "1" then status$ = "Working"
if status1$ = "2" then status$ = "Yet to be tested"
if status1$ = "3" then status$ = "Not Working"
if status1$ = "4" then status$ = "Spam"
if status1$ = "0" then status$ = "**Not Mentioned**"
print "Time:"; time$
input "press[enter] to record as ("+time$()+")"; time$
if time$ = "" then time$ = time$()
print "Date:"; date$
input "press[enter] to record as ("+date$()+")"; date$
if date$ = "" then date$ = date$()
return

[editup]
[diskdetails]
print "This feature in yet to be ENABLED!!"
input "Thanks -- press any key to goto menu page"; a
goto [menu]


[save]
open "datas.dat" for append as #datas
print #datas, filename$
print #datas, ext$
print #datas, company$
print #datas, status$
print #datas, date$
print #datas, time$
close #datas


[repeatsave]
open "software.txt" for append as #sft
print #sft,"*******************************************"
print #sft,"File name: ";filename$
print #sft,"Extension: ";ext$
print #sft,"Reference: ";company$
print #sft,"Status:    "; status$
print #sft,"Date:      ";date$
print #sft,"Time:      ";time$                          
print #sft,"*******************************************"
close #sft                                              
return

[edit]
print "Name of the  file:"; filename$
input "Re-type the file name>>"; filename1$
if filename1$ <> "" then filename$ = filename1$
print
print "File Extension:"; ext$
input "Re-type the file extension>>"; ext1$
if ext1$ <> "" then ext$ = ext1$
print
print "Company Name:"; company$
input "Re-type the Company name>>"; company1$
if company1$ <> "" then company$ = company1$
print
print "Status:" ; status$
print "Change the Status>>"
print "Status: 1) Working"
print         "2) Yet to be tested"
print         "3) Not Working"
print         "4) Spam"
status1$ = input$(1)
if status1$ = "1" then status$ = "Working"
if status1$ = "2" then status$ = "Yet to be tested"
if status1$ = "3" then status$ = "Not Working"
if status1$ = "4" then status$ = "Spam"
print

[displayinfo]
print "**************************************************"
print "Name:     "; filename$
print "Extention:";ext$
print "Reference:"; company$
print "Status:   "; status$
print "Date:     "; date$
print "Time:     "; time$ 
print "**************************************************"
return

[search]
print "1) Search by name"
print ">>2) Search by Category"
print ">>3) Search by Status"
se$ = input$(1)
if se$="1" then print"  SEARCH BY NAME:":goto [sename]
if se$="2" then print"  SEARCH BY REFRENCE:":goto [secompany]
if se$="3" then print"  SEARCH BY STATUS:":goto [sestatus]

[sename]
print "Please enter the name"
print
input ">> "; sename$
open "datas.dat" for input as #datas
gosub [readdata]
if instr(upper$(filename$),upper$(sename$)) > 0 then goto[matched]
cls
print "Entry not found!!!"
print
print "Please try again!!"
input "press any key to switch over MAIN MENU"; dum$
goto [menu]

[readdata]
line input #datas, filename$
line input #datas, ext$
line input #datas, company$
line input #datas, status$
line input #datas, date$
line input #datas, time$
return

[secompany]
print "Please enter the category"
print
input ">> "; secompany$
gosub [readdata]
if instr(upper$(company$),upper$(secompany$)) > 0 then goto[matched]
cls
print "Entry not found!!!"
print
print "Please try again!!"
input "press any key to switch over MAIN MENU"; dum$
goto [menu]

[sestatus]
print "Please enter the name"
print
input ">> "; sestatus$
gosub [readdata]
if instr(upper$(status$),upper$(sestatus$)) > 0 then goto[matched]
cls
print "Entry not found!!!"
print
print "Please try again!!"
input "press any key to switch over MAIN MENU"; dum$
goto [menu]


[matched]
cls
print "Entry found!!!"
print
print "Loading......."
print
print
print "*************************************"
gosub [displayinfo]
print "*************************************"
print
print "wanna SEARCH more!!!(Y/N)"
[wan]
an$ = input$(1)
if an$ = "y" or an$ = "Y" then goto [search]
if an$ = "n" or an$ = "N" then goto [menu]
print "INVALID ENTRY!!!"
goto [wan]














