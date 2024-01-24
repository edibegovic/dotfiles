RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice, ProgId, MSEdgeHTM
;RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice, ProgId, ChromeHTML
GroupAdd, explorer, ahk_class CabinetWClass
GroupAdd, outlook, ahk_exe OUTLOOK.EXE

; Hyper CapsLock Initializer
;---------------------------------------------------------------------
SetCapsLockState, AlwaysOff                                       

; CapsLock + Esc: {CapsLock}
; ---------------------------------------------------------------------
CapsLock & Esc::
GetKeyState, CapsLockState, CapsLock, T
if CapsLockState = D
    SetCapsLockState, AlwaysOff
else
    SetCapsLockState, AlwaysOn
KeyWait, ``
return

; CapsLock:  {ESC}
; ---------------------------------------------------------------------
CapsLock::Send, {ESC}

; Cursor movement
; --------------------------------------------------------------------
CapsLock & h::                                                       
if GetKeyState("shift") = 1                                        
    Send, +{Left}
else Send, {Left} 
return

CapsLock & j:: 
if GetKeyState("shift") = 1                                        
    Send, +{Down}
else if GetKeyState("alt") = 1                                        
    Send, !{Down}
else
    Send, {Down}
return

CapsLock & k::                                                       
if GetKeyState("shift") = 1                                        
    Send, +{Up}
else if GetKeyState("alt") = 1                                        
    Send, !{Up}
else Send, {Up} 
return

CapsLock & l::                                                       
if GetKeyState("shift") = 1                                        
    Send, +{Right}
else Send, {Right} 
return

; Word-level cursor movement
;--------------------------------------------------------------------
CapsLock & u::
if GetKeyState("shift") = 1                                        
    Send, +{Home}
else Send, {Home} 
return

CapsLock & p::
if GetKeyState("shift") = 1                                        
    Send, +{End}
else Send, {End} 
return

CapsLock & i::
if GetKeyState("shift") = 1                                        
   Send, +^{Left}
else Send, ^{Left} 
return

CapsLock & o::
if GetKeyState("shift") = 1                                        
   Send, +^{Right}
else Send, ^{Right} 
return

; Switch between open windows of current app
; --------------------------------------------------------------------
Windows(Direction)
{
	static total, hWnds, last := ""

	a := WinExist("A")
	WinGetClass wClass
	WinGet exe, ProcessName
	if (exe != last) {
		last := exe
		hWnds := []
		DetectHiddenWindows Off
		WinGet wList, List, % "ahk_exe" exe " ahk_class" wClass
		loop % wList {
			hWnd := wList%A_Index%
			hWnds.Push(hWnd)
		}
		total := hWnds.Count()
	}
	for i,hWnd in hWnds {
		if (a = hWnd)
			break
	}
	i += Direction
	i := i > total ? 1 : i = 0 ? total : i
	WinActivate % "ahk_id" hWnds[i]
}

!<::Windows(+1)

; Function to toggle the focus of a program
; --------------------------------------------------------------------
ToggleApp(AppName, AppPath) {
    if WinExist("ahk_exe " . AppName) {
        if WinActive("ahk_exe " . AppName) {
            WinMinimize
        } else {
            WinActivate
        }
    } else {
        Run %AppPath%
    }
}

; Hyper App Launcher
;---------------------------------------------------------------------
CapsLock & v::ToggleApp("Code.exe", "C:\program files\Microsoft VS Code\Code.exe")
CapsLock & c::ToggleApp("Firefox.exe", "C:\Program Files\Mozilla Firefox\firefox.exe")
CapsLock & t::ToggleApp("WindowsTerminal.exe", "C:\Users\edbe\AppData\Local\Microsoft\WindowsApps\wt.exe")
CapsLock & a::GroupActivate, explorer
CapsLock & q::ToggleApp("Teams.exe", "C:\Users\edbe\AppData\Local\Microsoft\Teams\Update.exe --processStart Teams.exe")
CapsLock & m::GroupActivate, outlook
CapsLock & e::ToggleApp("ONENOTE.EXE", "C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE")
CapsLock & x::ToggleApp("nvim-qt.exe", "C:\Program Files\Neovim\bin\nvim-qt.exe")
CapsLock & g::ToggleApp("gitkraken.exe", "C:\Users\edbe\AppData\Local\gitkraken\gitkraken.exe")
; CapsLock & r::ToggleApp("PAMAutomation", "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -Command &{Import-Module PAMAutomation; Start-PAMRDP}")
CapsLock & r::ToggleApp("mstsc.exe", "C:\Windows\System32\mstsc.exe")

; open powertoys run (alt+space) and search for files (?)
CapsLock & f::Send, !{Space}?
CapsLock & d::Send, !{Space}<
CapsLock & Return::Send, !{Space}:o

; macOS like window management
;---------------------------------------------------------------------
!q::WinClose A
!h::WinMinimize A

; Right click menu
RAlt::AppsKey

; media controls
;---------------------------------------------------------------------
CapsLock & F1:: Send, {Volume_Mute}
CapsLock & F2:: Send, {Volume_Down}
CapsLock & F3:: Send, {Volume_Up}
CapsLock & F4:: Send, {Media_Play_Pause}
CapsLock & F5:: Send, {Media_Next}
CapsLock & F6:: Send, {Media_Stop}

