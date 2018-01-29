;------------ ARK: Survival Evolved -----------------
#IfWinActive, ARK: Survival Evolved
{
	DoSend(dir){
		global ARKSCROLL				; static ARKSCROLL would also work
		ARKSCROLL := ARKSCROLL + dir		; Works for positive and negative! 2 plus -1 is 1 !!
		if (ARKSCROLL > 9){
			ARKSCROLL := 0
		} else if (ARKSCROLL < 0){
			ARKSCROLL := 9
		}
		Send %ARKSCROLL%{Enter}
	}

	WheelUp::
		DoSend(1)
		return

	WheelDown::
		DoSend(-1)
		return
}
	Return
