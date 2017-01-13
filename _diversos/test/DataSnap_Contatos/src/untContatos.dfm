object frmContatos: TfrmContatos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Contatos'
  ClientHeight = 289
  ClientWidth = 613
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 35
    Top = 8
    Width = 15
    Height = 13
    Alignment = taRightJustify
    Caption = 'ID:'
  end
  object DBText1: TDBText
    Left = 56
    Top = 8
    Width = 65
    Height = 17
    DataField = 'ID'
    DataSource = dtsContatos
  end
  object Label2: TLabel
    Left = 171
    Top = 8
    Width = 74
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data Cadastro:'
  end
  object DBText2: TDBText
    Left = 251
    Top = 8
    Width = 65
    Height = 17
    DataField = 'DATA_CADASTRO'
    DataSource = dtsContatos
  end
  object Label3: TLabel
    Left = 19
    Top = 34
    Width = 31
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nome:'
  end
  object Label4: TLabel
    Left = 4
    Top = 61
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'Telefone:'
  end
  object DBEdit1: TDBEdit
    Left = 56
    Top = 31
    Width = 451
    Height = 21
    DataField = 'NOME'
    DataSource = dtsContatos
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 56
    Top = 58
    Width = 189
    Height = 21
    DataField = 'TELEFONE'
    DataSource = dtsContatos
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 85
    Width = 597
    Height = 120
    DataSource = dtsContatos
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 211
    Width = 597
    Height = 62
    Caption = 'Controles'
    TabOrder = 3
    object DBNavigator1: TDBNavigator
      Left = 11
      Top = 24
      Width = 240
      Height = 25
      DataSource = dtsContatos
      TabOrder = 0
    end
    object Button1: TButton
      Left = 257
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 1
      OnClick = Button1Click
    end
    object edtBuscar: TEdit
      Left = 338
      Top = 24
      Width = 168
      Height = 21
      TabOrder = 2
    end
    object Button2: TButton
      Left = 512
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object dtsContatos: TDataSource
    DataSet = DM.cdsContatos
    Left = 336
    Top = 32
  end
end
