#!/bin/sh
cd build/iphone
xcodebuild -sdk iphoneos build
cd -
fruitstrap -b build/iphone/build/Release-iphoneos/TiApp.app
