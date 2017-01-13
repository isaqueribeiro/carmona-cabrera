object dmServerMethods: TdmServerMethods
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 323
  Width = 559
  object connBanco: TFDConnection
    Params.Strings = (
      'ConnectionDef=DataSnap_REST')
    LoginPrompt = False
    Left = 104
    Top = 64
  end
  object qryUsuario: TFDQuery
    Connection = connBanco
    Transaction = fbTrans
    UpdateTransaction = fbTrans
    UpdateObject = updUsuario
    SQL.Strings = (
      'SELECT * FROM SYS_USUARIO'
      'where cd_usuario = :login')
    Left = 104
    Top = 112
    ParamData = <
      item
        Name = 'LOGIN'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end>
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 368
    Top = 128
  end
  object updUsuario: TFDUpdateSQL
    Connection = connBanco
    InsertSQL.Strings = (
      'INSERT INTO SYS_USUARIO'
      '(CD_USUARIO, NM_USUARIO, CD_PERFIL)'
      'VALUES (:NEW_CD_USUARIO, :NEW_NM_USUARIO, :NEW_CD_PERFIL)'
      'RETURNING CD_USUARIO, NM_USUARIO, CD_PERFIL')
    ModifySQL.Strings = (
      'UPDATE SYS_USUARIO'
      'SET CD_USUARIO = :NEW_CD_USUARIO, NM_USUARIO = :NEW_NM_USUARIO, '
      '  CD_PERFIL = :NEW_CD_PERFIL'
      'WHERE CD_USUARIO = :OLD_CD_USUARIO'
      'RETURNING CD_USUARIO, NM_USUARIO, CD_PERFIL')
    DeleteSQL.Strings = (
      'DELETE FROM SYS_USUARIO'
      'WHERE CD_USUARIO = :OLD_CD_USUARIO')
    FetchRowSQL.Strings = (
      'SELECT CD_USUARIO, NM_USUARIO, CD_PERFIL'
      'FROM SYS_USUARIO'
      'WHERE CD_USUARIO = :CD_USUARIO')
    Left = 104
    Top = 160
  end
  object fbTrans: TFDTransaction
    Connection = connBanco
    Left = 144
    Top = 64
  end
  object fdGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 176
    Top = 64
  end
end
