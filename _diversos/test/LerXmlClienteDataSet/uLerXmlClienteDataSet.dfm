object FrmLerXmlClienteDataSet: TFrmLerXmlClienteDataSet
  Left = 388
  Top = 218
  Width = 1305
  Height = 675
  BorderWidth = 4
  Caption = 'Ler Arquivo XML (ClientDataSet)'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 15
  object Bevel1: TBevel
    Left = 0
    Top = 73
    Width = 1281
    Height = 4
    Align = alTop
    Shape = bsSpacer
  end
  object Bevel2: TBevel
    Left = 521
    Top = 77
    Width = 4
    Height = 552
    Align = alLeft
    Shape = bsSpacer
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1281
    Height = 73
    Align = alTop
    Caption = '1. Selecionar arquivo'
    TabOrder = 0
    object lblNomeArquivo: TLabel
      Left = 16
      Top = 24
      Width = 97
      Height = 15
      Caption = 'Nome do arquivo:'
      FocusControl = edNomeArquivo
    end
    object edNomeArquivo: TEdit
      Left = 16
      Top = 40
      Width = 617
      Height = 23
      ReadOnly = True
      TabOrder = 0
    end
    object btnSelecionar: TButton
      Left = 640
      Top = 16
      Width = 75
      Height = 48
      Caption = 'Selecionar'
      TabOrder = 1
      OnClick = btnSelecionarClick
    end
    object btnCarregar: TButton
      Left = 720
      Top = 16
      Width = 75
      Height = 48
      Caption = 'Carregar'
      TabOrder = 2
      OnClick = btnCarregarClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 77
    Width = 521
    Height = 552
    Align = alLeft
    Caption = 'Dados da Licen'#231'a'
    TabOrder = 1
    object dbgLicenca: TDBGrid
      Left = 2
      Top = 17
      Width = 517
      Height = 533
      Align = alClient
      DataSource = dtsLicenca
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Calibri'
      TitleFont.Style = []
    end
  end
  object GroupBox3: TGroupBox
    Left = 525
    Top = 77
    Width = 756
    Height = 552
    Align = alClient
    Caption = 'Empresas'
    TabOrder = 2
    object dbgEmpresa: TDBGrid
      Left = 2
      Top = 17
      Width = 752
      Height = 533
      Align = alClient
      DataSource = dtsEmpresa
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Calibri'
      TitleFont.Style = []
    end
  end
  object opdArquivo: TOpenDialog
    Filter = 'Arquivos *.dat|*.dat'
    Title = 'Selecionar arquivo'
    Left = 608
    Top = 16
  end
  object cdsLicenca: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 197
  end
  object dtsLicenca: TDataSource
    DataSet = cdsLicenca
    Left = 64
    Top = 197
  end
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 565
    Top = 205
  end
  object dtsEmpresa: TDataSource
    DataSet = cdsEmpresa
    Left = 597
    Top = 205
  end
end
