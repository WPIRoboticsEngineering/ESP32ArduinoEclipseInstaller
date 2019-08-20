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
OutputBaseFilename={#MyAppSlug}-LAB-{#MyAppVersion}
Compression=lzma
SolidCompression=yes
; Tell Windows Explorer to reload the environment
ChangesEnvironment=yes

[Languages]
Name: english; MessagesFile: compiler:Default.isl


[Files]
Source: {#MyAppPath}\arduino-1.8.5\*;  DestDir: C:\RBE\arduino-1.8.5\; Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\sloeber\*;  DestDir: C:\RBE\sloeber\; Flags: recursesubdirs createallsubdirs;

Source: {#MyAppPath}\driver\*; DestDir: C:\RBE\driver; Excludes: .*  
Source: {#MyAppPath}\driver\x86\*; DestDir: C:\RBE\driver\x86; Excludes: .* 
Source: {#MyAppPath}\driver\x64\*; DestDir: C:\RBE\driver\x64; Excludes: .* 

[InstallDelete] 
Type: files; Name: "{localappdata}\Arduino15\preferences.txt"

[Dirs]
Name: C:\RBE\sloeber\arduinoPlugin\libraries; Attribs: readonly;   Permissions: everyone-readexec 
Name: C:\RBE\sloeber\arduinoPlugin\downloads; Attribs: readonly;   Permissions: everyone-readexec 

[run]
filename: {sys}\rundll32.exe; parameters: "setupapi,installhinfsection defaultinstall 128 c:\rbe\driver\silabser.inf"; workingdir: c:\rbe\driver\; 

[icons]
name: {commondesktop}\arduino-rbe-esp32; filename: c:\rbe\arduino-1.8.5\arduino.exe; workingdir: c:\rbe\arduino-1.8.5\; comment: "wpi rbe esp32 arduino";iconfilename: c:\rbe\arduino-1.8.5\lib\arduino_icon.ico;
name: {commondesktop}\sloeber-rbe-esp32; filename: c:\rbe\sloeber\sloeber-ide.exe; workingdir: c:\rbe\sloeber\; comment: "wpi rbe esp32 sloeber";iconfilename: c:\rbe\sloeber\sloeber.ico;

[code]

// utility functions for inno setup
//   used to add/remove programs from the windows firewall rules
// code originally from http://news.jrsoftware.org/news/innosetup/msg43799.html
procedure setfirewallexception(appname,filename:string);
var
  firewallobject: variant;
  firewallmanager: variant;
  firewallprofile: variant;
  objPolicy:       variant;
  objProfile:      variant;
begin
  try
    firewallobject := createoleobject('hnetcfg.fwauthorizedapplication');
    firewallobject.processimagefilename := filename;
    firewallobject.name := appname;
    firewallobject.scope := 0;
    firewallobject.ipversion := 2;
    firewallobject.enabled := true;
    firewallmanager := createoleobject('hnetcfg.fwmgr');
    objPolicy := firewallmanager.LocalPolicy
    objProfile := objPolicy.GetProfileByType(1)

    firewallprofile := firewallmanager.localpolicy.currentprofile;
    firewallprofile.authorizedapplications.add(firewallobject);
    objProfile.AuthorizedApplications.Add(firewallobject);
    
  except
  end;
end;

procedure removefirewallexception( filename:string );
var
  firewallmanager: variant;
  firewallprofile: variant;
begin
  try
    firewallmanager := createoleobject('hnetcfg.fwmgr');
    firewallprofile := firewallmanager.localpolicy.currentprofile;
    firewallprofile.authorizedapplications.remove(filename);
  except
  end;
end;

procedure curstepchanged(curstep: tsetupstep);
begin
  if curstep=sspostinstall then
     setfirewallexception('arduino', 'c:\rbe\arduino-1.8.5\java\bin\javaw.exe');
  if curstep=sspostinstall then 
     setfirewallexception('sloeber-ide', 'c:\rbe\sloeber\sloeber-ide.exe');  
end;

procedure curuninstallstepchanged(curuninstallstep: tuninstallstep);
begin
  if curuninstallstep=uspostuninstall then
     removefirewallexception('arduino', 'c:\rbe\arduino-1.8.5\java\bin\javaw.exe');
  if curuninstallstep=uspostuninstall then 
     removefirewallexception('sloeber-ide', 'c:\rbe\sloeber\sloeber-ide.exe');
end;
