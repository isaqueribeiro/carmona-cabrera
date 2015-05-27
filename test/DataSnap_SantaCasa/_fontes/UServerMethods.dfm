object ServerMethods: TServerMethods
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 485
  Width = 663
  object SantaCasaConn: TFDConnection
    Params.Strings = (
      'ConnectionDef=SantaCasa')
    LoginPrompt = False
    Transaction = SantaCasaConnTrans
    UpdateTransaction = SantaCasaConnTrans
    Left = 57
    Top = 46
  end
  object SantaCasaConnTrans: TFDTransaction
    Connection = SantaCasaConn
    Left = 56
    Top = 96
  end
  object SantaCasaCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 56
    Top = 144
  end
  object FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink
    Left = 264
    Top = 112
  end
  object FDStanStorageJSONLink: TFDStanStorageJSONLink
    Left = 264
    Top = 256
  end
  object FDStanStorageBinLink: TFDStanStorageBinLink
    Left = 264
    Top = 304
  end
  object FDPhysTDBXDriverLink: TFDPhysTDBXDriverLink
    Left = 264
    Top = 160
  end
  object FDPhysDSDriverLink: TFDPhysDSDriverLink
    Left = 264
    Top = 208
  end
end
