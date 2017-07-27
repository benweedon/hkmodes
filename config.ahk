; ================================== CONFIG OPTIONS =================================

; The modifier keys for switching modes and using hotkeys within each mode.
ModeSwitchModifier := "ScrollLock"
HotkeyModifier := "Insert"

; The config options for the mode switch notification.
ModeSwitchNotificationWidth := 150
ModeSwitchNotificationX := (A_ScreenWidth // 2) - (ModeSwitchNotificationWidth // 2)
ModeSwitchNotificationY := 50
ModeSwitchNotificationTimeout := 700

; ====================================== MODES ======================================

; Set the modes and associated hotkeys.
Modes := {} ; DO NOT REMOVE

; Set up a mode activated with hotkey a, and containing a command for hotkey a
Modes.a := {}
Modes.a.Desc := "Normal Mode"
Modes.a.Keys := {"m": "DisplayMessage"}

; The mode the script starts on.
StartingMode := "a"

; =================================== FUNCTIONS =====================================

DisplayMessage() {
    MsgBox Hi!
}
