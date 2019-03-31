unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ShellApi, Menus, StrUtils, Registry,
  ComCtrls, IniFiles;

function choconoesta: string;
function GetDosOutput(CommandLine: string; Work: string = 'C:\'): string;
function instalar(listado: string): string;
function leCadINI(clave, cadena: string; defecto: string): string;
function InfoExport: string;
procedure LiberarMemoria;
function CleanData: string;

implementation

uses unit1, unit3, unit4, unit6;

//procedimiento para liberar ram

procedure LiberarMemoria;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    SetProcessWorkingSetSize(GetCurrentProcess, $FFFFFFFF, $FFFFFFFF);
end;

//Lee una cadena de texto de un INI

function leCadINI(clave, cadena: string; defecto: string): string;
begin
  with TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Lista.ini') do
    try
      result := readString(clave, cadena, defecto);
    finally
      free;
    end;
end;
//funcion para capturar datos de cmd e imprimirlo en un memo

function GetDosOutput(CommandLine: string; Work: string = 'C:\'): string;
var
  SA: TSecurityAttributes;
  SI: TStartupInfo;
  PI: TProcessInformation;
  StdOutPipeRead, StdOutPipeWrite: THandle;
  WasOK: Boolean;
  Buffer: array[0..255] of AnsiChar;
  BytesRead: Cardinal;
  WorkDir: string;
  Handle: Boolean;
begin
  Result := '';
  with SA do
  begin
    nLength := SizeOf(SA);
    bInheritHandle := True;
    lpSecurityDescriptor := nil;
  end;
  CreatePipe(StdOutPipeRead, StdOutPipeWrite, @SA, 0);
  try
    with SI do
    begin
      FillChar(SI, SizeOf(SI), 0);
      cb := SizeOf(SI);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
      wShowWindow := SW_HIDE;
      hStdInput := GetStdHandle(STD_INPUT_HANDLE); // don't redirect stdin
      hStdOutput := StdOutPipeWrite;
      hStdError := StdOutPipeWrite;
    end;
    WorkDir := Work;
    Handle := CreateProcess(nil, PChar('cmd.exe /C ' + CommandLine),
      nil, nil, true, 0, nil,
      PChar(WorkDir), SI, PI);
    CloseHandle(StdOutPipeWrite);
    if Handle then
      try
        repeat
          WasOK := ReadFile(StdOutPipeRead, Buffer, 255, BytesRead, nil);
          if BytesRead > 0 then
          begin
            Buffer[BytesRead] := #0;
            Result := Result + Buffer;
          end;
        until not WasOK or (BytesRead = 0);
        WaitForSingleObject(PI.hProcess, 1000);
      finally
        CloseHandle(PI.hThread);
        CloseHandle(PI.hProcess);
        Application.ProcessMessages;
      end;
    Application.ProcessMessages;
  finally
    CloseHandle(StdOutPipeRead);
  end;
end;
//Funcion para instalar

function instalar(listado: string): string;
var
  x: Integer;
begin
  if Form1.Listbox1.ItemIndex = -1 then
  begin
    ShowMessage('Debe seleccionar un paquete para instalar');
  end
  else
  begin
    Form1.Label3.Caption := '10%';
    Form1.Progressbar1.position := 10;
    tmp := GetDosOutput(choco + 'choco install ' + listado +
      ' -y --no-progress --ignorechecksum');
    //tmp := GetDosOutput(choco + 'choco install ' + StringReplace(listado,
    //  'winrar', '', [rfReplaceAll]) + ' -y --no-progress --ignorechecksum');
    Application.ProcessMessages;
    for x := 0 to 100 do
    begin
      Form1.Progressbar1.Position := Form1.ProgressBar1.Position + 5;
      Form1.Label3.Caption := IntToStr(Form1.ProgressBar1.Position * 100 div
        Form1.ProgressBar1.Max) + '%'; // funciona, saca el porcentaje
      Application.ProcessMessages;
    end;
    Form1.Memo1.Lines.Add(tmp);
    Form1.Memo2.Lines.Clear;
    ShowCursor(True);
    Application.ProcessMessages;
    if (Form1.Listbox1.Items[Form1.Listbox1.Itemindex] = 'poweriso') or
      (Form1.Listbox1.Items[Form1.Listbox1.Itemindex] = 'vmwareworkstation') or
      (Form1.Listbox1.Items[Form1.Listbox1.Itemindex] = 'winrar') or
      (Form1.Listbox1.Items[Form1.Listbox1.Itemindex] = 'revouninstallerpro')
        then
    begin
      Form1.Memo1.Lines.Add('');
      Form1.Memo1.Lines.Add('APLICANDO CRACK AUTOMATICAMENTE.');
      Form1.Memo1.Lines.Add('AGUARDE UN MOMENTO POR FAVOR.');
      Form1.Timer3.Enabled := true;
    end;
    Form1.Memo1.SelStart := 0;
    Form1.Memo1.Perform(EM_SCROLLCARET, 0, 0);
  end;
end;
//funcion que verifica si chocolatey esta instalado

function choconoesta: string;
begin
  if (Form1.Label1.Caption = 'Chocolatey no se encuentra instalado') or (not
    DirectoryExists('C:\ProgramData\Chocolatey\bin')) or (Form1.BitBtn4.Enabled
    =
    true) then
  begin
    Form1.Label3.Caption := 'error%';
    buttonSelected :=
      MessageDlg('La dependencia necesaria "CHOCOLATEY" no se encuentra instalada. Desea instalarla ahora?', mtConfirmation, [mbYes, mbNo], 0);
    if buttonSelected = mrYes then
    begin
      Form1.BitBtn4.Click;
    end;
  end
  else
  begin
    listado := obtenerlistado;
    Instalar(listado);
  end;
end;
//Funcion para exportar datos del memo1 al un txt

function InfoExport: string;
var
  saveDialog: tsavedialog; // Save dialog variable
begin
  // Create the save dialog object - assign to our save dialog variable
  saveDialog := TSaveDialog.Create(form1.parent);
  // Give the dialog a title
  saveDialog.Title := 'Seleccione la ruta de destino';
  // Set up the starting directory to be the current one
  saveDialog.InitialDir := GetCurrentDir;
  // Allow only .txt and .doc file types to be saved
  saveDialog.Filter := 'Text file|*.txt';
  // Set the default extension
  saveDialog.DefaultExt := 'txt';
  // Select text files as the starting filter type
  saveDialog.FilterIndex := 1;
  // Display the open file dialog
  if Form1.Memo1.Lines.Count = 0 then
  begin
    ShowMessage('No se puede exportar un archivo en blanco.');
  end
  else
  begin
    if saveDialog.Execute then
    begin
      Form1.Memo1.Lines.SaveToFile(savedialog.filename);
      ShowMessage('Archivo guardado correctamente');
    end;
  end;
  // Free up the dialog
  saveDialog.Free;
end;
//funcion para limpiar datos de todos los componentes

function CleanData: string;
var
  x, AllComp: integer;
begin
  try
    AllComp := Form1.ComponentCount;
    //borramos seleccion listbox y editamos el hint
    with Form1.Listbox1 do
    begin
      ClearSelection;
      Hint := 'Funciones del click derecho:'
        + #13 + #10
        + #13 + #10 +
        'Editar: Edita la lista de programas habilitados. (ver ayuda)'
        + #13 + #10 +
        'Actualizar: Actualiza la aplicacion seleccionada si hay alguna actualizacion disponible.'
        + #13 + #10 +
        'Desinstalar: Desinstala la aplicacion seleccionada. (ver ayuda).'
        + #13 + #10 +
        'Obtener Crack: Obtiene el crack del programa seleccionada (ver ayuda).'
        + #13 + #10 + 'Limpiar Selección: Limpia la informacion obtenida.';
    end;
    //Colocamos el label del label3 y posicionamos el progressbar en 0
    if Form1.progressbar1.Position > 0 then
    begin
      Form1.ProgressBar1.Position := 0;
      Form1.Label3.Caption := 'Esperando';
    end;
    //limpiamos todos los componentes que sean memo y edit
    for x := 0 to allcomp - 1 do
      if (form1.Components[x] is TMemo) or (form1.Components[x] is TEdit) then
      begin
        TMemo(form1.Components[x]).Clear;
        TEdit(form1.Components[x]).Clear;
      end;
  finally
    LiberarMemoria;
  end;
end;

end.
