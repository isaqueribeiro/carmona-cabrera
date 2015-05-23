object frmMainClient: TfrmMainClient
  Left = 0
  Top = 0
  Caption = 'App - Cliente'
  ClientHeight = 231
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 72
    Top = 64
    object Manuteno1: TMenuItem
      Caption = 'Manuten'#231#227'o'
      object Contatos1: TMenuItem
        Caption = 'Contatos'
        OnClick = Contatos1Click
      end
    end
  end
end
