object frmEncriptar: TfrmEncriptar
  Left = 573
  Top = 322
  BorderStyle = bsSingle
  Caption = 'Encriptar dados para o GA (Gestor Administrativo)'
  ClientHeight = 101
  ClientWidth = 739
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object edConta: TEdit
    Left = 8
    Top = 8
    Width = 265
    Height = 21
    TabOrder = 0
    Text = 'sistemas@agilsoftwares.com'
  end
  object edSenha: TEdit
    Left = 8
    Top = 32
    Width = 265
    Height = 21
    TabOrder = 1
    Text = 'AgilSoftwares13'
  end
  object edSmtp: TEdit
    Left = 8
    Top = 56
    Width = 265
    Height = 21
    TabOrder = 2
    Text = 'smtp.agilsoftwares.com'
  end
  object btnEncriptar: TButton
    Left = 288
    Top = 8
    Width = 161
    Height = 73
    Caption = 'Encriptar >'
    TabOrder = 3
    OnClick = btnEncriptarClick
  end
  object edContaEncript: TEdit
    Left = 456
    Top = 8
    Width = 265
    Height = 21
    TabOrder = 4
    Text = 'sistemas@agilsoftwares.com'
  end
  object edSenhaEncript: TEdit
    Left = 456
    Top = 32
    Width = 265
    Height = 21
    TabOrder = 5
    Text = 'AgilSoftwares13'
  end
  object edSmtpEncript: TEdit
    Left = 456
    Top = 56
    Width = 265
    Height = 21
    TabOrder = 6
    Text = 'smtp.agilsoftwares.com'
  end
end
