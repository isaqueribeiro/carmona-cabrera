object FrmOrcamentoPesq: TFrmOrcamentoPesq
  Left = 375
  Top = 109
  Width = 661
  Height = 451
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Orcamentos'
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
        Brush.Color = 12615680
        Pen.Color = clHighlight
        Pen.Style = psClear
      end
      object LblDados: TLabel
        Left = 10
        Top = 65
        Width = 118
        Height = 13
        Caption = 'Dados do Or'#231'amento'
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
        Caption = 'Pesquise o Or'#231'amento'
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
          object DbGridDBTblVworc_codigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'orc_codigo'
            Width = 78
          end
          object DbGridDBTblVworc_nome: TcxGridDBColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'orc_nome'
            Width = 295
          end
          object DbGridDBTblVworc_operacao: TcxGridDBColumn
            Caption = 'Opera'#231#227'o'
            DataBinding.FieldName = 'orc_operacao'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Items = <
              item
                Description = 'Receita'
                ImageIndex = 0
                Value = 'R'
              end
              item
                Description = 'Despesa'
                Value = 'D'
              end>
            Width = 103
          end
          object DbGridDBTblVwtot_codigo: TcxGridDBColumn
            Caption = 'Totalizador'
            DataBinding.FieldName = 'tot_codigo'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'tot_codigo'
            Properties.ListColumns = <
              item
                FieldName = 'tot_nome'
              end>
            Properties.ListOptions.CaseInsensitive = True
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DtSTotalizador
            Width = 147
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
      Left = 200
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
    object btnNovo: TcxButton
      Left = 8
      Top = 8
      Width = 97
      Height = 57
      Hint = 'Excluir'
      Caption = '&Novo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnNovoClick
      Glyph.Data = {
        860F0000424D860F000000000000360000002800000025000000230000000100
        180000000000500F0000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FA9AD9FA9AD97A0A48E989C8790
        947E868B757D816C7378656C715A6166535A5E4C5357454B5041464B3A3F4436
        3B3F32383C2E33382D31364C555B292E32292E32292E32292E32292E32292E32
        292F33FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBA
        C8D09FA9AD5060674A5A604552583F4B5239454B343E452F393F2A3339252E33
        212A2F1E252B1B2227181E24161C21141A1F12181D11161B10151A232D35232D
        35256B85267693287B982B87A53094B42A2F33FFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBC8D08AE1F688E0F587DFF485DEF384DE
        F383DDF381DCF380DBF27EDAF27CD9F17CD9F07AD8F079D7EF78D7EF76D5EF76
        D5EE74D4ED74D4EE73D4ED3B4C56357890202931266E88297D9A2D88A72F8EAE
        2A3034FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD
        CAD28AE1F689E1F588E0F586DFF485DEF484DDF382DCF280DBF37FDAF17EDAF1
        7CD9F17BD9F07AD8F079D7F078D6EF77D5EF75D5EF74D4EE73D4ED5C76844AA9
        C934758D202930266E8A2A809F2B83A22E3338FFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCCD48BE2F78AE1F689E0F587E0F586DE
        F484DEF483DDF481DCF380DBF27FDBF27EDAF17CD9F17BD8F07AD8F078D7F078
        D6EF76D5EE75D5EE74D4EE65819164B9D54AA9C93372891F282F266F8B277997
        32373BFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF
        CDD58DE3F68BE1F68AE1F688E0F587DFF586DEF485DEF482DCF381DCF380DBF2
        7EDAF27DDAF17BD9F17BD8F079D7F078D6EF77D6EF76D6EE75D5EE69879787D0
        E564B9D64AA9C9336F861F282F256F8932383CFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2D0D78EE3F78CE3F68BE1F689E1F688E0
        F586DFF585DEF483DEF383DDF381DCF280DAF27EDAF17CD9F17CD9F17AD8F079
        D7EF77D6EF77D5EF75D5EE6987979BDEEF87D0E564B9D54AA9C9336F861E272E
        363B3FFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3
        D1D88FE4F88DE3F78CE2F68AE1F689E1F587E0F586DFF485DEF483DEF382DDF3
        80DCF380DBF17DDAF17DD9F17CD8F07AD7F079D7EF78D6EF76D6EF6987976987
        976784945C76844C626E3B4C562A363E41474CFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5D3DA90E4F88EE3F78DE2F78CE2F68AE1
        F689E0F587E0F486DFF484DDF483DDF382DCF380DBF27FDBF27ED9F17CD9F07B
        D9F07AD7F078D7F078D6EF76D5EE76D5EE74D5ED73D4EE73D4EE72D3ED181E24
        3E4448FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5
        D4DB90E4F88FE4F88EE3F78CE2F78BE2F68AE1F689E0F587E0F586DFF484DDF4
        83DDF381DCF380DBF27EDAF17DD9F17CD9F07BD8F079D8F078D7F077D6EF76D5
        EF75D5EE74D4ED73D4EE73D3ED1A212641474CFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7D6DD91E5F890E4F88FE4F88DE3F68CE2
        F68BE2F689E1F688E0F586DFF586DEF483DEF383DCF381DCF280DAF27EDAF17D
        D9F17BD9F17AD8F079D7F078D7EF76D6EE75D5EE74D5EE74D4EE73D3EE1C2329
        484F53FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCA
        D8DE92E5F890E5F890E4F88EE3F88DE3F68CE2F68AE1F689E0F588E0F587DFF5
        85DEF483DDF382DCF381DCF27FDBF27DD9F17CD9F07BD9F07AD8F078D7EF78D6
        EF77D6EE76D5EE74D5EE73D4EE1F272C4F555AFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBDAE093E6F992E6F991E4F88FE4F78EE4
        F78DE3F78CE1F68AE1F589E0F687E0F586DFF484DEF483DDF381DCF280DBF27F
        DAF27DD9F17CD9F17BD8F07AD7F078D7EF78D6EE76D5EF75D5EE74D4EE232B31
        565D61FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFDFEFDFFFFFFFFFFFFD8
        E6EB75DBF48BE7FA9AE9F997E8F893E9F987E1F683DDF58BE1F68AE1F688E0F6
        87DFF486DFF484DDF383DDF382DCF380DBF27EDAF17DD9F17CD8F07AD8F079D7
        F078D6EF77D6EE76D5EE75D5EE272F355A6267FFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFEFEFEDFEFF2D2EEF3FDFEFEE4F1F451CDEF82E8FAA5EFFBA0EDFA7BDC
        F560CCEE84E0F68DE2F68BE2F68AE0F688DFF586DFF585DFF483DDF383DDF381
        DCF280DBF27EDAF17DDAF07BD8F07AD8F079D7EF78D6EF77D5EF76D5EE2A343A
        656C71FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFDAF0F444A1D37AE5F4AD
        E6EC36B1E268E5FBB1F5FD55DEFA38A4DB71DAF592E9F88DE3F78CE2F68BE1F6
        89E0F588E0F587DFF485DEF484DEF382DCF281DCF27FDAF27EDAF17CD9F17BD9
        F07AD7F079D7F078D6EF76D5EF2F393F6B7478FFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFBFDFD94E9F82AA1D9AEFCFC29BEEA7DF1FCA5FCFD299ED968E6
        FB96F0FB98E8F88EE3F78CE3F78CE2F78AE1F689E0F587E0F486DFF485DDF483
        DDF382DCF280DBF27FDBF27ED9F17CD8F17BD8F079D7F078D7EF77D6EF333F45
        757D81FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1FDFD99FAFBD1
        FEFE7CE5F8A7F6FDCBFEFE90FBFCA8F7FCA1EEFB98E9F98FE4F88EE3F78DE2F7
        8BE2F689E1F588E0F588DFF585DEF484DEF382DDF381DCF280DBF27EDBF27DDA
        F17CD8F07BD8F179D7F079D7EF39454B7C8589FFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFCFDFDE0F6F99BEEFA88F7FBB4FAFDCFFEFEE3FEFEA7F8FD75F2FB55E4
        FB6EE1FA81E3F990E4F88FE4F88DE3F68CE2F68BE1F68AE1F688DFF587DFF486
        DEF484DDF382DDF381DBF27FDBF17EDAF27CD9F17BD8F17AD8F079D7F03E4B51
        858E93FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFAFCFCD4EEF645BDE158DDF8B0
        FDFDE0FEFEE3FEFEACFDFD4EDAFA3CBBE753CBEE75DAF491E5F88FE4F88FE3F8
        8DE3F78CE2F68BE2F689E1F588DFF586DFF585DEF484DDF482DCF381DBF27FDB
        F27EDAF27DD9F07CD8F07AD8F04451598E979BFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFEFFFEC6F8F6B5FBFBD1FEFEB8FAFD8CEBFCCDFEFEA4FDFDAEF8
        FCA4F0FB9BEAFA92E6F891E4F88FE4F88EE3F78DE3F78CE2F68AE1F589E0F587
        DFF586DFF484DDF383DDF482DCF281DBF37FDBF17ED9F17CD9F07BD9F18E979B
        9FA9ADFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFF9FDFD7BE9F72AA0DB91
        FBFC75F1FB34C8F199FBFC289AD947D7F4D3EEF2DAE8ECCFDEE4CFDDE4CDDCE2
        CCDAE1CAD9DFC9D8DEC8D6DDC5D4DBC5D3DAC3D2D9C2D0D7C1CFD7BFCDD4BFCC
        D4BDCBD2BCCAD2BCC9D1BBC8D0BAC7CFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFDDF2F647A6D85ADFF6BCF7F469E2F744B1DDC9F4F263DDF345A0
        D5C8EBF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFDFF1F4D8F1F6F7FCFCFE
        FFFFCBEFF8B9E3EFFEFFFFFBFDFDD0F0F6DDF0F4FCFDFDFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFF8FBFBF4F9FAFFFFFFFFFFFFFFFF
        FFFDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00}
      LookAndFeel.Kind = lfOffice11
    end
    object btnEditar: TcxButton
      Left = 104
      Top = 8
      Width = 97
      Height = 57
      Hint = 'Excluir'
      Caption = '&Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnEditarClick
      Glyph.Data = {
        96120000424D96120000000000003600000028000000250000002A0000000100
        1800000000006012000000000000000000000000000000000000FAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAF8F8F8ECECECE6E6E6E9E9E9EAEAEAF2F2F2F8F8F8
        FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAF8F8F8E6E6E6CFCF
        CF7F7F8674747ED1D1D1E5E5E5F2F2F2FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAF8F8F8E4E4E4CCCCCC77777C2B2B6734348D63637AD1D1D1ECECEC
        FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFAF9F9F9F5F5F5F2F2F2F1
        F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F0F0F0EFEFEFDEDEDEC7C7C7787878878B
        975E5FAE5C5DCB6667D5878797EDEDEDFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
        FAFAFAF9F9F9F3F3F3E8E8E8E0E0E0DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
        DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDB
        DBDBCACACABBBBBB676B677F8C81D5D5D7D3D5D6898AD96B6BAAB3B3B4F3F3F3
        FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAF4F3F3C7ADAEA55B6CA96270A4
        5E6C934556A6A3A3A4A1A1A19C9C9C9797979393948D8D8E88888A8383867F7D
        837A7A8079789947599947599746588C4151803C4B583A485A8252265D138EA1
        8ACACACD9B9DA49F9FA1EFEFEFF9F9F9FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
        FAFAFAD7C6C6B28181AF6D79B8717FB7707DAA6472EFEFF1EEEEF1995D68B871
        7EB06B78E1E0E0DDDADBD8D5D6D4D1D2CFCCCCDBD8D88F4B599E5464924D5C86
        47555E4A585DA4CDB9CFD76C9260285E1F808B83A1A1A1EEEEEEF9F9F9FAFAFA
        FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAAE6A7AAF6D79BA7481B97380B7
        737FAA6472E9E9EBECEBEF995D68B8717EB06B78E1DFE1DCDADDD7D5D6D2D0D1
        CDC9CAD9D6D68B4857914C5B86475561525F5AA0C9A4ECFFAAEEFFB0C3CA6380
        64959895EEEEEEF9F9F9FAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
        FAFAFAAE6A7AC38D95BA7682BA7481B97480AA6472E5E4E7E9E9EB9A5D69B873
        7FB06B78E5E5E7E2E0E3DDDBDDD8D5D7D3D0D1DAD7D87E424F834553503A4A55
        9AC29EE8FFA3E9FFA6F4FF5CA7C88B9093E8E8E8F9F9F9FAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAAE6A7AC48E96BA7783BA7682B9
        7481AA6472E0DFE1E5E3E69B5F6BB97580B06B78E9EAECE6E5E8E2E1E4DDDCDE
        D6D3D5CCCBCB723A464F37485194BE99E4FC9EE8FFA3F3FF5AADCF5B3544D9D9
        D9F0F0F0FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
        FAFAFAAE6A7AC58F96BB7784BA7784BA7582AA6472DAD9DBE0DEE09B5F6BBA75
        82B06B78EDECEFEAE9EDE6E6E9DEDEE0C9C8CABEBCBE4530404E8DB595E2FD96
        E4FF9FF0FF57ACCE6C4E5B98475ADEDEDEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAAE6A7AC58F98BC7886BB7785BB
        7783AA6472D5D2D4DBD8DA9C606C925864925864EAEAEDEDEDF0E6E6E9D2D1D3
        BEBCBE76828B4886AE90E0FA91E2FF9AEFFF54ADCF6A4E5BB5707D9C4B5CDEDE
        DEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
        FAFAFAAE6A7AC49098BC7986BD7985BC7784AA6472CFCCCCD4D1D3D9D7D9DFDC
        DFE2E1E4E7E5E8E5E5E8D7D6D9C2C2C575818B4988B18DDCF98ADFFF95EBFF51
        AED1684D5AB46F7BB9727F9C4E5DDEDEDEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAAE6A7AC79198BD7A87BD7987BC
        7985BB7785AA6472AA6472AA6472AA6472AA6472AA64729A5B678D535E563F4E
        437DA688DAF885DDFF91E9FF4DADD2654B59B36D7AB7707EB8717E9E4E5FDEDE
        DEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
        FAFAFAAE6A7AC6929ABE7B88BE7B87BC7986BC7886BB7785BB7784BA7682B974
        81B5727DB06E7A985E685C45543F77A084D7F77ED9FF8DE6FF4AADD1634A58B2
        6A78B76F7CB76F7CB7707D9F4E60DEDEDEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAAE6A7AC6929ABE7B88BE7B87BC
        7986BC7886BB7785BB7784BA7682B7737FA76973985F6A694D5B3C71997FD3F4
        7AD8FF88E4FF46ACD1624A58B16977B56C7AB66C7AB66C7AB76D7C9F4F60DEDE
        DEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
        FAFAFAAE6A7AC6939BBE7E89BC7884A75E70A75E70A75E70A75E70A75E709B57
        688B4F5E6341523F709981C2E174D4FF83E1FF42ADD0584252A25B6DA75E70A7
        5E70A75E70B66B7AB66C7B9F5162DEDEDEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAAE6A7AC7949CBF7F8AAF6F7BEB
        E1E1FEFFFEFEFFFEFEFFFEF6F7F6DDDEDDAEB0B07498BCB7E0FB9FD0F491E3FF
        40B1D583949AF3F3F3F9F9F9F9F9F9E8D1D1A75E70B76D7BB66C7A9F5262DEDE
        DEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
        FAFAFAAE6A7AC8959DC0808BAF6F7BFEFFFEFCFCFBFBFBFAFAFBFAE3E3E3CBCC
        CB748597B2DBFEC9E7FFBADCFF53AAD083949AF0F0F0F7F7F7F7F7F7F7F6F6F9
        F9F9A75E70B96F7DB66B7AA05363DEDEDEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAAE6A7AC9969EC1818DAF6F7BFE
        FFFEFCFCFCFCFCFBFBFBFBD6D6D58E92968FBBE2C1E2FF9FCBF76289AE8C9298
        F1F1F1F8F8F8F7F7F7F7F7F7F7F7F7FBFBFBA75E70B97480B56B79A25666DEDE
        DEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
        FAFAFAAE6A7AC9989FC2828EAF6F7BFEFFFEDEDEDEDEDEDEDDDDDD9999996F8D
        ACAED8FF749FCC5667799B9D9DD6D5D5D5D5D5D5D5D5D4D5D4D4D4D4D3D3D3FC
        FCFBA75E70BA7581B56B79A45968DEDEDEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAAE6A7AC9989FC2838EAF6F7BFE
        FFFEFCFCFCFCFCFCFCFCFC7A7B7D769ABE607D99ABAEB0F3F3F2F9F9F9F9F9F9
        F9F9F8F8F9F8F8F8F8F8F7F7F7F7F7FCFCFCA75E70BA7783B66C7AA55969DEDE
        DEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
        FAFAFAAE6A7ACA98A0C2838EAF6F7BFEFFFE26BC2626BC2626BC263635348384
        85C9C9C9DBDBDBDADADADADADAD8D8D8D8D8D8D7D7D7D5D6D6D5D5D5D4D4D4FD
        FDFCA75E70BC7783B76D7BA55D6CDEDEDEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAAE6A7ACB98A0C2838EAF6F7BFE
        FFFEFDFDFDFDFDFCFCFDFCFCFCFCFCFCFBFBFCFBFBFBFBFBFBFAFAFAFAFAFAF9
        F9F9F9F9F9F9F9F9F9F8F8F8F8F8F8FDFEFDA75E70BD7985B76F7DA65F6EDEDE
        DEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
        FAFAFAAE6A7ACB9BA1C2838EAF6F7BFEFFFE26BC2626BC2626BC2626BC2626BC
        2626BC2626BC2626BC2626BC2626BC2626BC2626BC2626BC2626BC2626BC26FE
        FEFEA75E70BE7A86B7707DA6606EDEDEDEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAAE6A7ACB9BA1C2838EAF6F7BFE
        FFFEFEFEFDFEFEFDFDFDFCFDFDFCFCFDFCFCFCFCFCFCFBFCFCFBFBFBFAFBFBFA
        FAFAF9F9F9F9F9F9F9F9F9F9F9F9F8FEFFFEA75E70B38088B8717FA7606EDEDE
        DEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
        FAFAFAAE6A7ACB9BA1C2838EAF6F7BFEFFFECBCBCBCBCBCBCBCBCBCBCBCBCBCB
        CBCBCBCBCACACAC9C9C8C7C8C8C7C7C7C6C5C5C3C3C4C2C1C2C0C0C0BFBFBFFE
        FFFEA75E70996E759E5967A9606EDEDEDEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAAE6A7ACB9BA1C2838EAF6F7BFE
        FFFEFEFFFEFEFEFEFEFEFDFEFEFDFDFDFCFDFDFCFCFDFCFCFCFCFCFCFBFBFBFB
        FBFBFAFAFAFAFAFAF9FAFAF9F9F9F9FEFFFEA75E70B0757F9E5A68AA6471DEDE
        DEF1F1F1FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
        FAFAFAAE6A7ACA969EC2838EAF6F7BFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFF
        FEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFE
        FFFEA75E70C77F8BC77F8BAA6572E5E5E5F3F3F3FAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAAE6A7AAE6A7AAE6A7AAE6A7ABF
        BDBDBFBDBDBFBDBDBFBDBDBFBDBDBFBDBDBFBDBDBFBDBDBFBDBDBFBDBDBFBDBD
        BFBDBDBFBDBDBFBDBDBFBDBDBFBDBDBFBDBDA75E70A75E70A75E70A75E70F3F3
        F3F8F8F8FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00}
      LookAndFeel.Kind = lfOffice11
    end
  end
  object DtSMaster: TDataSource
    DataSet = ClntDtStMaster
    Left = 336
    Top = 304
  end
  object ActnMain: TActionList
    Left = 400
    Top = 272
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
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
        Value = '%'
      end>
    SQL.Strings = (
      'select'
      '  a.`orc_codigo`,'
      '  a.`orc_nome`,'
      '  a.`orc_operacao`,'
      '  a.`tot_codigo`,'
      '  a.`orc_inc`,'
      '  a.`orc_alt`'
      'from'
      '  `mny_orcamento` a'
      'where'
      '  a.`orc_nome` like :nome')
    SQLConnection = FrmLogin.conWebMaster
    Left = 336
    Top = 240
    object QryMasterorc_codigo: TSmallintField
      FieldName = 'orc_codigo'
      Required = True
    end
    object QryMasterorc_nome: TStringField
      FieldName = 'orc_nome'
      Size = 60
    end
    object QryMasterorc_operacao: TStringField
      FieldName = 'orc_operacao'
      Size = 1
    end
    object QryMastertot_codigo: TSmallintField
      FieldName = 'tot_codigo'
    end
    object QryMasterorc_inc: TStringField
      FieldName = 'orc_inc'
      Size = 60
    end
    object QryMasterorc_alt: TStringField
      FieldName = 'orc_alt'
      Size = 60
    end
  end
  object DtStPvdMaster: TDataSetProvider
    DataSet = QryMaster
    Left = 368
    Top = 272
  end
  object ClntDtStMaster: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DtStPvdMaster'
    BeforePost = ClntDtStMasterBeforePost
    BeforeDelete = ClntDtStMasterBeforeDelete
    OnNewRecord = ClntDtStMasterNewRecord
    Left = 336
    Top = 272
    object ClntDtStMasterorc_codigo: TSmallintField
      FieldName = 'orc_codigo'
      Required = True
    end
    object ClntDtStMasterorc_nome: TStringField
      FieldName = 'orc_nome'
      Size = 60
    end
    object ClntDtStMasterorc_operacao: TStringField
      FieldName = 'orc_operacao'
      Size = 1
    end
    object ClntDtStMastertot_codigo: TSmallintField
      FieldName = 'tot_codigo'
    end
    object ClntDtStMasterorc_inc: TStringField
      FieldName = 'orc_inc'
      Size = 60
    end
    object ClntDtStMasterorc_alt: TStringField
      FieldName = 'orc_alt'
      Size = 60
    end
  end
  object QryMax: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '  MAX(coalesce(a.`orc_codigo`,0)) as seq'
      'from'
      '  `mny_orcamento` a')
    SQLConnection = FrmLogin.conWebMaster
    Left = 368
    Top = 240
    object QryMaxseq: TBCDField
      FieldName = 'seq'
      Precision = 6
      Size = 0
    end
  end
  object QryTransaction: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'insert into'
      '  sys_usuario'
      '  (usr_codigo, usr_nome)'
      '  values'
      '   (12,'
      '    '#39#39';')
    SQLConnection = FrmLogin.conWebMaster
    Left = 400
    Top = 240
  end
  object QryTotalizador: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '  a.`tot_codigo`,'
      '  a.`tot_nome`'
      'from'
      '  `mny_totalizador` a'
      'order by 2')
    SQLConnection = FrmLogin.conWebMaster
    Left = 432
    Top = 240
    object QryTotalizadortot_codigo: TSmallintField
      FieldName = 'tot_codigo'
      Required = True
    end
    object QryTotalizadortot_nome: TStringField
      FieldName = 'tot_nome'
      Size = 60
    end
  end
  object DtSTotalizador: TDataSource
    DataSet = QryTotalizador
    Left = 460
    Top = 240
  end
end
