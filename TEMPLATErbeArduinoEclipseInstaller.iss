#define MyAppName "WPI RBE ESP32 Development Toolchain"
#define MyAppSlug "WPI-RBE-esp32"
#define MyAppPublisher "Worcester Polytechnic Institute"
#define MyAppURL "https://github.com/WPIRoboticsEngineering/"



#define MyAppOutput "C:\rbe-inst-output\"
;#define MyAppOutput "F:\\rbe-inst-output\"

#define MyAppPath "C:\rbe-inst\"
;#define MyAppPath "F:\\rbe-inst\"


#define MyAppVersion "VER"
#define MyAppVerName "WPI RBE ESP32 Development Toolchain VER"





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
Source: {#MyAppPath}\arduino-1.8.5\*;  DestDir: C:\RBE\arduino-1.8.5\; Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\ArduinoAppData\*;  DestDir: C:\RBE\ArduinoAppData\; Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\ArduinoSketchbook\*;  DestDir: C:\RBE\ArduinoSketchbook\; Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\sloeber\*;  DestDir: C:\RBE\sloeber\; Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\graphviz\*;  DestDir: C:\RBE\graphviz\; Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\doxygen\*;  DestDir: C:\RBE\doxygen\; Flags: recursesubdirs createallsubdirs;

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
Source: {#MyAppPath}\driver\x86\*; DestDir: C:\RBE\driver\x86; Excludes: .* 
Source: {#MyAppPath}\driver\x64\*; DestDir: C:\RBE\driver\x64; Excludes: .* 

[InstallDelete] 
Type: files; Name: "{localappdata}\Arduino15\preferences.txt"

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

[run]
Filename: {sys}\rundll32.exe; Parameters: "setupapi,InstallHinfSection DefaultInstall 128 C:\RBE\driver\silabser.inf"; WorkingDir: C:\RBE\driver\;

[icons]
name: {commondesktop}\arduino-rbe-esp32; filename: c:\rbe\arduino-1.8.5\arduino.exe; workingdir: c:\rbe\arduino-1.8.5\; comment: "wpi rbe esp32 arduino";iconfilename: c:\rbe\arduino-1.8.5\lib\arduino_icon.ico;
name: {commondesktop}\sloeber-rbe-esp32; filename: c:\rbe\sloeber\sloeber-ide.exe; workingdir: c:\rbe\sloeber\; comment: "wpi rbe esp32 sloeber";iconfilename: c:\rbe\sloeber\sloeber.ico;
[code]

// utility functions for inno setup
//   used to add/remove programs from the windows firewall rules
// code originally from http://news.jrsoftware.org/news/innosetup/msg43799.html
procedure setfirewallexceptionLocal(appname,filename:string);
var
  objApplication: variant;
  objFirewall: variant;
  objPolicyLocal: variant;
	objProfile: variant;
	colApplications: variant; 
	objPolicy: variant;
begin
  try
    objApplication := createoleobject('hnetcfg.fwauthorizedapplication');
    objApplication.processimagefilename := filename;
    objApplication.name := appname;
    objApplication.scope := 0;
    objApplication.ipversion := 2;
    objApplication.enabled := true;
    objFirewall := createoleobject('hnetcfg.fwmgr');
    //objFirewall.LocalPolicy.objPolicyLocal.GetProfileByType(1).AuthorizedApplications.Add(objApplication);
    objPolicyLocal := objFirewall.localpolicy.currentprofile;
    objPolicyLocal.authorizedapplications.add(objApplication);
   except
  end;
end;

// utility functions for inno setup
//   used to add/remove programs from the windows firewall rules
// code originally from http://news.jrsoftware.org/news/innosetup/msg43799.html
procedure setfirewallexception(appname,filename:string);
var
  objApplication: variant;
  objFirewall: variant;
  objPolicyLocal: variant;
	objProfile: variant;
	colApplications: variant; 
	objPolicy: variant;
begin
  try
    objApplication := createoleobject('hnetcfg.fwauthorizedapplication');
    objApplication.processimagefilename := filename;
    objApplication.name := appname;
    objApplication.scope := 0;
    objApplication.ipversion := 2;
    objApplication.enabled := true;
    objFirewall := createoleobject('hnetcfg.fwmgr');
		objPolicy := objFirewall.LocalPolicy ;
    objProfile := objPolicy.GetProfileByType(1) ;
		colApplications := objProfile.AuthorizedApplications ;
		colApplications.Add(objApplication) ;
    setfirewallexceptionLocal(appname,filename);
   except
  end;
end;



procedure removefirewallexception( filename:string );
var
  objFirewall: variant;
  objPolicyLocal: variant;
begin
  try
    objFirewall := createoleobject('hnetcfg.fwmgr');
    objPolicyLocal := objFirewall.localpolicy.currentprofile;
    objPolicyLocal.authorizedapplications.remove(filename);
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
     removefirewallexception( 'c:\rbe\arduino-1.8.5\java\bin\javaw.exe');
  if curuninstallstep=uspostuninstall then 
     removefirewallexception( 'c:\rbe\sloeber\sloeber-ide.exe');
end;

function NeedsAddPath(Param: string): boolean;
var
  OrigPath: string;
begin
  if not RegQueryStringValue(HKEY_LOCAL_MACHINE,
    'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
    'Path', OrigPath)
  then begin
    Result := True;
    exit;
  end;
  { look for the path with leading and trailing semicolon }
  { Pos() returns 0 if not found }
  Result := Pos(';' + Param + ';', ';' + OrigPath + ';') = 0;
end;

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; \
    ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};C:\RBE\graphviz\release\bin"; \
    Check: NeedsAddPath('C:\RBE\graphviz\release\bin')
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; \
    ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};C:\RBE\doxygen"; \
    Check: NeedsAddPath('C:\RBE\doxygen')
