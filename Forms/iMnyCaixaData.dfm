object FrmCaixaData: TFrmCaixaData
  Left = 467
  Top = 287
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Data do Movimento'
  ClientHeight = 274
  ClientWidth = 548
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 11
    Top = 72
    Width = 534
    Height = 17
    Brush.Color = 12615680
    Pen.Color = clHighlight
    Pen.Style = psClear
  end
  object Label1: TLabel
    Left = 18
    Top = 73
    Width = 122
    Height = 13
    Caption = 'Caixas Para o Usu'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object GrpBxData: TcxGroupBox
    Left = 8
    Top = 8
    Caption = 'Informe a Data do Movimento:'
    TabOrder = 0
    Height = 57
    Width = 209
    object DtEdtData: TcxDateEdit
      Left = 16
      Top = 24
      TabOrder = 0
      Width = 137
    end
    object btnPesquisar: TcxButton
      Left = 158
      Top = 22
      Width = 43
      Height = 25
      Caption = '...'
      Default = True
      TabOrder = 1
      OnClick = btnPesquisarClick
    end
  end
  object DbGrd: TcxGrid
    Left = 11
    Top = 96
    Width = 534
    Height = 145
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object DbGridDBTblVw: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DtSMaster
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsView.Navigator = True
      OptionsView.NoDataToDisplayInfoText = '<Sem Dados Para Exibi'#231#227'o>'
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      Styles.ContentEven = DtmResource.cxStlLinhaImpar
      Styles.ContentOdd = DtmResource.cxStlLinhaPar
      object DbGridDBTblVwcax_num: TcxGridDBColumn
        Caption = 'N'#250'mero'
        DataBinding.FieldName = 'cax_num'
        Width = 68
      end
      object DbGridDBTblVwcax_data: TcxGridDBColumn
        Caption = 'Data'
        DataBinding.FieldName = 'cax_data'
        Width = 69
      end
      object DbGridDBTblVwcax_hora: TcxGridDBColumn
        Caption = 'Hora'
        DataBinding.FieldName = 'cax_hora'
        Width = 64
      end
      object DbGridDBTblVwusr_nome: TcxGridDBColumn
        Caption = 'Usu'#225'rio'
        DataBinding.FieldName = 'usr_nome'
        Width = 145
      end
      object DbGridDBTblVwcax_status: TcxGridDBColumn
        Caption = 'Status'
        DataBinding.FieldName = 'cax_status'
        Width = 74
      end
      object DbGridDBTblVwColumn1uni_nome: TcxGridDBColumn
        Caption = 'Unidade'
        DataBinding.FieldName = 'uni_nome'
        Width = 112
      end
    end
    object DbGridLvl: TcxGridLevel
      GridView = DbGridDBTblVw
    end
  end
  object btnCarregar: TcxButton
    Left = 304
    Top = 246
    Width = 81
    Height = 25
    Caption = '&Carregar'
    TabOrder = 2
    OnClick = btnCarregarClick
  end
  object btnNovo: TcxButton
    Left = 384
    Top = 246
    Width = 81
    Height = 25
    Caption = '&Novo'
    TabOrder = 3
    OnClick = btnNovoClick
  end
  object btnFechar: TcxButton
    Left = 464
    Top = 246
    Width = 81
    Height = 25
    Caption = '&Fechar'
    TabOrder = 4
    OnClick = btnFecharClick
  end
  object QryMaster: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'data'
        ParamType = ptInput
        Value = '2013-01-14'
      end
      item
        DataType = ftString
        Name = 'usuario'
        ParamType = ptInput
        Value = '%'
      end>
    SQL.Strings = (
      'select'
      '  a.`cax_num`,'
      '  a.`cax_data`,'
      '  a.`cax_hora`,'
      '  a.`cax_usuario`,'
      '  b.`usr_nome`,'
      '  c.`uni_nome`,'
      '  case a.`cax_status`'
      '    when 0 then '#39'Aberto'#39
      '    else '#39'Encerrado'#39
      '  end as cax_status'
      'from'
      '  `mny_caixa` a'
      '  join `sys_usuario` b on(b.`usr_nome`=a.`cax_usuario`)'
      '  join `mny_unidade` c on(c.`uni_codigo`=a.`uni_codigo`)'
      'where'
      ' a.cax_data = :data  '
      'and  a.cax_usuario like :usuario')
    SQLConnection = FrmLogin.conWebMaster
    Left = 240
    Top = 8
    object QryMastercax_num: TIntegerField
      FieldName = 'cax_num'
      Required = True
    end
    object QryMastercax_data: TDateField
      FieldName = 'cax_data'
    end
    object QryMastercax_hora: TTimeField
      FieldName = 'cax_hora'
    end
    object QryMastercax_usuario: TStringField
      FieldName = 'cax_usuario'
      Size = 60
    end
    object QryMasterusr_nome: TStringField
      FieldName = 'usr_nome'
      Size = 60
    end
    object QryMastercax_status: TStringField
      FieldName = 'cax_status'
      Size = 9
    end
    object QryMasteruni_nome: TStringField
      FieldName = 'uni_nome'
      Size = 60
    end
  end
  object ClntDtStMaster: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DtStPvdMaster'
    Left = 240
    Top = 40
    object ClntDtStMastercax_num: TIntegerField
      FieldName = 'cax_num'
      Required = True
    end
    object ClntDtStMastercax_data: TDateField
      FieldName = 'cax_data'
    end
    object ClntDtStMastercax_hora: TTimeField
      FieldName = 'cax_hora'
    end
    object ClntDtStMastercax_usuario: TStringField
      FieldName = 'cax_usuario'
      Size = 60
    end
    object ClntDtStMasterusr_nome: TStringField
      FieldName = 'usr_nome'
      Size = 60
    end
    object ClntDtStMastercax_status: TStringField
      FieldName = 'cax_status'
      Size = 9
    end
    object ClntDtStMasteruni_nome: TStringField
      FieldName = 'uni_nome'
      Size = 60
    end
  end
  object DtStPvdMaster: TDataSetProvider
    DataSet = QryMaster
    Left = 272
    Top = 40
  end
  object DtSMaster: TDataSource
    DataSet = ClntDtStMaster
    Left = 272
    Top = 8
  end
end
