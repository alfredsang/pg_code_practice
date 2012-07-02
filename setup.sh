#! /bin/bash 

git submodule add https://github.com/apache/incubator-cordova-ios.git lib/cordova
git submodule add https://github.com/gabriel/gh-unit.git lib/ghunit

git submodule init
git submodule update

