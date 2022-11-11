:: 设置为 utf-8 编码
chcp 65001

@echo oFF
title sqlcmd测试

::初始化连接参数
set host="127.0.0.1,2433" 
set user="sa"
set pd="huyidao00"
 
:: 执行当前目录下的 db_backup.sql	并且将执行的日志保存在当前目录 db_backup.log 中。
sqlcmd -S %host% -U %user% -P %pd% -i ./db_backup.sql -o ./db_backup.log
pause