#!/bin/bash

#Download latest Bloodhound version
curl -s https://api.github.com/repos/BloodHoundAD/BloodHound/releases/latest | grep 'browser_download_url.*linux-x64.zip' | cut -d : -f 2,3 | tr -d \" | wget -qi -

#Unzip
unzip BloodHound-linux-x64.zip
pwd

#Move files to installer location
mv ./BloodHound-linux-x64/* ./

#Remove leftovers
rm BloodHound-linux-x64.zip
rm -r BloodHound-linux-x64
