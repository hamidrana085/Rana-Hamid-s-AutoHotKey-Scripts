#SingleInstance force

^+!w:: Reload
^!+r:: Edit

SetTimer WatchAxis, 5

WatchAxis()
{
    static KeyToHoldDown := ""
    JoyX := GetKeyState("JoyZ")  ; Get position of X axis.
    KeyToHoldDownPrev := KeyToHoldDown  ; Prev now holds the key that was down before (if any).

    if JoyX > 50
        KeyToHoldDown := "Left"
    else if JoyX < 49
        KeyToHoldDown := "Right"
    else
        KeyToHoldDown := ""

    if KeyToHoldDown = KeyToHoldDownPrev  ; The correct key is already down (or no key is needed).
        return  ; Do nothing.

    ; Otherwise, release the previous key and press down the new key:
    SetKeyDelay -1  ; Avoid delays between keystrokes.
    if KeyToHoldDownPrev   ; There is a previous key to release.
        Send "{" KeyToHoldDownPrev " up}"  ; Release it.
    if KeyToHoldDown   ; There is a key to press down.
        Send "{" KeyToHoldDown " down}"  ; Press it down.
}