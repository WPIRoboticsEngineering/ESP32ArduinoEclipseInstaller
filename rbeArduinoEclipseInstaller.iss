#define MyAppName "WPI RBE ESP32 Development Toolchain"
#define MyAppSlug "wpirbeesp32"
#define MyAppPublisher "Worcester Polytechnic Institute"
#define MyAppURL "https://github.com/WPIRoboticsEngineering/"
#define MyAppOutput "."

#define MyAppVersion "0.0.1"
#define MyAppVerName "WPI RBE ESP32 Development Toolchain 0.0.1"
#define MyAppPath ".\RBE\"



[Setup]
AppId={{A6FF93DE-2451-4610-8C9B-64DC2546DBE8}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppVerName}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
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
;Source: .\driver\*; DestDir: C:\RBE\driver; Excludes: .*
;Source: .\driver\*; DestDir: {win}\inf; Excludes: .*

[Run]
;Filename: {sys}\rundll32.exe; Parameters: "setupapi,InstallHinfSection DefaultInstall 128 {app}\{#MyAppSlug}-{#MyAppVersion}\driver\NRDyIO.inf"; WorkingDir: {app}\{#MyAppSlug}-{#MyAppVersion}\driver\; Flags: 32bit;

[Icons]
;Name: {group}\BowlerStudio; Filename: {app}\{#MyAppSlug}-{#MyAppVersion}\bin\BowlerStudio.jar 
;Name: {group}\{#MyAppVerName}; Filename: {app}\{#MyAppSlug}-{#MyAppVersion}\
;Name: {commondesktop}\BowlerStudio; Filename: {app}\{#MyAppSlug}-{#MyAppVersion}\bin\BowlerStudio.jar; WorkingDir: {app}\{#MyAppSlug}-{#MyAppVersion}\bin\; Comment: "Commonwealth Robotics BowlerStudio";IconFilename: {app}\{#MyAppSlug}-{#MyAppVersion}\bin\NeuronRobotics.ico;


[Registry]
Root: HKLM; SubKey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment";ValueType:string; ValueName: "BOWLER_HOME"; ValueData: {app}\{#MyAppSlug}-{#MyAppVersion};  Flags: preservestringtype ;
Root: HKLM; SubKey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment";ValueType:string; ValueName: "OPENCV_DIR"; ValueData: {app}\{#MyAppSlug}-{#MyAppVersion}\build\CVARCH\vc11;  Flags: preservestringtype
