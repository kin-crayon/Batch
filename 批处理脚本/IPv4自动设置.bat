:: 设置为 utf-8 编码
chcp 65001


:: 获取管理员权限
@echo off
cd /d "%~dp0"
cacls.exe "%SystemDrive%\System Volume Information" >nul 2>nul
if %errorlevel%==0 goto Admin
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
echo Set RequestUAC = CreateObject^("Shell.Application"^)>"%temp%\getadmin.vbs"
echo RequestUAC.ShellExecute "%~s0","","","runas",1 >>"%temp%\getadmin.vbs"
echo WScript.Quit >>"%temp%\getadmin.vbs"
"%temp%\getadmin.vbs" /f
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
exit

:Admin


:: 自动获取 ip 地址
netsh interface ip set address "WLAN" dhcp

:: 清空 DNS
netsh interface ip set dns name = "WLAN" static addr = none

:: 自动获取 DNS 
netsh interface ip set address name="WLAN" source=dhcp

pause








