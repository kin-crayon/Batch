:: 设置为 utf-8 编码
chcp 65001

@echo off
set MyDir=F:\HMS\Desktop\test
for /l %%i in (1,1,100) do (echo %%i  echo 1 > %MyDir%\%%i.jpg)
pause