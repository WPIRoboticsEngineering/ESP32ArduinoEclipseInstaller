#define MyAppName "WPI RBE ESP32 Development Toolchain"
#define MyAppSlug "WPI-RBE-esp32"
#define MyAppPublisher "Worcester Polytechnic Institute"
#define MyAppURL "https://github.com/WPIRoboticsEngineering/"
;#define MyAppOutput "C:\rbe-inst-output"
#define MyAppOutput "F:\\rbe-inst-output"
#define MyAppVersion "VER"
#define MyAppVerName "WPI RBE ESP32 Development Toolchain VER"
;#define MyAppPath "C:\rbe-inst\"
#define MyAppPath "F:\\rbe-inst\"


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
;Source: {#MyAppPath}\*;  DestDir: C:\RBE\; Flags: recursesubdirs createallsubdirs;
;Source: {#MyAppPath}\eclipse-workspace\.metadata\.plugins\org.eclipse.core.runtime\.settings\*; \
      DestDir: C:\RBE\eclipse-workspace\.metadata\.plugins\org.eclipse.core.runtime\.settings\;  \
      Flags: recursesubdirs createallsubdirs;
;Source: {#MyAppPath}\eclipse-workspace\.metadata\*; \
      DestDir: C:\RBE\eclipse-workspace\.metadata;  \
      Flags: recursesubdirs createallsubdirs;
;Source: {#MyAppPath}\eclipse-workspace\.metadata\.mylyn\*; \
      DestDir: C:\RBE\eclipse-workspace\.metadata\.mylyn\;  \
      Flags: recursesubdirs createallsubdirs;
;Source: {#MyAppPath}\eclipse-workspace\*; \
      DestDir: C:\RBE\eclipse-workspace\;  \
      Flags: recursesubdirs createallsubdirs;
Source: {#MyAppPath}\driver\*; DestDir: C:\RBE\driver; Excludes: .*
Source: {#MyAppPath}\driver\*; DestDir: {win}\inf; Excludes: .*  AfterInstall: CurStepChanged


[InstallDelete] 
Type: files; Name: "{userappdata}\Arduino15\preferences.txt"

[Dirs]
Name: C:\RBE\sloeber\arduinoPlugin\libraries; Attribs: readonly
Name: C:\RBE\eclipse-workspace; Permissions: users-full
Name: C:\RBE\ArduinoAppData; Permissions: users-full
Name: C:\RBE\ArduinoSketchbook; Permissions: users-full
Name: C:\RBE\gitRbe; Permissions: users-full

[Run]
Filename: {sys}\rundll32.exe; Parameters: "setupapi,InstallHinfSection DefaultInstall 128 C:\RBE\driver\silabser.inf"; WorkingDir: C:\RBE\driver\; 

[Icons]
Name: {commondesktop}\Arduino-RBE-ESP32; Filename: C:\RBE\arduino-1.8.5\arduino.exe; WorkingDir: C:\RBE\arduino-1.8.5\; Comment: "WPI RBE Esp32 Arduino";IconFilename: C:\RBE\arduino-1.8.5\lib\arduino_icon.ico;
Name: {commondesktop}\Sloeber-RBE-ESP32; Filename: C:\RBE\sloeber\sloeber-ide.exe; WorkingDir: C:\RBE\sloeber\; Comment: "WPI RBE Esp32 Sloeber";IconFilename: C:\RBE\sloeber\sloeber.ico;

[Code]
procedure DirectoryCopy(SourcePath, DestPath: string);
var
  FindRec: TFindRec;
  SourceFilePath: string;
  DestFilePath: string;
begin
  if FindFirst(SourcePath + '\*', FindRec) then
  begin
    try
      repeat
        if (FindRec.Name <> '.') and (FindRec.Name <> '..') then
        begin
          SourceFilePath := SourcePath + '\' + FindRec.Name;
          DestFilePath := DestPath + '\' + FindRec.Name;
          if FindRec.Attributes and FILE_ATTRIBUTE_DIRECTORY = 0 then
          begin
            if FileCopy(SourceFilePath, DestFilePath, False) then
            begin
              Log(Format('Copied %s to %s', [SourceFilePath, DestFilePath]));
            end
              else
            begin
              Log(Format('Failed to copy %s to %s', [SourceFilePath, DestFilePath]));
            end;
          end
            else
          begin
            if DirExists(DestFilePath) or CreateDir(DestFilePath) then
            begin
              Log(Format('Created %s', [DestFilePath]));
              DirectoryCopy(SourceFilePath, DestFilePath);
            end
              else
            begin
              Log(Format('Failed to create %s', [DestFilePath]));
            end;
          end;
        end;
      until not FindNext(FindRec);
    finally
      FindClose(FindRec);
    end;
  end
    else
  begin
    Log(Format('Failed to list %s', [SourcePath]));
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssInstall then
  begin
    Log('Installing files');
    DirectoryCopy(ExpandConstant('{#MyAppPath}eclipse-workspace\'), ExpandConstant('C:\RBE\eclipse-workspace\'));
  end;
end;

