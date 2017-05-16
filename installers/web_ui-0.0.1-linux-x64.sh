#!/bin/sh
#
# Script to install node.js, web_ui, and then start ERS.
#

# Get the needed parameters
OS=linux
ARCH=x64
VER=4.1.1
NODE_JS=http://nodejs.org/dist/v$VER/node-v$VER-$OS-$ARCH.tar.gz

# Download and extract needed node JS
which node
if [ $? != 0 ]; then 
    echo "Node.js DOES NOT exists.... Installing Node.js first...." 

    wget $NODE_JS 

    # Next, execute the following command to install the Node.js binary package in /usr/local/:
    tar zxf node-v$VER-$OS-$ARCH.tar.gz -C /usr/local --strip-components 1 
    if [ $? != 0 ]; then echo 'Node.js: INSTALLATION FAILED! Please see errors below:'; exit 1; fi
	
	echo "Node.js: SUCCESSFUL INSTALLATION!" 

    
else
    echo "Node.js already exists" 
fi 

echo 'Getting the ems_web_ui...'
npm install https://github.com/EvoStream/node-webui/tarball/codefix02
if [ $? != 0 ]; then echo 'ems_web_ui: INSTALLATION FAILED! Please see errors below:'; exit 1; fi

echo "ems_web_ui: SUCCESSFUL INSTALLATION!" 

cd node_modules
find . -type d -maxdepth 1 -not -name 'ems_web_ui' -exec rm -rf {} \;

# Change to where ems_web_ui is
cd ems_web_ui

# Install ems_web_ui modules
echo 'Installing web_ui modules...'
npm install

# Start ems_web_ui
echo 'Starting ems_web_ui...'
npm start 
if [ $? != 0 ]; then echo 'Could not start ems_web_ui!'; exit 1; fi

exit 0;