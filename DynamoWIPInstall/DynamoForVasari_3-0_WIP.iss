; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
AppName=Vasari 3.0 WIP Dynamo Add-In
AppVerName=Dynamo For Vasari 0.2
AppPublisher=Autodesk, Inc.
AppID={{5F61EC1C-39EF-4E21-80DA-55621BB20B2A}
AppCopyright=
AppPublisherURL=http://labs.autodesk.com/utilities/vasari
AppSupportURL=
AppUpdatesURL=
AppVersion=2013
VersionInfoVersion=2013.0
VersionInfoCompany=
VersionInfoDescription==Vasari 3.0 WIP Dynamo Add-In
VersionInfoTextVersion==Vasari 3.0 WIP Dynamo Add-In
VersionInfoCopyright=
DefaultDirName=C:\VasariWIP\3-0\Dynamo
DefaultGroupName=
OutputDir=.
OutputBaseFilename=Vasari_3-0_WIP_Dynamo_Add-In
SetupIconFile=Nodes_32_32.ico
Compression=lzma
SolidCompression=true
RestartIfNeededByRun=false
FlatComponentsList=false
ShowLanguageDialog=auto
DirExistsWarning=no
UninstallFilesDir={app}\Uninstall
UninstallDisplayIcon={app}\Nodes_32_32.ico
UninstallDisplayName=Vasari 3.0 WIP Dynamo Add-In
PrivilegesRequired=admin

[Types]
Name: "full"; Description: "Full installation"
Name: "compact"; Description: "Compact installation"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Dirs]
Name: "{app}\definitions"
Name: "{app}\samples"

[Components]
Name: "DynamoForVasariWIP"; Description: "Dynamo For Vasari WIP"; Types: full compact custom; Flags: fixed
Name: "DynamoTrainingFiles"; Description: "Dynamo Training Files"; Types: full

[Files]
;Core Files
Source: DynamoRevit.dll; DestDir: {app}; Flags: ignoreversion overwritereadonly; Components: DynamoForVasariWIP
Source: DynamoElements.dll; DestDir: {app}; Flags: ignoreversion overwritereadonly; Components: DynamoForVasariWIP
Source: DragCanvas.dll; DestDir: {app}; Flags: ignoreversion overwritereadonly; Components: DynamoForVasariWIP
Source: FSchemeInterop.dll; DestDir: {app}; Flags: ignoreversion overwritereadonly; Components: DynamoForVasariWIP
Source: FScheme.dll; DestDir: {app}; Flags: ignoreversion overwritereadonly; Components: DynamoForVasariWIP
Source: Nodes_32_32.ico; DestDir: {app}; Flags: ignoreversion overwritereadonly; Components: DynamoForVasariWIP
Source: readme.txt; DestDir: {app}; Flags: isreadme ignoreversion overwritereadonly; Components: DynamoForVasariWIP
Source: fsharp_redist.exe; DestDir: {app}; Flags: ignoreversion overwritereadonly; Components: DynamoForVasariWIP
;Training Files
Source: samples\*.*; DestDir: {app}\samples; Flags: ignoreversion overwritereadonly; Components: DynamoTrainingFiles
Source: definitions\*.dyf; DestDir: {app}\definitions; Flags: ignoreversion overwritereadonly; Components: DynamoTrainingFiles

[UninstallDelete]
Type: files; Name: "{userappdata}\Autodesk\Vasari\Addins\TP2.5\DynamoforVasari_2.5_WIP.addin"

[Run]
Filename: "{app}\fsharp_redist.exe"; Parameters: "/q"; Flags: runascurrentuser
;Filename: "del"; Parameters: "/q {app}\fsharp_redist.exe"; Flags: postinstall runascurrentuser runhidden

[Code]
{ HANDLE INSTALL PROCESS STEPS }
procedure CurStepChanged(CurStep: TSetupStep);
var
  AddInFilePath: String;
  AddInFileContents: String;
begin

  if CurStep = ssPostInstall then
  begin

	{ GET LOCATION OF USER AppData (Roaming) }
	AddInFilePath := ExpandConstant('{userappdata}\Autodesk\Vasari\Addins\2013\DynamoforVasari_3-0_WIP.addin');

	{ CREATE NEW ADDIN FILE }
	AddInFileContents := '<?xml version="1.0" encoding="utf-8" standalone="no"?>' + #13#10;
	AddInFileContents := AddInFileContents + '<RevitAddIns>' + #13#10;
	AddInFileContents := AddInFileContents + '  <AddIn Type="Application">' + #13#10;
    AddInFileContents := AddInFileContents + '    <Name>Dynamo For Vasari</Name>' + #13#10;
	AddInFileContents := AddInFileContents + '    <Assembly>'  + ExpandConstant('{app}') + '\DynamoRevit.dll</Assembly>' + #13#10;
	AddInFileContents := AddInFileContents + '    <AddInId>188B9080-EEBE-40C3-865A-8FC31DEEC12F</AddInId>' + #13#10;
	AddInFileContents := AddInFileContents + '    <FullClassName>Dynamo.Applications.DynamoRevitApp</FullClassName>' + #13#10;
	AddInFileContents := AddInFileContents + '  <VendorId>GOBD</VendorId>' + #13#10;
	AddInFileContents := AddInFileContents + '  <VendorDescription>dyanmo, github.com/ikeough/dynamo</VendorDescription>' + #13#10;
	AddInFileContents := AddInFileContents + '  </AddIn>' + #13#10;
	AddInFileContents := AddInFileContents + '  <AddIn Type="Command">' + #13#10;
	AddInFileContents := AddInFileContents + '    <Assembly>'  + ExpandConstant('{app}') + '\DynamoRevit.dll</Assembly>' + #13#10;
	AddInFileContents := AddInFileContents + '    <AddInId>dc09be67-aa31-4ea7-86c9-d06c080cd3e9</AddInId>' + #13#10;
	AddInFileContents := AddInFileContents + '    <FullClassName>Dynamo.Applications.DynamoRevit</FullClassName>' + #13#10;
	AddInFileContents := AddInFileContents + '  <VendorId>GOBD</VendorId>' + #13#10;
	AddInFileContents := AddInFileContents + '  <VendorDescription>dynamo, github.com/ikeough/dynamo</VendorDescription>' + #13#10;
    AddInFileContents := AddInFileContents + '    <Text>DynamoForVasari</Text>' + #13#10;
	AddInFileContents := AddInFileContents + '    <Description>Visual programming using the Revit API.</Description>' + #13#10;
	AddInFileContents := AddInFileContents + '  </AddIn>' + #13#10;
    AddInFileContents := AddInFileContents + '</RevitAddIns>' + #13#10;
	SaveStringToFile(AddInFilePath, AddInFileContents, False);

  end;
end;
