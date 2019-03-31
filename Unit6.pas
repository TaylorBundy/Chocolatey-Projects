unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Menus;

type
  TForm6 = class(TForm)
    Panel1: TPanel;
    Edit4: TEdit;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn7: TBitBtn;
    Memo3: TMemo;
    MainMenu1: TMainMenu;
    Archivo1: TMenuItem;
    Limpiardatos1: TMenuItem;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    Button4: TButton;
    ListBox1: TListBox;
    Button5: TButton;
    procedure Limpiardatos1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses unit1, unit2, unit4, unit5;

{$R *.dfm}

procedure TForm6.Limpiardatos1Click(Sender: TObject);
var
  allcomp2, y: integer;
begin
  AllComp2 := Form6.ComponentCount;
  Form6.Listbox1.ClearSelection;
  for y := 0 to allcomp2 - 1 do
    if (Form6.Components[y] is TMemo) or (Form6.Components[y] is TEdit) or
      (Form6.Components[y] is TListbox) then
    begin
      TMemo(Form6.Components[y]).Clear;
      TEdit(Form6.Components[y]).Clear;
      TListbox(Form6.Components[y]).Clear;
    end;

end;

procedure TForm6.BitBtn7Click(Sender: TObject);
begin
  Form1.Memo1.Lines.Add(GetDosOutput(choco + 'choco ' + edit1.Text));
  Form1.Edit1.Text := IntToStr(Form1.Memo1.Lines.Count);
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  ObtenerListado;
end;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Memo2.Visible := False;
  Form1.Edit1.Visible := False;
  Form1.Edit3.Enabled := False;
  Form1.Edit4.Visible := False;
  Form1.BitBtn6.Enabled := False;
  Form1.SetFocus;
  Form1.Listarpaquetesdisponibles1.Visible := False;
  Form1.CargarTXTcontodoslospaquetes1.Visible := False;
  Action := caFree;
  LiberarMemoria;
end;
//pasamos solo los noombres del memo1 del form1 al memo1 del form6 y luego pasamos solo los nombres al memo1 del form1

procedure TForm6.Button3Click(Sender: TObject);
var
  y, h: integer;
begin
  try
    for y := 0 to Memo1.Lines.Count - 1 do
    begin
      h := AnsiPos(' ', Memo1.Lines.Strings[y]);
      memo3.Lines.Add(copy(Memo1.Lines.Strings[y], 0, h));
    end;
  finally
    Form1.Memo1.Clear;
    Form1.Memo1.Lines.Add(StringReplace(trim(Memo3.Lines.Text), ' ', '',
      [rfReplaceAll, rfIgnoreCase]));
    form1.Memo1.SelStart := 0;
    form1.Memo1.Perform(EM_SCROLLCARET, 0, 0);
  end;

end;
//Cargamos txt

procedure TForm6.Button4Click(Sender: TObject);
var
  y: integer;
  openDialog: TOpenDialog;
begin
  Listbox1.Clear;
  memo1.Clear;
  memo3.Clear;
  // Create the open dialog object - assign to our open dialog variable
  openDialog := TOpenDialog.Create(self);
  // Set up the starting directory to be the current one
  openDialog.InitialDir := GetCurrentDir;
  // Allow only .dpr and .pas files to be selected
  openDialog.Filter := 'Text file|*.txt';
  // Select pascal files as the starting filter type
  openDialog.FilterIndex := 1;
  try
    if openDialog.Execute then
    begin
      Listbox1.Items.LoadFromFile(OpenDialog.FileName);
    end;
  finally
    for y := 0 to listbox1.items.Count - 1 do
    begin
      Memo1.Lines.Add(Listbox1.Items.Strings[y]);
    end;
  end;
  // Free up the dialog
  openDialog.Free;
end;

procedure TForm6.Button5Click(Sender: TObject);
begin
  Form1.Memo1.Lines.Add(trim(Listbox1.Items.Text));
end;

end.
