@echo off
setlocal EnableExtensions EnableDelayedExpansion
title Android Practical PDF Library
color 0F
mode con: cols=100 lines=43
cd /d "%~dp0"

set "REPO_URL=https://raw.githubusercontent.com/TanjiroKamado63/dragon/refs/heads/main"

:MENU
cls
echo.
echo ====================================================================================================
echo                                     ANDROID PRACTICAL PDF LIBRARY
echo ====================================================================================================
echo.
echo   MODULE 1 - ANDROID UI AND LAYOUT PRACTICALS
echo ----------------------------------------------------------------------------------------------------
echo   1.  Hello World Android Application
echo   2.  Programming Resources - Colors, Themes, Strings, Dimensions, Drawables
echo   3.  Activity Lifecycle and Logcat
echo   4.  Create Fragment and Fragment Lifecycle
echo   5.  Fragment-Based UI Navigation
echo   6.  Activity and Fragment Communication
echo   7.  LinearLayout - Horizontal and Vertical
echo   8.  RelativeLayout - Dynamic UI Alignment
echo   9.  TableLayout - Login and Registration Form
echo   10. ScrollView - Scrollable Content
echo   11. AbsoluteLayout - Fixed Positioning
echo   12. FrameLayout - Overlay UI Elements
echo   13. ListView - ArrayAdapter and Item Click
echo   14. GridView - Custom Adapter
echo   15. RecyclerView - Modern ListView Alternative
echo.
echo   MODULE 2 - ANDROID COMPONENTS AND DATABASE
echo ----------------------------------------------------------------------------------------------------
echo   16. Toolbar and Options Menu
echo   17. AlertDialog and Custom DialogFragment
echo   18. Contextual and Popup Menus
echo   19. Explicit and Implicit Intents
echo   20. Event Handling - Click and Long Click Listeners
echo   21. Adapters, Spinner and ListView
echo   22. Started and Bound Services
echo   23. Notifications with Notification Manager
echo   24. Static and Dynamic Broadcast Receivers
echo   25. SQLite Database CRUD Operations
echo   26. SQLite with ListView or RecyclerView
echo   27. Fetch and Parse JSON Web Data
echo   28. Threads and Handlers
echo   29. Media and Telephone APIs
echo   30. Runtime Permissions and Security
echo.
echo ====================================================================================================
echo   D. Download and Open ALL practical PDFs
echo   Q. Quit
echo ====================================================================================================
echo.

set "choice="
set /p "choice=Enter practical number (1-30), D, or Q: "

if /i "!choice!"=="Q" exit /b
if /i "!choice!"=="D" goto ALL
if not defined choice goto MENU

for /f "delims=0123456789" %%A in ("!choice!") do goto INVALID

if !choice! LSS 1 goto INVALID
if !choice! GTR 30 goto INVALID

if "!choice!"=="1"  call :OPEN "Module_1_Practical_01_Hello_World_Android_Application.pdf"
if "!choice!"=="2"  call :OPEN "Module_1_Practical_02_Programming_Resources_Colors_Themes_Strings_Dimens_Drawables.pdf"
if "!choice!"=="3"  call :OPEN "Module_1_Practical_03_Activity_Lifecycle_and_Logcat.pdf"
if "!choice!"=="4"  call :OPEN "Module_1_Practical_04_Create_Fragment_and_Fragment_Lifecycle.pdf"
if "!choice!"=="5"  call :OPEN "Module_1_Practical_05_Fragment_Based_UI_Navigation.pdf"
if "!choice!"=="6"  call :OPEN "Module_1_Practical_06_Activity_and_Fragment_Communication.pdf"
if "!choice!"=="7"  call :OPEN "Module_1_Practical_07_LinearLayout_Horizontal_and_Vertical.pdf"
if "!choice!"=="8"  call :OPEN "Module_1_Practical_08_RelativeLayout_Dynamic_UI_Alignment.pdf"
if "!choice!"=="9"  call :OPEN "Module_1_Practical_09_TableLayout_Login_Registration_Form.pdf"
if "!choice!"=="10" call :OPEN "Module_1_Practical_10_ScrollView_Scrollable_Content.pdf"
if "!choice!"=="11" call :OPEN "Module_1_Practical_11_AbsoluteLayout_Fixed_Positioning.pdf"
if "!choice!"=="12" call :OPEN "Module_1_Practical_12_FrameLayout_Overlay_UI_Elements.pdf"
if "!choice!"=="13" call :OPEN "Module_1_Practical_13_ListView_ArrayAdapter_Item_Click_Handling.pdf"
if "!choice!"=="14" call :OPEN "Module_1_Practical_14_GridView_Custom_Adapter.pdf"
if "!choice!"=="15" call :OPEN "Module_1_Practical_15_RecyclerView_Modern_ListView_Alternative.pdf"

if "!choice!"=="16" call :OPEN "Module_2_Practical_01_Toolbar_and_Options_Menu.pdf"
if "!choice!"=="17" call :OPEN "Module_2_Practical_02_AlertDialog_and_Custom_DialogFragment.pdf"
if "!choice!"=="18" call :OPEN "Module_2_Practical_03_Contextual_and_Popup_Menus.pdf"
if "!choice!"=="19" call :OPEN "Module_2_Practical_04_Explicit_and_Implicit_Intents.pdf"
if "!choice!"=="20" call :OPEN "Module_2_Practical_05_Event_Handling_Click_and_Long_Click_Listeners.pdf"
if "!choice!"=="21" call :OPEN "Module_2_Practical_06_Adapters_Spinner_and_ListView.pdf"
if "!choice!"=="22" call :OPEN "Module_2_Practical_07_Started_and_Bound_Services.pdf"
if "!choice!"=="23" call :OPEN "Module_2_Practical_08_Notifications_with_Notification_Manager.pdf"
if "!choice!"=="24" call :OPEN "Module_2_Practical_09_Static_and_Dynamic_Broadcast_Receivers.pdf"
if "!choice!"=="25" call :OPEN "Module_2_Practical_10_SQLite_Database_CRUD_Operations.pdf"
if "!choice!"=="26" call :OPEN "Module_2_Practical_11_SQLite_with_ListView_or_RecyclerView.pdf"
if "!choice!"=="27" call :OPEN "Module_2_Practical_12_Fetch_and_Parse_JSON_Web_Data.pdf"
if "!choice!"=="28" call :OPEN "Module_2_Practical_13_Threads_and_Handlers.pdf"
if "!choice!"=="29" call :OPEN "Module_2_Practical_14_Media_and_Telephone_APIs.pdf"
if "!choice!"=="30" call :OPEN "Module_2_Practical_15_Runtime_Permissions_and_Security.pdf"

goto MENU

:OPEN
if not exist "%~dp0%~1" (
    echo.
    echo   [+] Downloading missing PDF from GitHub: %~1
    curl -sL "%REPO_URL%/%~1" -o "%~dp0%~1"
)
if exist "%~dp0%~1" (
    start "" "%~dp0%~1"
) else (
    echo.
    echo   [x] Failed to download %~1. Make sure files are committed on GitHub!
    pause
)
exit /b

:ALL
echo.
echo   [+] Downloading all missing PDFs from GitHub...
for %%F in (
    "Module_1_Practical_01_Hello_World_Android_Application.pdf"
    "Module_1_Practical_02_Programming_Resources_Colors_Themes_Strings_Dimens_Drawables.pdf"
    "Module_1_Practical_03_Activity_Lifecycle_and_Logcat.pdf"
    "Module_1_Practical_04_Create_Fragment_and_Fragment_Lifecycle.pdf"
    "Module_1_Practical_05_Fragment_Based_UI_Navigation.pdf"
    "Module_1_Practical_06_Activity_and_Fragment_Communication.pdf"
    "Module_1_Practical_07_LinearLayout_Horizontal_and_Vertical.pdf"
    "Module_1_Practical_08_RelativeLayout_Dynamic_UI_Alignment.pdf"
    "Module_1_Practical_09_TableLayout_Login_Registration_Form.pdf"
    "Module_1_Practical_10_ScrollView_Scrollable_Content.pdf"
    "Module_1_Practical_11_AbsoluteLayout_Fixed_Positioning.pdf"
    "Module_1_Practical_12_FrameLayout_Overlay_UI_Elements.pdf"
    "Module_1_Practical_13_ListView_ArrayAdapter_Item_Click_Handling.pdf"
    "Module_1_Practical_14_GridView_Custom_Adapter.pdf"
    "Module_1_Practical_15_RecyclerView_Modern_ListView_Alternative.pdf"
    "Module_2_Practical_01_Toolbar_and_Options_Menu.pdf"
    "Module_2_Practical_02_AlertDialog_and_Custom_DialogFragment.pdf"
    "Module_2_Practical_03_Contextual_and_Popup_Menus.pdf"
    "Module_2_Practical_04_Explicit_and_Implicit_Intents.pdf"
    "Module_2_Practical_05_Event_Handling_Click_and_Long_Click_Listeners.pdf"
    "Module_2_Practical_06_Adapters_Spinner_and_ListView.pdf"
    "Module_2_Practical_07_Started_and_Bound_Services.pdf"
    "Module_2_Practical_08_Notifications_with_Notification_Manager.pdf"
    "Module_2_Practical_09_Static_and_Dynamic_Broadcast_Receivers.pdf"
    "Module_2_Practical_10_SQLite_Database_CRUD_Operations.pdf"
    "Module_2_Practical_11_SQLite_with_ListView_or_RecyclerView.pdf"
    "Module_2_Practical_12_Fetch_and_Parse_JSON_Web_Data.pdf"
    "Module_2_Practical_13_Threads_and_Handlers.pdf"
    "Module_2_Practical_14_Media_and_Telephone_APIs.pdf"
    "Module_2_Practical_15_Runtime_Permissions_and_Security.pdf"
) do (
    if not exist "%~dp0%%~F" (
        curl -sL "%REPO_URL%/%%~F" -o "%~dp0%%~F"
    )
    if exist "%~dp0%%~F" (
        start "" "%~dp0%%~F"
    )
)
echo   [✓] Done! All available PDFs opened.
pause
goto MENU

:INVALID
echo.
echo   Invalid choice. Enter a number from 1 to 30, D, or Q.
timeout /t 2 >nul
goto MENU
