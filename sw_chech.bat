@echo off

setlocal enabledelayedexpansion

set "software_list=Microsoft Office Adobe Reader Google Chrome Mozilla Firefox Bitdefender Packet Tracer PuTTY Python SPSS R RStudio SharpDevelop Code::Blocks Notepad++ WinRAR Dev-C++ MySQL Rapid Typing"

set "installed_software="
set "not_installed_software="

for %%s in (%software_list%) do (
    echo Checking if %%s is installed...
    set "found="
    if "%%s"=="Microsoft Office" (
        reg query "HKLM\SOFTWARE\Microsoft\Office" >nul 2>&1
    ) else (
        reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr /i /c:"%%s" >nul 2>&1
    )
    if errorlevel 1 (
        echo %%s is not installed.
        set "not_installed_software=!not_installed_software!%%s, "
    ) else (
        echo %%s is installed.
        set "found=1"
        set "installed_software=!installed_software!%%s, "
    )
)

echo.
echo Installed Software: %installed_software:~0,-2%
echo.
echo Not Installed Software: %not_installed_software:~0,-2%
echo.

pause
