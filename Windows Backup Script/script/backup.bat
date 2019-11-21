@echo off
REM Settings-------
title Windows Backup Script
REM ---------------
echo Windows Backup Script
echo Created by @IWickGames#7827
echo       github.com/iwickgames
echo.
echo Currently running in "%cd%"
set /p backupLocation=<backup.loc
set /p backupName=<backup.name
set /p backupDir=<backup.dir
echo.
echo Current backup name       ..     "%backupName%"
echo Current backup location   ..     "%backupLocation%"
echo Current backup directory  ..     "%backupDir%"
echo.
echo.
REM Check if the directoys exists
if not exist "%backupLocation%" set "errorVar=Backup location does not exist" & goto error
if not exist "%backupDir%" set "errorVar=Backup directory does not exist" & goto error
REM Check if the backname already exists
if exist "%backupDir%\%backupName%" set "errorVar=%backupName% already exists on %backupLocation%" & goto error
REM Error checking complete
echo Starting backup...
REM Create Backup Folder in %backupLocation%
mkdir "%backupLocation%\%backupName%"
REM Start Backup(This will take a wile)
echo Copying files...
echo This may take a long time depending on the amount of files
xcopy /Y /Q /S /H "%backupDir%" "%backupLocation%\%backupName%"
echo Backup created to %backupLocation%
echo.
echo.
echo.
echo Press any key to exit...
pause>nul
exit



:error
echo.
echo Error Log--------------------------
echo.
echo Windows Backup Script had to quit because of an error
echo Error Reason Given;
echo %errorVar%
echo -----------------------------------
echo.
echo Press any key to exit...
pause>nul
exit