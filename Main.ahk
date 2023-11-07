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
	if ImageSearch(&FoundX, &FoundY, 0, 0, 1920, 1049, "C:\Users\Kaizen Tech\Pictures\AHK ImageSearch\discord close.png"){
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
	;if ImageSearch(&FoundX, &FoundY, 260, 0, 325, 30, "C:\Users\Kaizen Tech\Pictures\AHK ImageSearch\ae text tool active.png"){
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
	Send "C:\Users\Kaizen Tech\Documents\AE Projects\Zen Sports"
	Send "{Enter}"
	MouseClick "left", 870, 405
	Send "^{v}"
	Sleep 100
	MouseMove 780, 473
}
;zoom-in hotkeys start

/* !Numpad1:: AeImageZoomAnc(1235, 226, 1050, 300)
AeImageZoomAnc(cx, cy, rx, ry)
{
	Send "^!{x}"
	Sleep 50
	Send "^!{a}"
	Sleep 50
	Send "{q}"
	Sleep 50
	Send "{s}"
	Sleep 50
	Send "{y}"
	g1 := cx
	var1 := g1
	g2 := cy
	var2 := g2
	g3 := rx
	var3 := g3
	g4 := ry
	var4 := g4
	SendEvent "{Click}" var1 var2 "{Down}"
	SendEvent "{Click}" var3 var4 "{UP}"
	Sleep 300
	Send "!+{g}"
	Sleep 100
	MouseMove 1030, 460
	Send "{v}"
	ToolTip "Waiting for {w}"
	KeyWait "w", "D"
	ToolTip
	Send "^+{NumpadAdd 3}"
} */

!Numpad1::{
	Send "^!{x}"
	Sleep 50
	Send "^!{a}"
	Sleep 50
	Send "{q}"
	Sleep 50
	Send "{s}"
	Sleep 50
	Send "{y}"
	SendEvent "{Click 1235 226 Down}{Click 1050 300 UP}"
	Sleep 300
	Send "!+{g}"
	Sleep 100
	MouseMove 1030, 460
	Send "{v}"
	ToolTip "Waiting for {w}"
	KeyWait "w", "D"
	ToolTip
	Send "^+{NumpadAdd 3}"
}
!Numpad2::{
	Send "^!{x}"
	Sleep 50
	Send "^!{a}"
	Sleep 50
	Send "{q}"
	Sleep 50
	Send "{s}"
	Sleep 50
	Send "{y}"
	SendEvent "{Click 1235 226 Down}{Click 1235 320 UP}"
	Sleep 300
	;if ImageSearch(&skfX, &skfY, 0, 405, 280, 720, "C:\Users\Kaizen Tech\Pictures\AHK ImageSearch\ae layer no 2.png"){
	;	MouseClick "left", skfX+23, skfY+23
	;}
	Send "!+{g}"
	Sleep 100
	MouseMove 1030, 460
	ToolTip "Waiting for {w}"
	KeyWait "w", "D"
	ToolTip
	Send "^+{NumpadAdd 3}"
}
!Numpad3::{
	Send "^!{x}"
	Sleep 50
	Send "^!{a}"
	Sleep 50
	Send "{q}"
	Sleep 50
	Send "{s}"
	Sleep 50
	Send "{y}"
	SendEvent "{Click 1235 226 Down}{Click 1380 300 UP}"
	Sleep 300
	;if ImageSearch(&skfX, &skfY, 0, 405, 280, 720, "C:\Users\Kaizen Tech\Pictures\AHK ImageSearch\ae layer no 2.png"){
	;	MouseClick "left", skfX+23, skfY+23
	;}
	Send "!+{g}"
	Sleep 100
	MouseMove 1030, 460
	Send "{v}"
	ToolTip "Waiting for {w}"
	KeyWait "w", "D"
	ToolTip
	Send "^+{NumpadAdd 3}"
}
!Numpad4::{
	Send "^!{x}"
	Sleep 50
	Send "^!{a}"
	Sleep 50
	Send "{q}"
	Sleep 50
	Send "{s}"
	Sleep 50
	Send "{y}"
	SendEvent "{Click 1235 226 Down}{Click 1080 226 UP}"
	Sleep 300
	;if ImageSearch(&skfX, &skfY, 0, 405, 280, 720, "C:\Users\Kaizen Tech\Pictures\AHK ImageSearch\ae layer no 2.png"){
	;	MouseClick "left", skfX+23, skfY+23
	;}
	Send "!+{g}"
	Sleep 100
	MouseMove 1030, 460
	Send "{v}"
	ToolTip "Waiting for {w}"
	KeyWait "w", "D"
	ToolTip
	Send "^+{NumpadAdd 3}"
}
!Numpad5::{
	Send "^!{x}"
	Sleep 50
	Send "^!{a}"
	Sleep 50
	Send "{q}"
	Sleep 100
	Send "{s}"
	Sleep 300
	;if ImageSearch(&skfX, &skfY, 0, 405, 280, 720, "C:\Users\Kaizen Tech\Pictures\AHK ImageSearch\ae layer no 2.png"){
	;	MouseClick "left", skfX+23, skfY+23
	;}
	Send "!+{g}"
	Sleep 100
	MouseMove 1030, 460
	ToolTip "Waiting for {w}"
	KeyWait "w", "D"
	ToolTip
	Send "^+{NumpadAdd 3}"
}
!Numpad6::{
	Send "^!{x}"
	Sleep 50
	Send "^!{a}"
	Sleep 50
	Send "{q}"
	Sleep 50
	Send "{s}"
	Sleep 50
	Send "{y}"
	SendEvent "{Click 1235 226 Down}{Click 1400 226 UP}"
	Sleep 300
	;if ImageSearch(&skfX, &skfY, 0, 405, 280, 720, "C:\Users\Kaizen Tech\Pictures\AHK ImageSearch\ae layer no 2.png"){
	;	MouseClick "left", skfX+23, skfY+23
	;}
	Send "!+{g}"
	Sleep 100
	MouseMove 1030, 460
	Send "{v}"
	ToolTip "Waiting for {w}"
	KeyWait "w", "D"
	ToolTip
	Send "^+{NumpadAdd 3}"
}
!Numpad7::{
	Send "^!{x}"
	Sleep 50
	Send "^!{a}"
	Sleep 50
	Send "{q}"
	Sleep 50
	Send "{s}"
	Sleep 50
	Send "{y}"
	SendEvent "{Click 1235 226 Down}{Click 1050 120 UP}"
	Sleep 300
	;if ImageSearch(&skfX, &skfY, 0, 405, 280, 720, "C:\Users\Kaizen Tech\Pictures\AHK ImageSearch\ae layer no 2.png"){
	;	MouseClick "left", skfX+23, skfY+23
	;}
	Send "!+{g}"
	Sleep 100
	MouseMove 1030, 460
	Send "{v}"
	ToolTip "Waiting for {w}"
	KeyWait "w", "D"
	ToolTip
	Send "^+{NumpadAdd 3}"
}
!Numpad8::{
	Send "^!{x}"
	Sleep 50
	Send "^!{a}"
	Sleep 50
	Send "{q}"
	Sleep 50
	Send "{s}"
	Sleep 50
	Send "{y}"
	SendEvent "{Click 1235 226 Down}{Click 1235 115 UP}"
	Sleep 300
	;if ImageSearch(&skfX, &skfY, 0, 405, 280, 720, "C:\Users\Kaizen Tech\Pictures\AHK ImageSearch\ae layer no 2.png"){
	;	MouseClick "left", skfX+23, skfY+23
	;}
	Send "!+{g}"
	Sleep 100
	Send "{v}"
	MouseMove 1030, 460
	ToolTip "Waiting for {w}"
	KeyWait "w", "D"
	ToolTip
	Send "^+{NumpadAdd 3}"
}
!Numpad9::{
	Send "^!{x}"
	Sleep 50
	Send "^!{a}"
	Sleep 50
	Send "{q}"
	Sleep 50
	Send "{s}"
	Sleep 50
	Send "{y}"
	SendEvent "{Click 1235 226 Down}{Click 1390 120 UP}"
	Sleep 300
	;if ImageSearch(&skfX, &skfY, 0, 405, 280, 720, "C:\Users\Kaizen Tech\Pictures\AHK ImageSearch\ae layer no 2.png"){
	;	MouseClick "left", skfX+23, skfY+23
	;}
	Send "!+{g}"
	Sleep 100
	Send "{v}"
	MouseMove 1030, 460
	ToolTip "Waiting for {w}"
	KeyWait "w", "D"
	ToolTip
	Send "^+{NumpadAdd 3}"
}
;zoom-in hotkeys end

^!Numpad5::{
	Send "^!{a}"
	Sleep 50
	Send "{q}"
	Sleep 100
	Send "^{d}"
	Sleep 300
	MouseClick "left", 850, 70
	Send "^{a}{Sleep 50}{Backspace}"
	SendText "drop shadow"
	Sleep 300
	MouseClick "left", 874, 155, 2
	Sleep 300
	MouseClick "left", 580, 115
	SendText "80"
	Sleep 50
	MouseClick "left", 580, 190
	SendText "20"
	Sleep 50
	MouseClick "left", 580, 206
	SendText "200"
	Send "{Enter}"
	Sleep 100
	Send "^{Down}"
	Sleep 50
	Send "^!{x}"
	Sleep 100
	MouseClick "left", 850, 70
	Send "^{a}{Sleep 50}{Backspace}"
	SendText "gaussian blur"
	Sleep 300
	MouseClick "left", 880, 105, 2
	Sleep 300
	MouseClick "left", 580, 97
	SendText "25"
	Send "{Enter}"
	Sleep 100
	Send "^{Up}"
	Sleep 50
	Send "{s}"
	Sleep 100
	;if ImageSearch(&skfX, &skfY, 0, 405, 280, 720, "C:\Users\Kaizen Tech\Pictures\AHK ImageSearch\ae layer no 2.png"){
	;	MouseClick "left", skfX+23, skfY+23
	;}
	Send "!+{g}"
	Sleep 100
	MouseMove 1030, 460
	Send "^+{NumpadSub}"
	Sleep 100
	Send "^+{Down}"
	Sleep 100
	ToolTip "Waiting for {w}"
	KeyWait "w", "D"
	ToolTip
	Send "^+{NumpadAdd 3}"
}
;position hotkeys start
!Numpad0::{
	MouseGetPos &Xpos, &Ypos
	Send "^!{x}"
	Sleep 50
	Send "^!{a}"
	Sleep 50
	Send "{q}"
	Sleep 50
	Send "+{d 2}"
	Sleep 50
	MouseClick "left", 1520, 87
	Sleep 50
	MouseClick "left", 1622, 91
	Sleep 50
	MouseMove Xpos, YPos
	Send "+{Up}+{Left}"
	Sleep 50
	Send "!+{p}"
	ToolTip "Waiting for {w}"
	KeyWait "w", "D"
	ToolTip
	MouseGetPos &Xpos, &Ypos
	Sleep 50
	MouseClick "left", 1591, 88
	Sleep 50
	Send "+{Right 2}"
	MouseMove Xpos, YPos
}
!NumpadDot::{
	MouseGetPos &Xpos, &Ypos
	Send "^!{x}"
	Sleep 50
	Send "^!{a}"
	Sleep 50
	Send "{q}"
	Sleep 50
	Send "+{d}"
	Sleep 50
	MouseClick "left", 1625, 87
	Sleep 50
	MouseMove Xpos, Ypos
	Send "{Up 2}"
	Sleep 50
	Send "!+{p}"
	ToolTip "Waiting for {w}"
	KeyWait "w", "D"
	ToolTip
	MouseGetPos &Xpos, &Ypos
	Sleep 50
	MouseClick "left", 1691, 92
	Sleep 50
	Send "+{Down}"
	Sleep 50
	MouseMove Xpos, Ypos
}
;position hotkeys end
;*


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

^!+\::{
	FillDates(&date)
}
FillDates(&date)
{
	i := 1
	while(i < 32)
	{
		MouseClick "left", 226, 488, 2
		Sleep 500
		if(i < 10)
		{
			SendText "0"
		}
		Send i
		Sleep 100
		SendInput FormatTime(A_Now, "-MM-yyyy")
		Sleep 300
		Send "{Alt down}{Down}{Alt up}"
		i++
		Sleep 300
	}
}
F1:: Run "C:\Users\Kaizen Tech\Documents"
F3:: Run "C:\Users\Kaizen Tech\Documents\Script Voices\Zen Sports"
F4:: Run "C:\Users\Kaizen Tech\Videos\Zen Sports"
F8:: Run "C:\Users\Kaizen Tech\Documents\Contents\Zen Sports"
;F9:: Run "C:\Users\Kaizen Tech\Documents\Photoshop"
;F10:: Run "C:\Users\Kaizen Tech\Documents\Illustrator"

^+Insert::{
	Send "{n}"
	Sleep 200
	Send "{Home}"
	SendInput FormatTime(A_Now, "dd-MM-yyyy")
	SendInput " (Rana) "
	Sleep 100
	Send "{Shift down}{End}{Shift up}{Shift down}{Left 4}{Shift up}^c"
	Send "{Enter}"
	Sleep 300
	MouseMove 8, 1057
	Sleep 50
	Send "{a}"
	Sleep 500
	Send "{Down}"
	Send "{Enter}"
	WinWait "Save As"
	Sleep 100
	MouseMove 636, 22
	Sleep 100
	MouseClick
	SendText "C:\Users\Kaizen Tech\Downloads"
	Send "{Enter}"
	MouseMove 776, 460
	MouseClick
	Sleep 3000
	Send "!{6}"
	WinWait "Adobe Audition"
	Run "C:\Users\Kaizen Tech\Downloads\"
	WinWait "Downloads"
	Sleep 50
	WinMove 30, 50
	Send "^{r}"
	Sleep 300
	SendEvent "{Click 300 165 Down}{Click 1300 650 UP}"
	Sleep 300
	Send "!{6}"
	Sleep 300
	Send "^!+{j}"
	Sleep 500
	Send "{Enter}"
	Sleep 1000
	Send "^+{m}"
	Sleep 500
	Send "^{v}"
	Send "{Tab 3}{Enter}"
	WinWait "Save As"
	WinMove 8, 110
	MouseClick "left", 630, 20
	Sleep 100
	SendText "C:\Users\Kaizen Tech\Documents\Script Voices\Zen Sports\"
	Sleep 100
	Send "{Enter}"
	Sleep 300
	MouseClick "left", 780, 475
	Sleep 500
	Send "{Tab 4}"
	Sleep 100
	Send "{Enter}"
}
!Enter::{
	MouseClick "left", 822, 148
	Sleep 1000	
	MouseClick "left", 815, 215
	Sleep 500
	MouseClick "left", 470, 260
	Sleep 100
	MouseClick "left", 470, 330
}
^!Enter::{
	Send "{Enter}"
	Sleep 1000
	MouseClick "left", 413, 213
	Sleep 1000	
	MouseClick "left", 815, 215
	Sleep 300
	MouseClick "left", 470, 260
	Sleep 100
	MouseClick "left", 470, 330
}
!+/::{
	MouseMove 700, 120
	Sleep 300
	MouseClick
}
!/::{
	MouseClick "left", 705, 145
	Send "^{a}"
	Send "{Backspace}"
}
^!+c::{
	Send "^{2}"
	Sleep 100
	SendEvent "{Click 103 1020 Down}"
	Sleep 100
	SendEvent "{Click 1150 800 UP}"
}
;*

;/ Window Switchers

!NumpadEnter:: Run "C:\Program Files\AutoHotkey\UX\WindowSpy.ahk"

;!1:: WindowSwitcher("brave.exe", "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe")
!2:: WindowSwitcher("chrome.exe", "chrome")
;!1:: WindowSwitcher("AfterFX.exe", "C:\Program Files\Adobe\Adobe After Effects 2023\Support Files\AfterFX.exe")
!3:: WindowSwitcher("Adobe Premiere Pro.exe", "C:\Program Files\Adobe\Adobe Premiere Pro 2023\Adobe Premiere Pro.exe")
!5:: WindowSwitcher("Photoshop.exe", "C:\Program Files\Adobe\Adobe Photoshop 2023\Photoshop.exe")
!6:: WindowSwitcher("Adobe Audition.exe", "C:\Program Files\Adobe\Adobe Audition 2023\Adobe Audition.exe")
!F1:: WindowSwitcher("Discord.exe", "C:\Users\Kaizen Tech\AppData\Local\Discord\app-1.0.9016\Discord.exe")
!F2:: WindowSwitcher("Telegram.exe", "C:\Users\Kaizen Tech\AppData\Roaming\Telegram Desktop\Telegram.exe")
!F3:: WindowSwitcher("ClickUp.exe", "C:\Users\Kaizen Tech\AppData\Local\Programs\desktop\ClickUp.exe")
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

!e::{
	WinActivate "ahk_exe AfterFX.exe"
	dir_input := "C:\Users\Kaizen Tech\Documents\Contents\Zen Sports\উড়ছে সৌদির টেকা পাখি"
	if WinExist(dir_input){
		WinSetTransparent 1, dir_input
		WinActivate
	}
	else {
		Run dir_input
		WinWait dir_input
		WinMove 200, 150 
		WinSetTransparent 1, dir_input
	}
	Send "^{r}"
	SendEvent "{Click 226, 173 Down}"
	SendEvent "{Click 720, 720 Up}"
	WinSetTransparent 255, dir_input
}


/* a:: {
 Global b
 b := 3
 MsgBox b
}

c::MsgBox b ?? 'Not assigned' */

/*
!+m::
{
	while(1)
	{
		Run "C:\Users\Kaizen Tech\Desktop\Screen OFF.lnk"
		Sleep 500
	}
}
*/

/* !Tab::
{
	Send "!{Tab}"
	Send "{Ctrl down}{Alt down}{v}{Alt up}{Ctrl up}"
}
 */