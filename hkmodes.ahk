#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include config.ahk
global g_Modes := Modes
global g_CurrentMode := StartingMode
global g_ModeSwitchModifier := ModeSwitchModifier
global g_HotkeyModifier := HotkeyModifier
global g_ModeSwitchNotificationWidth := ModeSwitchNotificationWidth
global g_ModeSwitchNotificationY := ModeSwitchNotificationY
global g_ModeSwitchNotificationX := ModeSwitchNotificationX
global g_ModeSwitchNotificationTimeout := ModeSwitchNotificationTimeout

HotkeyNoOp() {
}
Hotkey, %g_ModeSwitchModifier%, HotkeyNoOp
Hotkey, %g_ModeSwitchModifier%, HotkeyNoOp

InitializeModes()
ActivateHotkeysForMode(g_CurrentMode)
Return

InitializeModes() {
    for mode in g_Modes {
        Hotkey, %g_ModeSwitchModifier% & %mode%, SwitchMode
    }
}

ActivateHotkeysForMode(mode) {
    modeKeys := g_Modes[mode].Keys
    for key in modeKeys {
        Hotkey, %g_HotkeyModifier% & %key%, % modeKeys[key], On
    }
}

DeactivateHotkeysForMode(mode) {
    modeKeys := g_Modes[mode].Keys
    for key in modeKeys {
        Hotkey, %g_HotkeyModifier% & %key%, Off
    }
}

SwitchMode() {
    key := Trim(StrSplit(A_ThisHotkey, "&")[2])
    DeactivateHotkeysForMode(g_CurrentMode)
    g_CurrentMode := key
    ActivateHotkeysForMode(key)
    x := g_ModeSwitchNotificationX
    y := g_ModeSwitchNotificationY
    w := g_ModeSwitchNotificationWidth
    Progress, B x%x% y%y% w%w% zh0,, % g_Modes[key].Desc
    SetTimer, RemoveModeSwitchNotification, %g_ModeSwitchNotificationTimeout%
}

RemoveModeSwitchNotification() {
    SetTimer, RemoveModeSwitchNotification, Off
    Progress, Off
}
