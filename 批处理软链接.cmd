@echo off
setlocal

:: 获取当前计算机名
set "computerName=%COMPUTERNAME%"

:: 根据不同的计算机名设置不同的路径
if /i "%computerName%"=="Ronny-WTG" (
    set "pathVar=D:\Green\"
) else if /i "%computerName%"=="PC2" (
    set "pathVar=C:\Path\For\PC2"
) else if /i "%computerName%"=="PC3" (
    set "pathVar=C:\Path\For\PC3"
) else (
    set "pathVar=E:\"
)

:: 输出配置的路径
echo The path for %computerName% is: %pathVar%

:: 你可以在这里添加更多的命令来使用这个路径
:: 例如：xcopy, robocopy, 或者其他文件操作命令

endlocal
pause
