object dmServerMethods: TdmServerMethods
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 352
  Width = 573
  object Datasnap: TFDConnection
    Params.Strings = (
      'ConnectionDef=DataSnap_Contatos')
    LoginPrompt = False
    Left = 285
    Top = 121
  end
  object ContatosTable: TFDQuery
    Connection = Datasnap
    SQL.Strings = (
      'SELECT * FROM CONTATOS')
    Left = 285
    Top = 169
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 288
    Top = 224
  end
end
