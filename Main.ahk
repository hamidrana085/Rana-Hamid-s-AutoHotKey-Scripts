#SingleInstance force
^!+q:: Reload
^!+e:: Edit
^!+p:: ExitApp

;/ Premiere Pro
#HotIf WinActive("ahk_exe Adobe Premiere Pro.exe")
!WheelUp::Send "!{WheelUp}"
!WheelDown:: Send "!{WheelDown}"
RButton:: Send "{s}"
MButton:: Send "{RButton}"
#+Left:: Send "{q}"
^w:: Send "{e}"
XButton1:: Send "{-}"
XButton2:: Send "{=}"
Joy4:: Send "{Space}"
Joy3:: Send "{w}"
Joy2:: Send "^{z}"
Joy5:: Send "{q}"
Joy6:: Send "{e}"
Joy1:: Send "{s}"
Joy7:: Send "{r}"
Joy8:: Send "+{Left 30}{Space}"
s:: Send "+{Left 30}{Space}"
;*

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

; YT Playback

!Numpad1::{
	ActiveID := WinGetID("A")
	WinSetTransparent 1, "ahk_exe brave.exe"
	WinActivate("ahk_exe brave.exe")
	Send "^{1}"
	Send "{j}"
	Send "!{a}"
	Sleep 100
	WinActivate ActiveID
	WinSetTransparent 255, "ahk_exe brave.exe"
}
!Numpad3::{
	ActiveID := WinGetID("A")
	WinSetTransparent 1, "ahk_exe brave.exe"
	WinActivate("ahk_exe brave.exe")
	Send "^{1}"
	Send "{l}"
	Send "!{a}"
	Sleep 100
	WinActivate ActiveID
	WinSetTransparent 255, "ahk_exe brave.exe"
}
!Numpad4::{
	ActiveID := WinGetID("A")
	WinSetTransparent 1, "ahk_exe brave.exe"
	WinActivate("ahk_exe brave.exe")
	Send "^{1}"
	Send "{j 2}"
	Send "!{a}"
	Sleep 100
	WinActivate ActiveID
	WinSetTransparent 255, "ahk_exe brave.exe"
}
!Numpad6::{
	ActiveID := WinGetID("A")
	WinSetTransparent 1, "ahk_exe brave.exe"
	WinActivate("ahk_exe brave.exe")
	Send "^{1}"
	Send "{l 2}"
	Send "!{a}"
	Sleep 100
	WinActivate ActiveID
	WinSetTransparent 255, "ahk_exe brave.exe"
}
!Numpad7::{
	ActiveID := WinGetID("A")
	WinSetTransparent 1, "ahk_exe brave.exe"
	WinActivate("ahk_exe brave.exe")
	Send "^{1}"
	Send "{j 4}"
	Send "!{a}"
	Sleep 100
	WinActivate ActiveID
	WinSetTransparent 255, "ahk_exe brave.exe"
}
!Numpad9::{
	ActiveID := WinGetID("A")
	WinSetTransparent 1, "ahk_exe brave.exe"
	WinActivate("ahk_exe brave.exe")
	Send "^{1}"
	Send "{l 4}"
	Send "!{a}"
	Sleep 100
	WinActivate ActiveID
	WinSetTransparent 255, "ahk_exe brave.exe"
}
!Numpad0::{
	ActiveID := WinGetID("A")
	WinSetTransparent 1, "ahk_exe brave.exe"
	WinActivate("ahk_exe brave.exe")
	Send "^{1}"
	Send "{0}"
	Send "!{a}"
	Sleep 100
	WinActivate ActiveID
	WinSetTransparent 255, "ahk_exe brave.exe"
}

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
global FX := ""
global FY := ""
RButton::
{
	if (FX == "" and FY == "") {
		if ImageSearch(&FoundX, &FoundY, 0, 0, 1920, 1080, "C:\Users\Kaizen Tech\Pictures\AHK ImageSearch\ae graph editor inactive.png") or ImageSearch(&FoundX, &FoundY, 0, 0, 1920, 1080, "C:\Users\Kaizen Tech\Pictures\AHK ImageSearch\ae graph editor active.png") {
		global FX := FoundX
		global FY := FoundY
		Tooltip "Value Stored"
		SetTimer () => ToolTip(), -1500
		}
		else return
	}
	MouseGetPos &PosX, &PosY
	if (PosX > FX+40 and PosY > FY){
		SystemCursor("Hide")
		MouseClick "left", PosX, FY+22
		Sleep 10
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
F7::
{
	if WinActive("ahk_exe brave.exe")
	{
		Send "{Media_Play_Pause}"
	}
	else
	{
		MouseGetPos ,, &Win
		WinSetTransparent 1, "ahk_exe brave.exe"
		WinActivate "ahk_exe brave.exe"
		Send "{Media_Play_Pause}"
		WinActivate Win
		WinSetTransparent 255, "ahk_exe brave.exe"
	}
}

!k:: Send "{Backspace}"
^!k:: Send "^{Backspace}"
^!Backspace:: Send "^{Backspace}"
!+e::
{
	Send "{Home}"
	Send "+{End}"
}

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

AppsKey & w::
{
	If GetKeyState("Shift")
	{
		Send "+{Up}"
	}
	Else
	{
		Send "{Up}"
	}
}
AppsKey & s::
{
	If GetKeyState("Shift")
	{
		Send "+{Down}"
	}
	Else
	{
		Send "{Down}"
	}
}
AppsKey & a::
{
	If GetKeyState("Shift")
	{
		Send "+{Left}"
	}
	Else
	{
		Send "{Left}"
	}
}
AppsKey & d::
{
	If GetKeyState("Shift")
	{
		Send "+{Right}"
	}
	Else
	{
		Send "{Right}"
	}
}
AppsKey & q::
{
	If GetKeyState("Shift")
	{
		Send "+{Home}"
	}
	Else
	{
		Send "{Home}"
	}
}
AppsKey & e::
{
	If GetKeyState("Shift")
	{
		Send "+{End}"
	}
	Else
	{
		Send "{End}"
	}
}

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
` up::{
    if KeyWait("``", "D T0.2") {
        ;WinActivate "ahk_exe explorer.exe"
        Run "explorer"
    }
	Else
	{
		Send "{``}"
	}
    KeyWait("``")
}

!+;:: SendInput FormatTime(A_Now, "dd-MM-yyyy")
^!+;:: SendInput FormatTime(A_Now, "hh:mm tt")

;/ Window Switchers

!NumpadEnter:: Run "C:\Program Files\AutoHotkey\UX\WindowSpy.ahk"
;!1:: WindowSwitcher("brave.exe", "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe")
!2:: WindowSwitcher("chrome.exe", "chrome")
!1:: WindowSwitcher("AfterFX.exe", "C:\Program Files\Adobe\Adobe After Effects 2023\Support Files\AfterFX.exe")
!3:: WindowSwitcher("Adobe Premiere Pro.exe", "C:\Program Files\Adobe\Adobe Premiere Pro 2023\Adobe Premiere Pro.exe")
!5:: WindowSwitcher("Photoshop.exe", "C:\Program Files\Adobe\Adobe Photoshop 2023\Photoshop.exe")
!6:: WindowSwitcher("Adobe Audition.exe", "C:\Program Files\Adobe\Adobe Audition 2023\Adobe Audition.exe")

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
#Hotif
Emoji(name)
{
	Send "{LWin down}{.}{LWin up}"
	Sleep 200
	Send name
	Sleep 200
	Send "{Enter}"
	Sleep 100
	WinClose "ahk_class ApplicationFrameWindow"
}
^+1:: SendText "☭"
^+2:: SendText "👀"
^+3:: SendText "🙂"
^+4:: SendText "🤤"
^+5:: SendText "☕"
^+6:: SendText "🗿"
;*

/* !Tab::
{
	Send "!{Tab}"
	Send "{Ctrl down}{Alt down}{v}{Alt up}{Ctrl up}"
}
 */

;/ FL Studio
#Hotif WinActive("ahk_exe FL64.exe")
+WheelUp:: Send "{WheelLeft}"
+WheelDown:: Send "{WheelRight}"
!+WheelUp:: Send "+{WheelUp}"
!+WheelDown:: Send "+{WheelDown}"
XButton1::
{
	MouseGetPos &PosX, &PosY
	if (PosX > 250 and PosY > 80){
		SystemCursor("Hide")
		MouseClick "left", PosX, 140
		MouseMove PosX, PosY, 0
		SystemCursor("Show")
	}
	else Send "{RButton}"
}
;*

;/ Browsers
#Hotif WinActive("ahk_exe chrome.exe")

^+n::{
	Send "^+{n}"
	;Sleep 50
	SendText "google.com"
	Send "{Enter}"
}
^!+n::{
	Send "^+{n}"
	;Sleep 50
	SendText "youtube.com"
	Send "{Enter}"
}
!t::
{
	Send "^{t}"
	Sleep 100
	SendText "https://translate.google.com/"
	Send "{Enter}"
}

RButton & WheelUp::Send "{WheelUp 4}"
RButton & WheelDown:: Send "{WheelDown 4}"
XButton1 & WheelUp:: Send "{WheelUp 8}"
XButton1 & WheelDown:: Send "{WheelDown 8}"
XButton2 & WheelUp:: Send "{WheelUp 16}"
XButton2 & WheelDown:: Send "{WheelDown 16}"
MButton & RButton:: Send "+{MButton}"
MButton:: Send "{MButton}"
RButton:: Send "{RButton}"
XButton1:: Send "{XButton1}"
XButton2:: Send "{XButton2}"
RButton & XButton2:: Send "^{Tab}"
RButton & XButton1:: Send "^+{Tab}"
MButton & XButton1:: Send "^{w}"

#Hotif WinActive("ahk_exe brave.exe")
^+n::{
	Send "^+{n}"
	;Sleep 50
	SendText "google.com"
	Send "{Enter}"
}
^!+n::{
	Send "^+{n}"
	;Sleep 50
	SendText "youtube.com"
	Send "{Enter}"
}
!t::
{
	Send "^{t}"
	Sleep 100
	SendText "https://translate.google.com/"
	Send "{Enter}"
}
RButton & WheelUp::Send "{WheelUp 4}"
RButton & WheelDown:: Send "{WheelDown 4}"
XButton1 & WheelUp:: Send "{WheelUp 8}"
XButton1 & WheelDown:: Send "{WheelDown 8}"
XButton2 & WheelUp:: Send "{WheelUp 16}"
XButton2 & WheelDown:: Send "{WheelDown 16}"
MButton & RButton:: Send "+{MButton}"
MButton:: Send "{MButton}"
RButton:: Send "{RButton}"
XButton1:: Send "{XButton1}"
XButton2:: Send "{XButton2}"
RButton & XButton2:: Send "^{Tab}"
RButton & XButton1:: Send "^+{Tab}"
MButton & XButton1:: Send "^{w}"
RButton & LButton::
{
	Send "{RButton}"
	Sleep 50
	Send "{Down 4}"
	Send "{Enter}"
}
;*
