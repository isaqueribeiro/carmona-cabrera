object dmDataModule: TdmDataModule
  OldCreateOrder = False
  Height = 476
  Width = 732
  object conn: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'DriverID=DS')
    Connected = True
    LoginPrompt = False
    Left = 72
    Top = 40
  end
  object FDPhysDSDriverLink: TFDPhysDSDriverLink
    Left = 72
    Top = 96
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 72
    Top = 144
  end
  object ssmServerMethods: TFDStoredProc
    Connection = conn
    SchemaName = 'TdmServerMethods'
    StoredProcName = 'ReverseString'
    Left = 72
    Top = 192
    ParamData = <
      item
        Name = 'Value'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Position = 1
        Name = 'ReturnValue'
        DataType = ftWideString
        ParamType = ptResult
      end>
  end
  object ssmContatosDados: TFDStoredProc
    Connection = conn
    SchemaName = 'TdmServerMethods'
    StoredProcName = 'ContatosDados'
    Left = 352
    Top = 344
    ParamData = <
      item
        Name = 'ReturnValue'
        DataType = ftDataSet
        ParamType = ptResult
        DataTypeName = 'TDBXTypes.TABLE'
      end>
  end
end
