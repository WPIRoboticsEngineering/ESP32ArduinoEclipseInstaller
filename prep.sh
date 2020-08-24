#!/bin/bash

START=$PWD
VERSION=$1
DIR=rbe-inst
OUTDIR=rbe-inst-output
INST=$OUTDIR/WPI-RBE-esp32-$VERSION.exe
INSTLAB=$OUTDIR/WPI-RBE-esp32-LAB-$VERSION.exe
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


	if (! test -e $DIR) then
		echo "Making install dir $DIR"
		mkdir  $DIR
		mkdir  $DIR/gitRbe/	
		unzipifiy driver.zip 	$DIR
		unzipifiy WorkingDirectories.zip $DIR
		unzipifiy sloeber.zip $DIR
		unzipifiy arduino-1.8.5.zip $DIR
		unzipifiy doxygen.zip $DIR
		unzipifiy graphviz.zip $DIR
	fi
	
	testlink $DIR 		$START
	testlink $OUTDIR    $START
	testlink $INSTDIR   $START

	
	cp LICENSE.txt 			$DIR
	cp sloeber.ico 			$DIR/sloeber/

	if (! test -e $INST) then
		rm -rf $INSTDIR/run.iss
		cp TEMPLATErbeArduinoEclipseInstaller.iss $INSTDIR/run.iss
		sed -i s/VER/"$VERSION"/g $INSTDIR/run.iss
		if (! test -e $DIR/sloeber/configuration/.settings/) then
			mkdir -p $DIR/sloeber/configuration/.settings/
		fi
		cp org.eclipse.ui.ide.prefs 	$DIR/sloeber/configuration/.settings/
		grep -v "osgi.instance.area.default" rbe-inst/sloeber/configuration/config.ini > config.ini
		echo "osgi.instance.area.default=C\:\\\\RBE\\\\eclipse-workspace" >>config.ini
		cp config.ini 			$DIR/sloeber/configuration/
		
		#cp io.sloeber.core.ui.prefs 	$DIR/eclipse-workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/
		#cp io.sloeber.arduino.prefs 	$DIR/eclipse-workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/
		#cp org.eclipse.egit.core.prefs 	$DIR/eclipse-workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/
		cp preferences.txt 		$DIR/arduino-1.8.5/lib/
		chmod -R 7777 $DIR/eclipse-workspace/
		

		echo Running wine C:\$INSTDIR\run.iss
		return 0
		if ( wine "C:\Program Files (x86)\Inno Setup 5\ISCC.exe" /cc "c:\rbe-inst-iss\run.iss") then
			echo wine ok
		else
			exit 1
			testget isetup-5.4.3.exe
			wine isetup-5.4.3.exe
			exit 1
		fi
	fi
	if (! test -e $INSTLAB) then
		rm -rf $INSTDIR/runWPI.iss
		cp rbe/TEMPLATErbeArduinoEclipseInstaller.iss $INSTDIR/runWPI.iss
		cp rbe/org.eclipse.ui.ide.prefs 	$DIR/sloeber/configuration/.settings/
		grep -v "osgi.instance.area.default" rbe-inst/sloeber/configuration/config.ini > rbe/config.ini
		echo "osgi.instance.area.default=R\:\\\\RBE\\\\eclipse-workspace" >>rbe/config.ini
		cp rbe/config.ini 			$DIR/sloeber/configuration/
		cp rbe/preferences.txt 		$DIR/arduino-1.8.5/lib/
		sed -i s/VER/"$VERSION"/g $INSTDIR/runWPI.iss
		
		echo Running wine C:\$INSTDIR\run.iss
		
		if ( wine "C:\Program Files (x86)\Inno Setup 5\ISCC.exe" /cc "c:\rbe-inst-iss\runWPI.iss") then
			echo wine ok
		else
			exit 1
		fi
	fi
	testget GithubPublish.jar 
	java -Xmx8g -jar GithubPublish.jar ESP32ArduinoEclipseInstaller  WPIRoboticsEngineering $VERSION $INST
	java  -Xmx8g -jar GithubPublish.jar ESP32ArduinoEclipseInstaller  WPIRoboticsEngineering $VERSION $INSTLAB

fi
