; --------------------------------------------¨
; Invoke start menu (mouse click lower-left corner on ctrl+space)
; ctrl+space
; --------------------------------------------

; Capture screen coords
CoordMode, Mouse, Screen
SysGet, ScreenHeight, 79 
Y := ScreenHeight

; Helper
ControlClick2(X, Y, WinTitle, whicButton:="Left") {
    hwnd := WinActive("A")
    lparam := X & 0xFFFF | (Y & 0xFFFF) << 16
    SendMessage 0x200,, % lparam,, % "ahk_id" hwnd ; WM_MOUSEMOVE
    PostMessage 0x2A1,, % lparam,, % "ahk_id" hwnd ; WM_MOUSEHOVER
    ControlClick, % "x" X " y" Y, % "ahk_id" hwnd,, % whicButton,, % "NA Pos"
}

; Binding
^Space::
ControlClick2(10, Y-10, "X", "Left")
return


; --------------------------------------------
; Cycle through windows of current application 
; alt+§ (button above tab)
; --------------------------------------------
ExtractAppTitle(FullTitle)
{	
	AppTitle := SubStr(FullTitle, InStr(FullTitle, " ", false, -1) + 1)
	Return AppTitle
}

!SC056:: ; alt+§
    WinGet, ActiveProcess, ProcessName, A
    WinGet, OpenWindowsAmount, Count, ahk_exe %ActiveProcess%

    If OpenWindowsAmount = 1  ; If only one Window exist, do nothing
        Return
        
    Else
        {
            WinGetTitle, FullTitle, A
            AppTitle := ExtractAppTitle(FullTitle)

            SetTitleMatchMode, 2		
            WinGet, WindowsWithSameTitleList, List, %AppTitle%
            
            If WindowsWithSameTitleList > 1 ; If several Window of same type (title checking) exist
            {
                WinActivate, % "ahk_id " WindowsWithSameTitleList%WindowsWithSameTitleList%	; Activate next Window	
            }
        }
    Return
