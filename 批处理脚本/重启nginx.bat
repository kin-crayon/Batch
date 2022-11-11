:: 设置为 utf-8 编码
chcp 65001

@echo off

set nginx_home=E:\XR\Server\Nginx\nginx
set port=12345
set error_log=E:\XR\Server\Nginx\nginx\logs
:: 定时器
set n=0

:: 启动nginx
:start
echo 当前 Nginx 进程：
tasklist|find /i "nginx.exe" 
:: errorlevel值等于0表示存在nginx.exe进程
if %errorlevel%==0 ( 
	echo.
	echo 关闭 Nginx 进程：
	taskkill /f /t /im nginx.exe
) 
start %nginx_home%\nginx.exe

:: 检测启动状态
:check
set /a n+=1
:: 定时1秒
choice /t 1 /d y /n >nul
echo.
echo Nginx进程已启动，Nginx内部自检中，耗时大于 %n% 秒
tasklist|find /i "nginx.exe">null
:: 如果nginx进程不存在（nginx自己关闭了自己的进程）
if %errorlevel% neq 0 goto error

netstat -aon | findstr :%port%
if %errorlevel%==0 ( 
	echo.
	echo Nginx启动成功
	goto end
) else (
	goto check
)

:error
echo.
echo 启动Nginx失败，耗时大于 %n% 秒，开始打开日志
start %error_log%\error.log

:end
echo.
pause