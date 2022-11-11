:: 设置为 utf-8 编码
chcp 65001

:: 关闭终端回显
@echo off

set current_time=%date%%time%
echo 当前时间：	%date:~0,4%年%date:~5,2%月%date:~8,2%日%time:~0,2%时%time:~3,2%分%time:~6,2%秒

set CURRENT_DATE_STRING=%date:~0,4%%date:~5,2%%date:~8,2%
echo.
echo 年月日:	%CURRENT_DATE_STRING%


set "TIME_STRING_FILL_ZREO=%time: =0%"
echo.
echo 时分秒：	%TIME_STRING_FILL_ZREO%

set CURRENT_TIME_STRING=%TIME_STRING_FILL_ZREO:~0,2%%TIME_STRING_FILL_ZREO:~3,2%%TIME_STRING_FILL_ZREO:~6,2%
echo.
echo 时分秒格式：	%CURRENT_TIME_STRING%

set CURRENT_DATE_TIME_STRING=%CURRENT_DATE_STRING%%CURRENT_TIME_STRING%
echo.
echo 时间字符串拼接：	%CURRENT_DATE_TIME_STRING%
echo.

pause