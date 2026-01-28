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
    Run(
        'powershell.exe -NoProfile -WindowStyle Hidden -Command "Start-Sleep -Seconds 1; Add-Type -Assembly System.Windows.Forms; [System.Windows.Forms.Application]::SetSuspendState([System.Windows.Forms.PowerState]::Suspend, $false, $false)"'
    )
}


RShift & Left::SoundSetMute(-1)
Insert::Return
Ins::Return

NumLock::Return
^!NumLock::SetNumLockState(!GetKeyState("NumLock", "T"))

^Backspace::Send("{Delete}")



^!F12::{
    KeyWait("Ctrl")
    KeyWait("Alt")
    Sleep(100)
    SendMessage(0x112, 0xF170, 2, , "Program Manager")
}


^Space::{
    if WinExist("ahk_exe Everything.exe") {
        WinActivate
    } else {
        Run("C:\Program Files\Everything\Everything.exe")
    }
}


