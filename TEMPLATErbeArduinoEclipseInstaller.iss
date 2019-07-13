#define MyAppName "WPI RBE ESP32 Development Toolchain"
#define MyAppSlug "WPI-RBE-esp32"
#define MyAppPublisher "Worcester Polytechnic Institute"
#define MyAppURL "https://github.com/WPIRoboticsEngineering/"
#define MyAppOutput "C:\rbe-inst-output"

#define MyAppVersion "VER"
#define MyAppVerName "WPI RBE ESP32 Development Toolchain VER"
#define MyAppPath "C:\rbe-inst\"



[Setup]
AppId={{A6FF93DE-2451-4610-8C9B-64DC2546DBE8}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppVerName}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName=C:\RBE\
DefaultGroupName={#MyAppName}
LicenseFile={#MyAppPath}\LICENSE.txt
OutputDir={#MyAppOutput}
OutputBaseFilename={#MyAppSlug}-{#MyAppVersion}
Compression=lzma
SolidCompression=yes
; Tell Windows Explorer to reload the environment
ChangesEnvironment=yes

[Languages]
Name: english; MessagesFile: compiler:Default.isl


[Files]
Source: {#MyAppPath}\*; DestDir: C:\RBE\; Flags: recursesubdirs createallsubdirs; Languages: ; Excludes: .* 
Source: {#MyAppPath}\driver\*; DestDir: C:\RBE\driver; Excludes: .*
Source: {#MyAppPath}\driver\*; DestDir: {win}\inf; Excludes: .*
Source: {#MyAppPath}\..\sloeber.ico; DestDir: C:\RBE\sloeber\; Excludes: .*
Source: {#MyAppPath}\..\org.eclipse.ui.ide.prefs; DestDir: C:\RBE\sloeber\configuration\.settings\; Excludes: .*

[InstallDelete] 
Type: files; Name: "{userappdata}\Arduino15\preferences.txt"

[Dirs]
Name: C:\RBE\sloeber\arduinoPlugin\libraries; Attribs: readonly
Name: C:\RBE\eclipse-workspace; Permissions: users-full
Name: C:\RBE\ArduinoAppData; Permissions: users-full
Name: C:\RBE\ArduinoSketchbook; Permissions: users-full

[Run]
Filename: {sys}\rundll32.exe; Parameters: "setupapi,InstallHinfSection DefaultInstall 128 C:\RBE\driver\silabser.inf"; WorkingDir: C:\RBE\driver\; 

[Icons]
Name: {commondesktop}\Arduino-RBE-ESP32; Filename: C:\RBE\arduino-1.8.5\arduino.exe; WorkingDir: C:\RBE\arduino-1.8.5\; Comment: "WPI RBE Esp32 Arduino";IconFilename: C:\RBE\arduino-1.8.5\lib\arduino_icon.ico;
Name: {commondesktop}\Sloeber-RBE-ESP32; Filename: C:\RBE\sloeber\sloeber-ide.exe; WorkingDir: C:\RBE\sloeber\; Comment: "WPI RBE Esp32 Sloeber";IconFilename: C:\RBE\sloeber\sloeber.ico;

