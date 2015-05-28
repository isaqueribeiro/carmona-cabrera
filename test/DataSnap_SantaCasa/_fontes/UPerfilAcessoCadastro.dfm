object FrmPerfilAcessoCadastro: TFrmPerfilAcessoCadastro
  Left = 0
  Top = 0
  ActiveControl = dbeDescricao
  BorderStyle = bsDialog
  Caption = 'Cadastro do Perfil de Acesso'
  ClientHeight = 238
  ClientWidth = 515
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PnlFinal: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 196
    Width = 509
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 1
    ExplicitLeft = -135
    ExplicitTop = 202
    ExplicitWidth = 650
    object BtnCancelar: TButton
      Left = 429
      Top = 4
      Width = 76
      Height = 31
      Align = alRight
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
      ExplicitLeft = 404
    end
    object BtnSalvar: TButton
      Left = 353
      Top = 4
      Width = 76
      Height = 31
      Align = alRight
      Caption = 'Salvar'
      ModalResult = 2
      TabOrder = 0
      OnClick = BtnSalvarClick
      ExplicitLeft = 328
    end
  end
  object PgcControle: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 509
    Height = 187
    ActivePage = TbsPerfil
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 190
    object TbsPerfil: TTabSheet
      Caption = 'Cadastro'
      ExplicitWidth = 642
      ExplicitHeight = 282
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 495
        Height = 150
        Align = alTop
        Caption = 'Dados Nominais'
        TabOrder = 0
        object lblID: TLabel
          Left = 24
          Top = 24
          Width = 11
          Height = 13
          Caption = 'ID'
          FocusControl = dbeID
        end
        object lblDescricao: TLabel
          Left = 24
          Top = 72
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbeDescricao
        end
        object dbeID: TDBEdit
          Left = 24
          Top = 43
          Width = 449
          Height = 21
          Color = cl3DLight
          DataField = 'id_perfil'
          DataSource = FrmPerfilAcesso.DtsPerfil
          ReadOnly = True
          TabOrder = 0
        end
        object dbeDescricao: TDBEdit
          Left = 24
          Top = 91
          Width = 449
          Height = 21
          DataField = 'ds_perfil'
          DataSource = FrmPerfilAcesso.DtsPerfil
          TabOrder = 1
        end
        object dbcAtivo: TDBCheckBox
          Left = 24
          Top = 118
          Width = 97
          Height = 17
          Caption = 'Ativo'
          DataField = 'sn_perfil'
          DataSource = FrmPerfilAcesso.DtsPerfil
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
  end
end
