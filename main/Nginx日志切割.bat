:: 设置为 utf-8 编码
chcp 65001

@shift

::设置nginx安装文件路径和当天时间变量
@echo off
:: nginx.exe 所在目录
set nginx_dir=F:\HMS\Desktop\nginx1\nginx
:: 切割日志的路径
set dir=%nginx_dir%\logs\cut_log
set log=%nginx_dir%\logs\access.log
set errorlog=%nginx_dir%\logs\error.log
set today=%date:~0,4%-%date:~5,2%-%date:~8,2%

:: 删除 30 天以前的目录下的 .log 文件
forfiles /p "F:\HMS\Desktop\nginx1\nginx" /s /m *.log /d -30 /c "cmd /c del @path"

::判断nginx安装文件路径设置是否正确
:exist_nginx_dir
@echo off
if exist %nginx_dir% (
cd %nginx_dir%
goto check_log
) else (
echo 此路径%nginx_dir%不存在，请检查
goto stop
)

::判断nginx的access.log
:check_log
@echo off
if exist %log% (
goto check_dir
) else (
echo %log%文件不存在，请检查
goto stop
)

::判断nginx的cut_log目录
:check_dir
@echo off
if exist %dir% (
goto main
) else (
:: 创建文件夹
md "%dir%"
goto main 
)


::创建相关目录和对nginx日志进行切割
:main
@echo off
::结束nginx进程
taskkill /F /IM nginx.exe > nul
:: 移动文件，并以日期进行切割
move "%log%" "%dir%\access-%today%.log" > nul
move "%errorlog%" "%dir%\error-%today%.log" > nul

start nginx.exe

pause