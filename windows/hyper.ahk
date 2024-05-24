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


; Mac keyboard compatibility
; ---------------------------------------------------------------------
; LAlt::LWin
; LWin::Lalt

; left Windows + tab: Alt + tab
; ---------------------------------------------------------------------
LWin & Tab::AltTab

; PrintScreen (on Thinkpad) to right click
; ---------------------------------------------------------------------
SC137::AppsKey

; Auto-reload script with right
RControl::Reload

; Fix backslash
;FLIP 029 and 056 (½ - <)
; ---------------------------------------------------------------------
SC029::SC056
SC056::SC029

; Curly brackets { }
; ---------------------------------------------------------------------
!+8:: Send, {{} 
!+9:: Send, {}}

; Backslash
; ---------------------------------------------------------------------
!+7:: Send, \

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


; !SC029::Windows(+1)

; Switch between instances of the current ToggleApp
; --------------------------------------------------------------------
ExtractAppTitle(FullTitle)
{	
	AppTitle := SubStr(FullTitle, InStr(FullTitle, " ", false, -1) + 1)
	Return AppTitle
}
; !`::
!SC056:: ; Ctrl+Alt+L hotkey
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
CapsLock & q::ToggleApp("ms-teams.exe", "C:\Program Files\WindowsApps\MSTeams_24004.1309.2689.2246_x64__8wekyb3d8bbwe\ms-teams.exe")
CapsLock & m::GroupActivate, outlook
CapsLock & e::ToggleApp("ONENOTE.EXE", "C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE")
CapsLock & x::ToggleApp("neovide.exe", "C:\Users\edbe\scoop\apps\neovide\current\neovide.exe")
CapsLock & g::ToggleApp("GitHubDesktop.exe", "C:\Users\edbe\AppData\Local\GitHubDesktop\GitHubDesktop.exe")
; CapsLock & r::ToggleApp("PAMAutomation", "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -Command &{Import-Module PAMAutomation; Start-PAMRDP}")
CapsLock & r::ToggleApp("mstsc.exe", "C:\Windows\System32\mstsc.exe")

CapsLock & 1::ToggleApp("1Password.exe", "C:\Users\edbe\AppData\Local\1Password\app\8\1Password.exe")
CapsLock & s::ToggleApp("Spotify.exe", "C:\Users\edbe\AppData\Roaming\Spotify\Spotify.exe")
CapsLock & w::ToggleApp("WINWORD.EXE", "C:\Program Files\Microsoft Office\root\Office16\WINWORD.EXE")

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
F13::Media_Prev
F14::Media_Play_Pause
F15::Media_Next

F18::Send {Volume_Down}
F19::Send {Volume_Up}

