unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ShellApi, Menus, StrUtils, Registry,
  ComCtrls;

function ObtenerCrack(prog, prog1, prog2: string): string;
function EjecutaCrack: string;
function CompruebaCrack(app: string): string;
function comparapeso: string;
procedure DeleteDir(Dir: string);
procedure EmptyDir(Dir: string);
function LeeDirIni: string;

implementation

uses Unit1, unit2, unit4, unit6;

//Funcion para obtener crack

function ObtenerCrack(prog, prog1, prog2: string): string;
var
  F: TFileStream;
begin
  //si no hay nada seleccionado, no permite continuar
  if Form1.Listbox1.ItemIndex = -1 then
  begin
    ShowMessage('Ningun programa seleccionado');
  end
  else
  begin
    //asignamos el nombre del archivo ps1 segun el soft seleccionado
    mfile := Form1.Listbox1.Items[Form1.Listbox1.Itemindex] + '.ps1';
    try
      //si no existe el archivo .ps1 lo crea
      if not fileexists(mFile) then
      begin
        F := TFileStream.Create(mFile, fmCreate);
        a := '$client = new-object System.Net.WebClient' + #13 + #10;
        b := prog + #13 + #10;
        c := prog1 + #13 + #10;
        d := prog2;
        F.Write(a[1], Length(a));
        F.Write(b[1], Length(b));
        F.Write(c[1], Length(c));
        F.Write(d[1], Length(d));
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
          c := prog1 + #13 + #10;
          d := prog2;
          F.Write(a[1], Length(a));
          F.Write(b[1], Length(b));
          F.Write(c[1], Length(c));
          F.Write(d[1], Length(d));
          F.Free;
        end;
      end;
    finally
      //ejecutamos el archivo .ps1 para bajar el crack. si es winrar, lo baja directo a la carpeta de instalacion
      WinExec(PCHAR('cmd.exe /C powershell.exe -file ' + mFile), SW_HIDE);
      ShowCursor(True);
      Form1.Timer2.Enabled := True;
    end;
  end;
end;
//ejecuta el crack del programa

function EjecutaCrack: string;
begin
  //comprobamos si la politica de ejecucion no esta en restricted
  temporal := trim(GetDosOutput('powershell.exe Get-ExecutionPolicy'));
  if temporal = 'Restricted' then
  begin
    GetDosOutput('powershell.exe Set-ExecutionPolicy Unrestricted');
  end;
  //verificamos que programa esta seleccionado y le pasamos el valor a la variable prog, y luego a la variable b
  if Form1.Listbox1.Items[Form1.Listbox1.Itemindex] = 'revouninstallerpro' then
  begin
    prog := leCadINI('Links', Form1.Listbox1.Items[Form1.Listbox1.Itemindex],
      '');
    prog1 := leCadINI('Links', Form1.Listbox1.Items[Form1.Listbox1.Itemindex] +
      '1', '');
    prog2 := leCadINI('Links', Form1.Listbox1.Items[Form1.Listbox1.Itemindex] +
      '2', '');
  end
  else if Form1.Listbox1.Items[Form1.Listbox1.Itemindex] = 'winrar' then
    prog := leCadINI('Links', Form1.Listbox1.Items[Form1.Listbox1.Itemindex], '')
  else if
    Form1.Listbox1.Items[Form1.Listbox1.Itemindex] = 'getdataback-simple' then
    prog := leCadINI('Links', Form1.Listbox1.Items[Form1.Listbox1.Itemindex],
      '')
  else if
    Form1.Listbox1.Items[Form1.Listbox1.Itemindex] = 'getdataback-4.3' then
    prog := leCadINI('Links', Form1.Listbox1.Items[Form1.Listbox1.Itemindex],
      '')
  else if
    Form1.Listbox1.Items[Form1.Listbox1.Itemindex] = 'poweriso' then
    prog := leCadINI('Links',
      Form1.Listbox1.Items[Form1.Listbox1.Itemindex], '') +
      Form1.Listbox1.Items[Form1.Listbox1.Itemindex] + '.reg”)'
  else if
    Form1.Listbox1.Items[Form1.Listbox1.Itemindex] = 'vmwareworkstation' then
    prog := leCadINI('Links',
      Form1.Listbox1.Items[Form1.Listbox1.Itemindex], '') +
      Form1.Listbox1.Items[Form1.Listbox1.Itemindex] + '.reg”)'

  else
  begin
    prog := '';
  end;
  //si chocolatey no esta instalado ejecuta funcion choconoesta
  if (Form1.Label1.Caption = 'Chocolatey no se encuentra instalado') or (not
    DirectoryExists('C:\ProgramData\Chocolatey\bin')) or (Form1.BitBtn4.Enabled
    =
    true) then
  begin
    choconoesta;
  end
  else
  begin
    ObtenerCrack(prog, prog1, prog2);
  end;
end;
//funcion que comprueba el crack de un programa

function CompruebaCrack(app: string): string;
var
  registro: Tregistry;
  p: array of byte; //<<<<<<
  j: longint;
  t: string;
begin
  //Si no hay nada seleccionado no hace nada
  if Form1.Listbox1.ItemIndex = -1 then
  begin
  end
  else
  begin
    //buscamos el archivo rarreg.key
    if app = 'winrar' then
    begin
      if FileExists(soft + '\rarreg.key') then
      begin
        Form1.Memo1.Lines.Add('Estado Licencia: Activado.');
      end
      else
      begin
        Form1.Memo1.Lines.Add('Estado Licencia: No activado.');
        Form1.Memo1.Lines.Add('No se encontro el archivo "rarreg.key" dentro del directorio.');
      end;
    end;
    if app = 'revouninstallerpro' then
    begin
      if
        (FileExists('C:\ProgramData\VS Revo Group\Revo Uninstaller Pro\revouninstallerpro.lic')) and
        (FileExists('C:\ProgramData\VS Revo Group\Revo Uninstaller Pro\revouninstallerpro4.lic')) then
      begin
        Form1.Memo1.Lines.Add('Estado Licencia: Activado.');
      end
      else
      begin
        Form1.Memo1.Lines.Add('Estado Licencia: No activado.');
        Form1.Memo1.Lines.Add('No se encontraron los archivos "revouninstallerpro.lic" y "revouninstallerpro4.lic" dentro del directorio.');
      end;
    end;
    //buscamos si esta el archivo de licencia en el registro
    if app = 'poweriso' then
    begin
      Registro := tregistry.create;
      try
        Registro.RootKey := HKEY_CURRENT_USER;
        if Registro.OpenKey('\Software\PowerISO', false) then
        begin
          if Registro.ValueExists('USER') then
          begin
            t := 'USER';
            j := Registro.getdatasize(t);
            SetLength(p, j); //<<<<<<<<
            Registro.ReadBinaryData(t, p[0], J);
            t := '';
            for j := Low(p) to High(p) do
            begin
              t := t + IntToHex(p[j], 2) + #32;
            end;
            temporal := trim(t);
            if temporal =
              '00 06 54 61 79 6C 6F 72 65 1F 6F A9 82 03 E1 D3 68 6C F8 57 84 DF F5 24' then
            begin
              Form1.Memo1.Lines.Add('Estado Licencia: Activado.');
            end
            else
            begin
              Form1.Memo1.Lines.Add('Estado Licencia: No valido.');
              Form1.Memo1.Lines.Add('Requiere bajar nuevo crack.');
            end;
            SetLength(p, 0);
          end
          else
          begin
            Form1.Memo1.Lines.Add('Estado Licencia: No valido, No activado o Inexistente.');
            Form1.Memo1.Lines.Add('No se pudo comprobar el crack.');
            Form1.Memo1.Lines.Add('Si tiene instalado POWERISO, es recomendable bajar el crack.');
          end;
        end
        else
        begin
          Form1.Memo1.Lines.Add('Estado Licencia: No valido, No activado o Inexistente.');
          Form1.Memo1.Lines.Add('No se pudo comprobar el crack.');
          Form1.Memo1.Lines.Add('Si tiene instalado POWERISO, es recomendable bajar el crack.');
        end;
      finally
        Registro.CloseKey;
        Registro.Free;
      end;
    end;
    //buscame en el registro si esta el serial
    if app = 'vmwareworkstation' then
    begin
      Registro := TRegistry.Create;
      try
        Registro.RootKey := HKEY_LOCAL_MACHINE;
        if
          Registro.OpenKey('\SOFTWARE\Wow6432Node\VMware, Inc.\VMware Workstation\License.ws.12.0.e2.201505', false) then
        begin
          if Registro.ValueExists('Serial') then
          begin
            serie := Registro.ReadString('Serial');
            if serie = 'CF580-4XF0L-H886P-VWM7E-WLUW2' then
            begin
              Form1.Memo1.Lines.Add('Estado Licencia: Activado.');
              Form1.Memo1.Lines.Add('Numero de serie: ' + serie);
            end
            else
            begin
              Form1.Memo1.Lines.Add('Estado Licencia: No valido.');
              Form1.Memo1.Lines.Add('Requiere bajar nuevo crack.');
              Form1.Memo1.Lines.Add('Numero de serie: ' + serie);
            end;
          end
          else
          begin
            Form1.Memo1.Lines.Add('Estado Licencia: No valido.');
            Form1.Memo1.Lines.Add('Numero de serie: no encontrado.');
            Form1.Memo1.Lines.Add('Si tiene instalado VMWARE WORKSTATION, es recomendable bajar el crack.');
          end;
        end
        else
        begin
          Form1.Memo1.Lines.Add('Estado Licencia: No valido.');
          Form1.Memo1.Lines.Add('Numero de serie: no encontrado.');
          Form1.Memo1.Lines.Add('Si tiene instalado VMWARE WORKSTATION, es recomendable bajar el crack.');
        end;
      finally
        Registro.CloseKey;
        Registro.Free;
      end;
    end;
  end;
end;
//funcion que compara peso de un exe

function comparapeso: string;
var
  p1, p2: string;
begin
  p1 := FormatFloat('0.00', tamanoFichero1('winrar-x64-570es.exe'));
  p2 := FormatFloat('0.00', StrToFloat(p1) / 1024);
  result := StringReplace(FormatFloat('0.00', StrToFloat(p2) / 1024), ',', '',
    [rfReplaceAll]);
  Form6.Edit1.Text := result;
end;
//Procedimiento para eliminar directorios luego de desinstalar

procedure DeleteDir(Dir: string);
begin
  EmptyDir(Dir);
  RemoveDir(Dir);
end;

procedure EmptyDir(Dir: string);
var
  Files: integer;
  Search: TSearchRec;
begin
  Dir := IncludeTrailingPathDelimiter(Dir);
  Files := FindFirst(Dir + '*.*', faAnyFile, Search);
  while Files = 0 do
  begin
    if Search.Attr <> faDirectory then
      DeleteFile(Dir + Search.Name)
    else if (Search.Name <> '.') and (Search.Name <> '..') then
      DeleteDir(Dir + Search.Name);

    Files := FindNext(Search);
  end;
  FindClose(Search);
end;

function LeeDirIni: string;
begin
  Result := leCadIni('Directorios',
    Form1.Listbox1.Items[Form1.Listbox1.ItemIndex], '');
end;

end.
