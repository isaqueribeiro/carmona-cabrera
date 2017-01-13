object frmContatoFireDAC: TfrmContatoFireDAC
  Left = 0
  Top = 0
  Caption = 'Contatos'
  ClientHeight = 403
  ClientWidth = 795
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 795
    Height = 403
    Align = alClient
    DataSource = dtsContatosDados
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dtsContatosDados: TDataSource
    DataSet = dmDataModule.ssmContatosDados
    Left = 240
    Top = 152
  end
end
