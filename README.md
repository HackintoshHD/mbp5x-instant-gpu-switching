# mbp5x-instant-gpu-switching
A script to extract AppleMuxControl.kext version 3.14.52 from Apple's Security Update 2019-005 for macOS 10.12.6 Sierra to re-enable Instant GPU Switching / GPU Switching on the fly for the MacBook Pro Mid 2009 series

This script will download Apple's Security Update 2019-005 for macOS 10.12.6 Sierra and extract AppleMuxControl.kext version 3.14.52 from it.

Transplanting AppleMuxControl.kext version 3.14.52 into /System/Library/Extensions/AppleGraphicsControl.kext/Contents/PlugIns re-enables Instant GPU Switching / GPU Switching on the fly for the MacBook Pro Mid 2009 series (MacBookPro5,2) on macOS 10.13 High Sierra, macOS 10.14 Mojave and macOS 12 Monterey (…and probably also on macOS 10.15 Catalina and macOS 11 Big Sur (both untested yet), cf. https://forums.macrumors.com/threads/macos-10-14-mojave-on-unsupported-macs-thread.2121473/page-786?post=30351187#post-30351187
