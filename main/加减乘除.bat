:: 设置为 utf-8 编码
chcp 65001

@echo off

set /a a=1,b=2
if %a% equ %b% (echo 1等于2是对的) else (echo 1等于2是错的)
if %a% neq %b% (echo 1不等于2是对的) else (echo 1不等于2是对的)
if %a% lss %b% (echo 1小于2是对的) else (echo 1小于2是错的)
if %a% leq %b% (echo 1小于等于2是对的) else (echo 1小于等于2是错的)
if %a% gtr %b% (echo 1大于2是对的) else (echo 1大于2是错的)
if %a% geq %b% (echo 1大于等于2是对的) else (echo 1大于等于2是错的)

pause>nul