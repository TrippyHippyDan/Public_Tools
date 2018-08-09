; Creadted 08/09/2018 08:33 by dfellenz
; This is for use with Keepass to give you easy logins using remembers strings without compromising security 

; This is designed to that you can have seperate folders for different uses and projects for this example 
; it is going to be split into "Work" and "Personal". By no means is this a limiting factor

; vfolder is going to be the name of your folder on the left side of the UI and vsend is going to be the title on the right
; 	~~ As a note I would advise sorting aphabetically to get best results

LoginFunction(vfolder, vsend){
; -- Store the title and the mouse position to return where you were at the finish of the login
WinGetTitle, Title, A
MouseGetPos, xpos, ypos
; -- Keypas and AutoHotKey in general usually remove anything that was in the field when you run them but this is an insurance
Send, {BS}{BS}{BS}{BS}{BS}{BS}
; Moving to KeePass to start the process
IfWinNotActive, KeePass, , WinActivate, KeePass, 
WinWaitActive, KeePass,
; This puts you in the left hand field to sort by the vfolder bane
MouseClick, Left, 55, 150
Sleep, 100
Send, %vfolder%{Tab}
Sleep, 100
; The tab above moved you to the right hand side and now you will search and send the vsend var
Send, %vsend%{CTRLDOWN}v{CTRLUP}
; This uses the information from above to move your mouse back where it was when you started
WinWaitActive, %Title%
MouseMove, %xpos%, %ypos%, 0
	Return
}

; Now that the function has been assigned you have to run it either using hotkeys or hotstrings 
; I recommend hotstrings as they are less likely used by programs for anything

; Hot String 
::fblog::
LoginFunction("Personal", "Facebook")
	Return
	
::ticketlog::
LoginFunction("Work", "Ticket Tracker")
	Return

; Hot Key (CTRL + SHITF + 1)
^+1::
LoginFunction("Personal", "Facebook")
	Return
