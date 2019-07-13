#!/bin/bash

START=$PWD
VERSION=$1
DIR=rbe-inst
OUTDIR=rbe-inst-output
INST=$OUTDIR/WPI-RBE-esp32-$VERSION.exe
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
	rm -rf $OUTDIR
	mkdir $OUTDIR
	mkdir  $DIR	
	if (! test -e /home/hephaestus/.wine/drive_c/rbe-inst) then
		echo 'Linking build dirs for wine'
		ln -s $START/$DIR/ 					$HOME/.wine/drive_c/
		ln -s $START/rbe-inst-output		$HOME/.wine/drive_c/
	fi
		
	testget GithubPublish.jar 
	unzipifiy driver.zip 	$DIR
	unzipifiy WorkingDirectories.zip $DIR
	unzipifiy sloeber.zip $DIR
	unzipifiy arduino-1.8.5.zip $DIR


	rm -rf run.iss
	cp TEMPLATErbeArduinoEclipseInstaller.iss run.iss
	sed -i s/VER/"$VERSION"/g run.iss
	echo Running wine

	wine "C:\Program Files (x86)\Inno Setup 5\ISCC.exe" /cc "C:\rbe-inst\run.iss"
	
	if ( wine "C:\Program Files (x86)\Inno Setup 5\ISCC.exe" /cc "C:\rbe-inst\run.iss") then
		echo wine ok
	else
		testget isetup-5.4.3.exe
		wine isetup-5.4.3.exe
		exit 1
	fi
	java -jar GithubPublish.jar ESP32ArduinoEclipseInstaller  WPIRoboticsEngineering $VERSION $INST

fi
