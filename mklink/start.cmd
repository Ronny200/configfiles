@echo off
::创建配置目录
if not exist "%USERPROFILE%\.config" md "%USERPROFILE%\.config"

::获取当前系统版本信息
systeminfo | findstr "OS Name" > %TEMP%\osname.txt
FOR /F "usebackq delims=: tokens=2" %%i IN (%TEMP%\osname.txt) DO set vers=%%i

::复制单独配置文件到User目录下
copy "%~dp0\UserFolder\*" %USERPROFILE% /y

::Windows Terminal
echo %vers% | findstr "Windows 11" > nul
if %ERRORLEVEL% == 0 set apppath="%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
if exist %apppath% (
    rd /s /Q %apppath%)
mklink /j %apppath% "WindowsTerminal"

:: nvim
set apppath="%LOCALAPPDATA%\nvim"
if exist %apppath% (
    rd /s /Q %apppath%)
if exist "%LOCALAPPDATA%\nvim-data" (
		rd /s /Q "%LOCALAPPDATA%\nvim-data")
mklink /j %apppath% "nvim"

::PowerShell
set apppath="D:\Users\Ronny\Documents\PowerShell"
if exist %apppath% (
    rd /s /Q %apppath%)
mklink /j %apppath% "PowerShell"

::scoop, starship
set apppath="%USERPROFILE%\.config"
if exist %apppath% (
    rd /s /Q %apppath%)
mklink /j %apppath% ".config"

::flashdownload
set apppath="%USERPROFILE%\.flashdownload"
if exist %apppath% (
    rd /s /Q %apppath%)
mklink /j %apppath% ".flashdownload"

::picgo
set apppath="%USERPROFILE%\.picgo"
if exist %apppath% (
    rd /s /Q %apppath%)
mklink /j %apppath% ".picgo"

::pip
set apppath="%USERPROFILE%\.pip"
if exist %apppath% (
    rd /s /Q %apppath%)
mklink /j %apppath% ".pip"

::ssh
set apppath="%USERPROFILE%\.ssh"
if exist %apppath% (
    rd /s /Q %apppath%)
mklink /j %apppath% ".ssh"

::SwitchHosts
set apppath="%USERPROFILE%\.SwitchHosts"
if exist %apppath% (
    rd /s /Q %apppath%)
mklink /j %apppath% ".SwitchHosts"

:: Bandizip
Regedit -s "%~dp0\Bandizip\Bandizip Settings.reg"

::Scoop
set apppath="E:\Scoop\persist"
if exist %apppath% (
    rd /s /Q %apppath%)
mklink /j %apppath% "persist"

::Adobe Photoshop UXP
set apppath="C:\Users\Ronny\AppData\Roaming\Adobe\UXP"
if exist %apppath% (
    rd /s /Q %apppath%)
mklink /j %apppath% "Adobe\UXP"

::TTime
set apppath="C:\Users\Ronny\AppData\Roaming\time-translate\userDataConfig"
if exist %apppath% (
    rd /s /Q %apppath%)
mklink /j %apppath% "TTime"
