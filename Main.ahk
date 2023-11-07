#SingleInstance force
;put the ideas here
^!+q:: Reload
^!+e:: Edit
^!+p:: ExitApp

;/ Premiere Pro
#Hotif WinActive("ahk_exe Adobe Premiere Pro.exe")
XButton1:: Send "{-}"
XButton2:: Send "{=}"
!WheelUp::Send "!{WheelUp}"
!WheelDown:: Send "!{WheelDown}"
RButton:: Send "{s}"
MButton:: Send "{RButton}"
+s:: Send "+{Left 15}{Space}"
!a:: Send "!{Left}"
!d:: Send "!{Right}"
;*

/* ;/ Volume Control with TaskBar
#Hotif MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp:: Send "{Volume_Up 2}"
WheelDown:: Send "{Volume_Down 2}"

MouseIsOver(WinTitle) {
    MouseGetPos ,, &Win
    return WinExist(WinTitle " ahk_id " Win)
}
;* */

;/ Visual Studio
#Hotif WinActive("ahk_exe Code.exe")
+Space:: {
	Send "^{s}"
	Send "^!{n}"
}
;*

;/ Photoshop
#Hotif WinActive("ahk_exe Photoshop.exe")
!v::{
	MouseGetPos &PosX, &PosY
	MouseClick "left", 20, 98
	MouseMove PosX, PosY
}
/*
!WheelUp::Send "!{WheelUp}"
!WheelDown:: Send "!{WheelDown}"
*/
!+v::{
	Send "^!+{a}"
	MouseClick "left", 803, 885, 2
}
;*

;/ Discord
#Hotif WinActive("ahk_exe Discord.exe")
!+f::{
	MouseGetPos &PosX, &PosY
	if ImageSearch(&FoundX, &FoundY, 0, 0, 1920, 1049, "[discord close image path]"){
		MouseClick "left", FoundX+3, FoundY+3
	}
	MouseMove PosX, PosY
}
;*

;/ After Effects
#Hotif WinActive("ahk_exe AfterFX.exe")

/* SystemCursor(cmd)  ; cmd = "Show|Hide|Toggle|Reload"
{
    static visible := true, c := Map()
    static sys_cursors := [32512, 32513, 32514, 32515, 32516, 32642
                         , 32643, 32644, 32645, 32646, 32648, 32649, 32650]
    if (cmd = "Reload" or !c.Count)  ; Reload when requested or at first call.
    {
        for i, id in sys_cursors
        {
            h_cursor  := DllCall("LoadCursor", "Ptr", 0, "Ptr", id)
            h_default := DllCall("CopyImage", "Ptr", h_cursor, "UInt", 2
                , "Int", 0, "Int", 0, "UInt", 0)
            h_blank   := DllCall("CreateCursor", "Ptr", 0, "Int", 0, "Int", 0
                , "Int", 32, "Int", 32
                , "Ptr", Buffer(32*4, 0xFF)
                , "Ptr", Buffer(32*4, 0))
            c[id] := {default: h_default, blank: h_blank}
        }
    }
    switch cmd
    {
    case "Show": visible := true
    case "Hide": visible := false
    case "Toggle": visible := !visible
    default: return
    }
    for id, handles in c
    {
        h_cursor := DllCall("CopyImage"
            , "Ptr", visible ? handles.default : handles.blank
            , "UInt", 2, "Int", 0, "Int", 0, "UInt", 0)
        DllCall("SetSystemCursor", "Ptr", h_cursor, "UInt", id)
    }
} */

RButton::{
	;if ImageSearch(&FoundX, &FoundY, 260, 0, 325, 30, "[ae text tool active image path]"){
	;	return
	;}
	SystemCursor(cmd)  ; cmd = "Show|Hide|Toggle|Reload"
{
    static visible := true, c := Map()
    static sys_cursors := [32512, 32513, 32514, 32515, 32516, 32642
                         , 32643, 32644, 32645, 32646, 32648, 32649, 32650]
    if (cmd = "Reload" or !c.Count)  ; Reload when requested or at first call.
    {
        for i, id in sys_cursors
        {
            h_cursor  := DllCall("LoadCursor", "Ptr", 0, "Ptr", id)
            h_default := DllCall("CopyImage", "Ptr", h_cursor, "UInt", 2
                , "Int", 0, "Int", 0, "UInt", 0)
            h_blank   := DllCall("CreateCursor", "Ptr", 0, "Int", 0, "Int", 0
                , "Int", 32, "Int", 32
                , "Ptr", Buffer(32*4, 0xFF)
                , "Ptr", Buffer(32*4, 0))
            c[id] := {default: h_default, blank: h_blank}
        }
    }
    switch cmd
    {
    case "Show": visible := true
    case "Hide": visible := false
    case "Toggle": visible := !visible
    default: return
    }
    for id, handles in c
    {
        h_cursor := DllCall("CopyImage"
            , "Ptr", visible ? handles.default : handles.blank
            , "UInt", 2, "Int", 0, "Int", 0, "UInt", 0)
        DllCall("SetSystemCursor", "Ptr", h_cursor, "UInt", id)
    }
}
	MouseGetPos &PosX, &PosY
	if (PosX > 600 and PosY > 445){
		SystemCursor("Hide")
		MouseClick "left", PosX, 460
		Sleep 50
		MouseMove PosX, PosY, 0
		SystemCursor("Show")
	}
	else Send "{RButton}"
}
!v::{
	MouseGetPos &Xpos, &Ypos
	MouseClick "left", 50, 6
	MouseMove Xpos, Ypos
}
MButton:: Send "{RButton}"
!+d:: Send "+{Right 2}"
!+a:: Send "!+{a 2}"
!+s:: Send "!+{s 2}"
!+w:: Send "!+{w 2}"
^f:: Send "f"
!a:: Send "p"
!d:: Send "{l}{l}"
XButton1:: Send "{-}"
XButton2:: Send "{=}"
^!d::{
	Send "^!{x}"
	Send "^!{a}"
	Send "{q}"
}
!WheelUp::Send "!{WheelUp}"
!WheelDown:: Send "!{WheelDown}"
^!+s::{
	Send "^+{s}"
	Sleep 400
	MouseClick "left", 625, 20
	Send "[directory]"
	Send "{Enter}"
	MouseClick "left", 870, 405
	Send "^{v}"
	Sleep 100
	MouseMove 780, 473
}
;zoom-in hotkeys start

#Hotif

;/ No Need to Touch These
~LAlt::Sendinput "{Blind}{sc0E9}"
~RAlt::Sendinput "{Blind}{sc0E9}"

ScrollLock:: Send "{Volume_Down 2}"
Pause:: Send "{Volume_Up 2}"
F7:: Send "{Media_Play_Pause}"

!k:: Send "{Backspace}"
^!k:: Send "^{Backspace}"
^!Backspace:: Send "^{Backspace}"

>!a:: Send "1"
>!s:: Send "2"
>!d:: Send "3"
>!f:: Send "4"
>!g:: Send "5"
>!h:: Send "6"
>!j:: Send "7"
>!k:: Send "8"
>!l:: Send "9"
>!;:: Send "0"

A_HotkeyInterval := 2000
A_MaxHotkeysPerInterval := 200
A_MenuMaskKey := "vkE8"

/*
!WheelUp::Send "{WheelUp 4}"
!WheelDown:: Send "{WheelDown 4}"

^!WheelUp::Send "{WheelUp 8}"
^!WheelDown:: Send "{WheelDown 8}"
*/

CapsLock:: Send "{Ctrl down}{Alt down}{v}{Alt up}{Ctrl up}"
!CapsLock:: Send "{Ctrl down}{Alt down}{b}{Alt up}{Ctrl up}"

AppsKey & w:: Send "{Up}"
AppsKey & s:: Send "{Down}"
AppsKey & a:: Send "{Left}"
AppsKey & d:: Send "{Right}"

!+2:: SendText "@gmail.com"
;*

;/ General Window Management
!+f:: Send "!{F4}"
!`:: WinMinimize "A"
;RAlt:: Send "{LWin down}{Shift down}{Left}{Shift up}{LWin up}"
;*

;/ Random BS

^!+l:: Run "https://www.autohotkey.com/docs/v2/KeyList.htm"
;*

;/ Random Work
+CapsLock::{
	Send "{RButton}{Sleep 100}{Up 5}{Enter}"
	WinWait "Save As"
	SendEvent "{Enter}"
}
/* ~LControl up::{
    if KeyWait("LControl", "D T0.3") {
        WinActivate "ahk_exe explorer.exe"
        Run "explorer"
    }
    KeyWait("LControl")
} */
!+;:: SendInput FormatTime(A_Now, "dd-MM-yyyy")
^!+;:: SendInput FormatTime(A_Now, "hh:mm tt")

;/ Window Switchers

!NumpadEnter:: Run "C:\Program Files\AutoHotkey\UX\WindowSpy.ahk"

;!1:: WindowSwitcher("brave.exe", "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe")
!2:: WindowSwitcher("chrome.exe", "chrome")
;!1:: WindowSwitcher("AfterFX.exe", "C:\Program Files\Adobe\Adobe After Effects 2023\Support Files\AfterFX.exe")
!3:: WindowSwitcher("Adobe Premiere Pro.exe", "C:\Program Files\Adobe\Adobe Premiere Pro 2023\Adobe Premiere Pro.exe")
!5:: WindowSwitcher("Photoshop.exe", "C:\Program Files\Adobe\Adobe Photoshop 2023\Photoshop.exe")
!6:: WindowSwitcher("Adobe Audition.exe", "C:\Program Files\Adobe\Adobe Audition 2023\Adobe Audition.exe")
!1:: WindowSwitcher("ApplicationFrameHost.exe", "Whatsapp")

WindowSwitcher(ahke, lpath)
{
	if WinActive("ahk_exe" ahke)
	WinMinimize
	else if WinExist("ahk_exe" ahke)
	WinActivate
	else Run lpath
}	
;*

/*  Needs to be worked on
!Numpad4::{
	ActiveID := WinGetID("A")
	WinSetTransparent 0, "ahk_exe brave.exe"
	WinActivate("ahk_exe brave.exe")
	Send "^{1}"
	Send "{j}"
	Send "^{9}"
	Sleep 100
	WinActivate ActiveID
	WinSetTransparent 255, "ahk_exe brave.exe"
}
!Numpad6::{
	ActiveID := WinGetID("A")
	WinSetTransparent 0, "ahk_exe brave.exe"
	WinActivate("ahk_exe brave.exe")
	Send "^{1}"
	Send "{l}"
	Send "^{9}"
	Sleep 100
	WinActivate ActiveID
	WinSetTransparent 255, "ahk_exe brave.exe"
}

*/

;/ Emoji
^+1::{
	Send "{LWin down}{.}{LWin up}"
	Sleep 300
	Send "eyes"
	Sleep 100
	Send "{Enter}"
	Sleep 300
	Send "{LButton}"
}

^+2::{
	Send "{LWin down}{.}{LWin up}"
	Sleep 300
	Send "slightly smiling face"
	Sleep 100
	Send "{Enter}"
	Sleep 300
	Send "{LButton}"
}

^+3::{
	Send "{LWin down}{.}{LWin up}"
	Sleep 300
	Send "drooling face"
	Sleep 100
	Send "{Enter}"
	Sleep 300
	Send "{LButton}"
}
^+4::{
	Send "{LWin down}{.}{LWin up}"
	Sleep 300
	Send "hot beverage"
	Sleep 100
	Send "{Enter}"
	Sleep 300
	Send "{LButton}"
}
^+5::{
	Send "{LWin down}{.}{LWin up}"
	Sleep 300
	Send "thumbs up"
	Sleep 100
	Send "{Enter}"
	Sleep 300
	Send "{LButton}"
}
^+6::{
	Send "{LWin down}{.}{LWin up}"
	Sleep 300
	Send "check mark button"
	Sleep 100
	Send "{Enter}"
	Sleep 300
	Send "{LButton}"
}
;*

/* a:: {
 Global b
 b := 3
 MsgBox b
}

c::MsgBox b ?? 'Not assigned' */


/* !Tab::
{
	Send "!{Tab}"
	Send "{Ctrl down}{Alt down}{v}{Alt up}{Ctrl up}"
}
 */
