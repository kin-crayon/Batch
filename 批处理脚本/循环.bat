:: 设置为 utf-8 编码
chcp 65001


@echo off

set n=0

:abc

set /a n+=1
echo %n%
if %n%==60 goto end

goto abc

:end
pause