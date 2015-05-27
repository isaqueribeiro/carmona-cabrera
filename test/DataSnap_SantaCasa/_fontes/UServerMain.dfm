object FrmServerMain: TFrmServerMain
  Left = 271
  Top = 114
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Servidor DataSnap (Santa Casa)'
  ClientHeight = 473
  ClientWidth = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    404
    473)
  PixelsPerInch = 96
  TextHeight = 13
  object LblPortaServico: TLabel
    Left = 8
    Top = 79
    Width = 26
    Height = 13
    Caption = 'Porta'
    FocusControl = EdtPortaServico
  end
  object ButtonStart: TButton
    Left = 8
    Top = 47
    Width = 75
    Height = 25
    Caption = 'Iniciar'
    TabOrder = 0
    OnClick = ButtonStartClick
  end
  object ButtonStop: TButton
    Left = 89
    Top = 47
    Width = 75
    Height = 25
    Caption = 'Parar'
    TabOrder = 1
    OnClick = ButtonStopClick
  end
  object EdtPortaServico: TEdit
    Left = 8
    Top = 98
    Width = 130
    Height = 21
    TabOrder = 2
    Text = '8080'
  end
  object ButtonOpenBrowser: TButton
    Left = 8
    Top = 125
    Width = 130
    Height = 25
    Caption = 'Abrir Navegador'
    TabOrder = 3
    OnClick = ButtonOpenBrowserClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 404
    Height = 41
    Align = alTop
    Caption = 'Servidor DataSnap Web'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object GrpBxConfiguracaoDB: TGroupBox
    Left = 8
    Top = 156
    Width = 388
    Height = 149
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Configurar Conex'#227'o DB (MySQL)'
    TabOrder = 5
    object LblServidor: TLabel
      Left = 16
      Top = 23
      Width = 40
      Height = 13
      Caption = 'Servidor'
      FocusControl = EdtServidor
    end
    object LblBase: TLabel
      Left = 16
      Top = 63
      Width = 70
      Height = 13
      Caption = 'Base de dados'
      FocusControl = EdtBase
    end
    object LblUsuario: TLabel
      Left = 136
      Top = 63
      Width = 36
      Height = 13
      Caption = 'Usu'#225'rio'
      FocusControl = EdtUsuario
    end
    object LblSenha: TLabel
      Left = 256
      Top = 63
      Width = 30
      Height = 13
      Caption = 'Senha'
      FocusControl = EdtSenha
    end
    object LblPorta: TLabel
      Left = 256
      Top = 23
      Width = 26
      Height = 13
      Caption = 'Porta'
      FocusControl = EdtPorta
    end
    object EdtServidor: TEdit
      Left = 16
      Top = 40
      Width = 234
      Height = 21
      TabOrder = 0
      Text = 'skynet.mysql.uhserver.com'
    end
    object EdtBase: TEdit
      Left = 16
      Top = 80
      Width = 114
      Height = 21
      TabOrder = 2
      Text = 'skynet'
    end
    object EdtUsuario: TEdit
      Left = 136
      Top = 80
      Width = 114
      Height = 21
      TabOrder = 3
      Text = 'jonh_conner'
    end
    object EdtSenha: TEdit
      Left = 256
      Top = 80
      Width = 115
      Height = 21
      PasswordChar = '*'
      TabOrder = 4
      Text = 'masterkey@!21'
    end
    object BtnTestarConexao: TButton
      Left = 16
      Top = 107
      Width = 114
      Height = 25
      Caption = 'Testar Conex'#227'o'
      TabOrder = 5
      OnClick = BtnTestarConexaoClick
    end
    object EdtPorta: TEdit
      Left = 256
      Top = 40
      Width = 114
      Height = 21
      TabOrder = 1
      Text = '3306'
    end
    object BtnSalvarConexaoDB: TButton
      Left = 136
      Top = 107
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 6
      OnClick = BtnSalvarConexaoDBClick
    end
  end
  object GrpBxAcesso: TGroupBox
    Left = 8
    Top = 311
    Width = 388
    Height = 130
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Configurar acessos aos sistemas'
    TabOrder = 6
    object Button1: TButton
      Left = 16
      Top = 27
      Width = 114
      Height = 25
      Caption = 'Perfis de acesso'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 16
      Top = 58
      Width = 114
      Height = 25
      Caption = 'Usu'#225'rios do sistema'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 16
      Top = 89
      Width = 114
      Height = 25
      Caption = 'Permiss'#245'es'
      TabOrder = 2
    end
  end
  object appEvents: TApplicationEvents
    OnIdle = appEventsIdle
    Left = 232
    Top = 56
  end
  object SantaCasaCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 264
    Top = 104
  end
  object SantaCasaConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=SantaCasa')
    LoginPrompt = False
    Left = 232
    Top = 104
  end
  object SantaCasaTransaction: TFDTransaction
    Connection = SantaCasaConnection
    Left = 296
    Top = 104
  end
end
