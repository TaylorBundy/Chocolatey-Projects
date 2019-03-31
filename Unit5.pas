unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses unit1, unit6;

{$R *.dfm}

procedure TForm5.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['a'..'z', 'A'..'Z', #8]) then
  begin
    Key := #0;
  end;
end;

procedure TForm5.BitBtn1Click(Sender: TObject);
begin
  if Edit1.Text = 'admin' then
  begin
    if Edit2.Text = '123' then
    begin
      if (Form1.edit1.visible = false) and (Form1.edit4.visible = false) and
        (Form1.bitbtn6.Enabled = false) and
        (Form1.Memo2.visible = false) and
        (Form1.Listarpaquetesdisponibles1.Visible
        = False) and (Form1.Edit3.Enabled = false) and
        (Form1.CargarTXTcontodoslospaquetes1.Visible = False) then
      begin
        Form1.Memo2.Visible := True;
        Form1.Edit1.Visible := True;
        Form1.Edit3.Enabled := True;
        Form1.Edit4.Visible := True;
        Form1.BitBtn6.Enabled := True;
        Form1.Listarpaquetesdisponibles1.Visible := True;
        Form1.CargarTXTcontodoslospaquetes1.Visible := True;
        Form6 := TForm6.Create(self);
        Form6.Show;
      end
      else
      begin
        Form1.Edit1.Visible := False;
        Form1.Memo2.Visible := False;
        Form1.Edit3.Enabled := False;
        Form1.Edit4.Visible := False;
        Form1.BitBtn6.Enabled := False;
        Form1.Listarpaquetesdisponibles1.Visible := False;
        Form1.CargarTXTcontodoslospaquetes1.Visible := False;
        if Form6.Visible = true then
          Form6.Close;
        Form6.Free;
      end;
    end
    else
    begin
      ShowMessage('Usuario o Contraseña invalidos');
    end;
  end
  else
  begin
    ShowMessage('Usuario o Contraseña invalidos');
  end;
end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
  if Edit1.Text = 'admin' then
  begin
    edit2.SetFocus;
  end
  else
  begin
    edit1.SetFocus;
  end;
end;

end.
