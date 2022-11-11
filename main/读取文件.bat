:: 设置为 utf-8 编码
chcp 65001

@echo off&setlocal enabledelayedexpansion

set FilePath=F:\HMS\Desktop\MyScript
rem 读取a.txt所有内容
for /f "eol=* tokens=*" %%i in (%FilePath%\test.txt) do (
rem 设置变量a为每行内容
set hang=%%i
rem 如果该行有123，则将其改为456
::set "hang=!hang:123=456!"
set "hang=修改hou"
rem 把修改后的全部行存入$
echo !hang!>>$)


rem 用$的内容替换原来a.txt内容
move $ %FilePath%\test.txt

pause





