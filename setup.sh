#!/bin/bash

echo "This is the installation script of Poison - The Person of Interest Investigation OSINT tool."
echo "* * * * *"

echo "Installing dependencies..."

sudo apt update
sudo apt install python3-pip -y
sudo apt install python3-venv -y 

sleep 1
echo "Installing external modules..."

cd ..
mkdir dorkScanner
cd dorkScanner
python3 -m venv dorkScannerEnvironment
source dorkScannerEnvironment/bin/activate
sudo git clone https://github.com/madhavmehndiratta/dorkScanner.git
cd dorkScanner
pip3 install -r requirements.txt
deactivate

cd ../..
mkdir sherlock
cd sherlock
git clone https://github.com/sherlock-project/sherlock.git
cd sherlock
python3 -m venv SherlockEnvironment
source SherlockEnvironment/bin/activate
pip install -r requirements.txt
deactivate

cd ../..
mkdir maigret
cd maigret
python3 -m venv maigretEnvironment
source maigretEnvironment/bin/activate
pip install maigret
deactivate

cd ../..
mkdir holehe
cd holehe
python3 -m venv holeheEnvironment
source holeheEnvironment/bin/activate
pip install -U holehe
deactivate

echo "Installation completed."
