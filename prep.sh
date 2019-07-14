#!/bin/bash

START=$PWD
VERSION=$1
DIR=rbe-inst
OUTDIR=rbe-inst-output
INST=$OUTDIR/WPI-RBE-esp32-$VERSION.exe
INSTDIR=rbe-inst-iss
unzipifiy(){
	testget $1
	echo "Unzipping $1 to $2"
	unzip -qq $1 -d $2
}

testget () {
   if [ -f $1 ]; then
    	echo "$1 exist"
    else
    	wget https://github.com/WPIRoboticsEngineering/ESP32ArduinoEclipseInstaller/releases/download/0.0.0/$1
	fi
}

testlink () {
	if (! test -e $1) then
		mkdir $1
	fi
	if (! test -e $HOME/.wine/drive_c/$1) then
		echo "Linking build dirs for wine $1"
		ln -s $2/$1	$HOME/.wine/drive_c/
	fi
}

if (! test -z "$VERSION" ) then
	rm -rf $OUTDIR/*
	
	testget GithubPublish.jar 
	if (! test -e $DIR) then
		echo "Making install dir $DIR"
		mkdir  $DIR
		mkdir  $DIR/gitRbe/	
		unzipifiy driver.zip 	$DIR
		unzipifiy WorkingDirectories.zip $DIR
		unzipifiy sloeber.zip $DIR
		unzipifiy arduino-1.8.5.zip $DIR
	fi
	
	testlink $DIR 		$START
	testlink $OUTDIR    $START
	testlink $INSTDIR   $START

	rm -rf $INSTDIR/run.iss
	cp TEMPLATErbeArduinoEclipseInstaller.iss $INSTDIR/run.iss
	cp LICENSE.txt 			$DIR
	cp sloeber.ico 			$DIR/sloeber/
	cp org.eclipse.ui.ide.prefs 	$DIR/sloeber/configuration/.settings/
	cp config.ini 			$DIR/sloeber/configuration/
	cp io.sloeber.core.ui.prefs 	$DIR/eclipse-workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/
	cp io.sloeber.arduino.prefs 	$DIR/eclipse-workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/
	cp org.eclipse.egit.core.prefs 	$DIR/eclipse-workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/
	cp preferences.txt 		$DIR/arduino-1.8.5/lib/
	chmod -R 7777 $DIR/eclipse-workspace/
	sed -i s/VER/"$VERSION"/g $INSTDIR/run.iss
	
	echo Running wine C:\$INSTDIR\run.iss
	
	if ( wine "C:\Program Files (x86)\Inno Setup 5\ISCC.exe" /cc "c:\rbe-inst-iss\run.iss") then
		echo wine ok
	else
		exit 0
		testget isetup-5.4.3.exe
		wine isetup-5.4.3.exe
		exit 1
	fi
	java -jar GithubPublish.jar ESP32ArduinoEclipseInstaller  WPIRoboticsEngineering $VERSION $INST

fi
