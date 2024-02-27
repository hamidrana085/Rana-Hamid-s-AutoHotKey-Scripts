

; Using a Controller as a Mouse
; https://www.autohotkey.com
; This script converts a controller (gamepad, joystick, etc.) into a three-button
; mouse. It allows each button to drag just like a mouse button and it uses
; virtually no CPU time. Also, it will move the cursor faster depending on how far
; you push the controller from center. You can personalize various settings at the
; top of the script.
;
; Note: For Xbox controller 2013 and newer (anything newer than the Xbox 360
; controller), this script will only work if a window it owns is active,
; such as a message box, GUI, or the script's main window.

; Increase the following value to make the mouse cursor move faster:
ContMultiplier := 0.10

; Decrease the following value to require less controller displacement-from-center
; to start moving the mouse.  However, you may need to calibrate your controller
; -- ensuring it's properly centered -- to avoid cursor drift. A perfectly tight
; and centered controller could use a value of 1:
ContThreshold := 3

; Change the following to true to invert the Y-axis, which causes the mouse to
; move vertically in the direction opposite the stick:
InvertYAxis := false

; Change these values to use controller button numbers other than 1, 2, and 3 for
; the left, right, and middle mouse buttons.  Available numbers are 1 through 32.
; Use the Controller Test Script to find out your controller's numbers more easily.
ButtonLeft := 1
ButtonRight := 3
ButtonMiddle := 2
ButtonY := 4
ButtonBackward := 5
ButtonForward := 6
LsClick := 9
RsClick := 10

; If your controller has a POV control, you can use it as a mouse wheel.  The
; following value is the number of milliseconds between turns of the wheel.
; Decrease it to have the wheel turn faster:
WheelDelay := 150
WheelDelay2 := 200

; If your system has more than one controller, increase this value to use a
; controller other than the first:
ControllerNumber := 1

; END OF CONFIG SECTION -- Don't change anything below this point unless you want
; to alter the basic nature of the script.


ControllerPrefix := ControllerNumber "Joy"
Hotkey ControllerPrefix . ButtonLeft, ClickButtonLeft
Hotkey ControllerPrefix . ButtonRight, ClickButtonRight
Hotkey ControllerPrefix . ButtonMiddle, ClickButtonMiddle
Hotkey ControllerPrefix . ButtonBackward, ClickButtonBackward
Hotkey ControllerPrefix . ButtonForward, ClickButtonForward
Hotkey ControllerPrefix . ButtonY, ContDPIShift
Hotkey ControllerPrefix . LsClick, ContDPICycle
Hotkey ControllerPrefix . RsClick, CloseTab
;Hotkey ControllerPrefix . ButtonY, RippleDelete

; Calculate the axis displacements that are needed to start moving the cursor:
ContThresholdUpper := 50 + ContThreshold
ContThresholdLower := 50 - ContThreshold
if InvertYAxis
    YAxisMultiplier := -1
else
    YAxisMultiplier := 1

SetTimer WatchController, 10  ; Monitor the movement of the controller.
SetTimer WatchControllerR, 10
SetTimer WatchTriggers, 10

JoyInfo := GetKeyState(ControllerNumber "JoyInfo")
if InStr(JoyInfo, "P")  ; Controller has POV control, so use it as a mouse wheel.
   SetTimer DPadAss, WheelDelay

; WatchController quasi-thread beneath the wait-for-button-up thread, which would
; The functions below do not use KeyWait because that would sometimes trap the
; effectively prevent mouse-dragging with the controller.

 
ClickButtonLeft(*)
{
    SetMouseDelay -1  ; Makes movement smoother.
    MouseClick "Left",,, 1, 0, "D"  ; Hold down the left mouse button.
    SetTimer WaitForLeftButtonUp, 10
    
    WaitForLeftButtonUp()
    {
        if GetKeyState(A_ThisHotkey)
            return  ; The button is still, down, so keep waiting.
        ; Otherwise, the button has been released.
        SetTimer , 0
        SetMouseDelay -1  ; Makes movement smoother.
        MouseClick "Left",,, 1, 0, "U"  ; Release the mouse button.
    }
}

ClickButtonRight(*)
{
    SetMouseDelay -1  ; Makes movement smoother.
    MouseClick "Right",,, 1, 0, "D"  ; Hold down the right mouse button.
    SetTimer WaitForRightButtonUp, 10
    
    WaitForRightButtonUp()
    {
        if GetKeyState(A_ThisHotkey)
            return  ; The button is still, down, so keep waiting.
        ; Otherwise, the button has been released.
        SetTimer , 0
        MouseClick "Right",,, 1, 0, "U"  ; Release the mouse button.
    }
}

ClickButtonMiddle(*)
{
    SetMouseDelay -1  ; Makes movement smoother.
    MouseClick "Middle",,, 1, 0, "D"  ; Hold down the right mouse button.
    SetTimer WaitForMiddleButtonUp, 10
    
    WaitForMiddleButtonUp()
    {
        if GetKeyState(A_ThisHotkey)
            return  ; The button is still, down, so keep waiting.
        ; Otherwise, the button has been released.
        SetTimer , 0
        MouseClick "Middle",,, 1, 0, "U"  ; Release the mouse button.
    }

}
ContDPIShift(*)
{
	global
	if ContMultiplier != 0.10
	{
		ContMultiplier := 0.10
		ToolTip "0.10"
		Sleep 500
		ToolTip
	}
	else
	{
		ContDPICycle
	}
}
ContDPICycle(*)
{
	global
	if ContMultiplier = 0.10
	{
		ContMultiplier := 0.30
		ToolTip "0.30"
		Sleep 500
		ToolTip
	}
	else if ContMultiplier = 0.30
	{
		ContMultiplier := 0.05
		ToolTip "0.05"
		Sleep 500
		ToolTip
	}
	else if ContMultiplier = 0.05
	{
		ContMultiplier := 0.10
		ToolTip "0.10"
		Sleep 500
		ToolTip
	}
	
}

CloseTab(*)
{
	Send "^{w}"
}

ClickButtonBackward(*)
{
    MouseClick "X1",,, 1, 0, "D"  ; Hold down the right mouse button.
    SetMouseDelay -1  ; Makes movement smoother.
    SetTimer WaitForBackwardButtonUp, 10
    
    WaitForBackwardButtonUp()
    {
        if GetKeyState(A_ThisHotkey)
            return  ; The button is still, down, so keep waiting.
        ; Otherwise, the button has been released.
        SetTimer , 0
        MouseClick "X1",,, 1, 0, "U"  ; Release the mouse button.
    }

}
ClickButtonForward(*)
{
    SetMouseDelay -1  ; Makes movement smoother.
    MouseClick "X2",,, 1, 0, "D"  ; Hold down the right mouse button.
    SetTimer WaitForForwardButtonUp, 10
    
    WaitForForwardButtonUp()
    {
        if GetKeyState(A_ThisHotkey)
            return  ; The button is still, down, so keep waiting.
        ; Otherwise, the button has been released.
        SetTimer , 0
        MouseClick "X2",,, 1, 0, "U"  ; Release the mouse button.
    }

}

WatchController()
{
    global
    MouseNeedsToBeMoved := false  ; Set default.
    JoyX := GetKeyState(ControllerNumber "JoyX")
    JoyY := GetKeyState(ControllerNumber "JoyY")
    if JoyX > ContThresholdUpper
    {
        MouseNeedsToBeMoved := true
        DeltaX := Round(JoyX - ContThresholdUpper)
    }
    else if JoyX < ContThresholdLower
    {
        MouseNeedsToBeMoved := true
        DeltaX := Round(JoyX - ContThresholdLower)
    }
    else
        DeltaX := 0
    if JoyY > ContThresholdUpper
    {
        MouseNeedsToBeMoved := true
        DeltaY := Round(JoyY - ContThresholdUpper)
    }
    else if JoyY < ContThresholdLower
    {
        MouseNeedsToBeMoved := true
        DeltaY := Round(JoyY - ContThresholdLower)
    }
    else
        DeltaY := 0
    if MouseNeedsToBeMoved
    {
        SetMouseDelay -1  ; Makes movement smoother.
        MouseMove DeltaX * ContMultiplier, DeltaY * ContMultiplier * YAxisMultiplier, 0, "R"
    }
}
WatchControllerR()
{
    global
	SetTimer WatchControllerR, WheelDelay2
    JoyR := GetKeyState(ControllerNumber "JoyR")
    JoyU := GetKeyState(ControllerNumber "JoyU")
    if JoyR > ContThresholdUpper
    {
		Send "{WheelDown}"
    }
    if JoyR < ContThresholdLower
    {
        Send "{WheelUp}"
    }
	if JoyU < ContThresholdLower-10
    {
        Send "{=}"
    }
	if JoyU > ContThresholdUpper+10
    {
        Send "{-}"
    }
}
WatchTriggers()
{
	global
	trval := 0
	JoyZ := GetKeyState(ControllerNumber "JoyZ")
	if(Joyz > ContThresholdUpper and trval != 1)
	{
		Send "^+{Tab}"
		Sleep 500
		trval := 1
	}
	else if(JoyZ < ContThresholdLower and trval != 1)
	{
		Send "^{Tab}"
		Sleep 500
		trval := 1
	}
}

MouseWheel()
{
    JoyPOV := GetKeyState(ControllerNumber "JoyPOV")
    if JoyPOV = -1  ; No angle.
        return
    if JoyPOV = 0  ; Forward
        Send "{WheelUp 2}"
    else if JoyPOV = 18000  ; Back
        Send "{WheelDown 2}"
	HotIfWinActive "ahk_class Premiere Pro"
	if JoyPOV = 9000  ; Right
        Send "{Down}"
    else if JoyPOV = 27000  ; Left
        Send "{Up}"
}

DPadAss()
{
    global
    JoyPOV := GetKeyState(ControllerNumber "JoyPOV")
    if JoyPOV = -1  ; No angle.
        return
    if (JoyPOV = 0)  ; Up
        Send "{Up}"
    if (JoyPOV = 18000)  ; Down
        Send "{Down}"
	if (JoyPOV = 27000)  ; Left
        Send "{Left}"
	if (JoyPOV = 9000)  ; Right
        Send "{Right}"
}
;premiere pro

ControllerNumber := 1
ControllerPrefix := ControllerNumber "Joy"
WheelDelay := 150


JoyInfo := GetKeyState(ControllerNumber "JoyInfo")
if InStr(JoyInfo, "P")  ; Controller has POV control, so use it as a mouse wheel.
    SetTimer DPadAss, WheelDelay


SetTimer WatchAxis, 5
WatchAxis()
{
	static KeyToHoldDown := ""
    JoyZ := GetKeyState("JoyZ")  ; Get position of X axis.
    KeyToHoldDownPrev := KeyToHoldDown  ; Prev now holds the key that was down before (if any).

    if JoyZ > 50
        KeyToHoldDown := "Left"
    else if JoyZ < 49
        KeyToHoldDown := "Right"
    else
        KeyToHoldDown := ""

    if KeyToHoldDown = KeyToHoldDownPrev  ; The correct key is already down (or no key is needed).
    {
    if KeyToHoldDown
        Send "{" KeyToHoldDown " down}"  ; Auto-repeat the keystroke.
    return
}

    ; Otherwise, release the previous key and press down the new key:
    SetKeyDelay -1  ; Avoid delays between keystrokes.
    if KeyToHoldDownPrev   ; There is a previous key to release.
        Send "{" KeyToHoldDownPrev " up}"  ; Release it.
    if KeyToHoldDown   ; There is a key to press down.
        Send "{" KeyToHoldDown " down}"  ; Press it down.
}

/* RippleDelete(*)
{
	Send "{d}"
}
 */
/*
; Controller Test Script
; https://www.autohotkey.com
; This script helps determine the button numbers and other attributes
; of your controller (gamepad, joystick, etc.). It might also reveal
; if your controller is in need of calibration; that is, whether the
; range of motion of each of its axes is from 0 to 100 percent as it
; should be. If calibration is needed, use the operating system's
; control panel or the software that came with your controller.

; May 24, 2023: Replaced ToolTip and MsgBox with GUI.
; April 14, 2023: Renamed 'joystick' to 'controller'.
; July 16, 2016: Revised code for AHK v2 compatibility
; July 6, 2005 : Added auto-detection of joystick number.
; May 8, 2005  : Fixed: JoyAxes is no longer queried as a means of
; detecting whether the joystick is connected.  Some joysticks are
; gamepads and don't have even a single axis.

; If you want to unconditionally use a specific controller number, change
; the following value from 0 to the number of the controller (1-16).
; A value of 0 causes the controller number to be auto-detected:
ControllerNumber := 0

; END OF CONFIG SECTION. Do not make changes below this point unless
; you wish to alter the basic functionality of the script.

G := Gui("+AlwaysOnTop", "Controller Test Script")
G.Add("Text", "w300", "Note: For Xbox controller 2013 and newer (anything newer than the Xbox 360 controller), this script can only detect controller events if a window it owns is active (like this one).")
E := G.Add("Edit", "w300 h300 +ReadOnly")
G.Show()

; Auto-detect the controller number if called for:
if ControllerNumber <= 0
{
    Loop 16  ; Query each controller number to find out which ones exist.
    {
        if GetKeyState(A_Index "JoyName")
        {
            ControllerNumber := A_Index
            break
        }
    }
    if ControllerNumber <= 0
    {
        E.Value := "The system does not appear to have any controllers."
        return
    }
}

#SingleInstance
cont_buttons := GetKeyState(ControllerNumber "JoyButtons")
cont_name := GetKeyState(ControllerNumber "JoyName")
cont_info := GetKeyState(ControllerNumber "JoyInfo")
Loop
{
    buttons_down := ""
    Loop cont_buttons
    {
        if GetKeyState(ControllerNumber "Joy" A_Index)
            buttons_down .= " " A_Index
    }
    axis_info := "X" Round(GetKeyState(ControllerNumber "JoyX"))
    axis_info .= "  Y" Round(GetKeyState(ControllerNumber "JoyY"))
    if InStr(cont_info, "Z")
        axis_info .= "  Z" Round(GetKeyState(ControllerNumber "JoyZ"))
    if InStr(cont_info, "R")
        axis_info .= "  R" Round(GetKeyState(ControllerNumber "JoyR"))
    if InStr(cont_info, "U")
        axis_info .= "  U" Round(GetKeyState(ControllerNumber "JoyU"))
    if InStr(cont_info, "V")
        axis_info .= "  V" Round(GetKeyState(ControllerNumber "JoyV"))
    if InStr(cont_info, "P")
        axis_info .= "  POV" Round(GetKeyState(ControllerNumber "JoyPOV"))
    E.Value := cont_name " (#" ControllerNumber "):`n" axis_info "`nButtons Down: " buttons_down
    Sleep 100
}
return
*/
