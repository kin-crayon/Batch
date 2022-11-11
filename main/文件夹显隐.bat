:: 设置为 utf-8 编码
chcp 65001

@ECHO OFF
title 文件夹显隐
set MyDir=F:\HMS\Desktop
if EXIST "%MyDir%\Control Panel.{0236d120-1531-4950-b23a-7b49dbb03497}" goto UNLOCK
if EXIST %MyDir%\Locker goto LOCK

if NOT EXIST %MyDir%\Locker goto MDLOCKER
:LOCK
:: 修改文件夹名称
ren %MyDir%\Locker "Control Panel.{0236d120-1531-4950-b23a-7b49dbb03497}"
:: 隐藏文件夹并设置为系统文件属性
attrib +h +s "%MyDir%\Control Panel.{0236d120-1531-4950-b23a-7b49dbb03497}"
echo 文件夹隐藏成功
goto End
:UNLOCK
:: 去除隐藏与系统文件属性
attrib -h -s "%MyDir%\Control Panel.{0236d120-1531-4950-b23a-7b49dbb03497}"
:: 修改文件夹名称
ren "%MyDir%\Control Panel.{0236d120-1531-4950-b23a-7b49dbb03497}" Locker
echo 文件夹去除隐藏成功
goto End
:MDLOCKER
md %MyDir%\Locker
echo 文件夹 Locker 创建成功
goto End
:End
pause