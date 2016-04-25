@echo off
perl %STUDIO_BIN%\srcdoc %1
if errorlevel 1 goto end
call htmlpp html.out
call htmlpp html.out
:end
