#define MyAppName "WPI RBE ESP32 Development Toolchain"
#define MyAppSlug "WPI-RBE-esp32"
#define MyAppPublisher "Worcester Polytechnic Institute"
#define MyAppURL "https://github.com/WPIRoboticsEngineering/"
#define MyAppOutput "C:\rbe-inst-output\"
;#define MyAppOutput "F:\\rbe-inst-output\"
#define MyAppVersion "VER"
#define MyAppVerName "WPI RBE ESP32 Development Toolchain VER"
#define MyAppPath "C:\rbe-inst\"
;#define MyAppPath "F:\\rbe-inst\"


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
Source: {#MyAppPath}\*;  DestDir: C:\RBE\; Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\eclipse-workspace\.metadata\.plugins\org.eclipse.core.runtime\.settings\*; 	DestDir: C:\RBE\eclipse-workspace\\.metadata\.plugins\org.eclipse.core.runtime\.settings; 	Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\eclipse-workspace\.metadata\.plugins\org.eclipse.rse.core\profiles\PRF.desktop-tlp1o5p_32629\\*; 	DestDir: C:\RBE\eclipse-workspace\\.metadata\.plugins\org.eclipse.rse.core\profiles\PRF.desktop-tlp1o5p_32629\; 	Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\eclipse-workspace\.metadata\.plugins\org.eclipse.rse.core\initializerMarks\*; 	DestDir: C:\RBE\eclipse-workspace\\.metadata\.plugins\org.eclipse.rse.core\initializerMarks; 	Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\eclipse-workspace\.metadata\.plugins\org.eclipse.ui.workbench\*; 	DestDir: C:\RBE\eclipse-workspace\\.metadata\.plugins\org.eclipse.ui.workbench; 	Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\eclipse-workspace\.metadata\.plugins\org.eclipse.e4.workbench\*; 	DestDir: C:\RBE\eclipse-workspace\\.metadata\.plugins\org.eclipse.e4.workbench; 	Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\eclipse-workspace\.metadata\.plugins\org.eclipse.cdt.make.core\*; 	DestDir: C:\RBE\eclipse-workspace\\.metadata\.plugins\org.eclipse.cdt.make.core; 	Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\eclipse-workspace\.metadata\.plugins\org.eclipse.core.resources\.projects\*; 	DestDir: C:\RBE\eclipse-workspace\\.metadata\.plugins\org.eclipse.core.resources\.projects; 	Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\eclipse-workspace\.metadata\.plugins\org.eclipse.core.resources\.root\*; 	DestDir: C:\RBE\eclipse-workspace\\.metadata\.plugins\org.eclipse.core.resources\.root; 	Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\eclipse-workspace\.metadata\.plugins\org.eclipse.core.resources\.root\.indexes\*; 	DestDir: C:\RBE\eclipse-workspace\\.metadata\.plugins\org.eclipse.core.resources\.root\.indexes; 	Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\eclipse-workspace\.metadata\.plugins\org.eclipse.core.resources\.safetable\*; 	DestDir: C:\RBE\eclipse-workspace\\.metadata\.plugins\org.eclipse.core.resources\.safetable; 	Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\eclipse-workspace\.metadata\.plugins\org.eclipse.mylyn.context.core\*; 	DestDir: C:\RBE\eclipse-workspace\\.metadata\.plugins\org.eclipse.mylyn.context.core; 	Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\eclipse-workspace\.metadata\.plugins\org.eclipse.ui.ide\*; 	DestDir: C:\RBE\eclipse-workspace\\.metadata\.plugins\org.eclipse.ui.ide; 	Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\eclipse-workspace\.metadata\.mylyn\*; 	DestDir: C:\RBE\eclipse-workspace\\.metadata\.mylyn; 	Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\eclipse-workspace\.metadata\\*; 	DestDir: C:\RBE\eclipse-workspace\\.metadata\; 	Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\driver\*; DestDir: C:\RBE\driver; Excludes: .*
Source: {#MyAppPath}\driver\*; DestDir: {win}\inf; Excludes: .*  


[InstallDelete] 
Type: files; Name: "{userappdata}\Arduino15\preferences.txt"

[Dirs]
Name: C:\RBE\sloeber\arduinoPlugin\libraries; Attribs: readonly;   Permissions: everyone-readexec 
Name: C:\RBE\sloeber\arduinoPlugin\downloads; Attribs: readonly;   Permissions: everyone-readexec 
Name: C:\RBE\eclipse-workspace; Permissions: users-full
Name: C:\RBE\ArduinoAppData; Permissions: users-full
Name: C:\RBE\ArduinoSketchbook; Permissions: users-full
Name: C:\RBE\gitRbe; Permissions: users-full
Name: C:\RBE\eclipse-workspace\\.metadata\.plugins\org.eclipse.mylyn.tasks.ui; 	 Permissions: users-full
Name: C:\RBE\eclipse-workspace\\.metadata\.plugins\org.eclipse.ui.intro; 	 Permissions: users-full
Name: C:\RBE\eclipse-workspace\\.metadata\.plugins\org.eclipse.core.resources\.history; 	 Permissions: users-full
Name: C:\RBE\eclipse-workspace\\.metadata\.plugins\org.eclipse.core.resources\.projects\RemoteSystemsTempFiles; 	 Permissions: users-full
Name: C:\RBE\eclipse-workspace\\.metadata\.plugins\org.eclipse.mylyn.bugzilla.core; 	Permissions: users-full
Name: C:\RBE\eclipse-workspace\\.metadata\.plugins\org.eclipse.cdt.core; 	Permissions: users-full
Name: C:\RBE\eclipse-workspace\\.metadata\.plugins\org.eclipse.rse.ui; 	Permissions: users-full
Name: C:\RBE\eclipse-workspace\\.metadata\.plugins\org.eclipse.debug.core; 	Permissions: users-full
Name: C:\RBE\eclipse-workspace\\.metadata\.plugins\org.eclipse.mylyn.context.core\contexts;  	Permissions: users-full
Name: C:\RBE\eclipse-workspace\\.metadata\.mylyn\contexts; 	Permissions: users-full
Name: C:\RBE\eclipse-workspace\\RemoteSystemsTempFiles; 	Permissions: users-full

[Run]
Filename: {sys}\rundll32.exe; Parameters: "setupapi,InstallHinfSection DefaultInstall 128 C:\RBE\driver\silabser.inf"; WorkingDir: C:\RBE\driver\; 

[Icons]
Name: {commondesktop}\Arduino-RBE-ESP32; Filename: C:\RBE\arduino-1.8.5\arduino.exe; WorkingDir: C:\RBE\arduino-1.8.5\; Comment: "WPI RBE Esp32 Arduino";IconFilename: C:\RBE\arduino-1.8.5\lib\arduino_icon.ico;
Name: {commondesktop}\Sloeber-RBE-ESP32; Filename: C:\RBE\sloeber\sloeber-ide.exe; WorkingDir: C:\RBE\sloeber\; Comment: "WPI RBE Esp32 Sloeber";IconFilename: C:\RBE\sloeber\sloeber.ico;


