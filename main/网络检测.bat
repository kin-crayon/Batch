:: 设置为 utf-8 编码
chcp 65001

::网络检测 
::开始会自动检测网络状态，若是网络畅通，执行操作，若是连接不通，则会一直检测网络，直到网络通畅，再次进行链接
::网络不通的时候会进行连接测试，网络通畅之后，执行一次需要执行的内容，当网络再次断掉后，程序依旧会运行，等待网络连接成功，再执行一次需要执行的命令！！
@echo off
::初始化的网络检测部分
:check
ping -n 2 192.168.110.1
IF ERRORLEVEL 1 goto check
IF ERRORLEVEL 0 goto startConnect
pause > nul
::这里进行命令的执行等操作，操作的满足条件就是网络通畅
:startConnect
echo hello
goto checkNormal
pause>nul
::用来一直检测网络是否正常(-n 后跟的是发送ping的次数，数字越小，对网络的检测敏感度越高，这要根据自己需求来调)，这里成功失败都会书写一个日志信息到c盘文件夹里
:checkNormal
ping -n 10 www.baidu.com
IF ERRORLEVEL  1 (echo %date%%time% netCheckNotNormal >> C:\Users\netCheckLogs.txt) && goto check

IF ERRORLEVEL  0 (echo %date%%time% netCheckNormal >> C:\Users\netCheckLogs.txt) && goto  checkNormal
pause>nul