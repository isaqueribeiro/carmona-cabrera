object Form1: TForm1
  Left = 572
  Top = 226
  Width = 817
  Height = 625
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 58
    Height = 13
    Caption = 'emp_codigo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 80
    Width = 85
    Height = 13
    Caption = 'emp_razao_social'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 8
    Top = 120
    Width = 63
    Height = 13
    Caption = 'emp_fantasia'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 8
    Top = 160
    Width = 46
    Height = 13
    Caption = 'emp_cnpj'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 8
    Top = 200
    Width = 62
    Height = 13
    Caption = 'emp_imagem'
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 56
    Width = 134
    Height = 21
    DataField = 'emp_codigo'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 96
    Width = 784
    Height = 21
    DataField = 'emp_razao_social'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 136
    Width = 784
    Height = 21
    DataField = 'emp_fantasia'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 8
    Top = 176
    Width = 264
    Height = 21
    DataField = 'emp_cnpj'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 8
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 4
  end
  object cxDBImage1: TcxDBImage
    Left = 8
    Top = 216
    DataBinding.DataField = 'emp_imagem'
    DataBinding.DataSource = DataSource1
    Properties.GraphicClassName = 'TJPEGImage'
    TabOrder = 5
    Height = 329
    Width = 785
  end
  object conWebMaster: TSQLConnection
    ConnectionName = 'MySQLConnection'
    DriverName = 'MySQL50'
    GetDriverFunc = 'getSQLDriverMYSQL50'
    KeepConnection = False
    LibraryName = 'dbxopenmysql50.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MySQL50'
      'HostName=localhost'
      'Database=tkce'
      'User_Name=root'
      'Password=admin'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Port=3308')
    VendorLib = 'libmysql.dll'
    Left = 256
    Top = 8
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from sys_empresa')
    SQLConnection = conWebMaster
    Left = 256
    Top = 40
    object SQLQuery1emp_codigo: TSmallintField
      FieldName = 'emp_codigo'
      Required = True
    end
    object SQLQuery1emp_razao_social: TStringField
      FieldName = 'emp_razao_social'
      Size = 60
    end
    object SQLQuery1emp_fantasia: TStringField
      FieldName = 'emp_fantasia'
      Size = 60
    end
    object SQLQuery1emp_cnpj: TStringField
      FieldName = 'emp_cnpj'
    end
    object SQLQuery1emp_imagem: TBlobField
      FieldName = 'emp_imagem'
      Size = 1
    end
    object SQLQuery1emp_end_logra: TStringField
      FieldName = 'emp_end_logra'
      Size = 60
    end
    object SQLQuery1emp_end_bairro: TStringField
      FieldName = 'emp_end_bairro'
      Size = 60
    end
    object SQLQuery1emp_end_cidade: TStringField
      FieldName = 'emp_end_cidade'
      Size = 60
    end
    object SQLQuery1emp_end_cep: TStringField
      FieldName = 'emp_end_cep'
      Size = 8
    end
    object SQLQuery1emp_end_uf: TStringField
      FieldName = 'emp_end_uf'
      Size = 2
    end
    object SQLQuery1emp_end_fone: TStringField
      FieldName = 'emp_end_fone'
    end
    object SQLQuery1emp_site: TStringField
      FieldName = 'emp_site'
      Size = 200
    end
    object SQLQuery1emp_ftp: TStringField
      FieldName = 'emp_ftp'
      Size = 200
    end
    object SQLQuery1emp_email: TStringField
      FieldName = 'emp_email'
      Size = 60
    end
    object SQLQuery1emp_inc: TStringField
      FieldName = 'emp_inc'
      Size = 60
    end
    object SQLQuery1emp_alt: TStringField
      FieldName = 'emp_alt'
      Size = 60
    end
    object SQLQuery1emp_custos: TStringField
      FieldName = 'emp_custos'
      Size = 60
    end
    object SQLQuery1emp_financeiro: TStringField
      FieldName = 'emp_financeiro'
      Size = 60
    end
    object SQLQuery1emp_diretor: TStringField
      FieldName = 'emp_diretor'
      Size = 60
    end
    object SQLQuery1emp_aceite: TSmallintField
      FieldName = 'emp_aceite'
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLQuery1
    Left = 288
    Top = 40
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    AfterPost = ClientDataSet1AfterPost
    Left = 320
    Top = 40
    object ClientDataSet1emp_codigo: TSmallintField
      FieldName = 'emp_codigo'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object ClientDataSet1emp_razao_social: TStringField
      FieldName = 'emp_razao_social'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object ClientDataSet1emp_fantasia: TStringField
      FieldName = 'emp_fantasia'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object ClientDataSet1emp_cnpj: TStringField
      FieldName = 'emp_cnpj'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1emp_imagem: TBlobField
      FieldName = 'emp_imagem'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object ClientDataSet1emp_end_logra: TStringField
      FieldName = 'emp_end_logra'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object ClientDataSet1emp_end_bairro: TStringField
      FieldName = 'emp_end_bairro'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object ClientDataSet1emp_end_cidade: TStringField
      FieldName = 'emp_end_cidade'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object ClientDataSet1emp_end_cep: TStringField
      FieldName = 'emp_end_cep'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object ClientDataSet1emp_end_uf: TStringField
      FieldName = 'emp_end_uf'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object ClientDataSet1emp_end_fone: TStringField
      FieldName = 'emp_end_fone'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1emp_site: TStringField
      FieldName = 'emp_site'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object ClientDataSet1emp_ftp: TStringField
      FieldName = 'emp_ftp'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object ClientDataSet1emp_email: TStringField
      FieldName = 'emp_email'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object ClientDataSet1emp_inc: TStringField
      FieldName = 'emp_inc'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object ClientDataSet1emp_alt: TStringField
      FieldName = 'emp_alt'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object ClientDataSet1emp_custos: TStringField
      FieldName = 'emp_custos'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object ClientDataSet1emp_financeiro: TStringField
      FieldName = 'emp_financeiro'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object ClientDataSet1emp_diretor: TStringField
      FieldName = 'emp_diretor'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object ClientDataSet1emp_aceite: TSmallintField
      FieldName = 'emp_aceite'
      ProviderFlags = [pfInUpdate]
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 352
    Top = 40
  end
end
