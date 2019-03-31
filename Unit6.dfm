object Form6: TForm6
  Left = 1370
  Top = 193
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Form6'
  ClientHeight = 571
  ClientWidth = 528
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 513
    Height = 553
    BevelInner = bvRaised
    Color = clActiveCaption
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 28
      Height = 13
      Caption = 'Edit1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 28
      Height = 13
      Caption = 'Edit4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 88
      Width = 42
      Height = 13
      Caption = 'Memo2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 264
      Top = 88
      Width = 42
      Height = 13
      Caption = 'Memo3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit4: TEdit
      Left = 8
      Top = 64
      Width = 497
      Height = 21
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 8
      Top = 24
      Width = 497
      Height = 21
      Hint = 'BetaTester Purposes'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object BitBtn7: TBitBtn
      Left = 8
      Top = 520
      Width = 75
      Height = 25
      Caption = 'pruebas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn7Click
    end
    object Memo3: TMemo
      Left = 264
      Top = 104
      Width = 241
      Height = 409
      Color = clGradientActiveCaption
      ScrollBars = ssBoth
      TabOrder = 2
    end
    object Button1: TButton
      Left = 432
      Top = 520
      Width = 75
      Height = 25
      Caption = 'Cerrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 88
      Top = 520
      Width = 75
      Height = 25
      Caption = 'Obtener Listado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = Button2Click
    end
    object Memo1: TMemo
      Left = 8
      Top = 104
      Width = 249
      Height = 201
      Color = clGradientActiveCaption
      ScrollBars = ssBoth
      TabOrder = 6
    end
    object Button3: TButton
      Left = 168
      Top = 520
      Width = 75
      Height = 25
      Caption = 'Procesar Todos'
      TabOrder = 7
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 248
      Top = 520
      Width = 75
      Height = 25
      Caption = 'Cargar TXT'
      TabOrder = 8
      OnClick = Button4Click
    end
    object ListBox1: TListBox
      Left = 8
      Top = 312
      Width = 249
      Height = 201
      ItemHeight = 13
      Sorted = True
      TabOrder = 9
    end
    object Button5: TButton
      Left = 328
      Top = 520
      Width = 75
      Height = 25
      Caption = 'Pasamos listbox'
      TabOrder = 10
      OnClick = Button5Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 88
    Top = 224
    object Archivo1: TMenuItem
      Caption = 'Archivo'
      object Limpiardatos1: TMenuItem
        Caption = 'Limpiar datos'
        ShortCut = 120
        OnClick = Limpiardatos1Click
      end
    end
  end
end
