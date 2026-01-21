RShift::RShift  ; keep Right Shift behaving normally

; Volume Up
RShift & Up::{
    vol := SoundGetVolume()
    SoundSetVolume(Min(vol + 5, 100))
}

; Volume Down
RShift & Down::{
    vol := SoundGetVolume()
    SoundSetVolume(Max(vol - 5, 0))
}

; Ctrl + Alt + Esc = Sleep
^!Esc::{
    Run("rundll32.exe powrprof.dll,SetSuspendState 0,1,0")
}
; Mute Toggle
RShift & Left::SoundSetMute(-1)

; Ins Disable
Insert::Return
Ins::Return

; Ctrl + Alt + Num toggle for safety
NumLock::Return
^!NumLock::SetNumLockState(!GetKeyState("NumLock", "T"))

; Ctrl + Backspace delete
^Backspace::Send("{Delete}")

; Monitors off
^!F12::{
    KeyWait("Ctrl")
    KeyWait("Alt")
    Sleep(100)
    SendMessage(0x112, 0xF170, 2, , "Program Manager")
}
