object ServerMethods: TServerMethods
  OldCreateOrder = False
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
end
