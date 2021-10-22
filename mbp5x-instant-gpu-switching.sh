#!/bin/bash

# root check
if [ "$(id -u)" != "0" ]; then
   printf "\nError: This script needs to be executed with sudo privileges.\n" 1>&2
   exit 1
fi

# variables
nameprefix=`date '+%Y.%m.%d-%H.%M.%S'`
filename1=SecUpd2019-005Sierra
filename2=AppleMuxControl
expandeddirectoryname1=$filename1-$nameprefix
expandeddirectorypath1=/tmp/$expandeddirectoryname1
expandeddirectoryname2=$filename2-$nameprefix
expandeddirectorypath2=/tmp/$expandeddirectoryname2

clear

printf "Restore Instant GPU Switching / GPU Switching on the fly for MacBookPro5,x\n\n"
printf "\nThis script will download Apple's Security Update 2019-005 for macOS 10.12.6 Sierra and extract AppleMuxControl.kext version 3.14.52 from it.\n"
printf "Transplanting AppleMuxControl.kext version 3.14.52 into /System/Library/Extensions/AppleGraphicsControl.kext/Contents/PlugIns re-enables\n"
printf "\"Instant GPU Switching / GPU Switching on the fly\" for the MacBook Pro Mid 2009 series (MacBookPro5,2) on macOS 10.13 High Sierra,\n"
printf "macOS 10.14 Mojave and macOS 12 Monterey (…and probably also on macOS 10.15 Catalina and macOS 11 Big Sur (both untested yet),\n"
printf "cf. https://forums.macrumors.com/threads/macos-10-14-mojave-on-unsupported-macs-thread.2121473/page-786?post=30351187#post-30351187\n"  

printf "\nDownloading Apple Software Update's package of the Security Update 2019-005 for macOS 10.12.6 Sierra…\n\n"
wget http://swcdn.apple.com/content/downloads/55/63/061-41803-A_87X0EHD65R/gt50wt0ye0twqkj227l9g7vw2ok4nl72a6/SecUpd2019-005Sierra.pkg -O "/tmp/$filename1-$nameprefix.pkg"

printf "\nExpanding the downloaded Security Update 2019-005 via the undocumented pkgutil switch \"--expand-full\"…\n"
pkgutil --expand-full "/tmp/$filename1-$nameprefix.pkg" "$expandeddirectorypath1"

printf "\nMoving AppleMuxControl.kext version 3.14.52 to $expandeddirectorypath2/…\n"
mkdir "$expandeddirectorypath2"
mv "$expandeddirectorypath1/Payload/System/Library/Extensions/AppleGraphicsControl.kext/Contents/PlugIns/AppleMuxControl.kext" "$expandeddirectorypath2/"

printf "\nCleaning up…\n"
rm "/tmp/$filename1-$nameprefix.pkg"
rm -rf "$expandeddirectorypath1"

printf "\nOpening Finder window with AppleMuxControl.kext version 3.14.52…\n\n"
open "$expandeddirectorypath2"
