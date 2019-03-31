unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ShellApi, Menus, StrUtils, Registry,
  ComCtrls, IniFiles;

function GetRegistryData(RootKey: HKEY; Key, Value: string): variant;
function GetHint(version: string): string;
function ObtenerListado: string;
function bajasoft(src: string): string;
function instalasoft: string;
function tamanoFichero1(sFileToExamine: string): Longword;
function leeini(seccion: string): string;
function GetIdFromListBoxText(const Text: string): string;

implementation

uses unit1, unit2, unit3, unit6;

function GetIdFromListBoxText(const Text: string): string;
var
  P1, P2: Integer;
begin
  P1 := Pos('[', Text);
  P2 := Pos(']', Text);
  if (P1 <> 0) and (P2 <> 0) then
    Result := Copy(Text, P1 + 1, P2 - P1 - 1)
  else
    Result := '';
end;

function tamanoFichero1(sFileToExamine: string): Longword;
var
  FileHandle: THandle;
  FileSize: Longword;
begin
  FileHandle := CreateFile(PChar(sFileToExamine),
    GENERIC_READ,
    0, {exclusivo}
    nil, {seguridad}
    OPEN_EXISTING,
    FILE_ATTRIBUTE_NORMAL,
    0);
  FileSize := GetFileSize(FileHandle, nil);
  Result := FileSize;
  CloseHandle(FileHandle);
end;

function GetRegistryData(RootKey: HKEY; Key, Value: string): variant;
var
  Reg: TRegistry;
  RegDataType: TRegDataType;
  DataSize, Len: integer;
  s: string;
label
  cantread;
begin
  Reg := nil;
  try
    Reg := TRegistry.Create(KEY_QUERY_VALUE);
    Reg.RootKey := RootKey;
    if Reg.OpenKeyReadOnly(Key) then
    begin
      try
        RegDataType := Reg.GetDataType(Value);
        if (RegDataType = rdString) or
          (RegDataType = rdExpandString) then
          Result := Reg.ReadString(Value)
        else if RegDataType = rdInteger then
          Result := Reg.ReadInteger(Value)
        else if RegDataType = rdBinary then
        begin
          DataSize := Reg.GetDataSize(Value);
          if DataSize = -1 then
            goto cantread;
          SetLength(s, DataSize);
          Len := Reg.ReadBinaryData(Value, PChar(s)^, DataSize);
          if Len <> DataSize then
            goto cantread;
          Result := s;
        end
        else
          cantread:
          raise Exception.Create(SysErrorMessage(ERROR_CANTREAD));
      except
        s := ''; // Deallocates memory if allocated
        Reg.CloseKey;
        raise;
      end;
      Reg.CloseKey;
    end
    else
      raise Exception.Create(SysErrorMessage(GetLastError));
  except
    Reg.Free;
    raise;
  end;
  Reg.Free;
end;
//funcion que obtiene un listado de items seleccionados del listbox1

function ObtenerListado: string;
var
  ii: integer;
begin
  with Form1.listbox1 do
  begin
    Form1.memo2.Lines.clear;
    for ii := 0 to items.Count - 1 do
    begin
      if Selected[ii] then
      begin
        Form1.memo2.Lines.Delimiter := ' ';
        Form1.memo2.Lines.Add(Form1.Listbox1.Items.Strings[ii]);
        Result := Form1.memo2.Lines.DelimitedText;
      end;
    end;
  end;
end;

//funcion para obtener el hint de los items del listbox

function GetHint(version: string): string;
begin
  with Form1.ListBox1 do
  begin
    if Items[Itemindex] = 'adwcleaner' then
      Hint := 'AdwCleaner ' + version
    else if Items[Itemindex] = 'googleearth' then
      Hint := 'Google Earth ' + version
    else if Items[Itemindex] = 'ChocolateyGUI' then
      Hint := 'Chocolatey GUI ' + version
    else if Items[Itemindex] = 'malwarebytes' then
      Hint := 'Malwarebytes Anti-Malware ' + version
    else if Items[Itemindex] = 'hijackthis' then
      Hint := 'HijackThis - Anti Hijackers Muy potente ' + version
    else if Items[Itemindex] = 'jrt' then
      Hint := 'Junkware Removal Tool ' + version
    else if Items[Itemindex] = 'speccy' then
      Hint := 'Speccy ' + version
    else if Items[Itemindex] = 'defraggler' then
      Hint := 'Defraggler ' + version
    else if Items[Itemindex] = 'desktopok' then
      Hint := 'Aplicacion para guardar el estado del escritorio ' + version
    else if Items[Itemindex] = 'getdataback-simple' then
      Hint := 'Get Data Back For NTF - Simple ' + version
    else if Items[Itemindex] = 'leagueoflegends' then
      Hint := 'League of Legends ' + version
    else if Items[Itemindex] = 'avastfreeantivirus' then
      Hint := 'Avast Free Antivirus ' + version
    else if Items[Itemindex] = 'revouninstallerpro' then
      Hint := 'Revo Unistaller Pro ' + version + #13 + #10 +
        'Clic derecho para obtener el crack'
    else if Items[Itemindex] = 'ccleaner' then
      Hint := 'Ccleaner ' + version
    else if Items[Itemindex] = 'vlc' then
      Hint := 'Vlc - Reproductor Multimedia ' + version
    else if Items[Itemindex] = 'aimp' then
      Hint := 'Aimp - Reproductor Audio ' + version
    else if Items[Itemindex] = 'foxitreader' then
      Hint := 'Foxit Reader - Lector PDF ' + version
    else if Items[Itemindex] = 'libreoffice-fresh' then
      Hint := 'Libre Office-Fresh - Open Source ' + version
    else if Items[Itemindex] = 'adobereader' then
      Hint := 'Adobe Acrobat Reader ' + version
    else if Items[Itemindex] = 'flashplayerplugin' then
      Hint := 'Plugin Flash Player ' + version
    else if Items[Itemindex] = 'firefox' then
      Hint := 'Mozilla Firefox ' + version
    else if Items[Itemindex] = 'googlechrome' then
      Hint := 'Google Chrome ' + version
    else if Items[Itemindex] = 'utorrent' then
      Hint := 'uTorrent ' + version
    else if Items[Itemindex] = 'jdownloader' then
      Hint := 'JDownloader ' + version
    else if Items[Itemindex] = 'vmwareworkstation' then
      Hint := 'VMWare Workstation ' + version + #13 + #10 +
        'Clic derecho para obtener el crack'
    else if Items[Itemindex] = 'whatsapp' then
      Hint := 'WhatsAPP ' + version
    else if Items[Itemindex] = 'dropbox' then
      Hint := 'Dropbox ' + version
    else if Items[Itemindex] = 'spotify' then
      Hint := 'Spotify ' + version
    else if Items[Itemindex] = 'skype' then
      Hint := 'Skype for desktop ' + version
    else if Items[Itemindex] = 'winrar' then
      Hint := 'Winrar ' + version + #13 + #10 +
        'Clic derecho para obtener el crack'
    else if Items[Itemindex] = 'poweriso' then
      Hint := 'Power ISO ' + version + #13 + #10 +
        'Clic derecho para obtener el crack'
    else if Items[Itemindex] = 'gimp' then
      Hint := 'GIMP - Editor de imagenes ' + version
    else if Items[Itemindex] = 'quicktime' then
      Hint := 'Quick Time Player ' + version
    else if Items[Itemindex] = 'chocolatey' then
      Hint := 'Chocolatey ' + version
    else if Items[Itemindex] = 'revo-uninstaller' then
      Hint := 'Revo Unistaller FREE ' + version
    else if Items[Itemindex] = 'teamviewer' then
      Hint := 'TeamViewer ' + version
    else if Items[Itemindex] = 'teamviewer-qs' then
      Hint := 'TeamViewer - Quick Support (no instalable)'
    else if Items[Itemindex] = 'teracopy' then
      Hint := 'TeraCopy - Gestor de copiado de archivos ' + version
    else if Items[Itemindex] = 'steam' then
      Hint := 'Steam ' + version
    else if Items[Itemindex] = 'kav' then
      Hint := 'Kaspersky Anti-Virus ' + version
    else if Items[Itemindex] = 'jre8' then
      Hint := 'Java ' + version
    else if Items[Itemindex] = 'dotnet4.7.2' then
      Hint := 'Net Framework 4.7.2'
    else if Items[Itemindex] = 'dotnet4.5' then
      Hint := 'Net Framework 4.5'
    else if Items[Itemindex] = 'dotnet3.5' then
      Hint := 'Net Framework 3.5'
    else
    begin
      Hint := '';
    end;
  end;
end;
//baja winrar

function bajasoft(src: string): string;
var
  F: TFileStream;
begin
  //si estamos bajando un soft usamos otras variable
  if Form1.Listbox1.Items[Form1.Listbox1.Itemindex] = 'winrar' then
  begin
    mfile := Form1.Listbox1.Items[Form1.Listbox1.Itemindex] + '-baja.ps1';
    prog := src;
  end
  else
  begin
    //asignamos el nombre del archivo ps1 segun el soft seleccionado
    mfile := Form1.Listbox1.Items[Form1.Listbox1.Itemindex] + '.ps1';
  end;
  //si no hay nada seleccionado, no permite continuar
  if Form1.Listbox1.ItemIndex = -1 then
  begin
    ShowMessage('Ningun programa seleccionado');
  end
  else
  begin
    try
      //si no existe el archivo .ps1 lo crea
      if not fileexists(mFile) then
      begin
        F := TFileStream.Create(mFile, fmCreate);
        a := '$client = new-object System.Net.WebClient' + #13 + #10;
        b := prog + #13 + #10;
        c := prog1;
        F.Write(a[1], Length(a));
        F.Write(b[1], Length(b));
        F.Write(c[1], Length(c));
        F.Free;
      end
      else
      begin
        //si ya existe el archivo .ps1 nos pregunta si queremos reemplazarlo
        buttonSelected :=
          MessageDlg('Ya existe el archivo. Desea Reemplazarlo?',
          mtConfirmation,
          [mbYes, mbNo], 0);
        if buttonSelected = mrYes then
        begin
          F := TFileStream.Create(mFile, fmCreate);
          a := '$client = new-object System.Net.WebClient' + #13 + #10;
          b := prog + #13 + #10;
          c := prog1;
          F.Write(a[1], Length(a));
          F.Write(b[1], Length(b));
          F.Write(c[1], Length(c));
          F.Free;
        end;
      end;
    finally
      WinExec(PCHAR('cmd.exe /C powershell.exe -file ' + mFile), SW_HIDE);
    end;
    Form1.Timer4.Enabled := True;
  end;
end;
//Instala winrar luego de bajarlo

function instalasoft: string;
var
  x: integer;
begin
  if Form1.Listbox1.ItemIndex = -1 then
  begin
    ShowMessage('Debe seleccionar un paquete para instalar');
  end
  else
  begin
    Form1.Label3.Caption := '10%';
    Form1.Progressbar1.position := 10;
    WinExec('cmd.exe /C start /WAIT winrar-x64-570es.exe /S', SW_HIDE);
    Application.ProcessMessages;
    for x := 0 to 100 do
    begin
      Form1.Progressbar1.Position := Form1.ProgressBar1.Position + 5;
      Form1.Label3.Caption := IntToStr(Form1.ProgressBar1.Position * 100 div
        Form1.ProgressBar1.Max) + '%'; // funciona, saca el porcentaje
      Application.ProcessMessages;
    end;
    Form1.Memo2.Lines.Clear;
    ShowCursor(True);
    Application.ProcessMessages;
    if (Form1.Listbox1.Items[Form1.Listbox1.Itemindex] = 'poweriso') or
      (Form1.Listbox1.Items[Form1.Listbox1.Itemindex] = 'vmwareworkstation') or
      (Form1.Listbox1.Items[Form1.Listbox1.Itemindex] = 'winrar') or
      (Form1.Listbox1.Items[Form1.Listbox1.Itemindex] = 'revouninstallerpro')
        then
    begin
      Form1.Timer3.Enabled := true;
    end;
    Form1.Memo1.SelStart := 0;
    Form1.Memo1.Perform(EM_SCROLLCARET, 0, 0);
  end;
end;

//funcion para leer todo el ini, y luego imprimimos la seccion que queramos

function leeini(seccion: string): string;
var
  r: integer;
  ini: TiniFile;
begin
  ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Lista.ini');
  with Ini do
  begin
    st := tStringList.create;
    //tendremos un stringlist con el contenido de la seccion
    ReadSection(seccion, st);
    for r := 0 to st.count - 1 do
    begin
      aux := st.strings[r];
      //guardamos el indice del dentro de la seccion para buscar su valor
      base := READstring(seccion, aux, ''); //obtenemos el valor
      Form1.Memo1.Clear;
      Form1.ListBox1.Items.Add(base); //lo metemos en un listbox
    end;
    st.Free;
    Free;
  end;
end;

end.
