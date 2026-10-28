
@echo off
setlocal EnableExtensions EnableDelayedExpansion
title Android Practical PDF Library
color 0F
mode con: cols=100 lines=43
cd /d "%~dp0"

:MENU
cls
echo.
echo  ====================================================================================================
echo                                ANDROID PRACTICAL PDF LIBRARY
echo  ====================================================================================================
echo.
echo   MODULE 1 - ANDROID UI AND LAYOUT PRACTICALS
echo  ----------------------------------------------------------------------------------------------------
echo   1.  Hello World Android Application
echo   2.  Programming Resources
echo   3.  Activity Lifecycle and Logcat
echo   4.  Create Fragment and Demonstrate Fragment Lifecycle
echo   5.  Fragment-Based UI Navigation
echo   6.  Activity and Fragment Communication
echo   7.  LinearLayout - Horizontal and Vertical
echo   8.  RelativeLayout - Dynamic Layout
echo   9.  Login Layout
echo   10. ScrollView - Scrollable Content
echo   11. AbsoluteLayout - Fixed Positioning
echo   12. FrameLayout - Overlay Layout
echo   13. ListView - ArrayAdapter
echo   14. GridView - Custom Adapter
echo   15. RecyclerView - Modern List
echo.
echo   MODULE 2 - ANDROID COMPONENTS AND DATABASE
echo  ----------------------------------------------------------------------------------------------------
echo   16. Toolbar and Options Menu
echo   17. AlertDialog and Custom Dialog
echo   18. Contextual and Popup Menus
echo   19. Explicit and Implicit Intents
echo   20. Event Handling - Click Listeners
echo   21. Adapters, Spinner and ListView
echo   22. Started and Bound Services
echo   23. Notifications with NotificationManager
echo   24. Static and Dynamic Broadcast Receivers
echo   25. SQLite Database CRUD
echo   26. SQLite with ListView or RecyclerView
echo   27. Fetch and Parse JSON
echo   28. Threads and Handlers
echo   29. Media and Telephone APIs
echo   30. Runtime Permissions and Security
echo.
echo  ====================================================================================================
echo   D. Open ALL practical PDFs
echo   Q. Quit
echo  ====================================================================================================
echo.

set "choice="
set /p "choice=Enter practical number (1-30), D, or Q: "

if /i "!choice!"=="Q" exit /b
if /i "!choice!"=="D" goto ALL

for /f "delims=0123456789" %%A in ("!choice!") do goto INVALID
if not defined choice goto MENU

if "!choice!"=="1"  call :OPEN "Module_1_Practical_01"
if "!choice!"=="2"  call :OPEN "Module_1_Practical_02"
if "!choice!"=="3"  call :OPEN "Module_1_Practical_03"
if "!choice!"=="4"  call :OPEN "Module_1_Practical_04"
if "!choice!"=="5"  call :OPEN "Module_1_Practical_05"
if "!choice!"=="6"  call :OPEN "Module_1_Practical_06"
if "!choice!"=="7"  call :OPEN "Module_1_Practical_07"
if "!choice!"=="8"  call :OPEN "Module_1_Practical_08"
if "!choice!"=="9"  call :OPEN "Module_1_Practical_09"
if "!choice!"=="10" call :OPEN "Module_1_Practical_10"
if "!choice!"=="11" call :OPEN "Module_1_Practical_11"
if "!choice!"=="12" call :OPEN "Module_1_Practical_12"
if "!choice!"=="13" call :OPEN "Module_1_Practical_13"
if "!choice!"=="14" call :OPEN "Module_1_Practical_14"
if "!choice!"=="15" call :OPEN "Module_1_Practical_15"

if "!choice!"=="16" call :OPEN "Module_2_Practical_01"
if "!choice!"=="17" call :OPEN "Module_2_Practical_02"
if "!choice!"=="18" call :OPEN "Module_2_Practical_03"
if "!choice!"=="19" call :OPEN "Module_2_Practical_04"
if "!choice!"=="20" call :OPEN "Module_2_Practical_05"
if "!choice!"=="21" call :OPEN "Module_2_Practical_06"
if "!choice!"=="22" call :OPEN "Module_2_Practical_07"
if "!choice!"=="23" call :OPEN "Module_2_Practical_08"
if "!choice!"=="24" call :OPEN "Module_2_Practical_09"
if "!choice!"=="25" call :OPEN "Module_2_Practical_10"
if "!choice!"=="26" call :OPEN "Module_2_Practical_11"
if "!choice!"=="27" call :OPEN "Module_2_Practical_12"
if "!choice!"=="28" call :OPEN "Module_2_Practical_13"
if "!choice!"=="29" call :OPEN "Module_2_Practical_14"
if "!choice!"=="30" call :OPEN "Module_2_Practical_15"

if !choice! LSS 1 goto INVALID
if !choice! GTR 30 goto INVALID
goto MENU

:OPEN
set "MATCH="
for %%F in ("%~dp0%~1*.pdf") do (
    if exist "%%~fF" if not defined MATCH set "MATCH=%%~fF"
)
if defined MATCH (
    start "" "!MATCH!"
) else (
    echo.
    echo  PDF not found for %~1
    echo  Check that the PDF is in the same folder as library.bat.
    pause
)
exit /b

:ALL
set /a COUNT=0
for %%F in ("%~dp0*.pdf") do (
    if exist "%%~fF" (
        start "" "%%~fF"
        set /a COUNT+=1
    )
)
if !COUNT! EQU 0 echo No PDF files found in this folder.
if !COUNT! GTR 0 echo Opened !COUNT! PDF files.
pause
goto MENU

:INVALID
echo.
echo  Invalid choice. Enter a number from 1 to 30, D, or Q.
timeout /t 2 >nul
goto MENU
