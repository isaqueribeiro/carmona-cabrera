object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 327
  Width = 556
  object conConnection: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=21.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b')
    Left = 200
    Top = 96
    UniqueId = '{64E59A39-92BB-4A5C-A09F-CEF55E4387D3}'
  end
  object DSProviderConnection: TDSProviderConnection
    ServerClassName = 'TSM'
    SQLConnection = conConnection
    Left = 200
    Top = 144
  end
  object cdsContatos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end>
    ProviderName = 'dspContatos'
    RemoteServer = DSProviderConnection
    BeforePost = cdsContatosBeforePost
    OnNewRecord = cdsContatosNewRecord
    Left = 200
    Top = 192
    object cdsContatosID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsContatosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 240
    end
    object cdsContatosTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 45
    end
    object cdsContatosDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
  end
  object ssmMethodServer: TSqlServerMethod
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'aSequence'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'ReturnParameter'
        ParamType = ptResult
        Size = 4
      end>
    SQLConnection = conConnection
    ServerMethodName = 'TSM.GenerateID'
    Left = 312
    Top = 136
  end
end
