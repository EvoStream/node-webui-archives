@echo off

echo creating installation folder in node_webui\.... 
IF NOT EXIST node_webui MD node_webui

echo changing directory to node_webui\......
CD node_webui

echo getting evowebservices on github...
call npm install --save https://github.com/EvoStream/node-webui/tarball/develop

echo changing directory to evowebservices....
cd node_modules\web_ui

echo starting evowebservices using npm....
call npm start

echo.
echo EVOWEBSERVICES INSTALLED ON %cd%\node_webui\node_modules\web_ui
echo PRESS ANY KEY TO EXIT. 
echo.
pause >nul