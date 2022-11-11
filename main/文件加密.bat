:: 设置为 utf-8 编码
chcp 65001

@ECHO OFF
title 文件加密
:: 关闭notepad++
taskkill /f /IM notepad++.exe
:: 关闭任务栏
taskkill /f /IM explorer.exe
:: 启动任务栏
start %windir%\explorer.exe


:: 解压程序WinRAR.exe所在目录
set WinRarDir=D:\WinRAR

:: 根据日期设置压缩文件名称
set CURRENT_DATE_STRING=%date:~0,4%%date:~5,2%%date:~8,2%
set "TIME_STRING_FILL_ZREO=%time: =0%"
set CURRENT_TIME_STRING=%TIME_STRING_FILL_ZREO:~0,2%%TIME_STRING_FILL_ZREO:~3,2%%TIME_STRING_FILL_ZREO:~6,2%
set Name=%CURRENT_DATE_STRING%%CURRENT_TIME_STRING%

:: 目标文件夹位置
set MyDir=F:\HMS\Desktop

:: 判断
if EXIST "%MyDir%\Control Panel.{0236d120-1531-4950-b23a-7b49dbb03497}" goto UNLOCK
if EXIST %MyDir%\File\back goto LOCK
if NOT EXIST %MyDir%\File\back goto MDFile

:LOCK
:: 压缩
start  /wait  ""  "%WinRarDir%\WinRAR.exe"  a -ep1 -o+ -r -ibck -p密码 "%MyDir%\File\back\%Name%.rar"  "%MyDir%\File\备忘"
:: 清除TXT件内容并将压缩文件名存入TXT中
echo %Name%.rar>%MyDir%\File\test.txt
:: 删除文件夹
rd /s/q %MyDir%\File\备忘
:: 修改文件夹名称
ren %MyDir%\File "Control Panel.{0236d120-1531-4950-b23a-7b49dbb03497}"
:: 隐藏文件夹并设置为系统文件属性
attrib +h +s "%MyDir%\Control Panel.{0236d120-1531-4950-b23a-7b49dbb03497}"

echo 锁定成功
goto End

:UNLOCK
:: 去除隐藏与系统文件属性
attrib -h -s "%MyDir%\Control Panel.{0236d120-1531-4950-b23a-7b49dbb03497}"
:: 修改文件夹名称
ren "%MyDir%\Control Panel.{0236d120-1531-4950-b23a-7b49dbb03497}" File
:: 读取文件第一行内容
for /f %%a in (%MyDir%\File\test.txt) do (
:: 解压
start  /wait  ""  "%WinRarDir%\WinRAR.exe"  x  -l -o+ -p密码  F:\HMS\Desktop\File\back\%%a  F:\HMS\Desktop\File
echo 解锁成功
goto End)



:MDFile
md %MyDir%\File\back
echo 文件夹 File\back 创建成功
goto End


:END
pause