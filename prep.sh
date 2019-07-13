#!/bin/bash

START=$PWD
VERSION=$1
DIR=rbe-inst

unzipifiy(){
	testget $1
	unzip -qq $1 -d $2
}

testget () {
  if [ -f $1 ]; then
    	echo "$1 exist"
    else
    	wget https://github.com/WPIRoboticsEngineering/ESP32ArduinoEclipseInstaller/releases/download/0.0.0/$1
	fi
}

if (! test -z "$VERSION" ) then
	rm -rf $DIR
	mkdir  $DIR	
	if (! test -e /home/hephaestus/.wine/drive_c/rbe-inst) then
		echo 'Linking build dirs for wine'
		ln -s $START/$DIR/ 	$HOME/.wine/drive_c/
		ln -s $START/		$HOME/.wine/drive_c/
	fi
		
	testget GithubPublish.jar 
	unzipifiy driver.zip 	$DIR
	unzipifiy WorkingDirectories.zip $DIR
	unzipifiy sloeber.zip $DIR
	unzipifiy arduino-1.8.5.zip $DIR

	exit 0
	rm windows.iss
	cp TEMPLATEwindows.iss windows.iss
	sed -i s/VER/"$VERSION"/g windows.iss
	sed -i s/CVARCH/x64/g windows.iss
	sed -i s/JAVAARCH/HKLM64/g windows.iss
	echo adding Bowler Studio For Windows

	echo Running wine
	wine "C:\Program Files (x86)\Inno Setup 5\ISCC.exe" /cc "C:\rbe-inst\rbeArduinoEclipseInstaller.iss"
	rm -rf $DIR
	#if ( wine "C:\Program Files (x86)\Inno Setup 5\Compil32.exe" /cc "C:\installer-scripts\windows\windows.iss") then
	#	echo wine ok
	#else
	#	wine $START/tools/isetup-5.4.3.exe
	#	exit 1
	#fi

fi
