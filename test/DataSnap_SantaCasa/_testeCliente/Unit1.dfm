object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 597
  ClientWidth = 840
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 16
    Top = 8
    Width = 161
    Height = 25
    Caption = 'Carregar Perfil'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 39
    Width = 481
    Height = 184
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Edit1: TEdit
    Left = 16
    Top = 229
    Width = 484
    Height = 21
    TabOrder = 2
    Text = 'Isaque Marinho Ribeiro'
  end
  object Edit2: TEdit
    Left = 16
    Top = 256
    Width = 484
    Height = 21
    TabOrder = 3
  end
  object Encriptar: TButton
    Left = 16
    Top = 283
    Width = 75
    Height = 25
    Caption = 'Encriptar'
    TabOrder = 4
    OnClick = EncriptarClick
  end
  object DBGrid2: TDBGrid
    Left = 400
    Top = 320
    Width = 432
    Height = 120
    DataSource = DataSource2
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button2: TButton
    Left = 400
    Top = 289
    Width = 75
    Height = 25
    Caption = 'Abrir'
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 481
    Top = 289
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 7
    OnClick = Button3Click
  end
  object DBNavigator1: TDBNavigator
    Left = 400
    Top = 446
    Width = 240
    Height = 25
    DataSource = DataSource2
    TabOrder = 8
  end
  object memPerfil: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    Left = 16
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = memPerfil
    Left = 16
    Top = 48
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 368
    Top = 80
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 368
    Top = 128
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Protocol=http'
      'Server=localhost'
      'Port=8080'
      'User_Name=admin'
      'Password=RXUgc2VpIHF1ZSBtZXUgUmVkZW50b3Igdml2ZSE='
      'DriverID=DS')
    LoginPrompt = False
    Left = 224
    Top = 352
  end
  object FDPhysDSDriverLink1: TFDPhysDSDriverLink
    Left = 224
    Top = 400
  end
  object FDPhysTDBXDriverLink1: TFDPhysTDBXDriverLink
    Left = 224
    Top = 448
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 136
    Top = 400
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 152
    Top = 360
  end
  object FDStoredProc1: TFDStoredProc
    Connection = FDConnection1
    SchemaName = 'TServerMethods'
    StoredProcName = 'GetPerfilDataSet'
    Left = 328
    Top = 360
    ParamData = <
      item
        Name = 'ReturnValue'
        DataType = ftDataSet
        ParamType = ptResult
        DataTypeName = 'TDBXTypes.TABLE'
      end>
  end
  object DataSource2: TDataSource
    DataSet = FDStoredProc1
    Left = 328
    Top = 392
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'Select * from sys_perfil')
    Left = 592
    Top = 216
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from sys_perfil')
    SQLConnection = SQLConnection1
    Left = 688
    Top = 496
  end
  object SQLStoredProc1: TSQLStoredProc
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 568
    Top = 496
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DbxDatasnap'
      'HostName=localhost'
      'Port=8080'
      'CommunicationProtocol=http'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=21.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}'
      'DSAuthenticationUser=admin'
      
        'DSAuthenticationPassword=RXUgc2VpIHF1ZSBtZXUgUmVkZW50b3Igdml2ZSE' +
        '=')
    Left = 528
    Top = 496
    UniqueId = '{C286100A-7399-436A-B04B-23EE5BE291E2}'
  end
end
