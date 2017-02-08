@echo off

echo creating installation folder in node_webui\.... 
IF NOT EXIST node_webui MD node_webui

echo changing directory to node_webui\......
CD node_webui

echo getting webui on github...
call npm install --save https://github.com/EvoStream/node-webui/tarball/codefix01

echo changing directory to webui....
cd node_modules\ems_web_ui

echo starting webui using npm....
call npm install
call npm start

echo.
echo WEBUI INSTALLED ON %cd%\node_webui\node_modules\ems_web_ui
echo PRESS ANY KEY TO EXIT. 
echo.
pause >nul