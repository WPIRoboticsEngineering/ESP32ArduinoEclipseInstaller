#!/bin/bash

ARDUINO_LOC=~/bin/arduino-1.8.13/
ARDUINO_ZIP_NAME=arduino-1.8.13-linux64.tar.xz

ECLIPSE_LOC=~/bin/eclipse-slober-rbe/
SLOBER_LOC=~/bin/eclipse-slober-rbe/

SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


if (! test -e ~/bin) then
 mkdir ~/bin
fi

if ! [ "$SCRIPT" = "$HOME/bin" ]; then
 echo "Script source copied to ~/bin from " $SCRIPT
 cp $SCRIPT/linux-eclipse-esp32.sh ~/bin/linux-eclipse-esp32.sh
 chmod +x  ~/bin/linux-eclipse-esp32.sh
fi

if (! test -e ~/Arduino/hardware) then
 mkdir -p ~/Arduino/hardware
fi
if (! test -e ~/Arduino/tools) then
 mkdir -p ~/Arduino/tools
fi

if (! test -e $ARDUINO_LOC) then

	if (! test -e ~/bin/$ARDUINO_ZIP_NAME ) then
	 wget https://github.com/WPIRoboticsEngineering/ESP32ArduinoEclipseInstaller/releases/download/0.0.0/$ARDUINO_ZIP_NAME -O ~/bin/$ARDUINO_ZIP_NAME
	fi
	
	tar -xvf ~/bin/$ARDUINO_ZIP_NAME -C ~/bin/
	sudo usermod -a -G dialout $USER 
	sudo apt-get install git python3-serial python3
	wget https://bootstrap.pypa.io/get-pip.py 
	echo "Getting Pip, might take a while..."
	sudo python get-pip.py
	sudo pip install pyserial 
fi

DEFAULT_SLOBER_LIBS="CapacitiveSensor  Ethernet  Firmata  GSM  Keyboard  LiquidCrystal  Mouse  Servo  Stepper  TFT  WiFi SD"


StringVal="Adafruit_BNO055              ESP32AnalogRead        
Adafruit_Circuit_Playground  ESP32Encoder           RfidDb
Adafruit_TinyUSB_Library     ESP32Servo             
Adafruit_TLC5947             Esp32SimplePacketComs  SimplePacketComs
Adafruit_Unified_Sensor      Esp32WifiManager       
ArduinoJson                  EspWii                 TeensySimplePacketComs
BNO055SimplePacketComs       FlashStorage           WiiChuck
BowlerCom                    HerkulexServo          Yet_Another_Arduino_Wiegand_Library
DFRobotIRPosition            lx16a-servo
DFW                          RBE1001Lib EspMQTTClient wpi-32u4-library ESP32_BLE_Arduino Adafruit_GFX_Library 	     Adafruit_SSD1306        Adafruit_BusIO"

function sync {

	CURRENT_LIBS=$(ls ~/bin/eclipse-slober-rbe/eclipse/arduinoPlugin/libraries)
	
	for val in $CURRENT_LIBS; do
		IS_DEFAULT=false
		if [ "$val" = "ESP32ServoServer" ]; then
			IS_DEFAULT=true
			mv ~/bin/eclipse-slober-rbe/eclipse/arduinoPlugin/libraries/ESP32ServoServer ~/Arduino/
			rm -rf  ~/Arduino/ESP32ServoServer/core/
			rm -rf  ~/Arduino/ESP32ServoServer/libraries
			rm -rf  ~/Arduino/ESP32ServoServer/spec.d
			rm -rf  ~/Arduino/ESP32ServoServer/sloeber.ino.cpp
			rm -rf  ~/Arduino/ESP32ServoServer/.git
			rm -rf  ~/Arduino/ESP32ServoServer/.settings
			rm -rf  ~/Arduino/ESP32ServoServer/.project
			rm -rf  ~/Arduino/ESP32ServoServer/.cproject
			rm -rf ~/bin/eclipse-slober-rbe/eclipse/arduinoPlugin/libraries/ESP32ServoServer
		fi 
		for valDef in $DEFAULT_SLOBER_LIBS; do
			if [ "$val" = "$valDef" ]; then
				IS_DEFAULT=true
			fi
		done
		if [ "$IS_DEFAULT" = true ] ; then
			echo "Default lib found" $val
		else
			echo "EXTRA lib found, moving" ~/bin/eclipse-slober-rbe/eclipse/arduinoPlugin/libraries/$val " to " ~/Arduino/libraries/
			mkdir -p ~/Arduino/libraries/$val
			VER=$(ls ~/bin/eclipse-slober-rbe/eclipse/arduinoPlugin/libraries/$val)
			for version in $VER; do
				mv ~/bin/eclipse-slober-rbe/eclipse/arduinoPlugin/libraries/$val/$version/* ~/Arduino/libraries/$val
			done		
			rm -rf ~/bin/eclipse-slober-rbe/eclipse/arduinoPlugin/libraries/$val/
		fi
	done
	
	
	
	## toolchain sync
	if ( test -e ~/.arduino15/) then
		if ( test -e ~/.arduino15/packages/) then
			if [ "$(ls -A ~/.arduino15/packages/)" ]; then
			    rsync -avtP --exclude '~/.arduino15/packages/esp32/' ~/.arduino15/packages/* $SLOBER_LOC/eclipse/arduinoPlugin/packages/
			fi
		fi
	fi
	

	
	if (! test -e ~/Arduino/hardware/espressif/4point2/) then

		echo "Starting clone ..."
		mkdir -p ~/Arduino/hardware/espressif 
		cd ~/Arduino/hardware/espressif 
		git clone https://github.com/WPIRoboticsEngineering/arduino-esp32.git 4point2 
		cd 4point2
		git checkout idf-release/v4.2
		git submodule update --init --recursive 
		cd tools 
		python3 get.py
	fi
	

}


#if (! test -e ~/Arduino/libraries/Adafruit_Sensor) then
#	git clone https://github.com/adafruit/Adafruit_Sensor.git ~/Arduino/libraries/Adafruit_Sensor/
#fi

# Iterate the string variable using for loop
for val in $StringVal; do
	LIBCHECK=~/Arduino/libraries/$val
	if (! test -e $LIBCHECK) then
		#convert the underscores to spaced for installing
		LIB=\'$(sed "s/_/ /g" <<< $val)\' 
		echo Installing $LIB
		CMD="$ARDUINO_LOC/arduino --install-library $LIB"
		echo $CMD
		if ( eval "$CMD") then
		 echo "Success install "  $LIB
		else
		 echo "FAULT " $LIB
		fi	
	fi
    
done



if (! test -e ~/bin/ArduinoESP32.desktop) then
	echo "[Desktop Entry]
	Version=1.0
	Type=Application
	Name=RBE Arduino 1.8.13
	Comment=
	Exec=$HOME/bin/arduino-1.8.13/arduino
	Icon=$HOME/bin/arduino-1.8.13/lib/arduino_icon.ico
	Path=
	Terminal=false
	StartupNotify=false" > ~/bin/ArduinoESP32.desktop
	chmod +x ~/bin/ArduinoESP32.desktop
	gio set ~/bin/ArduinoESP32.desktop "metadata::trusted" yes
	ln -s ~/bin/ArduinoESP32.desktop ~/Desktop/ArduinoESP32.desktop
	gio set ~/Desktop/ArduinoESP32.desktop "metadata::trusted" yes
	sudo desktop-file-install $HOME/Desktop/ArduinoESP32.desktop
fi

if (! test -e $ECLIPSE_LOC) then
  if (! test -e ~/bin/linux-sloeber-eclipse.zip ) then
	 wget https://github.com/WPIRoboticsEngineering/ESP32ArduinoEclipseInstaller/releases/download/0.0.0/linux-sloeber-eclipse.zip -O ~/bin/linux-sloeber-eclipse.zip
	fi
	
	unzip ~/bin/linux-sloeber-eclipse.zip -d $SLOBER_LOC
	for val in $StringVal; do
		LIBCHECK=$SLOBER_LOC/eclipse/arduinoPlugin/libraries/$val
		if ( test -e $LIBCHECK) then
			echo $LIBCHECK To Be Erased
			rm -rf $LIBCHECK
		fi   
	done
	grep -v "osgi.instance.area.default" $SLOBER_LOC/eclipse/configuration/config.ini > ~/bin/config.ini
	echo "osgi.instance.area.default=$HOME/rbe-workspace" >>~/bin/config.ini
	cp ~/bin/config.ini 			$SLOBER_LOC/eclipse/configuration/
		
	grep -v "RECENT_WORKSPACES=" $SLOBER_LOC/eclipse/configuration/.settings/org.eclipse.ui.ide.prefs > ~/bin/org.eclipse.ui.ide.prefs
	echo "RECENT_WORKSPACES=$HOME/rbe-workspace" >>~/bin/org.eclipse.ui.ide.prefs
	cp ~/bin/org.eclipse.ui.ide.prefs $SLOBER_LOC/eclipse/configuration/.settings/
	
	
	grep -v "Dosgi.instance.area.default" $SLOBER_LOC/eclipse/eclipse.ini > ~/bin/eclipse.ini
	echo "-Dosgi.instance.area.default=@user.home/rbe-workspace" >>~/bin/eclipse.ini
	cp ~/bin/eclipse.ini $SLOBER_LOC/eclipse/
	
		File=$SLOBER_LOC/eclipse/arduinoPlugin/packages/esp32/hardware/esp32/1.0.4/platform.txt
	TOOLROOT=$SLOBER_LOC/eclipse/arduinoPlugin/packages/esp32/tools/xtensa-esp32-elf-gcc/
	TOOLROOT_PY=$SLOBER_LOC/eclipse/arduinoPlugin/packages/esp32/tools/esptool_py/
	VERSIO_PY=$(ls $TOOLROOT_PY)
	echo  -e "tools.esptool_py.runtime.tools.esptool_py.path=$TOOLROOT_PY/$VERSIO_PY \n$(cat $File)" >$File
	VERSION=$(ls $TOOLROOT)
	echo $VERSION
	echo  -e "runtime.tools.xtensa-esp32-elf-gcc.path=$TOOLROOT/$VERSION \n$(cat $File)" >$File
	
	rsync -avtP  $SLOBER_LOC/eclipse/arduinoPlugin/packages/* ~/.arduino15/packages/
	# Replace the mbedtls definition so it commpiles
	sed -i 's/"mbedtls\/esp_config.h"/\\"mbedtls\/esp_config.h\\"/g' $File 
	# clear stale temp sloeber files
	rm $SLOBER_LOC/eclipse/arduinoPlugin/packages/esp32/hardware/esp32/1.0.4/platform.sloeber.txt
	rm ~/.arduino15/packages//esp32/hardware/esp32/1.0.4/platform.sloeber.txt
	
	

fi



if (! test -e ~/bin/SloeberESP32.desktop) then
	echo "[Desktop Entry]
	Version=1.0
	Type=Application
	Name=RBE Eclipse Sloeber
	Comment=
	Exec=$HOME/bin/linux-eclipse-esp32.sh
	Icon=$HOME/bin/eclipse-slober-rbe/eclipse/icon.xpm
	Path=
	Terminal=false
	StartupNotify=false" > ~/bin/SloeberESP32.desktop
	chmod +x ~/bin/SloeberESP32.desktop
	gio set ~/bin/SloeberESP32.desktop "metadata::trusted" yes
	ln -s ~/bin/SloeberESP32.desktop ~/Desktop/SloeberESP32.desktop
	gio set ~/Desktop/SloeberESP32.desktop "metadata::trusted" yes
	sudo desktop-file-install $HOME/Desktop/SloeberESP32.desktop
fi



sync
#Run SLoeber
$SLOBER_LOC/eclipse/eclipse "$@"

sync
