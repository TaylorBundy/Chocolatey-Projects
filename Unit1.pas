unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ShellApi, Menus, StrUtils, Registry,
  ComCtrls, IniFiles, ActnList;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    ListBox1: TListBox;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    BitBtn4: TBitBtn;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    Editar1: TMenuItem;
    Actualizar1: TMenuItem;
    Desintalar1: TMenuItem;
    Panel3: TPanel;
    BitBtn5: TBitBtn;
    Edit2: TEdit;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    Label3: TLabel;
    Panel4: TPanel;
    Edit3: TEdit;
    Label4: TLabel;
    BitBtn6: TBitBtn;
    ObtenerCrack1: TMenuItem;
    Timer2: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    Timer5: TTimer;
    MainMenu1: TMainMenu;
    Offimatica1: TMenuItem;
    Herramientas1: TMenuItem;
    Desinfeccion1: TMenuItem;
    Offimatica2: TMenuItem;
    Complementos1: TMenuItem;
    Varios1: TMenuItem;
    Cracks1: TMenuItem;
    Cracks2: TMenuItem;
    Label5: TLabel;
    Label6: TLabel;
    Salir1: TMenuItem;
    odos1: TMenuItem;
    Administracin1: TMenuItem;
    FuncionesExtras1: TMenuItem;
    PopupMenu2: TPopupMenu;
    ExportarInforme1: TMenuItem;
    Ayuda1: TMenuItem;
    Atajosdeteclado1: TMenuItem;
    ActionList1: TActionList;
    Verificar1: TAction;
    Instala1: TAction;
    Help1: TAction;
    Help2: TAction;
    Cierra1: TAction;
    Timer6: TTimer;
    LimpiarSeleccin1: TMenuItem;
    LimpiarDatos1: TMenuItem;
    LimpiarDatos2: TMenuItem;
    Listarpaquetesdisponibles1: TMenuItem;
    Edit1: TEdit;
    Memo2: TMemo;
    CargarTXTcontodoslospaquetes1: TMenuItem;
    DateTimePicker1: TDateTimePicker;
    Timer8: TTimer;
    Edit4: TEdit;
    next1: TAction;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
    procedure Actualizar1Click(Sender: TObject);
    procedure Desintalar1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure ListBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Memo1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitBtn5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitBtn6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ListBox1DblClick(Sender: TObject);
    procedure Edit3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ObtenerCrack1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure Herramientas1Click(Sender: TObject);
    procedure Desinfeccion1Click(Sender: TObject);
    procedure Offimatica2Click(Sender: TObject);
    procedure Complementos1Click(Sender: TObject);
    procedure Varios1Click(Sender: TObject);
    procedure Cracks1Click(Sender: TObject);
    procedure Cracks2Click(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure odos1Click(Sender: TObject);
    procedure FuncionesExtras1Click(Sender: TObject);
    procedure ExportarInforme1Click(Sender: TObject);
    procedure Atajosdeteclado1Click(Sender: TObject);
    procedure Verificar1Execute(Sender: TObject);
    procedure Instala1Execute(Sender: TObject);
    procedure Help1Execute(Sender: TObject);
    procedure Help2Execute(Sender: TObject);
    procedure Cierra1Execute(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);
    procedure LimpiarSeleccin1Click(Sender: TObject);
    procedure LimpiarDatos1Click(Sender: TObject);
    procedure LimpiarDatos2Click(Sender: TObject);
    procedure Listarpaquetesdisponibles1Click(Sender: TObject);
    procedure CargarTXTcontodoslospaquetes1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer8Timer(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  choco = 'C:\ProgramData\Chocolatey\bin\';
  x64 = 'C:\Program Files\';
  x86 = 'C:\Program Files (x86)\';
  ROOT_KEY = HKEY_LOCAL_MACHINE;
  KEY = '\SOFTWARE\Microsoft\.NETFramework\v4.0.30319\SKUs';
  CSIDL_PROFILE = 40;
  SHGFP_TYPE_CURRENT = 0;

var
  Form1: TForm1;
  Fichero: TSearchRec;
  buttonSelected, vSize: integer;
  soft, directorio, ruta, user, name, tmp, tmp1, tmp2, raiz, listado,
    app, ruta1, ruta2, ruta3, valor, valor1, strProgram, strCommand, fileOne,
    prog, prog1, prog2, temporal, serie, tmpStr, mfile, a, b, c, d, src,
    pesoarchivo,
    aux, base, version: string;
  fOldIndex: integer = -1;
  Reg, regKey: TRegistry;
  server: TStrings;
  st: TStringList;

implementation

uses unit2, unit3, unit4, Unit5, unit6;

{$R *.dfm}
{$R 'Admin.RES' 'Admin.RC'}

//Funcion para obtener la version de un archivo EXE

function GetExeVersion(exePath: string): string;
var
  Size, Size2: DWord;
  Pt, Pt2: Pointer;
begin
  if not FileExists(exePath) then
    Exit;
  Size := GetFileVersionInfoSize(PChar(exePath), Size2);
  if Size > 0 then
  begin
    GetMem(Pt, Size);
    try
      GetFileVersionInfo(PChar(exePath), 0, Size, Pt);
      VerQueryValue(Pt, '\', Pt2, Size2);
      with TVSFixedFileInfo(Pt2^) do
      begin
        Result := IntToStr(HiWord(dwFileVersionMS)) + '.' +
          IntToStr(LoWord(dwFileVersionMS)) + '.' +
          IntToStr(HiWord(dwFileVersionLS)) + '.' +
          IntToStr(LoWord(dwFileVersionLS));
      end;
    finally
      FreeMem(Pt);
    end;
  end;
end;

function SHGetFolderPath(hwndOwner: HWND;
  nFolder: Integer;
  hToken: THandle;
  dwFlags: DWORD;
  pszPath: LPTSTR): HRESULT; stdcall;
  external 'Shell32.dll' name 'SHGetFolderPathA';
//funcion para obtener el directorio del usuario activo "C:\users\usuario"

function GetUserProfile: string;
var
  Buffer: array[0..MAX_PATH] of Char;
begin
  FillChar(Buffer, SizeOf(Buffer), 0);
  SHGetFolderPath(0, CSIDL_PROFILE, 0, SHGFP_TYPE_CURRENT, Buffer);
  Result := string(PChar(@Buffer));
end;
//funcion para obtener los directorios de los programas

function ObtenerDirectorio: string;
begin
  user := GetUserProfile;
  if FindFirst('C:\Program Files\' +
    Form1.Listbox1.Items[Form1.Listbox1.ItemIndex], faDirectory, Fichero) = 0
      then
  begin
    raiz := 'C:\Program Files\';
    FindClose(Fichero);
  end
  else
  begin
    raiz := 'C:\Program Files (x86)\';
    FindClose(Fichero);
  end;
  //buscamos en la ruta establecida en "raiz" la carpeta correspondiente al programa,
  //le asignamos el nombre correcto a la variable soft
  if FindFirst(raiz + Form1.Listbox1.Items[Form1.Listbox1.ItemIndex],
    faDirectory, Fichero) = 0 then
  begin
    soft := raiz + fichero.Name;
    FindClose(Fichero);
  end;
  //asignamos valores a las variables "soft" y "name" de ciertos programas
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'googleearth' then
  begin
    //soft := x86 + 'Google\Google Earth\' + 'client'; name := 'googleearth.exe';
    soft := LeeDirIni; name := 'googleearth.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'ChocolateyGUI' then
  begin
    soft := LeeDirIni; name := 'ChocolateyGUI.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'desktopok' then
  begin
    soft := LeeDirIni; name := 'DesktopOK_x64.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'speccy' then
  begin
    soft := LeeDirIni; name := 'Speccy64.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'defraggler' then
  begin
    soft := LeeDirIni; name := 'Defraggler64.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'malwarebytes' then
  begin
    soft := LeeDirIni; name := 'gdbsim.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'hijackthis' then
  begin
    soft := LeeDirIni; name := 'HiJackThis.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'jrt' then
  begin
    soft := LeeDirIni; name := 'jrt.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'adwcleaner' then
  begin
    soft := LeeDirIni; name := 'adwcleaner_7.2.7.0.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'getdataback-simple' then
  begin
    soft := LeeDirIni; name := 'gdbsim.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'leagueoflegends' then
  begin
    soft := LeeDirIni; name := 'LeagueClient.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'winrar' then
  begin
    soft := LeeDirIni; name := 'Winrar.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'vlc' then
  begin
    soft := LeeDirIni; name := 'VLC.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'dropbox' then
  begin
    soft := raiz + 'Dropbox\' + 'Client'; name := 'Dropbox.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'foxitreader' then
  begin
    soft := LeeDirIni; name := 'FoxitReader.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'libreoffice-fresh' then
  begin
    soft := LeeDirIni; name := 'Soffice.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'skype' then
  begin
    soft := LeeDirIni; name := 'Skype.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'chocolatey' then
  begin
    soft := LeeDirIni; name := 'choco.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'utorrent' then
  begin
    soft := user + LeeDirIni; name := 'uTorrent.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'jdownloader' then
  begin
    soft := user + LeeDirIni; name := 'JDownloader2.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'whatsapp' then
  begin
    soft := user + LeeDirIni; name := 'WhatsApp.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'spotify' then
  begin
    soft := user + LeeDirIni; name := 'Spotify.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'vmwareworkstation' then
  begin
    soft := LeeDirIni; name := 'vmware.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'googlechrome' then
  begin
    soft := LeeDirIni; name := 'chrome.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'revo-uninstaller' then
  begin
    soft := LeeDirIni; name := 'RevoUnin.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'revouninstallerpro' then
  begin
    soft := LeeDirIni; name := 'RevoUninPro.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'avastfreeantivirus' then
  begin
    soft := LeeDirIni; name := 'AvastUI.exe';
  end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'firefox' then
  begin
    soft := LeeDirIni;
  end; //name := 'firefox.exe'; end;
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'quicktime' then
  begin
    soft := LeeDirIni; name := 'QuickTimePlayer.exe';
  end;

  //buscamos el archivo .exe en la carpeta correspondiente, y le asignamos el nombre a la variable name
  if FindFirst(soft + '\' + Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] +
    '.exe', faAnyfile, Fichero) = 0 then
  begin
    name := fichero.Name;
    FindClose(Fichero);
  end;
  //Definimos los parametros de busqueda para Net Framework 4.7.2
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'dotnet4.7.2' then
  begin
    if FindFirst('C:\Windows\Microsoft.NET\' + 'Framework*', faDirectory,
      Fichero) = 0 then
    begin
      if DirectoryExists('C:\Windows\Microsoft.NET\Framework') and
        DirectoryExists('C:\Windows\Microsoft.NET\Framework64') then
      begin
        tmp := 'C:\Windows\Microsoft.NET\Framework64';
      end;
      FindClose(Fichero);
      if FindFirst(tmp + '\' + 'v4.*', faDirectory, Fichero) = 0 then
      begin
        soft := tmp + '\' + fichero.Name;
        name := 'AddInProcess.exe';
        FindClose(Fichero);
      end;
    end;
  end;
  //Definimos los parametros de busqueda para Net Framework 3.5
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'dotnet3.5' then
  begin
    if FindFirst('C:\Windows\Microsoft.NET\' + 'Framework*', faDirectory,
      Fichero) = 0 then
    begin
      if DirectoryExists('C:\Windows\Microsoft.NET\Framework') and
        DirectoryExists('C:\Windows\Microsoft.NET\Framework64') then
      begin
        tmp := 'C:\Windows\Microsoft.NET\Framework64';
        FindClose(Fichero);
      end;
      if FindFirst(tmp + '\' + 'v3.5*', faDirectory, Fichero) = 0 then
      begin
        soft := tmp + '\' + fichero.Name;
        name := 'AddInProcess.exe';
        FindClose(Fichero);
      end;
    end;
  end;
  //Definimos los parametros de busqueda para kaspersky
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'kav' then
  begin
    if DirectoryExists(x64 + 'Kaspersky Lab\') then
    begin
      if FindFirst(x64 + 'Kaspersky Lab\' + 'Kaspersky*', faDirectory, Fichero)
        = 0 then
      begin
        soft := x64 + 'Kaspersky Lab\' + fichero.Name;
        name := 'avp.exe';
        FindClose(Fichero);
      end;
    end
    else
    begin
      soft := x64 + 'Kaspersky Lab\';
    end;
  end;
  //Definimos los parametros de busqueda para flashe player plugin
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'flashplayerplugin' then
  begin
    if FindFirst('C:\Windows\SysWow64\Macromed\Flash\' + 'FlashPlayerPlugin*',
      faAnyFile, Fichero) = 0 then
    begin
      soft := 'C:\Windows\SysWow64\Macromed\Flash';
      name := Fichero.name;
      FindClose(Fichero);
    end;
  end;
  //Definimos los parametros de busqueda para adobe reader
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'adobereader' then
  begin
    if FindFirst(x86 + 'Adobe\' + 'Acrobat 11.0', fadirectory, Fichero) = 0 then
    begin
      soft := x86 + 'Adobe\' + Fichero.Name + '\Acrobat';
      name := 'Acrobat.exe';
      FindClose(Fichero);
    end
    else
    begin
      soft := x86 + 'Adobe\Acrobat Reader DC\Reader';
      name := 'AcroRd32.exe';
    end;
  end;
  //Definimos los parametros de busqueda para java
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'jre8' then
  begin
    if FindFirst(x64 + 'Java\' + 'j*', fadirectory, Fichero) = 0 then
    begin
      soft := x64 + 'Java\' + Fichero.Name + '\bin';
      name := 'Java.exe';
      FindClose(Fichero);
    end;
  end;
  //Definimos los parametros de busqueda para gimp
  if Form1.Listbox1.Items[Form1.Listbox1.ItemIndex] = 'gimp' then
  begin
    if FindFirst(x64 + 'GIMP*', fadirectory, Fichero) = 0 then
    begin
      soft := x64 + Fichero.Name + '\bin';
      name := 'gimp-2.10.exe';
      FindClose(Fichero);
    end;
  end;
  //parametros de busqueda de la carpeta de instalacion
  if not directoryexists(soft) then
  begin
    Form1.Memo1.Lines.Add('Aplicacion no instalada');
  end
  else
  begin
    if FindFirst(soft, faDirectory, Fichero) = 0 then
    begin
      Directorio := soft;
      Form1.Memo1.Lines.Add('Instalado en: ' + directorio);
      FindClose(Fichero);
    end;
  end;
end;
//funcion propia para obtener version

function obtenerVersion: string;
begin
  if (AnsiContainsStr(Form1.Listbox1.Items[Form1.Listbox1.ItemIndex],
    'teamviewer-qs')) then
  begin
    Form1.Memo1.Lines.Add('Numero de version no adquirible');
  end
  else
  begin
    if FindFirst(directorio + '\' + name, faanyfile, fichero) = 0 then
    begin
      version := GetExeVersion(directorio + '\' + Fichero.Name);
      Form1.Memo1.Lines.Add(version);
      FindClose(Fichero);
    end;
  end;
end;

procedure TForm1.Timer5Timer(Sender: TObject);
begin
  form6.Edit1.Text := comparapeso;
  if form6.edit1.Text = '311' then
  begin
    timer5.Enabled := False;
    instalasoft;
  end
  else
  begin
    form6.edit1.Text := comparapeso;
    timer4.Enabled := true;
    timer5.Enabled := False;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  today: TDateTime;
begin
  Today := now;
  datetimepicker1.DateTime := today;
  Form1.Caption := 'Chocolatey GUI v' +
    GetExeVersion('Project1.exe') + ' - TaylorBundy - ' +
    FormatDateTime('dddddd' + ' - ', dateTimePicker1.Date) + TimeToStr(now);
  Application.HintPause := 200;
  Application.HintHidePause := 10000;
  Label3.Parent := progressBar1;
  Label3.AutoSize := False;
  Label3.Transparent := True;
  Label3.Top := 0;
  Label3.Left := 0;
  Label3.Width := progressBar1.ClientWidth;
  Label3.Height := progressBar1.ClientHeight;
  Label3.Alignment := taCenter;
  Label3.Layout := tlCenter;
  Listbox1.Hint := 'Funciones del click derecho:'
    + #13 + #10
    + #13 + #10 + 'Editar: Edita la lista de programas habilitados. (ver ayuda)'
    + #13 + #10 +
    'Actualizar: Actualiza la aplicacion seleccionada si hay alguna actualizacion disponible.'
    + #13 + #10 +
    'Desinstalar: Desinstala la aplicacion seleccionada. (ver ayuda).'
    + #13 + #10 +
    'Obtener Crack: Obtiene el crack del programa seleccionada (ver ayuda).'
    + #13 + #10 + 'Limpiar Selección: Limpia la informacion obtenida.';
  if DirectoryExists('C:\ProgramData\chocolatey') then
  begin
    Label1.Caption := 'Chocolatey se encuentra instalado';
    BitBtn4.Enabled := False;
  end
  else
  begin
    Label1.Caption := 'Chocolatey no se encuentra instalado';
    BitBtn4.Enabled := True;
  end;
  if not FileExists('Lista.ini') then
  begin
    buttonSelected :=
      MessageDlg('No se encuentra el archivo de recursos, desea generar uno nuevo?', mtError, [mbYes, mbNo], 0);
    if buttonSelected = mrYes then
    begin
      Listbox1.Sorted := False;
      Listbox1.Items.Add('Sin datos, editar y eliminar esta linea');
      Listbox1.Items.Add('Para obtener una lista de programas');
      Listbox1.Items.Add('Dirigirse a:');
      Listbox1.Items.Add('"https://chocolatey.org/packages"');
      Listbox1.Items.Add('Copiar solo el nombre del programa');
      Listbox1.Items.Add('EJ: ccleaner. Segun pagina oficial.');
      Listbox1.ItemIndex := 0;
    end
    else
    begin
      buttonSelected := MessageDlg('Desea cerrar el programa?', mtConfirmation,
        [mbYes, mbNo], 0);
      if buttonselected = mrYes then
      begin
        BitBtn2.Click;
      end;
    end;
  end
  else
  begin
    leeini('Herramientas');
    leeini('Offimatica');
    leeini('Internet');
    leeini('Reproductores');
    leeini('Desinfeccion');
    leeini('Complementos');
  end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Halt(0);
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    BitBtn2.Click;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  listado := obtenerlistado;
  if (Label1.Caption = 'Chocolatey no se encuentra instalado') or (not
    DirectoryExists('C:\ProgramData\Chocolatey\bin')) or (BitBtn4.Enabled = true)
      then
  begin
    choconoesta;
  end
  else
  begin
    {if Listbox1.Items[Listbox1.ItemIndex] = 'winrar' then
    begin
      src :=
        '$client.DownloadFile(“http://download2269.mediafire.com/kffodo4edu1g/d2oyvvslnokba4f/winrar-x64-570es.exe”,“winrar-x64-570es.exe”)';
      bajasoft(src);
    end
    else
    begin }
    ShowCursor(False);
    instalar(listado);
    //end;
  end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
  x, line: Integer;
  cant, par: string;
begin
  //si el bitbtn3 tiene como caption 'Verificar' entonces
  if BitBtn3.Caption = 'Verificar' then
  begin
    Label3.Caption := '10%';
    if Listbox1.ItemIndex = -1 then
    begin
      ShowMessage('Debe seleccionar un paquete para verificar');
    end
    else
    begin
      if (Label1.Caption = 'Chocolatey no se encuentra instalado') or (not
        DirectoryExists('C:\ProgramData\Chocolatey\bin')) or (BitBtn4.Enabled =
        true) then
      begin
        choconoesta;
      end
      else
      begin
        //obtenemos listado de items seleccionados
        listado := obtenerlistado;
        //contamos lineas del memo2
        for line := 0 to Form1.Memo2.Lines.Count - 1 do
        begin
          //pasamos la cantidas de lineas a la variable cant
          cant := IntToStr(Form1.memo2.Lines.count);
        end;
        //si la cantidad de items es mayor a 1, le asignamos string mas de 1 a par
        if cant > '1' then
        begin
          par := 'mas de 1';
        end;
        //si la cantidad de items es = a 1, le asignamos string 1 a par
        if cant = '1' then
        begin
          par := '1';
        end;
        //si la cantidad de items es menor a 1, le asignamos string 0 a par
        if cant < '1' then
        begin
          par := '0';
        end;
        //posicionamos el progressbar en 10
        Progressbar1.position := 10;
        //si la variable par tiene como valor 0 entonces
        if par = '0' then
        begin
          LiberarMemoria;
          tmp1 := GetDosOutput(choco + 'choco list -lo');
          tmp2 := GetDosOutput(choco + 'choco outdated');
        end;
        //si la variable par tiene como valor mas de 1 entonces
        if par = 'mas de 1' then
        begin
          Memo1.Clear;
          Memo2.Clear;
          ProgressBar1.Position := 0;
          Label3.Caption := 'Esperando';
          memo1.Lines.Add('Esta funcion no permite seleccionar multiples programas.');
          Listbox1.ClearSelection;
        end;
        //si la variable par tiene como valor 1 entonces
        if par = '1' then
        begin
          tmp1 := '';
          tmp2 := GetDosOutput(choco + 'choco search ' + listado +
            ' --exact --detailed');
        end;
        if (par = '1') or (par = '0') then
        begin
          Application.ProcessMessages;
          for x := 0 to 100 do
          begin
            Progressbar1.Position := ProgressBar1.Position + 5;
            Label3.Caption := IntToStr(ProgressBar1.Position * 100 div
              ProgressBar1.Max) + '%'; // funciona, saca el porcentaje
            Application.ProcessMessages;
          end;
          Memo1.Lines.Add(tmp1);
          Memo1.Lines.Add('');
          Memo1.Lines.Add(tmp2);
          Memo1.SetFocus;
          Memo1.SelStart := 0;
          Memo1.Perform(EM_SCROLLCARET, 0, 0);
        end;
      end;
    end;
  end;
  //si bitbtn3 tiene como caption 'Guardar' entonces
  if BitBtn3.Caption = 'Guardar' then
  begin
    try
      Memo1.Lines.SaveToFile('Lista.ini');
      ShowMessage('Lista editada correctamente');
      Listbox1.Clear;
      Listbox1.Enabled := True;
    finally
      Memo1.Clear;
      Memo1.Color := clGradientInactiveCaption;
      leeini('Herramientas');
      leeini('Offimatica');
      leeini('Internet');
      leeini('Reproductores');
      leeini('Desinfeccion');
      leeini('Complementos');
      BitBtn3.Caption := 'Verificar';
      Memo1.ReadOnly := True;
    end;
  end;

end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
  x: Integer;
begin
  ruta1 :=
    '@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString';
  ruta2 := '(''https://chocolatey.org/install.ps1''))';
  ruta3 := '" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"';
  try
    Label3.Caption := '10%';
    Progressbar1.position := 10;
    tmp := GetDosOutput(ruta1 + ruta2 + ruta3);
    Application.ProcessMessages;
    for x := 0 to 100 do
    begin
      Progressbar1.Position := ProgressBar1.Position + 5;
      Label3.Caption := IntToStr(ProgressBar1.Position * 100 div
        ProgressBar1.Max) + '%'; // funciona, saca el porcentaje
      Application.ProcessMessages;
    end;
    Memo1.Lines.Add(tmp);
    Application.ProcessMessages;
  finally
    Timer1.Enabled := True;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if DirectoryExists('C:\ProgramData\chocolatey') then
  begin
    BitBtn4.Enabled := False;
    Label1.Caption := 'Chocolatey se encuentra instalado';
    Timer1.Enabled := False;
  end;
end;

procedure TForm1.Editar1Click(Sender: TObject);
begin
  with Memo1 do
  begin
    ReadOnly := False;
    Lines.LoadFromFile('Lista.INI');
    color := clWindow;
  end;
  BitBtn3.Caption := 'Guardar';
  Listbox1.Enabled := False;
end;

procedure TForm1.Actualizar1Click(Sender: TObject);
var
  x: Integer;
begin
  listado := obtenerlistado;
  if Listbox1.ItemIndex = -1 then
  begin
    ShowMessage('Debe seleccionar un paquete para instalar');
  end
  else
  begin
    if (Label1.Caption = 'Chocolatey no se encuentra instalado') or (not
      DirectoryExists('C:\ProgramData\Chocolatey\bin')) or (BitBtn4.Enabled =
      true) then
    begin
      choconoesta;
    end
    else
    begin
      Label3.Caption := '10%';
      Progressbar1.position := 10;
      tmp := GetDosOutput(choco + 'choco upgrade ' + listado +
        ' -y --no-progress --ignorechecksum');
      //tmp := GetDosOutput(choco + 'choco upgrade ' + StringReplace(listado,
      //  'winrar', '', [rfReplaceAll]) + ' -y --no-progress --ignorechecksum');
      Application.ProcessMessages;
      for x := 0 to 100 do
      begin
        Progressbar1.Position := ProgressBar1.Position + 5;
        Label3.Caption := IntToStr(ProgressBar1.Position * 100 div
          ProgressBar1.Max) + '%'; // funciona, saca el porcentaje
        Application.ProcessMessages;
      end;
      Memo1.lines.Clear;
      Memo1.Lines.Add(tmp);
      Application.ProcessMessages;
      Memo1.SelStart := 0;
      Memo1.Perform(EM_SCROLLCARET, 0, 0);
    end;
  end;
end;

procedure TForm1.Desintalar1Click(Sender: TObject);
var
  x: Integer;
begin
  listado := ObtenerListado;
  if Listbox1.ItemIndex = -1 then
  begin
    ShowMessage('Debe seleccionar un paquete para instalar');
  end
  else
  begin
    if (Label1.Caption = 'Chocolatey no se encuentra instalado') or (not
      DirectoryExists('C:\ProgramData\Chocolatey\bin')) or (BitBtn4.Enabled =
      true) then
    begin
      choconoesta;
    end
    else
    begin
      try
        Label3.Caption := '10%';
        Progressbar1.position := 10;
        tmp := GetDosOutput(choco + 'choco uninstall ' + listado + ' -y');
        Application.ProcessMessages;
        for x := 0 to 100 do
        begin
          Progressbar1.Position := ProgressBar1.Position + 5;
          Label3.Caption := IntToStr(ProgressBar1.Position * 100 div
            ProgressBar1.Max) + '%'; // funciona, saca el porcentaje
          Application.ProcessMessages;
        end;
        Memo1.lines.Clear;
        Memo1.Lines.Add(tmp);
        Form1.Memo2.Lines.Clear;
        Application.ProcessMessages;
        Memo1.SelStart := 0;
        Memo1.Perform(EM_SCROLLCARET, 0, 0);
      finally
        Timer6.Enabled := True;
      end;
    end;
  end;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  if not DirectoryExists('C:\ProgramData\Chocolatey\Bin') then
  begin
    with Memo1.Lines do
    begin
      Clear;
      Add('dependencia Chocolatey no instalada');
      Add('');
      Add('es requerida para realizar todos los procesos');
      Add('');
      Add('Haga click en el boton "INSTALAR" ubicado en la parte superior.');
    end;
  end
  else
  begin
    //posicionamos la progressbar en 0
    if progressbar1.Position > 0 then
    begin
      ProgressBar1.Position := 0;
      Label3.Caption := 'Esperando';
    end;
    //Limpiamos el memo
    Memo1.lines.Clear;
    //llamamos a la funcion para obtener los directorios de instalacion de cada programa
    ObtenerDirectorio;
    //llamamos a la funcion para extraer la version del archivo .exe
    ObtenerVersion;
    //Comprobamos si esta el crack de los programas
    if directoryexists(soft) then
    begin
      app := Listbox1.Items[Listbox1.ItemIndex];
      CompruebaCrack(app);
      gethint(version);
    end
    else
    begin
      version := '';
      ruta := '';
      GetHint(version);
    end;
    //si el item seleccionado es "teamviewer-qs" entonces limpia el memo con mensaje
    if Listbox1.Items[Listbox1.ItemIndex] = 'teamviewer-qs' then
    begin
      Memo1.lines.Clear;
      Memo1.Lines.Add('Aplicacion no Instalable');
    end;
    //si el item seleccionado es "kav" se fija si esta instalado
    if Listbox1.Items[Listbox1.ItemIndex] = 'kav' then
    begin
      if not DirectoryExists(x64 + 'Kaspersky Lab\') then
      begin
        Memo1.lines.Clear;
        Memo1.Lines.Add('Aplicacion no instalada');
      end;
    end;
    //si el item seleccionado es "gimp" se fija si esta instalado
    if Listbox1.Items[Listbox1.ItemIndex] = 'gimp' then
    begin
      if not DirectoryExists(x64 + 'GIMP 2') then
      begin
        Memo1.lines.Clear;
        Memo1.Lines.Add('Aplicacion no instalada');
      end;
    end;
    //si el item seleccionado es "aimp" se fija si esta instalado
    if Listbox1.Items[Listbox1.ItemIndex] = 'aimp' then
    begin
      if not DirectoryExists(x86 + 'AIMP') then
      begin
        Memo1.lines.Clear;
        Memo1.Lines.Add('Aplicacion no instalada');
      end;
    end;
    //Definimos los parametros de busqueda para Net Framework 4.5
    if Listbox1.Items[Listbox1.ItemIndex] = 'dotnet4.5' then
    begin
      Memo1.lines.Clear;
      server := TStringList.Create;
      Reg := TRegistry.Create;
      try
        Reg.RootKey := ROOT_KEY;
        if Reg.OpenKey(KEY, True) then
        begin
          Reg.GetKeyNames(server); // abstract error here
          Tmp := server.Strings[8];
          if Ansicontainsstr(tmp, '.NETFramework,Version=v4.5') then
          begin
            Memo1.Lines.Add('Localizacion Desconocida');
            Memo1.Lines.Add(copy(tmp, 24, 3));
          end;
        end;
      finally
        Reg.CloseKey;
        Reg.Free;
        Server.Free;
      end;
    end;
  end;
end;
//efectos aplicados al evento mousemove del listbox
//por el momento desactivados

procedure TForm1.ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
{var
  lstIndex: Integer;
  p: TPoint;}
begin
  {  p.x := x;
    p.y := y;
    with ListBox1 do
    begin
      //SetFocus;
      ItemIndex := ListBox1.ItemAtPos(P, True);
      lstIndex := SendMessage(Handle, LB_ITEMFROMPOINT, 0, MakeLParam(x, y));
      // this should do the trick..
      if fOldIndex <> lstIndex then
      begin
        Application.CancelHint;
        fOldIndex := lstIndex;
        if (lstIndex >= 0) and (lstIndex <= Items.Count) then
        begin
          if listbox1.Items[Listbox1.ItemIndex] = '' then
          begin
            //Limpiamos el memo
            Memo1.lines.Clear;
            //llamamos a la funcion para obtener los directorios de instalacion de cada programa
            ObtenerDirectorio;
            //llamamos a la funcion para extraer la version del archivo .exe
            ObtenerVersion;
            //Comprobamos si esta el crack de los programas
          end;
          if directoryexists(soft) then
          begin
            version := '';
            app := Items[ItemIndex];
            //CompruebaCrack(app);
            gethint(version);
          end
          else
          begin
            //ruta := '';
            version := '';
            GetHint(version);
          end;
        end
        else
        begin
          Hint := 'Funciones del click derecho:'
            + #13 + #10
            + #13 + #10 +
              'Editar: Edita la lista de programas habilitados. (ver ayuda)'
            + #13 + #10 +
              'Actualizar: Actualiza la aplicacion seleccionada si hay alguna actualizacion disponible.'
            + #13 + #10 +
              'Desinstalar: Desinstala la aplicacion seleccionada. (ver ayuda).';
        end;
      end;
    end; }
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
var
  x: Integer;
begin
  if (Label1.Caption = 'Chocolatey no se encuentra instalado') or (not
    DirectoryExists('C:\ProgramData\Chocolatey\bin')) or (BitBtn4.Enabled = true)
      then
  begin
    choconoesta;
  end
  else
  begin
    if edit2.Text = '' then
    begin
      Label3.Caption := '10%';
      Progressbar1.position := 10;
      tmp := GetDosOutput(choco + 'choco -h');
      Application.ProcessMessages;
      for x := 0 to 100 do
      begin
        Progressbar1.Position := ProgressBar1.Position + 5;
        Label3.Caption := IntToStr(ProgressBar1.Position * 100 div
          ProgressBar1.Max) + '%'; // funciona, saca el porcentaje
        Application.ProcessMessages;
      end;
      Memo1.Lines.Clear;
      Memo1.Lines.Add(tmp);
      Edit2.clear;
      Application.ProcessMessages;
    end
    else if (edit2.Text = 'packages') or (edit2.Text = '"packages"') or
      (edit2.Text = 'paquetes') or (edit2.Text = 'PACKAGES') or (edit2.Text =
      '"PACKAGES"') or (edit2.Text = 'PAQUETES') then
    begin
      try
        ShellExecute(0, nil, 'cmd.exe',
          '/C start /WAIT FIREFOX.EXE https://chocolatey.org/packages', nil,
          SW_HIDE);
      finally
        Memo1.Lines.Clear;
        Edit2.Clear;
      end;
    end
    else if (edit2.Text = 'oficial') or (edit2.Text = '"oficial"') or (edit2.Text
      = 'OFICIAL') or (edit2.Text = '"OFICIAL"') then
    begin
      try
        ShellExecute(0, nil, 'cmd.exe',
          '/C start /WAIT FIREFOX.EXE https://chocolatey.org/', nil, SW_HIDE);
      finally
        Memo1.Lines.Clear;
        Edit2.Clear;
      end;
    end
    else
    begin
      Label3.Caption := '10%';
      Progressbar1.position := 10;
      tmp := GetDosOutput(choco + 'choco ' + edit2.Text + ' -h');
      Application.ProcessMessages;
      for x := 0 to 100 do
      begin
        Progressbar1.Position := ProgressBar1.Position + 5;
        Label3.Caption := IntToStr(ProgressBar1.Position * 100 div
          ProgressBar1.Max) + '%'; // funciona, saca el porcentaje
        Application.ProcessMessages;
      end;
      Memo1.Lines.Clear;
      Memo1.Lines.Add(tmp);
      Edit2.clear;
      Application.ProcessMessages;
    end;
    Memo1.SelStart := 0;
    Memo1.Perform(EM_SCROLLCARET, 0, 0);
  end;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['a'..'z', 'A'..'Z', #8, #32, '-']) then
  begin
    Key := #0;
  end;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  if (Label1.Caption = 'Chocolatey no se encuentra instalado') or (not
    DirectoryExists('C:\ProgramData\Chocolatey\bin')) or (BitBtn4.Enabled = true)
      then
  begin
    choconoesta;
  end
  else
  begin
    if edit3.Text = '' then
    begin
      ShowMessage('Debe escribir un comando');
    end
    else
    begin
      Memo1.Clear;
      Memo1.Lines.Add(GetDosOutput(choco + 'choco ' + Edit3.Text));
      Application.ProcessMessages;
    end;
  end;
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['a'..'z', 'A'..'Z', #8, #32, '-']) then
  begin
    Key := #0;
  end;
end;

procedure TForm1.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  with Memo1 do
  begin
    if ReadOnly = false then
    begin
      if Key = #27 then
      begin
        Listbox1.Enabled := True;
        Clear;
        Color := clGradientInactiveCaption;
        Listbox1.Items.LoadFromFile('lista.txt');
        BitBtn3.Caption := 'Verificar';
        ReadOnly := true;
      end;
    end
    else
    begin
      if Key = #27 then
      begin
        BitBtn2.Click;
      end;
    end;
  end;
end;

procedure TForm1.ListBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    BitBtn2.Click;
  end;
end;

procedure TForm1.Memo1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if memo1.ReadOnly = false then
  begin
    Memo1.Hint := 'Para conocer la lista de programas disponibles dirigirse a:'
      + #13 + #10 + '"https://chocolatey.org/packages".'
      + #13 + #10
      + #13 + #10 +
      'Se debe colocar el nombre del programa tal y como aparece en la pagina'
      + #13 + #10 + 'Ej: ccleaner, firefox, googlechrome, etc.'
      + #13 + #10
      + #13 + #10 +
      'Escriba "packages" en el campo de ayuda para dirigirse a la pagina con la lista de programas';
  end
  else
  begin
    Form1.SetFocus;
    Memo1.Hint := 'Muestra informacion de los procesos realizados.'
      + #13 + #10 + 'Boton derecho para exportar el informe';
  end;
end;

procedure TForm1.BitBtn5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  BitBtn5.Hint := 'Si presiona el boton dejando el campo de texto vacio,'
    + #13 + #10 + 'obtendra la ayuda obtenida de "choco -?, --help, -h".'
    + #13 + #10
    + #13 + #10 + 'De lo contrario escriba un comando valido.'
    + #13 + #10
    + #13 + #10 +
    'Escriba "packages" para dirijirse a la pagina con la lista de programas.'
    + #13 + #10 +
    'Escriba "oficial" para dirijirse a la pagina oficial de CHOCOLATEY.';
end;

procedure TForm1.BitBtn6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  BitBtn6.Hint := 'funciones especiales diseñadas para el desarrolador.'
    + #13 + #10
    + #13 + #10 + 'No utilizar.';
end;

procedure TForm1.Edit2Click(Sender: TObject);
begin
  BitBtn5.Default := True;
end;

procedure TForm1.Edit2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Edit2.SetFocus;
  Edit2.Hint := 'Escriba el comando para obtener ayuda.'
    + #13 + #10
    + #13 + #10 + 'Lista de comandos mas usados:'
    + #13 + #10
    + #13 + #10 + 'Install'
    + #13 + #10 + 'uninstall'
    + #13 + #10 + 'upgrade'
    + #13 + #10 + 'info'
    + #13 + #10 + 'search'
    + #13 + #10 + 'list'
    + #13 + #10 + 'outdated'
    + #13 + #10 + 'download';
end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
var
  line: Integer;
  cant, par: string;
begin
  if (Label1.Caption = 'Chocolatey no se encuentra instalado') or (not
    DirectoryExists('C:\ProgramData\Chocolatey\bin')) or (BitBtn4.Enabled = true)
      then
  begin
    choconoesta;
  end
  else
  begin
    {if Listbox1.Items[Listbox1.ItemIndex] = 'winrar' then
    begin
      src :=
        '$client.DownloadFile(“http://download2269.mediafire.com/kffodo4edu1g/d2oyvvslnokba4f/winrar-x64-570es.exe”,“winrar-x64-570es.exe”)';
      bajasoft(src);
    end
    else
    begin}
      //obtenemos listado de items seleccionados
    listado := obtenerlistado;
    //contamos lineas del memo2
    for line := 0 to Form1.Memo2.Lines.Count - 1 do
    begin
      //pasamos la cantidas de lineas a la variable cant
      cant := IntToStr(Form1.memo2.Lines.count);
    end;
    //si la cantidad de items es mayor a 1, le asignamos string mas de 1 a par
    if cant > '1' then
    begin
      par := 'mas de 1';
    end;
    //si la cantidad de items es = a 1, le asignamos string 1 a par
    if cant = '1' then
    begin
      par := '1';
    end;
    //si la cantidad de items es menor a 1, le asignamos string 0 a par
    if cant < '1' then
    begin
      par := '0';
    end;
    //si la variable par tiene como valor 0 entonces
    if par = '0' then
    begin
      Memo1.Clear;
      ShowMessage('Debe seleccionar 1 item para poder instalarlo');
    end;
    //si la variable par tiene como valor mas de 1 entonces
    if par = 'mas de 1' then
    begin
      Memo1.Clear;
      Memo1.Lines.Add('Esta funcion no permite seleccionar multiples programas.');
    end;
    //si la variable par tiene como valor 1 entonces
    if par = '1' then
    begin
      ShowCursor(False);
      instalar(listado);
    end;
    //end;
  end;
end;

procedure TForm1.Edit3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Edit3.SetFocus;
end;

procedure TForm1.ObtenerCrack1Click(Sender: TObject);
begin
  if (Form1.Listbox1.Items[Form1.Listbox1.Itemindex] = 'getdataback-4.3') or
    (Form1.Listbox1.Items[Form1.Listbox1.Itemindex] = 'getdataback-simple') or
    (Form1.Listbox1.Items[Form1.Listbox1.Itemindex] = 'poweriso') or
    (Form1.Listbox1.Items[Form1.Listbox1.Itemindex] = 'vmwareworkstation') or
    (Form1.Listbox1.Items[Form1.Listbox1.Itemindex] = 'winrar') or
    (Form1.Listbox1.Items[Form1.Listbox1.Itemindex] = 'revouninstallerpro') then
  begin
    ShowCursor(False);
    ejecutacrack;
  end
  else
  begin
    ShowMessage('El programa: "' + Form1.Listbox1.Items[Form1.Listbox1.Itemindex]
      + '" No requiere crack, o no hay disponible hasta el momento.');
  end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  fileOne := ExtractFilePath(Application.ExeName) +
    Listbox1.Items[Listbox1.Itemindex] + '.reg';
  strProgram := 'REGEDIT';
  strProgram := strProgram + #0;
  strCommand := '/SC /C ' + ExtractShortPathName(fileOne);
  strCommand := strCommand + #0;
  ShowCursor(true);
  //si el programa seleccionado es poweriso o vmware entonces
  if (Listbox1.Items[Listbox1.Itemindex] = 'getdataback-4.3') or
    (Listbox1.Items[Listbox1.Itemindex] = 'getdataback-simple') or
    (Listbox1.Items[Listbox1.Itemindex] = 'poweriso') or
    (Listbox1.Items[Listbox1.Itemindex] = 'vmwareworkstation') or
    (Listbox1.Items[Listbox1.Itemindex] = 'revouninstallerpro') then
  begin
    //si el archivo seleccionado.reg existe
    if FileExists(Listbox1.Items[Listbox1.Itemindex] + '.reg') then
    begin
      try
        //ejecuta el archivo seleccionado.reg
        if ShellExecute(0, nil, @strProgram[1], @strCommand[1], nil, SW_HIDE) <=
          32 then
        begin
          ShowMessage(SysErrorMessage(GetLastError));
          //if there is any error in importing
        end;
      finally
        //Mostramos en Memo1 resultado
        if Listbox1.Items[Listbox1.Itemindex] = 'getdataback-4.3' then
          valor := '[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Runtime Software\GetDataBackNT\License]'
        else if Listbox1.Items[Listbox1.Itemindex] = 'getdataback-simple' then
          valor := '[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Runtime Software\GetDataBackSimple\License]'
        else if Listbox1.Items[Listbox1.Itemindex] = 'revouninstallerpro' then
        begin
          valor :=
            '[HKEY_CURRENT_USER\Software\VS Revo Group\Revo Uninstaller Pro\General]';
          temporal := 'Se configuro el idioma a español.';
        end
        else if Listbox1.Items[Listbox1.Itemindex] = 'poweriso' then
          valor := '[HKEY_CURRENT_USER\Software\PowerISO]'
        else if Listbox1.Items[Listbox1.Itemindex] = 'vmwareworkstation' then
          valor :=
            '[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\VMware, Inc.\VMware Workstation\License.ws.12.0.e2.201505]';
        Memo1.Lines.Clear;
        obtenerdirectorio;
        obtenerversion;
        Memo1.Lines.Add('Estado Licencia: Activado');
        Memo1.Lines.Add('');
        Memo1.Lines.Add('Se agrego valores del crack en el registro de windows');
        Memo1.Lines.Add('');
        if Listbox1.Items[Listbox1.Itemindex] = 'revouninstallerpro' then
        begin
          Memo1.Lines.Add('Cadena de registro: ' + valor);
          Memo1.Lines.Add(temporal);
        end
        else
        begin
          Memo1.Lines.Add('Cadena de registro: ' + valor);
        end;
        WinExec(PCHAR('cmd.exe /C del ' + Listbox1.Items[Listbox1.Itemindex] +
          '.ps1 /q'), SW_HIDE);
        WinExec(PCHAR('cmd.exe /C del ' + Listbox1.Items[Listbox1.Itemindex] +
          '.reg /q'), SW_HIDE);
        timer2.Enabled := false;
      end;
    end
    else
    begin
      //si el archivo no existe lo informa en el memo y para el timer
      Memo1.Lines.Add('');
      Memo1.Lines.Add('No existe el archivo: ' +
        Listbox1.Items[Listbox1.Itemindex] + '.reg');
      timer2.Enabled := false;
    end;
    ShowCursor(true);
  end
  else
  begin
    //si el programa seleccionado es winrar comprueba si existe el archivo .key y lo informa en el memo
    if Listbox1.Items[Listbox1.Itemindex] = 'winrar' then
    begin
      //si el archivo .key existe lo informa en el memo, elimina los archivos y para reloj
      if FileExists(soft + '\rarreg.key') then
      begin
        valor := 'rarreg.key';
        Memo1.Lines.Clear;
        obtenerdirectorio;
        obtenerversion;
        Memo1.Lines.Add('Estado Licencia: Activado');
        Memo1.Lines.Add('');
        Memo1.Lines.Add('Se agrego el crack en el directorio: ' + soft);
        Memo1.Lines.Add('');
        Memo1.Lines.Add('Archivo: ' + valor);
        WinExec(PCHAR('cmd.exe /C del ' + Listbox1.Items[Listbox1.Itemindex] +
          '.ps1 /q'), SW_HIDE);
        WinExec(PCHAR('cmd.exe /C del ' + Listbox1.Items[Listbox1.Itemindex] +
          '-baja.ps1 /q'), SW_HIDE);
        WinExec(PCHAR('cmd.exe /C del ' + Listbox1.Items[Listbox1.Itemindex] +
          '-x64-570es.exe /q'), SW_HIDE);
        timer2.Enabled := false;
      end
      else
      begin
        valor := 'rarreg.key';
        //si el archivo .key no existe lo informa en el memo y para reloj
        Memo1.Lines.Clear;
        obtenerdirectorio;
        obtenerversion;
        Memo1.Lines.Add('Estado Licencia: No activado');
        Memo1.Lines.Add('');
        Memo1.Lines.Add('No existe el archivo: ' + valor);
        Memo1.Lines.Add('En el directorio seleccionado: ' + soft);
        timer2.Enabled := false;
      end;
    end;
    //si el programa seleccionado es Revounistaller pro comprueba si existen los archivos .lic y lo informa en el memo
    if Listbox1.Items[Listbox1.Itemindex] = 'revouninstallerpro' then
    begin
      //si el archivo .key existe lo informa en el memo, elimina los archivos y para reloj
      if
        (FileExists('C:\ProgramData\VS Revo Group\Revo Uninstaller Pro\revouninstallerpro.lic')) and
        (FileExists('C:\ProgramData\VS Revo Group\Revo Uninstaller Pro\revouninstallerpro4.lic')) then
      begin
        valor := 'revouninstallerpro.lic';
        valor1 := 'revouninstallerpro4.lic';
        Memo1.Lines.Clear;
        obtenerdirectorio;
        obtenerversion;
        Memo1.Lines.Add('Estado Licencia: Activado');
        Memo1.Lines.Add('');
        Memo1.Lines.Add('Se agregaron los archivos de licencia en el directorio: C:\ProgramData\VS Revo Group\Revo Uninstaller Pro');
        Memo1.Lines.Add('');
        Memo1.Lines.Add('Archivo: ' + valor);
        Memo1.Lines.Add('Archivo: ' + valor1);
        WinExec(PCHAR('cmd.exe /C del ' + Listbox1.Items[Listbox1.Itemindex] +
          '.ps1 /q'), SW_HIDE);
        WinExec(PCHAR('cmd.exe /C del ' + Listbox1.Items[Listbox1.Itemindex] +
          '.reg /q'), SW_HIDE);
        timer2.Enabled := false;
      end
      else
      begin
        valor := 'revouninstallerpro.lic';
        valor1 := 'revouninstallerpro4.lic';
        //si el archivo .key no existe lo informa en el memo y para reloj
        Memo1.Lines.Clear;
        obtenerdirectorio;
        obtenerversion;
        Memo1.Lines.Add('Estado Licencia: No activado');
        Memo1.Lines.Add('');
        Memo1.Lines.Add('No existen los archivos: ' + valor + ' ' + valor1);
        Memo1.Lines.Add('En el directorio seleccionado: ' + soft);
        timer2.Enabled := false;
      end;
    end;
    ShowCursor(true);
    timer2.Enabled := False;
  end;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
  EjecutaCrack;
  timer3.Enabled := False;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
begin
  Edit1.Text := comparapeso;
  if edit1.Text = '311' then
  begin
    timer4.Enabled := False;
    instalasoft;
  end
  else
  begin
    edit1.Text := comparapeso;
    timer5.Enabled := true;
    timer4.Enabled := False;
  end;
end;

procedure TForm1.Herramientas1Click(Sender: TObject);
begin
  Listbox1.Items.Clear;
  leeini('Herramientas');
  Label5.Caption := 'Categoria: Herramientas';
end;

procedure TForm1.Desinfeccion1Click(Sender: TObject);
begin
  Listbox1.Items.Clear;
  leeini('Desinfeccion');
  Label5.Caption := 'Categoria: Desinfeccion';
end;

procedure TForm1.Offimatica2Click(Sender: TObject);
begin
  Listbox1.Items.Clear;
  leeini('Offimatica');
  Label5.Caption := 'Categoria: Offimatica';
end;

procedure TForm1.Complementos1Click(Sender: TObject);
begin
  Listbox1.Items.Clear;
  leeini('Complementos');
  Label5.Caption := 'Categoria: Complementos';
end;

procedure TForm1.Varios1Click(Sender: TObject);
begin
  Listbox1.Items.Clear;
  leeini('Internet');
  Label5.Caption := 'Categoria: Internet';
end;

procedure TForm1.Cracks1Click(Sender: TObject);
begin
  Listbox1.Items.Clear;
  leeini('Reproductores');
  Label5.Caption := 'Categoria: Reproductores';
end;

procedure TForm1.Cracks2Click(Sender: TObject);
begin
  Listbox1.Items.Clear;
  leeini('Cracks');
  Label5.Caption := 'Categoria: Cracks';
end;

procedure TForm1.Salir1Click(Sender: TObject);
begin
  Halt(0);
end;

procedure TForm1.odos1Click(Sender: TObject);
begin
  Listbox1.Clear;
  leeini('Herramientas');
  leeini('Offimatica');
  leeini('Internet');
  leeini('Reproductores');
  leeini('Desinfeccion');
  leeini('Complementos');
  Label5.Caption := 'Categoria: Todas';
  Listbox1.ItemIndex := 0;
end;

procedure TForm1.FuncionesExtras1Click(Sender: TObject);
begin
  Form5 := TForm5.Create(Self);
  Form5.showmodal;
end;

procedure TForm1.ExportarInforme1Click(Sender: TObject);
begin
  InfoExport;
end;

procedure TForm1.Atajosdeteclado1Click(Sender: TObject);
begin
  Memo1.Lines.Add('Atajos de teclado utiles = '
    + #13 + #10
    + #13 + #10 + 'F10 = Ingreso a Funciones Extras'
    + #13 + #10 + 'F12 = AYUDA'
    + #13 + #10 + 'CTRL + H = AYUDA'
    + #13 + #10
    + #13 + #10 + 'F1 = Muestra categoria HERRAMIENTAS'
    + #13 + #10 + 'F2 = Muestra categoria DESINFECCIÓN'
    + #13 + #10 + 'F3 = Muestra categoria OFFIMÁTICA'
    + #13 + #10 + 'F4 = Muestra categoria COMPLEMENTOS'
    + #13 + #10 + 'F5 = Muestra categoria INTERNET'
    + #13 + #10 + 'F6 = Muestra categoria REPRODUCTORES'
    + #13 + #10 + 'F7 = Muestra categoria CRACKS'
    + #13 + #10 + 'F8 = Muestra TODAS las categoria'
    + #13 + #10 + 'F9 = Limpia la informacion visible'
    + #13 + #10
    + #13 + #10 + 'CTRL + ALT + H = AYUDA sobre chocolatey'
    + #13 + #10 + 'CTRL + ALT + I = Instala programa seleccionado'
    + #13 + #10 + 'CTRL + ALT + V = Verificar programa seleccionado'
    + #13 + #10
    + #13 + #10 + 'CTRL + Q =             Cierra aplicación'
    + #13 + #10 + 'CTRL + ALT + C =   Cierra aplicación'
    + #13 + #10 + 'ESC =                      Cierra aplicación');
end;

procedure TForm1.Verificar1Execute(Sender: TObject);
begin
  BitBtn3.Click;
end;

procedure TForm1.Instala1Execute(Sender: TObject);
begin
  BitBtn1.Click;
end;

procedure TForm1.Help1Execute(Sender: TObject);
begin
  Atajosdeteclado1.Click;
end;

procedure TForm1.Help2Execute(Sender: TObject);
begin
  BitBtn5.Click;
end;

procedure TForm1.Cierra1Execute(Sender: TObject);
begin
  Halt(0);
end;

procedure TForm1.Timer6Timer(Sender: TObject);
begin
  if DirectoryExists(directorio) then
  begin
    DeleteDir(Directorio);
    Timer6.Enabled := False;
  end
  else
  begin
    Timer6.Enabled := False;
  end;
end;

procedure TForm1.LimpiarSeleccin1Click(Sender: TObject);
begin
  CleanData;
end;

procedure TForm1.LimpiarDatos1Click(Sender: TObject);
begin
  CleanData;
end;

procedure TForm1.LimpiarDatos2Click(Sender: TObject);
begin
  CleanData;
end;

procedure TForm1.Listarpaquetesdisponibles1Click(Sender: TObject);
var
  x: Integer;
begin
  Memo1.Clear;
  Memo1.ReadOnly := False;
  Label3.Caption := '10%';
  //posicionamos el progressbar en 10
  Progressbar1.position := 10;
  tmp2 := GetDosOutput(choco + 'choco list');
  Application.ProcessMessages;
  for x := 0 to 100 do
  begin
    Progressbar1.Position := ProgressBar1.Position + 5;
    Label3.Caption := IntToStr(ProgressBar1.Position * 100 div
      ProgressBar1.Max) + '%'; // funciona, saca el porcentaje
    Application.ProcessMessages;
  end;
  Memo1.Lines.Add('');
  Memo1.Lines.Add(tmp2);
  Memo1.SetFocus;
  Memo1.SelStart := 0;
  Memo1.Perform(EM_SCROLLCARET, 0, 0);
end;

procedure TForm1.CargarTXTcontodoslospaquetes1Click(Sender: TObject);
begin
  Memo1.Clear;
  Memo2.Clear;
  try
    memo2.Lines.LoadFromFile('All-Packages.txt');
  finally
    Memo1.ReadOnly := False;
    Memo1.Lines.Add(StringReplace(trim(memo2.Lines.Text), ' ', '',
      [rfReplaceAll, rfIgnoreCase]));
    Memo1.SelStart := 0;
    Memo1.Perform(EM_SCROLLCARET, 0, 0);
    Memo2.Clear;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WinExec('cmd.exe /C taskkill.exe /f /im choco.exe', SW_HIDE);
  WinExec('cmd.exe /C taskkill.exe /f /im chocolatey.exe', SW_HIDE);
  WinExec('cmd.exe /C taskkill.exe /f /im cmd.exe', SW_HIDE);
  LiberarMemoria;
  Action := caFree;
end;

procedure TForm1.Timer8Timer(Sender: TObject);
begin
  Form1.Caption := 'Chocolatey GUI v' +
    GetExeVersion('Project1.exe') + ' - TaylorBundy - ' +
    FormatDateTime('dddddd' + ' - ', dateTimePicker1.Date) + TimeToStr(now);
end;

procedure TForm1.Edit4Change(Sender: TObject);
var
  Posicion: longint;
  Cadena: string;
begin
  cadena := edit4.Text;
  Posicion := Pos(Cadena, Memo1.Text) - 1;
  with Memo1 do
  begin
    SelStart := Posicion;
    SelLength := Length(Cadena);
  end;
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Form1.SetFocus;
end;
end.
