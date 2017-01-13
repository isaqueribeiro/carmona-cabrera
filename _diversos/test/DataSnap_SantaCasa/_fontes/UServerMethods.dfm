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
    Left = 49
    Top = 38
  end
  object SantaCasaConnTrans: TFDTransaction
    Connection = SantaCasaConn
    Left = 48
    Top = 88
  end
  object SantaCasaCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 48
    Top = 136
  end
  object FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink
    Left = 168
    Top = 128
  end
  object FDStanStorageJSONLink: TFDStanStorageJSONLink
    Left = 168
    Top = 272
  end
  object FDStanStorageBinLink: TFDStanStorageBinLink
    Left = 168
    Top = 320
  end
  object FDPhysTDBXDriverLink: TFDPhysTDBXDriverLink
    Left = 168
    Top = 176
  end
  object FDPhysDSDriverLink: TFDPhysDSDriverLink
    Left = 168
    Top = 224
  end
  object qryBusca: TFDQuery
    Connection = SantaCasaConn
    Transaction = SantaCasaConnTrans
    SQL.Strings = (
      'Select *'
      'from sys_perfil'
      'order by ds_perfil')
    Left = 48
    Top = 184
  end
  object qryPerfil: TFDQuery
    Connection = SantaCasaConn
    Transaction = SantaCasaConnTrans
    UpdateObject = updPerfil
    SQL.Strings = (
      'Select *'
      'from sys_perfil'
      'order by ds_perfil')
    Left = 376
    Top = 248
  end
  object updPerfil: TFDUpdateSQL
    Connection = SantaCasaConn
    InsertSQL.Strings = (
      'INSERT INTO skynet.sys_perfil'
      '(id_perfil, ds_perfil, sn_perfil)'
      'VALUES (:NEW_id_perfil, :NEW_ds_perfil, :NEW_sn_perfil)')
    ModifySQL.Strings = (
      'UPDATE skynet.sys_perfil'
      
        'SET id_perfil = :NEW_id_perfil, ds_perfil = :NEW_ds_perfil, sn_p' +
        'erfil = :NEW_sn_perfil'
      'WHERE id_perfil = :OLD_id_perfil')
    DeleteSQL.Strings = (
      'DELETE FROM skynet.sys_perfil'
      'WHERE id_perfil = :OLD_id_perfil')
    FetchRowSQL.Strings = (
      'SELECT id_perfil, ds_perfil, sn_perfil'
      'FROM skynet.sys_perfil'
      'WHERE id_perfil = :id_perfil')
    Left = 376
    Top = 296
  end
end
