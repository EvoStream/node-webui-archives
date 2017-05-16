@echo off

echo creating installation folder in node_webui\.... 
IF NOT EXIST node_webui MD node_webui

echo changing directory to node_webui\......
CD node_webui

echo getting webui on github...
call npm install --save https://github.com/EvoStream/node-webui/tarball/codefix02

for /D %%D in ("node_modules\*.*") do (
    if /I not "%%~nxD"=="ems_web_ui" (
        2> nul rd /S /Q "%%~fD"
    )
)

echo changing directory to ems_web_ui....
cd node_modules\ems_web_ui

echo starting ems_web_ui using npm....
call npm install
call npm start

echo.
echo ems_web_ui INSTALLED ON %cd%\node_webui\node_modules\ems_web_ui
echo PRESS ANY KEY TO EXIT. 
echo.
pause >nul