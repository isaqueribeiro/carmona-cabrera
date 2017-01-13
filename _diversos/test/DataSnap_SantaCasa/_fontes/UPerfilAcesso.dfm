object FrmPerfilAcesso: TFrmPerfilAcesso
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Tabela de Perfis de Acesso aos Sistemas'
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
        DataSource = DtsPerfil
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
            FieldName = 'id_perfil'
            Title.Caption = 'ID'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_perfil'
            Title.Caption = 'Descri'#231#227'o'
            Width = 300
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'sn_perfil'
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
          Left = 331
          Top = 29
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Busca'
          FocusControl = EdtBusca
        end
        object DBNavigator: TDBNavigator
          Left = 11
          Top = 19
          Width = 250
          Height = 33
          DataSource = DtsPerfil
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
  object QryPerfil: TFDQuery
    OnNewRecord = QryPerfilNewRecord
    Connection = FrmServerMain.SantaCasaConnection
    Transaction = FrmServerMain.SantaCasaTransaction
    UpdateTransaction = FrmServerMain.SantaCasaTransaction
    UpdateObject = UpdPerfil
    SQL.Strings = (
      'Select * from sys_perfil')
    Left = 336
    Top = 96
  end
  object DtsPerfil: TDataSource
    DataSet = QryPerfil
    Left = 336
    Top = 144
  end
  object UpdPerfil: TFDUpdateSQL
    Connection = FrmServerMain.SantaCasaConnection
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
    Left = 368
    Top = 96
  end
end
