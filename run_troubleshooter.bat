REM This troubleshooter is only for Windows 10 and up. This troubleshooter is custom-made, and it doesn't work on Windows 8.1 and less.
@echo off

REM Initialization ----------------------------------------------------------------------------------------------

REM Creating the escape character (ASCII 27) automatically.
for /F "delims=#" %%a in ('prompt #$E# ^& for %%a in ^(1^) do rem') do set "ESC=%%a"
REM Example usage:
REM 	%ESC%

REM Creating a Newline variable (the two blank lines are required!)
set NLM=^


set NL=^^^%NLM%%NLM%^%NLM%%NLM%
REM Example usage: 
REM 	echo First line ends here.%NL%Start of second line.

REM Begin of code -----------------------------------------------------------------------------------------------

REM The "do while" loop
:OPTION_INVALID

REM Asking the user the option
echo %NL%Enter option number and press Enter to choose and run selected option:%NL%%NL%
echo %ESC%[92m1%ESC%[0m - Find blocking program(s) preventing USB media from being ejected.%NL%%NL%
set /p option=Enter Option (only the green text): 

REM The "option" now has the option number. We choose the option matching the variable "option".
if %option% EQU 1 (
	goto :OPTION_FIND_EJECTING_PREVENTION
)
echo Invalid option detected. Retry...
goto :OPTION_INVALID

REM The "option" chosen is to find programs that prevent USB storage media from being ejected.
:OPTION_FIND_EJECTING_PREVENTION
REM This is how one gets the output from a Powershell script to this batch script.
for /F "delims=" %%a in ('Powershell.exe -executionpolicy remotesigned -File ^"powershell\nonejectingApp.ps1^"') do (
	set result=%%a
)
goto :END_OF_TROUBLESHOOTING_EJECTION


REM Ending the troubleshooter for Option 1
:END_OF_TROUBLESHOOTING_EJECTION
if [%result%] == [] goto :END_OF_TROUBLESHOOTING_NOTHING
echo %NL%%ESC%[94mOffending app that is blocking USB Media -%ESC%[0m %result%%NL%

:END_OF_TROUBLESHOOTING_NOTHING
echo %NL%The troubleshooter didn't find anything wrong.%NL%

REM Prompt to restart?
set /p option=Restart? [Y/N] 

REM If user wants to restart, navigate user back to beginning of loop.
if "%option%" == "y" (
	goto :OPTION_INVALID
)
if "%option%" == "Y" (
	goto :OPTION_INVALID
)

REM Exiting app.
exit