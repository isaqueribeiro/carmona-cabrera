object FrmUsuario: TFrmUsuario
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Tabela de Usu'#225'rios dos Sistemas'
  ClientHeight = 354
  ClientWidth = 656
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PgcControle: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 650
    Height = 310
    ActivePage = TbsPerfil
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TbsPerfil: TTabSheet
      Caption = 'Tabela'
      object dbgTabela: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 636
        Height = 207
        Align = alClient
        DataSource = DtsUsuario
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyPress = dbgTabelaKeyPress
        OnTitleClick = dbgTabelaTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'id_usuario'
            Title.Caption = 'ID'
            Width = 230
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_login'
            Title.Caption = 'Login'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_perfil'
            Title.Caption = 'Perfil de acesso'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_usuario'
            Title.Caption = 'Nome completo'
            Width = 350
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'sn_ativo'
            Title.Alignment = taCenter
            Title.Caption = 'Ativo?'
            Width = 40
            Visible = True
          end>
      end
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 216
        Width = 636
        Height = 63
        Align = alBottom
        Caption = 'Controle'
        TabOrder = 1
        object LblBusca: TLabel
          Left = 303
          Top = 29
          Width = 56
          Height = 13
          Alignment = taRightJustify
          Caption = 'Busca Login'
          FocusControl = EdtBusca
        end
        object DBNavigator: TDBNavigator
          Left = 11
          Top = 19
          Width = 250
          Height = 33
          DataSource = DtsUsuario
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = DBNavigatorClick
        end
        object EdtBusca: TEdit
          Left = 365
          Top = 26
          Width = 167
          Height = 21
          TabOrder = 1
        end
        object BtnPesquisar: TButton
          Left = 538
          Top = 24
          Width = 89
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 2
          OnClick = BtnPesquisarClick
        end
      end
    end
  end
  object PnlFinal: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 312
    Width = 650
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 1
    object ButtonClose: TButton
      Left = 545
      Top = 4
      Width = 101
      Height = 31
      Align = alRight
      Cancel = True
      Caption = 'Fechar'
      ModalResult = 2
      TabOrder = 0
    end
  end
  object QryUsuario: TFDQuery
    OnNewRecord = QryUsuarioNewRecord
    Connection = FrmServerMain.SantaCasaConnection
    Transaction = FrmServerMain.SantaCasaTransaction
    UpdateTransaction = FrmServerMain.SantaCasaTransaction
    UpdateObject = UpdUsuario
    SQL.Strings = (
      'Select '
      '  u.*, p.ds_perfil '
      'from sys_usuario u'
      '  inner join sys_perfil p on (p.id_perfil = u.id_perfil)')
    Left = 336
    Top = 96
  end
  object DtsUsuario: TDataSource
    DataSet = QryUsuario
    Left = 336
    Top = 144
  end
  object UpdUsuario: TFDUpdateSQL
    Connection = FrmServerMain.SantaCasaConnection
    InsertSQL.Strings = (
      'INSERT INTO skynet.sys_usuario'
      '(id_usuario, nm_login, ds_senha, id_perfil, '
      '  nm_usuario, sn_ativo, sn_alterar_senha)'
      
        'VALUES (:NEW_id_usuario, :NEW_nm_login, :NEW_ds_senha, :NEW_id_p' +
        'erfil, '
      '  :NEW_nm_usuario, :NEW_sn_ativo, :NEW_sn_alterar_senha)')
    ModifySQL.Strings = (
      'UPDATE skynet.sys_usuario'
      
        'SET id_usuario = :NEW_id_usuario, nm_login = :NEW_nm_login, ds_s' +
        'enha = :NEW_ds_senha, '
      '  id_perfil = :NEW_id_perfil, nm_usuario = :NEW_nm_usuario, '
      
        '  sn_ativo = :NEW_sn_ativo, sn_alterar_senha = :NEW_sn_alterar_s' +
        'enha'
      'WHERE id_usuario = :OLD_id_usuario')
    DeleteSQL.Strings = (
      'DELETE FROM skynet.sys_usuario'
      'WHERE id_usuario = :OLD_id_usuario')
    FetchRowSQL.Strings = (
      
        'SELECT id_usuario, nm_login, ds_senha, id_perfil, nm_usuario, sn' +
        '_ativo, '
      '  sn_alterar_senha'
      'FROM skynet.sys_usuario'
      'WHERE id_usuario = :id_usuario')
    Left = 368
    Top = 96
  end
  object QryPerfil: TFDQuery
    Connection = FrmServerMain.SantaCasaConnection
    Transaction = FrmServerMain.SantaCasaTransaction
    UpdateTransaction = FrmServerMain.SantaCasaTransaction
    SQL.Strings = (
      'Select * from sys_perfil')
    Left = 472
    Top = 96
  end
  object DtsPerfil: TDataSource
    DataSet = QryPerfil
    Left = 472
    Top = 144
  end
end
