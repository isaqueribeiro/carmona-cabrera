object FrmUsuarioCadastro: TFrmUsuarioCadastro
  Left = 0
  Top = 0
  ActiveControl = dbeDescricao
  BorderStyle = bsDialog
  Caption = 'Cadastro do Usu'#225'rio'
  ClientHeight = 323
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
    Top = 281
    Width = 509
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 1
    ExplicitTop = 196
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
    end
  end
  object PgcControle: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 509
    Height = 272
    ActivePage = TbsPerfil
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 187
    object TbsPerfil: TTabSheet
      Caption = 'Cadastro'
      ExplicitHeight = 159
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 495
        Height = 230
        Align = alTop
        Caption = 'Dados Nominais'
        TabOrder = 0
        ExplicitTop = 0
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
          Width = 25
          Height = 13
          Caption = 'Login'
          FocusControl = dbeDescricao
        end
        object lblSenha: TLabel
          Left = 239
          Top = 72
          Width = 30
          Height = 13
          Caption = 'Senha'
          FocusControl = dbeSenha
        end
        object lblNomeCompleto: TLabel
          Left = 24
          Top = 120
          Width = 73
          Height = 13
          Caption = 'Nome completo'
          FocusControl = dbeNomeCompleto
        end
        object lblPerfil: TLabel
          Left = 239
          Top = 120
          Width = 75
          Height = 13
          Caption = 'Perfil de acesso'
          FocusControl = dblPerfil
        end
        object dbeID: TDBEdit
          Left = 24
          Top = 43
          Width = 449
          Height = 21
          Color = cl3DLight
          DataField = 'id_usuario'
          DataSource = FrmUsuario.DtsUsuario
          ReadOnly = True
          TabOrder = 0
        end
        object dbeDescricao: TDBEdit
          Left = 24
          Top = 91
          Width = 209
          Height = 21
          DataField = 'nm_login'
          DataSource = FrmUsuario.DtsUsuario
          TabOrder = 1
        end
        object dbcAtivo: TDBCheckBox
          Left = 24
          Top = 174
          Width = 97
          Height = 17
          Caption = 'Ativo'
          DataField = 'sn_ativo'
          DataSource = FrmUsuario.DtsUsuario
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbeSenha: TDBEdit
          Left = 239
          Top = 91
          Width = 234
          Height = 21
          DataField = 'ds_senha'
          DataSource = FrmUsuario.DtsUsuario
          PasswordChar = '*'
          TabOrder = 2
        end
        object dbeNomeCompleto: TDBEdit
          Left = 24
          Top = 139
          Width = 209
          Height = 21
          DataField = 'nm_usuario'
          DataSource = FrmUsuario.DtsUsuario
          TabOrder = 3
        end
        object dbcAlterarSenha: TDBCheckBox
          Left = 24
          Top = 197
          Width = 209
          Height = 17
          Caption = 'Altera senha no primeiro login'
          DataField = 'sn_alterar_senha'
          DataSource = FrmUsuario.DtsUsuario
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dblPerfil: TDBLookupComboBox
          Left = 239
          Top = 139
          Width = 234
          Height = 21
          DataField = 'id_perfil'
          DataSource = FrmUsuario.DtsUsuario
          KeyField = 'id_perfil'
          ListField = 'ds_perfil'
          ListSource = FrmUsuario.DtsPerfil
          TabOrder = 4
        end
      end
    end
  end
end
