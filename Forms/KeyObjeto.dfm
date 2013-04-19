object FrmObjeto: TFrmObjeto
  Left = 375
  Top = 109
  Width = 661
  Height = 451
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Objetos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PgCtrlMain: TcxPageControl
    Left = 8
    Top = 88
    Width = 633
    Height = 321
    ActivePage = TbShtPrincipal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ClientRectBottom = 317
    ClientRectLeft = 4
    ClientRectRight = 629
    ClientRectTop = 24
    object TbShtPrincipal: TcxTabSheet
      Caption = 'Principal'
      ImageIndex = 79
      object Shape2: TShape
        Left = 0
        Top = 64
        Width = 625
        Height = 17
        Brush.Color = clGradientActiveCaption
        Pen.Color = clHighlight
        Pen.Style = psClear
      end
      object LblDados: TLabel
        Left = 10
        Top = 65
        Width = 93
        Height = 13
        Caption = 'Dados do Objeto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object GrpBxPesquisa: TcxGroupBox
        Left = 2
        Top = 8
        Caption = 'Pesquise o Objeto'
        Style.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.Kind = lfStandard
        TabOrder = 0
        Height = 49
        Width = 623
        object EdtPesquisar: TcxTextEdit
          Left = 8
          Top = 18
          Properties.OnChange = btnPesquisarClick
          TabOrder = 0
          Width = 584
        end
        object btnPesquisar: TcxButton
          Left = 592
          Top = 16
          Width = 25
          Height = 25
          Caption = '...'
          Default = True
          TabOrder = 1
          OnClick = btnPesquisarClick
          LookAndFeel.Kind = lfOffice11
        end
      end
      object DbGrd: TcxGrid
        Left = 0
        Top = 88
        Width = 625
        Height = 201
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
          OptionsData.Appending = True
          OptionsSelection.InvertSelect = False
          OptionsView.Navigator = True
          OptionsView.NoDataToDisplayInfoText = '<Sem Dados Para Exibi'#231#227'o>'
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          Styles.ContentEven = DtmResource.cxStlLinhaImpar
          Styles.ContentOdd = DtmResource.cxStlLinhaPar
          object DbGridDBTblVwobj_codigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'obj_codigo'
          end
          object DbGridDBTblVwobj_nome: TcxGridDBColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'obj_nome'
            Width = 404
          end
          object DbGridDBTblVwobj_tipo: TcxGridDBColumn
            Caption = 'Tipo'
            DataBinding.FieldName = 'obj_tipo'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Items = <
              item
                Description = 'Formul'#225'rio'
                ImageIndex = 0
                Value = 0
              end
              item
                Description = 'Processo'
                Value = 1
              end
              item
                Description = 'Relat'#243'rio'
                Value = 2
              end>
            Width = 152
          end
        end
        object DbGridLvl: TcxGridLevel
          GridView = DbGridDBTblVw
        end
      end
    end
  end
  object PnlMain: TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 73
    Align = alTop
    TabOrder = 1
    object btnFechar: TcxButton
      Left = 8
      Top = 8
      Width = 97
      Height = 57
      Hint = 'Excluir'
      Caption = '&Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnFecharClick
      Glyph.Data = {
        360D0000424D360D000000000000360000002800000022000000200000000100
        180000000000000D000000000000000000000000000000000000FAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        0000FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFA0000FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA0000FAFAFAFAFAFAFAFAFAF8F8F8F4F4
        F4F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
        F4F4F4F8F8F8FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA0000FAFAFAFAFAFA
        FAFAFAF4F4F4E7E7E7DFDFDFDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
        DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
        DEDEDEDEDEDFDFDFE8E8E8F4F4F4FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        0000FAFAFAFAFAFAFAFAFA7BA5CB4F8BBC4F8BBC4F8BBC4F8ABA4F89BA4E88B8
        4E87B74E86B64D84B54D84B34D82B24D81B04C80AF4D7FAD4C7DAB4C7DAA4C7B
        A94B7AA84C79A74C79A54B77A47DA1C3DFDFDFF1F1F1FAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFA0000FAFAFAFAFAFAFAFAFA799BC59DDBF261C5EF60C4F060
        C4F060C4F05FC4F060C4F060C4EF60C4EF60C4F060C4F05FC4F060C4F060C5F0
        60C4F060C4F05FC4F060C4EF5FC4F061C4F05EB9E44B77A4DEDEDEF1F1F1FAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA0000FAFAFAFAFAFAFAFAFA799BC5A6EA
        FE82DCF680DBF67FDBF57EDAF67CDAF57AD9F479D8F577D8F576D7F475D6F473
        D5F473D6F371D5F370D4F26ED4F36ED3F26DD3F26CD2F269CFF162C5F04C78A5
        DEDEDEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA0000FAFAFAFAFAFA
        FAFAFA799DC7A6EAFE85DEF783DDF781DCF680DBF67EDBF67DDAF67BD9F579D9
        F579D8F478D7F476D7F474D6F373D6F372D5F371D5F370D4F36FD4F36DD3F26D
        D2F263C6F14C7AA7DEDEDEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        0000FAFAFAFAFAFAFAFAFA7A9DC8A6EAFE87DFF886DEF884DEF783DDF781DCF6
        7FDBF67EDBF67CDAF57BDAF57AD8F578D8F476D7F476D7F374D6F372D6F371D5
        F370D4F370D3F26ED4F263C6F14B7BA9DEDEDEF1F1F1FAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFA0000FAFAFAFAFAFAFAFAFA7B9FC9A6EAFE8AE0F888DFF887
        DFF785DEF784DDF781DDF680DCF77FDBF57DDBF57CDAF57BD9F579D9F477D8F4
        77D7F475D7F474D6F372D6F371D5F370D4F264C7F14C7CAADEDEDEF1F1F1FAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA0000FAFAFAFAFAFAFAFAFA7CA1CCA2EB
        FF8CE1F98AE0F889E0F887DFF886DEF884DEF783DCF781DDF77FDCF67FDAF57C
        DAF57BD9F57AD9F479D8F477D8F475D6F475D7F373D6F372D5F365C7F14C7EAC
        DEDEDEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA0000FAFAFAFAFAFA
        FAFAFA7CA3CDAEEEFF8FE3F98EE1FA8CE1F98AE1F888DFF887DFF885DEF784DD
        F782DDF781DCF67FDBF67EDBF57CDAF67BD9F57AD9F578D8F476D7F475D6F374
        D6F366C8F24D80AFDEDEDEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        0000FAFAFAFAFAFAFAFAFA7EA5CFB6EEFF92E4FA90E3FA8FE2F98DE1F98CE1F9
        8AE0F888E0F886DFF885DEF883DEF782DDF780DBF67FDBF57EDBF57CDAF67AD9
        F579D8F577D8F477D7F467C9F24D82B1DEDEDEF1F1F1FAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFA0000FAFAFAFAFAFAFAFAFA7FA7D2B8F1FF94E5FB93E4FA91
        E3FA8FE3FA8EE2F98DE1F98AE1F889E0F888DFF786DEF784DEF783DDF782DDF6
        80DCF67FDBF67DDAF57CD9F57AD9F478D8F469CAF34E84B3DEDEDEF1F1F1FAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA0000FAFAFAFAFAFAFAFAFA80A9D3B9F0
        FF97E6FB95E5FB94E4FA92E4FA90E4F98FE3FA8DE2F98CE1F98AE0F988E0F887
        DFF886DFF784DDF783DDF781DCF67FDCF67EDBF57CDAF57BD9F569CCF34E86B6
        DEDEDEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA0000FAFAFAFAFAFA
        FAFAFA81ABD5B8F0FF99E7FB97E6FB96E6FB95E5FB94E4FA92E4FA91E3F98FE3
        FA8DE1F98BE1F889E0F888E0F887DFF785DEF783DDF782DCF681DBF67FDBF67D
        DAF56BCDF44E88B7DEDEDEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        0000FAFAFAFAFAFAFAFAFA82ACD7B9F0FF9BE9FD9AE7FB98E7FC97E6FB95E6FA
        94E5FB93E4FA91E3FA90E3FA8EE2FA8DE1F98BE1F989E0F887DFF886DEF784DD
        F783DDF781DCF780DCF66CCEF54F89B9DEDEDEF1F1F1FAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFA0000FAFAFAFAFAFAFAFAFA83AFD9BCF1FF9DE9FD9DE8FC9B
        E8FC9AE7FC98E6FB96E6FB95E5FA94E5FB92E4FA91E3F98FE2F98EE2FA8CE1F8
        8BE1F889DFF887DFF886DEF784DDF783DDF66ECFF44F8ABBDEDEDEF1F1F1FAFA
        FAF9F9F9F7F7F7F9F9F9FAFAFAFAFAFA0000FAFAFAFAFAFAFAFAFA84B1DCBDF2
        FF9FEAFD9FEAFD9DE9FD9BE8FC9BE8FC99E7FB97E6FB96E5FB95E6FB93E5FA92
        E4FA90E3FA8FE2F98DE2F98CE1F98AE1F989DFF887DFF885DEF77CD4F64F8BBC
        DFDFDFF1F1F1FAFAFAF5F5F5F0F0F0F5F5F5FAFAFAFAFAFA0000FAFAFAFAFAFA
        FAFAFA85B2DDBDF2FFBBF1FEB9F0FFB7EFFEB4EFFEB1EDFEAEEBFDAAEAFDA6E9
        FCA3E7FB9FE6FB9BE4FB97E3FA94E1F991E0F98DDEF98ADDF887DBF885DBF783
        DAF781D9F74F8BBCE7E7E7F4F4F4F7F7F69B8D85EBEBEBF3F3F3FAFAFAFAFAFA
        0000FAFAFAFAFAFAFAFAFA85B2DF84B2DF83B2DF83B2DF82B2E081B2E080B3E1
        80B2E07FB2E17EB2E27DB2E17CB2E27BB2E37AB1E37AB1E379B2E478B2E378B1
        E477B2E476B1E576B1E475B1E58EC6E4F2F2F2F8F8F8F5F5F46F5A4CEBEBEBF3
        F3F3FAFAFAFAFAFA0000FAFAFAFAFAFAFAFAFA86B4DFB3E6FAB1EFFFA8EEFFAC
        EFFFB0F0FFACEEFFA7EFFFA1ECFFA0EBFFA5E2FA8EBEE8C6D7E6F4F4F4F9F9F9
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAF9F9F9F1F0F0EDEDEDF4F4F4F8F8F8D9D6
        D37F6E63EEEEEEF6F6F6FAFAFAFAFAFA0000FAFAFAFAFAFAFAFAFAC4DAEE8DBE
        E5B8EBFCBFF2FFC1F2FFC1F3FFC2F2FFBFF1FFB6F0FFACE6FA90C1E9B5CDE5F3
        F3F3F9F9F9FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAF5F5F59D8B7EE3E3E3
        EAEAEAE8E7E7867B759D9590F3F3F3F9F9F9FAFAFAFAFAFA0000FAFAFAFAFAFA
        FAFAFAFAFAFAB6D2EE8CB8E38CB8E38BB8E38BB8E389B8E388B7E387B7E486B7
        E4C1D6ECF6F6F6F9F9F9FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAD8
        D0CC806551D9D8D8C5C2C080766F837973E6E5E4F8F8F8FAFAFAFAFAFAFAFAFA
        0000FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFA8C6B5981625076605285766CABA4A0ECEBEBF9F9F9FAFAFAFA
        FAFAFAFAFAFAFAFA0000FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFA7F5A45816250AE9A8EE7E7E7F1F1F1F9F9
        F9FAFAFAFAFAFAFAFAFAFAFAFAFAFAFA0000FAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAF7F6F5BCACA2836A58
        D9D4D0F5F5F5F9F9F9FAFAFAFAFAFAFAFAFAFAFAFAFAFAFA0000FAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAF8F8F8E3DFDCF9F9F9FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        0000FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFA0000FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA0000FAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA0000}
      LookAndFeel.Kind = lfOffice11
    end
  end
  object DtSMaster: TDataSource
    DataSet = ClntDtStMaster
    Left = 304
    Top = 360
  end
  object ActnMain: TActionList
    Left = 368
    Top = 328
    object ActnInc: TAction
      Caption = 'ActnInc'
      ShortCut = 122
      OnExecute = ActnIncExecute
    end
    object ActnAlt: TAction
      Caption = 'ActnAlt'
      ShortCut = 123
      OnExecute = ActnAltExecute
    end
    object ActnBlock: TAction
      Caption = 'ActnBlock'
      ShortCut = 49220
    end
  end
  object QryMaster: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'nome'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select'
      '  a.`obj_codigo`,'
      '  a.`obj_nome`,'
      '  a.`obj_tipo`,'
      '  a.`obj_inc`,'
      '  a.`obj_alt`'
      'from'
      '  `sys_objeto` a'
      'where'
      '  upper(a.`obj_nome`) like upper(:nome)')
    SQLConnection = FrmLogin.conWebMaster
    Left = 304
    Top = 296
    object QryMasterobj_codigo: TSmallintField
      FieldName = 'obj_codigo'
      Required = True
    end
    object QryMasterobj_nome: TStringField
      FieldName = 'obj_nome'
      Size = 60
    end
    object QryMasterobj_tipo: TSmallintField
      FieldName = 'obj_tipo'
    end
    object QryMasterobj_inc: TStringField
      FieldName = 'obj_inc'
      Size = 60
    end
    object QryMasterobj_alt: TStringField
      FieldName = 'obj_alt'
      Size = 60
    end
  end
  object DtStPvdMaster: TDataSetProvider
    DataSet = QryMaster
    Left = 336
    Top = 328
  end
  object ClntDtStMaster: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DtStPvdMaster'
    BeforePost = ClntDtStMasterBeforePost
    BeforeDelete = ClntDtStMasterBeforeDelete
    OnNewRecord = ClntDtStMasterNewRecord
    Left = 304
    Top = 328
    object ClntDtStMasterobj_codigo: TSmallintField
      FieldName = 'obj_codigo'
      Required = True
    end
    object ClntDtStMasterobj_nome: TStringField
      FieldName = 'obj_nome'
      Size = 60
    end
    object ClntDtStMasterobj_tipo: TSmallintField
      FieldName = 'obj_tipo'
    end
    object ClntDtStMasterobj_inc: TStringField
      FieldName = 'obj_inc'
      Size = 60
    end
    object ClntDtStMasterobj_alt: TStringField
      FieldName = 'obj_alt'
      Size = 60
    end
  end
  object QryMax: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '  MAX(coalesce(a.`obj_codigo`,0)) as seq'
      'from'
      '  `sys_objeto` a')
    SQLConnection = FrmLogin.conWebMaster
    Left = 336
    Top = 296
    object QryMaxseq: TBCDField
      FieldName = 'seq'
      Precision = 6
      Size = 0
    end
  end
  object QryUpdate: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'update'
      ' `sys_objeto` a'
      'set'
      '  a.`obj_alt` = '#39#39)
    SQLConnection = FrmLogin.conWebMaster
    Left = 404
    Top = 328
  end
  object QryInsert: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'insert into'
      '  sys_objeto'
      '  (obj_codigo, obj_nome, obj_tipo, obj_inc, obj_alt)'
      '  values'
      '   (12,'
      '    '#39#39','
      '    0,'
      '    '#39#39','
      '    '#39#39');')
    SQLConnection = FrmLogin.conWebMaster
    Left = 368
    Top = 296
  end
  object QryDelete: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'delete'
      'from'
      '  `sys_objeto`')
    SQLConnection = FrmLogin.conWebMaster
    Left = 404
    Top = 296
  end
end
