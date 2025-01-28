#SingleInstance force
^!+q:: Reload
^!+e:: Edit
^!+p:: ExitApp

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

~LAlt::SendInput "{Blind}{sc0E9}"
~RAlt::SendInput "{Blind}{sc0E9}"

ScrollLock:: Send "{Volume_Down 2}"
Pause:: Send "{Volume_Up 2}"
F7:: Send "{Media_Play_Pause}"

!k:: Send "{Backspace}"
^!k:: Send "^{Backspace}"
!+k:: Send "{Delete}"
!+e::
{
	Send "{Home}"
	Send "+{End}"
}

CapsLock:: Send "{Ctrl down}{Alt down}{v}{Alt up}{Ctrl up}"
!CapsLock:: Send "{Ctrl down}{Alt down}{b}{Alt up}{Ctrl up}"

!+f:: Send "!{F4}"

!+2:: SendText "@gmail.com"
!+3:: SendText "lumetri color"
!+4:: SendText "(13s, 1080p30)"

^+1:: SendText "0F9D58"
^+2:: SendText "F4B400"
^+3:: SendText "DB4437"
^+4:: SendText "4285F4"

!+;:: SendInput FormatTime(A_Now, "dd-MM-yyyy")
^!+;:: SendInput FormatTime(A_Now, "hh:mm tt")

^!NumpadDiv:: Run "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
^!+l:: Run "https://www.autohotkey.com/docs/v2/KeyList.htm"

^!+d::
{
	Run "C:\Program Files\APKCombo VPN\apkcombovpn.exe"
	WinWaitActive "ahk_exe apkcombovpn.exe"
	Sleep 100
	MouseClick "left", 390, 227
	Sleep 100
	WinClose "ahk_exe apkcombovpn.exe"
}

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

>!w::
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
>!s::
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
>!a::
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
>!d::
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
>!+q:: Send "+{Home}"
>!+e:: Send "+{End}"
>!q::
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
>!e::
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
	if WinExist("ahk_exe" ahke)
	WinActivate
	else Run lpath
}	
;*






#HotIf WinActive("ahk_exe Adobe Premiere Pro.exe")

RButton:: Send "{s}"
MButton:: Send "{RButton}"
XButton1:: Send "{-}"
XButton2:: Send "{=}"
Joy4:: Send "{Space}"
Joy3:: Send "{w}"
Joy2:: Send "^{z}"
Joy5:: Send "{q}"
Joy6:: Send "{e}"
Joy1:: Send "{s}"
Joy7:: Send "{r}"
!f::
Joy8:: Send "+{Left 10}{Space}"
!a:: Send "{Left}"
!d:: Send "{Right}"
!w:: Send "{Up}"
!s:: Send "{Down}"
!+a:: Send "!{Left}"
!+d:: Send "!{Right}"
!+w:: Send "!{Up}"
!+s:: Send "!{Down}"
!v::
{
	MouseGetPos &Xpos, &Ypos
	SystemCursor("Hide")
	if ImageSearch(&FoundX, &FoundY, 0, 0, 1920, 1049, "C:\Users\Rana Hamid\Pictures\AHK ImageSearch\premiere pro selection tool inactive.png")
	{
		MouseClick "left", FoundX+5, FoundY+5
	}
	MouseMove Xpos, Ypos
	SystemCursor("Show")
}

;*

;/ After Effects

#Hotif WinActive("ahk_exe AfterFX.exe")

global FX := ""
global FY := ""
RButton::
{
	if (FX == "" and FY == "") {
		if ImageSearch(&FoundX, &FoundY, 0, 0, 1920, 1080, "C:\Users\Rana Hamid\Pictures\AHK ImageSearch\ae graph editor inactive.png") or ImageSearch(&FoundX, &FoundY, 0, 0, 1920, 1080, "C:\Users\Rana Hamid\Pictures\AHK ImageSearch\ae graph editor active.png") {
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
	SystemCursor("Hide")
	MouseGetPos &Xpos, &Ypos
	MouseClick "left", 50, 8
	MouseMove Xpos, Ypos
	SystemCursor("Show")
}
MButton::
{
	if !(FX == "") {
		MouseGetPos &PosX, &PosY
		Send "{RButton}"
	}
	else
	{
		Send "{MButton}"
	}
}
^f:: Send "f"
!s:: Send "p"
!a:: Send "^{Left}"
!d:: Send "^{Right}"
!+d:: Send "^+{Right}"
!+a:: Send "^+{Left}"
!z:: Send "{l 2}"
XButton1:: Send "{-}"
XButton2:: Send "{=}"

!+2::
{
	Send "^!{d}"
	SendText "path"
}
!+3::
{
	Send "^!{d}"
	SendText "group"
}
!+4::
{
	Send "^!{d}"
	SendText "start,end,offset"
}

#HotIf WinActive("ahk_exe Illustrator.exe")
!v::{
	SystemCursor("Hide")
	MouseGetPos &Xpos, &Ypos
	MouseClick "left", 19, 107
	MouseMove Xpos, Ypos
	SystemCursor("Show")
}

#HotIf WinActive("ahk_exe Photoshop.exe")
!v::{
	SystemCursor("Hide")
	MouseGetPos &Xpos, &Ypos
	MouseClick "left", 19, 107
	MouseMove Xpos, Ypos
	SystemCursor("Show")
}

#Hotif WinActive("ahk_exe Code.exe")
^1:: SendText("console.log(")
+Space::
{
	Send "^{s}"
	Send "^!{n}"
}
^Space::
{
	Send "^!+{m}"
}
^+Space::
{
	Send "^{k}"
	Send "{e}"
	Send "{Enter}"
}
XButton1:: Send "{-}"
XButton2:: Send "{=}"
!+w:: Send "+{F3}"

!z::
AppsKey & z::
{
	WinActivate "ahk_exe chrome.exe"
	Send "{Left}"
	Sleep 50
	KeyWait ("RButton")
	WinActivate "ahk_exe Code.exe"
}
!c::
AppsKey & c::
RButton & WheelDown::
{
	WinActivate "ahk_exe chrome.exe"
	Send "{Right}"
	Sleep 50
	KeyWait ("RButton")
	WinActivate "ahk_exe Code.exe"
}
RButton:: Send "{RButton}"

#HotIf WinActive("ahk_exe devenv.exe")
!z::
AppsKey & z::
RButton & WheelUp::
{
	WinActivate "ahk_exe chrome.exe"
	Send "{Left}"
	Sleep 50
	KeyWait ("RButton")
	WinActivate "ahk_exe devenv.exe"
	Send "^{F6}"
	Send "^{F7}"
}
!c::
AppsKey & c::
RButton & WheelDown::
{
	WinActivate "ahk_exe chrome.exe"
	Send "{Right}"
	Sleep 50
	KeyWait ("RButton")
	WinActivate "ahk_exe devenv.exe"
	Send "^{F6}"
	Send "^{F7}"
}
RButton:: Send "{RButton}"
;*

;/ Chrome and Brave
#Hotif WinActive("ahk_exe chrome.exe")
RButton & XButton2:: Send "^{Tab}"
RButton & XButton1:: Send "^+{Tab}"
RButton:: Send "{RButton}"
AppsKey & z::
RButton & WheelUp:: Send "{Left}"
AppsKey & c::
RButton & WheelDown:: Send "{Right}"

+Capslock::
{
	Send "{RButton}"
	Sleep 50
	Send "{Up 6}"
	Send "{Enter}"
}

^+n::
{
	Send "^+{n}"
	Sleep 50
	SendText "google.com/ "
	Send "{Enter}"
}
^!+n::
{
	Send "^+{n}"
	Sleep 50
	SendText "youtube.com/ "
	Send "{Enter}"
}
!+s::
{
	MouseGetPos &Px, &Py
	MouseClick "left", 1319, 820
	MouseMove Px, Py
}

!+z::
{
	MouseGetPos &Px, &Py
	MouseClick "left", 808, 202
	Sleep 100
	MouseClick "left", 947, 264
	MouseMove Px, Py
}
!+c::
{
	MouseGetPos &Px, &Py
	MouseClick "left", 808, 202
	Sleep 100
	MouseClick "left", 913, 357
	MouseMove Px, Py
}


;Brave
#Hotif WinActive("ahk_exe brave.exe")
^+n::{
	Send "^+{n}"
	Sleep 50
	SendText "google.com/ "
	Sleep 100
	Send "{Enter}"
}
^!+n::
{
	Send "^+{n}"
	Sleep 50
	SendText "youtube.com/ "
	Sleep 100
	Send "{Enter}"
}
MButton & RButton:: Send "+{MButton}"
MButton:: Send "{MButton}"

;*

;/ Discord
#Hotif WinActive("ahk_exe Discord.exe")
!+f::
{
	MouseGetPos &PosX, &PosY
	if ImageSearch(&FoundX, &FoundY, 0, 0, 1920, 1049, "C:\Users\Rana Hamid\Pictures\AHK ImageSearch\discord close.png")
	{
		MouseClick "left", FoundX+3, FoundY+3
	}
	MouseMove PosX, PosY
}
;*

#Hotif WinActive("ahk_exe Godot_v4.2.2-stable_win64.exe")
!z::
AppsKey & z::
RButton & WheelUp::
{
	WinActivate "ahk_exe chrome.exe"
	Send "{Left}"
	Sleep 50
	KeyWait ("RButton")
	WinActivate "ahk_exe Godot_v4.2.2-stable_win64.exe"
}
!c::
AppsKey & c::
RButton & WheelDown::
{
	WinActivate "ahk_exe chrome.exe"
	Send "{Right}"
	Sleep 50
	KeyWait ("RButton")
	WinActivate "ahk_exe Godot_v4.2.2-stable_win64.exe"
}
RButton:: Send "{RButton}"


#Hotif WinActive("ahk_exe blender.exe")

F7::
{
	WinActivate "ahk_exe chrome.exe"
	Sleep 50
	Send "{Media_Play_Pause}"
	WinActivate "ahk_exe blender.exe"
}


#Hotif WinActive("ahk_exe FL64.exe")

AppsKey & z::

{
	WinActivate "ahk_exe chrome.exe"
	Send "{Left}"
	Sleep 50
	KeyWait ("RButton")
	WinActivate "ahk_exe FL64.exe"
}
AppsKey & c::

{
	WinActivate "ahk_exe chrome.exe"
	Send "{Right}"
	Sleep 50
	KeyWait ("RButton")
	WinActivate "ahk_exe FL64.exe"
}

F7::
{
	WinActivate "ahk_exe chrome.exe"
	Sleep 50
	Send "{Media_Play_Pause}"
	WinActivate "ahk_exe FL64.exe"
}

