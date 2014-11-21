object Form1: TForm1
  Left = 381
  Top = 305
  Width = 1305
  Height = 675
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object cxImageComboBox1: TcxImageComboBox
    Left = 224
    Top = 40
    HelpType = htKeyword
    HelpKeyword = 'Teste 222'
    Properties.Items = <
      item
        Description = 'A'
        ImageIndex = 0
        Value = 1
      end
      item
        Description = 'B'
        Value = 2
      end
      item
        Description = 'C'
        Value = 3
      end>
    TabOrder = 0
    Width = 513
  end
  object cxComboBox1: TcxComboBox
    Left = 232
    Top = 80
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5')
    TabOrder = 1
    Width = 505
  end
  object Button1: TButton
    Left = 744
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    TabStop = False
    OnClick = Button1Click
  end
  object cxLookupComboBox1: TcxLookupComboBox
    Left = 232
    Top = 112
    Properties.ListColumns = <>
    TabOrder = 3
    Width = 145
  end
  object cxTextEdit1: TcxTextEdit
    Left = 344
    Top = 160
    TabOrder = 4
    Text = 'cxTextEdit1'
    Width = 121
  end
  object cxMaskEdit1: TcxMaskEdit
    Left = 416
    Top = 224
    TabOrder = 5
    Text = 'cxMaskEdit1'
    Width = 121
  end
  object Edit1: TEdit
    Left = 424
    Top = 272
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'Edit1'
  end
  object ComboBox1: TComboBox
    Left = 480
    Top = 312
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 7
    Text = 'ComboBox1'
  end
  object cxDBImageComboBox1: TcxDBImageComboBox
    Left = 752
    Top = 200
    Properties.Items = <>
    TabOrder = 8
    Width = 121
  end
end
