object FrmCaixaEnc: TFrmCaixaEnc
  Left = 460
  Top = 255
  Width = 470
  Height = 287
  Caption = 'Fechamento de Caixa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DbGrd: TcxGrid
    Left = 6
    Top = 32
    Width = 441
    Height = 145
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object DbGridDBTblVw: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = FrmCaixa.DtSCaixaConta
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
      OptionsSelection.InvertSelect = False
      OptionsView.NoDataToDisplayInfoText = '<Sem Dados Para Exibi'#231#227'o>'
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      Styles.ContentEven = DtmResource.cxStlLinhaImpar
      Styles.ContentOdd = DtmResource.cxStlLinhaPar
      object DbGridDBTblVwccr_codigo: TcxGridDBColumn
        Caption = 'Conta Corrente'
        DataBinding.FieldName = 'ccr_codigo'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ccr_codigo'
        Properties.ListColumns = <
          item
            FieldName = 'ccr_nome'
          end>
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = FrmCaixa.DtSConta
        Properties.ReadOnly = True
        Width = 268
      end
      object DbGridDBTblVwcax_saldo: TcxGridDBColumn
        Caption = 'Saldo Inicial'
        DataBinding.FieldName = 'cax_saldo'
        Width = 86
      end
      object DbGridDBTblVwcax_tipo: TcxGridDBColumn
        Caption = 'Pag/Rec'
        DataBinding.FieldName = 'cax_tipo'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            Description = 'Pagadora'
            ImageIndex = 0
            Value = 'P'
          end
          item
            Description = 'Recebedora'
            Value = 'R'
          end>
        Width = 85
      end
    end
    object DbGridLvl: TcxGridLevel
      GridView = DbGridDBTblVw
    end
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Caption = 'Selecione a Conta:'
    Transparent = True
  end
  object btnImprimir: TcxButton
    Left = 8
    Top = 184
    Width = 105
    Height = 57
    Hint = 'Excluir'
    Caption = '&Imprimir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnImprimirClick
    Glyph.Data = {
      26120000424D2612000000000000360000002800000025000000290000000100
      180000000000F011000000000000000000000000000000000000FAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAF8F8F8F3F3
      F3F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0F0F0F0F3F3F3F8F8F8FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFAF3F3F3E5E5E5DEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
      DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEE5E5E5F3F3F3FAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFABAA797A897
      87917D6C806D59806D59806D59806D59806D59806D59806D59806D59806D5980
      6D59806D59DEDEDEF0F0F0FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFABAA797FEFEFDFEFEFDFFFDFDFEFDFCFEFCFBFEFCFB
      FEFCFBFEFBFBFEFBFAFDFAF9FDFAF9FDFAF8806D59DEDEDEF0F0F0FAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFABBA798FEFE
      FEBBADA19D83719D83719D83719D83719D83719D83719D83719D83719D8371FE
      FBF9806D59DEDEDEF0F0F0FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFABBA798FEFEFEBCACA2FFE9D3FFF5EBF6C9B8CA8A6A
      CA9870F2BA98E38B59DA7A4D9D8371FEFBFA806D59DEDEDEF0F0F0FAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
      FAFAFAFAFAFAF9F9F9F5F5F5F2F2F2F0F0F0F0F0F0F0F0F0F0F0F0BBA799FFFF
      FFBCADA2C88F61FAFDFFFFF2E8C08658C88F61FFF2E8CE8342FDE6BB9D8371FD
      FCFB806D59DBDBDBE9E9E9F0F0F0F0F0F0F0F0F0F0F0F0F1F1F1F4F4F4F8F8F8
      FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFAF5F5F5E9E9E9E0E0E0DE
      DEDEDEDEDEDEDEDEDEDEDEBBA799FFFFFFBDADA3FDE6BBD2A279C58866FDE6BB
      FDE6BBCE8342FDE6BBFDE6BB9D8371FEFCFB806D59D6D6D6DBDBDBDEDEDEDEDE
      DEDEDEDEDEDEDEDFDFDFE8E8E8F4F4F4FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
      FAFAFAFAFAFAC4C4C38E8B8A7168686E64646C62624C4A494F4E4CBCA899FFFF
      FFBCADA2FCEAC0FCEAC0FCEAC0FCEAC0FCEAC0FCEAC0FCEAC0FCEAC09D8371FE
      FDFC806D594F4D4C4C4B4B6A61616E64646E64646E6464999899DFDFDFF1F1F1
      FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFA8E8E8D9595949E9E9D9E
      9E9D8484833B3A3A3B3A3ABCA89AFFFFFFBDAEA2FEECC2FEECC2FEECC2FEECC2
      FEECC27F97FFFEECC2FEECC29D8371FEFEFD917D6C3B3A3A3B3A3A7878779E9E
      9D9E9E9D8F8D8C6E6464DEDEDEF0F0F0FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
      FAFAFAFAFAFA929191A09F9FA09F9FA09F9F9797973B3A3A3B3A3AAA988BE6E6
      E6AF9E92EEDCB0EEDCB0EEDCB0EEDCB06782F5C8ECEC6782F5EBDBB3937763E5
      E5E48371613B3A3A3B3A3A8A8989A09F9FA09F9FA09F9F6E6464DEDEDEF0F0F0
      FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFA8B8B8B938B8B91898991
      8989918989727171727171727171727171727171727171727171727171727171
      7271717271717271717271717271717271717271717271717271719189899189
      899189898980806E6464DEDEDEF0F0F0FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
      FAFAFAFAFAFA8B8B8BB9B9B9C9CACAC9C9C9C8C8C8868686A8A8A8A8A8A8A8A8
      A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8949493AFAFAFAFAFAFAF
      AEAEAFAEAEAFAEAE7B7A7AC5C5C5BDBDBDBDBDBDB2B1B16E6464DEDEDEF0F0F0
      FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFA8E8E8DCFCFCFC9CACAC9
      C9C9C8C8C8868686A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8
      A8A8A8A8A8A89A9A9AFFAB64FFAB64FFAB64FFAB64AFAEAE7B7A7AC5C5C5BDBD
      BDBDBDBDBDBDBD6E6464DEDEDEF0F0F0FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
      FAFAFAFAFAFA8E8E8DCFCFCFC9CACAC9C9C9C8C8C8868686A8A8A8A8A8A8A8A8
      A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A1A1A0A1A09FA09F9F9F
      9F9F9F9E9E9F9E9E7B7A7AC5C5C5BDBDBDBDBDBDBDBDBD6E6464DEDEDEF0F0F0
      FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFA929191F7F7F7F2F2F2F1
      F1F1F0F0F0A1A0A0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0
      D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0969696EDEDEDEAEA
      EAEAEAEAEAEAEA6E6464DEDEDEF0F0F0FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
      FAFAFAFAFAFA939393F6F6F6C9CACAB9B9B9EDEDED8D8B8AC6C6C6C6C6C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
      C6C6C6C6C6C6C6C67D7C7CEDEDEDB9B9B99C9C9CDEDEDE6E6464DEDEDEF0F0F0
      FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFA969595F6F7F7EEEEEEEE
      EEEEEEEEEE8E8D8CC6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C67F7E7EEDEDEDDEDE
      DEDEDEDEDEDEDE6E6464DEDEDEF0F0F0FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
      FAFAFAFAFAFA989797F9F9F9F3F3F3F2F2F2F1F1F18F8E8DC9C9C9C9C9C9C9C9
      C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9
      C9C9C9C9C9C9C9C9807F7FEFEFEFBCBCBC9F9F9FDEDEDE6E6464DEDEDEF0F0F0
      FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFA9A9999FAFBFAF7F6F6F6
      F6F6F6F6F6908F8ECECECECECECECECECECECECECECECECECECECECECECECECE
      CECECECECECECECECECECECECECECECECECECECECECECECE828281F2F2F2E7E7
      E7E7E7E7E7E7E76E6464DEDEDEF0F0F0FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
      FAFAFAFAFAFA9A9999FCFCFCFAFAFAFAFAFAFAFAFA90908FD1D1D1D1D1D1D1D1
      D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
      D1D1D1D1D1D1D1D1838383F4F4F4C3C3C3A4A4A4E7E7E76E6464E0E0E0F2F2F2
      FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFA9A9999FFFFFFFFFFFFFF
      FFFFFFFFFF90908FD9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9858483F4F4F4F4F4
      F4F4F4F4F4F4F46E6464E9E9E9F5F5F5FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
      FAFAFAFAFAFADAD9D9AEADADAEADADAEADADAEADAD9292929292919191919191
      91919090909090908F8F8F8E8E8E8E8E8E8D8D8D8C8C8C8C8C8B8B8B8A898A89
      8989898989888787878686929192908F908E8E8E8C8C8CBDBDBDF5F5F5F9F9F9
      FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
      FAFAFAFAFA91908F6C6B6BBAA797FEFEFDFEFEFDFFFDFDFEFDFCFEFCFBFEFCFB
      FEFCFBFEFBFBFEFBFAFDFAF9FDFAF9FDFAF8806D596E6D6C878685E8E8E8F6F6
      F6FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAA5A4A4545453BBA798FEFE
      FEFEFEFDFEFDFDFEFEFCFEFDFCFEFDFCFEFDFBFEFCFBFDFCFAFDFBFAFDFBFAFE
      FBF9806D59555453979796EDEDEDF8F8F8FAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
      FAFAFAFAFAECECEC5E5D5DBBA798FEFEFEFEFEFEFFFDFEFEFDFDFFFDFCFEFDFD
      FEFDFCFEFCFBFEFCFBFEFCFBFDFCFAFEFBFA806D595E5D5CD6D6D6F3F3F3FAFA
      FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA646363BBA799FFFF
      FFFFFEFFFFFEFEFEFEFDFFFEFDFEFEFDFEFEFCFEFDFCFEFCFCFEFDFCFDFCFBFD
      FCFB806D59646363ECECECF8F8F8FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFABBA799FFFFFFFFFFFFFFFFFEFEFFFEFFFEFEFEFEFE
      FFFEFDFFFDFDFEFDFCFEFDFCFEFDFCFEFCFB806D59DEDEDEF0F0F0FAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFABCA899FFFF
      FFFFFFFFFFFFFFFFFEFEFEFFFEFFFFFEFEFEFEFEFEFDFFFEFDFFFDFDFEFDFDFE
      FDFC806D59DEDEDEF0F0F0FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFA00FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFABCA89AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FFFEFEFFFEFEFFFFFEFFFEFEFFFDFDFEFEFD917D6CE5E5E5F3F3F3FAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA00FAFAFAFAFAFA
      FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFABCA89ABBA8
      9ABBA799BBA698BAA696BAA496B9A495B8A294B8A292B6A191B69F90B59E8FB5
      9D8DB59D8DF3F3F3F8F8F8FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
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
      FAFAFAFAFAFAFAFAFA00}
    LookAndFeel.Kind = lfOffice11
  end
  object btnEncerra: TcxButton
    Left = 112
    Top = 184
    Width = 105
    Height = 57
    Hint = 'Excluir'
    Caption = '&Encerrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnEncerraClick
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
  object QryRCaixaItem: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'cax_num'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'ccr_codigo'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'cax_num'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ccr_codigo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cax_num'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ccr_codigo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cax_num'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ccr_codigo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cax_num'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ccr_codigo'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '  '#39'1 - SALDO INICIAL'#39' as cax_desc,'
      '  0 as cax_item,'
      '  '#39'S'#39' as cax_dce,'
      '  '#39'Saldo Inicial :'#39' as cax_historico,'
      '  '#39#39' as cax_favorecido,'
      '  a.`cax_saldo` as cax_credito,'
      '  0 as cax_debito,'
      '  0 as cax_estorno,'
      '  0 as cax_transf,'
      '  a.`cax_saldo` as cax_valor'
      'from'
      '  `mny_caixa_conta` a'
      'where'
      '  a.`cax_num` = :cax_num'
      '  and a.`ccr_codigo` = :ccr_codigo'
      '  '
      'union'
      ''
      'select'
      '  '#39'1 - SALDO INICIAL'#39' as cax_desc,'
      '  p.cax_imp as cax_item,'
      '  p.`cax_dce`,'
      '  p.`cax_historico` ,'
      '  p.`cax_favorecido`,  '
      '  case p.`cax_dce`'
      '    when '#39'C'#39' then p.`cax_valor`'
      '    else 0'
      '  end as cax_credito,'
      '  '
      '  0 as cax_debito,'
      '  0 as cax_estorno,'
      '  '
      '  case p.`cax_dce`'
      '    when '#39'T'#39' then p.`cax_valor`'
      '    else 0'
      '  end as cax_trasnf,'
      '  '
      '  p.`cax_valor` as cax_valor'
      '  '
      'from'
      '  `mny_caixa_item` p'
      'where'
      '  p.`cax_num` = :cax_num'
      '  and p.`ccr_codigo` = :ccr_codigo'
      '  and p.`cax_dce` = '#39'T'#39
      ''
      'union'
      ''
      'select'
      '  '#39'2 - CR'#201'DITOS'#39' as cax_desc,'
      '  p.cax_imp as cax_item,'
      '  p.`cax_dce`,'
      '  p.`cax_historico` ,'
      '  p.`cax_favorecido`,  '
      '  '
      '  case p.`cax_dce`'
      '    when '#39'C'#39' then p.`cax_valor`'
      '    else 0'
      '  end as cax_credito,'
      '  '
      '  case p.`cax_dce`'
      '    when '#39'D'#39' then p.`cax_valor`'
      '    else 0'
      '  end as cax_debito,'
      '  '
      '  case p.`cax_dce`'
      '    when '#39'E'#39' then p.`cax_valor`'
      '    else 0'
      '  end as cax_estorno,'
      '  '
      '  case p.`cax_dce`'
      '    when '#39'T'#39' then p.`cax_valor`'
      '    else 0'
      '  end as cax_trasnf,'
      '  '
      '  p.`cax_valor` as cax_valor'
      '  '
      'from'
      '  `mny_caixa_item` p'
      'where'
      '  p.`cax_num` = :cax_num'
      '  and p.`ccr_codigo` = :ccr_codigo'
      '  and p.`cax_dce` = '#39'C'#39
      ''
      'union'
      ''
      'select'
      '  '#39'3 - D'#201'BITOS'#39' as cax_desc,'
      '  p.cax_imp as cax_item,'
      '  p.`cax_dce`,'
      '  p.`cax_historico` ,'
      '  p.`cax_favorecido`,  '
      '  '
      '  case p.`cax_dce`'
      '    when '#39'C'#39' then p.`cax_valor`'
      '    else 0'
      '  end as cax_credito,'
      '  '
      '  case p.`cax_dce`'
      '    when '#39'D'#39' then p.`cax_valor`'
      '    else 0'
      '  end as cax_debito,'
      '  '
      '  case p.`cax_dce`'
      '    when '#39'E'#39' then p.`cax_valor`'
      '    else 0'
      '  end as cax_estorno,'
      '  '
      '  case p.`cax_dce`'
      '    when '#39'T'#39' then p.`cax_valor`'
      '    else 0'
      '  end as cax_trasnf,'
      '  '
      '  p.`cax_valor` as cax_valor'
      'from'
      '  `mny_caixa_item` p'
      'where'
      '  p.`cax_num` = :cax_num'
      '  and p.`ccr_codigo` = :ccr_codigo'
      '  and p.`cax_dce` = '#39'D'#39
      '  '
      'union'
      ''
      'select'
      '  '#39'4 - ESTORNOS'#39' as cax_desc,'
      '  p.cax_imp as cax_item,'
      '  p.`cax_dce`,'
      '  p.`cax_historico` ,'
      '  p.`cax_favorecido`,  '
      '  '
      '  case p.`cax_dce`'
      '    when '#39'C'#39' then p.`cax_valor`'
      '    else 0'
      '  end as cax_credito,'
      '  '
      '  case p.`cax_dce`'
      '    when '#39'D'#39' then p.`cax_valor`'
      '    else 0'
      '  end as cax_debito,'
      '  '
      '  case p.`cax_dce`'
      '    when '#39'E'#39' then p.`cax_valor`'
      '    else 0'
      '  end as cax_estorno,'
      '  '
      '  case p.`cax_dce`'
      '    when '#39'T'#39' then p.`cax_valor`'
      '    else 0'
      '  end as cax_trasnf,'
      '  '
      '  p.`cax_valor` as cax_valor'
      '  '
      'from'
      '  `mny_caixa_item` p'
      'where'
      '  p.`cax_num` = :cax_num'
      '  and p.`ccr_codigo` = :ccr_codigo'
      '  and p.`cax_dce` = '#39'E'#39
      'order by 1,2')
    SQLConnection = FrmLogin.conWebMaster
    Left = 264
    Top = 56
    object QryRCaixaItemcax_desc: TStringField
      FieldName = 'cax_desc'
      Required = True
      Size = 17
    end
    object QryRCaixaItemcax_item: TBCDField
      FieldName = 'cax_item'
      Required = True
      Precision = 6
      Size = 0
    end
    object QryRCaixaItemcax_dce: TStringField
      FieldName = 'cax_dce'
      Size = 1
    end
    object QryRCaixaItemcax_historico: TStringField
      FieldName = 'cax_historico'
      Size = 203
    end
    object QryRCaixaItemcax_credito: TFMTBCDField
      FieldName = 'cax_credito'
      Precision = 17
      Size = 2
    end
    object QryRCaixaItemcax_debito: TFMTBCDField
      FieldName = 'cax_debito'
      Precision = 17
      Size = 2
    end
    object QryRCaixaItemcax_estorno: TFMTBCDField
      FieldName = 'cax_estorno'
      Precision = 17
      Size = 2
    end
    object QryRCaixaItemcax_valor: TFMTBCDField
      FieldName = 'cax_valor'
      Precision = 17
      Size = 2
    end
    object QryRCaixaItemcax_transf: TFMTBCDField
      FieldName = 'cax_transf'
      Precision = 17
      Size = 2
    end
    object QryRCaixaItemcax_favorecido: TStringField
      FieldName = 'cax_favorecido'
      Size = 100
    end
  end
  object FrMaster: TfrxReport
    Version = '4.6.32'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41156.685022071800000000
    ReportOptions.LastChange = 41156.685022071800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = FrMasterGetValue
    Left = 296
    Top = 88
    Datasets = <
      item
        DataSet = FrmLogin.FrDtStEmpresa
        DataSetName = 'FrDtStEmpresa'
      end
      item
        DataSet = FrDtStRCaixaItem
        DataSetName = 'FrDtStRCaixaItem'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        DataSet = FrDtStRCaixaItem
        DataSetName = 'FrDtStRCaixaItem'
        RowCount = 0
        object Memo43: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Lucida Sans Typewriter'
          Highlight.Font.Style = []
          Highlight.Color = 16702140
          Highlight.Condition = '<Line> mod 2 = 1'
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[FrDtStRCaixaItem."cax_item"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 34.015770000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[FrDtStRCaixaItem."cax_dce"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 317.480520000000000000
          Width = 294.803340000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            '[FrDtStRCaixaItem."cax_historico"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          Left = 616.063390000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FrDtStRCaixaItem."cax_valor"]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 68.031540000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            '[FrDtStRCaixaItem."cax_favorecido"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 253.228510000000000000
        Top = 385.512060000000000000
        Width = 718.110700000000000000
        object Memo15: TfrxMemoView
          Left = 464.882190000000000000
          Top = 11.338590000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBlack
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'RESUMO')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 464.882190000000000000
          Top = 34.015770000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'SALDO INICIAL:')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 464.882190000000000000
          Top = 52.913420000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'CR'#195#8240'DITOS:')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 464.882190000000000000
          Top = 71.811070000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'D'#195#8240'BITOS:')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 464.882190000000000000
          Top = 90.708720000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'SALDO FINAL:')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 600.945270000000000000
          Top = 34.015770000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[sSaldo]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 600.945270000000000000
          Top = 52.913420000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[sCredito]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 600.945270000000000000
          Top = 71.811070000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[sDebito]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 600.945270000000000000
          Top = 90.708720000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[sSaldoFinal]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 464.882190000000000000
          Top = 128.504020000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBlack
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'TOTAIS CAIXA [dDataCaixa]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 464.882190000000000000
          Top = 151.181200000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'TOTAL D'#195#8240'BITOS DO DIA:')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 604.724800000000000000
          Top = 151.181200000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[cTotDebito]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 464.882190000000000000
          Top = 170.078850000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'TOTAL DE SALDOS:')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 604.724800000000000000
          Top = 170.078850000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[cTotSaldo]')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 464.882190000000000000
          Top = 204.094620000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'CONTA INVESTIMENTO:')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 604.724800000000000000
          Top = 204.094620000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '0,00')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 464.882190000000000000
          Top = 222.992270000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'SALDO REAL:')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 604.724800000000000000
          Top = 222.992270000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[cTotSaldo]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 113.385900000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Picture1: TfrxPictureView
          Left = 11.338590000000000000
          Top = 7.559060000000000000
          Width = 287.244280000000000000
          Height = 64.252010000000000000
          ShowHint = False
          Picture.Data = {
            0A544A504547496D616765F22B0000FFD8FFE000104A46494600010101006000
            600000FFDB004300020101020101020202020202020203050303030303060404
            0305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C0C07090E
            0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080049016E03012200021101031101
            FFC4001F0000010501010101010100000000000000000102030405060708090A
            0BFFC400B5100002010303020403050504040000017D01020300041105122131
            410613516107227114328191A1082342B1C11552D1F02433627282090A161718
            191A25262728292A3435363738393A434445464748494A535455565758595A63
            6465666768696A737475767778797A838485868788898A92939495969798999A
            A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
            D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
            01010101010101010000000000000102030405060708090A0BFFC400B5110002
            0102040403040705040400010277000102031104052131061241510761711322
            328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
            292A35363738393A434445464748494A535455565758595A636465666768696A
            737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
            A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
            E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FDFC
            A28A2800A28AE3FE26FED07E04F82D66B71E2FF18F86BC33031C09353D462B55
            27EAEC3D0D007614578ADA7FC1483F67FBFB810C1F1ABE17CB2B1C044F12DA16
            27E9BEBD7340F13E9BE2BD3A1BCD32FECF50B5B840F1CD6F32CA9229E8410704
            5005EA28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
            A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
            A2800A28A2800A28A2800A28A2800A28A2800AAFABEAF69E1FD26EAFEFEE6DEC
            AC6CA27B8B8B89E411C504680B33BB1E154004927800558AFCBAFF008382FF00
            6A4F17F8C3C53E07FD963E1B7972EBFF00151A17D63CA9089BC879F6416E4838
            4476477909FE08C7F09390691C87ED55FF00055EF8C5FF000517F8B5ABFC1BFD
            90345D425D2ECD95353F19447C891A30FB5A48E57212DA063C0763E63807685E
            87A7F84BFF0006C4F8575A5B5D67E317C4FF0019F8D3C4B70A24BF1652AC3119
            08C94F3A612C920073F31DA4F5C0AF45F8DBF137C07FF06FCFEC3DE17F09F80F
            41B0F11FC40F12DC476965672865B9F115EE144F7B3941BD914B2AAA0231BE34
            5C0C91DCFC1EFF008261DF7C63D2AD7C63FB4378E7C73E3AF186BB0A5EDDE830
            EB571A6681A13BA86FB3416D6EEA088B2537331DC46719A07738DF10FF00C1B5
            1FB346B1A49B7B5B4F1A6953ED205CDBEB21A4071D71246CBFA57CFBF16BFE08
            A1F1BBFE09DF341F10BF65EF897E25F124FA3CFE7DC785EEB11CB7308E76840F
            E4DD0EB98CA29E72B96C57BCFED43FF0483D57E1AEB7A1F8D7F67CF1F7C47F06
            DF69BACD836A5E1CB7F115D4D63A85A9BA896764F3242CACB1B339562C8C108D
            A339AFD0AA0573E1DFF8259FFC16234EFDB36F2F3E1FFC47B1B3F87FF1A745B9
            7B39F419BCCB7FED431AB191A18E51B9244D8FBE124B285CF233B7EE2AFCC3FF
            0082FDFEC0172FE1FB7FDA6FE19DC3F877E207C35115E6A8FA7C4229AFE04941
            5BBDEB8266833925B3BA3041FB801FB57FE09FDFB5EE95FB71FECA3E14F883A7
            4900BBD46D560D5EDA33FF001E1A846A05C4383C801B95F55653DE8067B3D7C4
            DFF0575FF82C5E83FF0004DEF0ED9687A35AD8F89BE26EB08B716DA44EEEB058
            5A9DE3ED33B28E85976AA0219B9390066BED9AFE6E3FE0B817B73E2DFF0082CC
            78D2D3580C96B15FE8F631A39F956DBEC76B8233D8EE66FAB1A0123E87B2FF00
            829A7FC1437C53F0D3FE16B69FE018DBC05F666D455E1F0D06B56B5505DA60A5
            CCE62DA09DE0E30339C57DB1FF00046FFF0082C6C5FF00052AB5D7BC3BE22D0E
            CBC37E3EF0CDB25F4B0D94ACF69A95AB38469A256CB26C76456525BFD6210C72
            40FB6AE7C396573E1C9348FB3C51E9D25B1B4F22340A8B115D9B001C01B78C74
            AF947F629FF82467C05FD8DBE2DC1E35F87736AD71E2382DA6B3134DAE9B9578
            E4187568D4853D01E470403D450173E9EF89DF147C3BF05FC0BA8789FC59ACE9
            FE1FF0FE94AAF79A85F4C22B7B70CEA8A598F032ECAA3DD80AC0F815FB517C3B
            FDA72C351BAF87DE32D03C616FA4C8915EBE9776B38B66704A07C74C856C7AE0
            D7E727FC1C8DF15FC41F137C4FF07BF66EF09B17D47E236A71DFDEC28C77CA3C
            E16F688C3A796643339CF7854F6AF06FF821FEADAAFEC11FF057CF1E7C0AD72E
            A582C75DFB6E8AA2E7F75F6B9ED19A7B3B80338CC900936FA89C6280B687EC17
            C70FDB4FE13FECD3E21B4D27C7DF103C2FE12D4AFADFED76F6DA9DF24124B16E
            65DE01EABB95867D41AE434FFF0082A97ECE1A9DE47043F1AFE1CF992B055DFA
            D431824FBB1007E75F95FF00F074335AA7EDC9F0A8DF6CFB10F0DC26E370257C
            BFB7CFBB20738C66A6FF0082A3F8B7F608D67F63FD7A0F83B6DE1A6F892D716D
            FD8E743D3AEED6556F397CC323491AA18FCAF30107924AE39E403B1FB57E31F8
            9FE1DF87FF000FAEFC59AD6B5A6E9DE1AB0B6FB6DC6A734EA2D6280804485FA6
            D208E7A735E7DF087F6FAF82DF1F7C6F0786BC17F137C1DE25D7EEA37961B0B0
            D45259E55452CE5541C9C2824E3B027B57E737ECB3E09F1B780BFE0DABF8B365
            E36B1D5B4C924B4D52E348B6D46378E58EC1C4050847E551A4F3994606436470
            727E1CFD9DBC20DFF04FFF00881FB25FED0FE74E7C35E34B9B893546ED6AD6F7
            D3595DA0239C1B5747031C92DF80163FA15F8EDFB5CFC32FD98AE34D87E20F8E
            7C37E0F9758591EC9354BC581AE5632A1CA83D402EB9FA8ABDF037F694F00FED
            31A1DEEA5E00F16E87E2EB0D3A716D733E9972B3A412950C1188E87041AFC4BF
            F82C46B577FF000509FF008285FC46B5D247DA3C19F00BC07777135EDB39789D
            E3B67B8DE4F405AEA78A2C0EAB167B1AED7FE0893FB559FD8A3FE0947F1CBE24
            AD845AA49A078B6C112D65665494CFF65839239E0484FD4502B687EB17C7BFDB
            83E117ECBDAAC361F103E21F85BC2BA8DC44278ECEF6F556E5E32701C4432FB4
            9CF38C1C1F4AD8F811FB507C3BFDA7B46BBBFF0087DE33F0F78BED6C1D52E9B4
            CBC49DAD59812A24507721201C6E03383E95F8D9FF000438FD903C33FF000543
            F8F5F167E307C6D8A4F1A5FE9BA842EBA7DD39FB25CDC5D89D9DE45072563545
            548F3B403D0ED5C67FC79F09597FC113FF00E0B6FE0EB9F8766E53C1BE2D86DA
            EAE748926631C7677B3CB6D3DB0239658D93CC8F767055339DB92058FD82F8B7
            FB7C7C17F80BE3A9BC33E33F899E0FF0CEBF6E91C92D86A3A8A41346AEA19188
            63C0208393DABB6F8ABF1A7C27F03BC033F8A7C5FE21D2BC3DE1CB631ACBA8DE
            CEB15BA19182A65CF1F331007AE6BF0AFF00E0B51FB377897F6AEFF82CDF8A7C
            1DE10B75BDF114DE18B6BFB4B4270D786DB4EF3DA25278DEC88C173C1381DE97
            59FF00828CA7ED17FF00042AF1BFC25F186A2EBF11FE1C5D6976D0C7745BCFD4
            74C8EFEDD237C9EAF0922261D70A879CB100EC7EF1F80FC7BA37C50F06E9BE21
            F0EEA767ACE87ABC0B73657B6B20921B98DBA3AB0E0835E7769FB79FC19BFF00
            8BE7C010FC4BF07CBE341A836927465D450DDFDAD58A341B339DE1811B7AE462
            BC37F64CF8F163FB31FF00C10EBC1BE3DD42E20B78BC31F0F12F2232B61659C4
            444117D5E52883DD857E1FF893F672F1BFECF3FB367C25FDA90EA97C757F17F8
            BEEEE2DA4941DD0C96D224B05C33E77169658EE89CF68C1EF40923FA8DAC3F89
            3F12741F83DE03D57C51E27D52D344F0FE876ED757D7D74FB62B78D7A927F200
            0E49200049AE73F654F8EF69FB4F7ECDBE08F883651A430F8BB46B7D49A146DC
            2DE5741E6C59EFB24DE9FF0001AF91BFE0E4DD62F34CFF00825FEB315A97115F
            EBFA6DBDD6D27FD5798D273EDBD13F4A047C91E26FF82F6FED21FB69FC6FD4BC
            1DFB37F806C16DA06967B42B646FF5292D6360BE7CACECB0C4A7726415F94B85
            DCC7197F80FF00E0BE9FB437EC77F1DEC7C11FB49F812C3C99E4824BC76B36D3
            F51B4B591F69B98F6168A6400390028DC508DC0E6BD0FF00E0D40F0A69717C0F
            F8B1AE2C501D6A7D72D6C649368F312DD2DF7A2E7A852F239C742547A57D99FB
            76FF00C131BE0BFEDD3E39F0E6B7F13BEDABA8E8D69258D90B7D4C597DA222E1
            C86C7CCFB58F183C6F3EB415A1F487873C4563E2FF000F586ADA5DDC17FA66A7
            6F1DDDA5CC0E1E2B886450C8EAC382ACA4107D0D797F897F6F9F82DE0EF8ACDE
            06D57E27783B4FF17A5E47A7B6933EA31A5D2DC4854244549E18975E3DEB4FC2
            5E1BF097EC59FB2AFD8F4879A1F067C3AD0E79E137176D70D1DADBC6F2906562
            49000207A00076AFE6CFE2E7C10F1FFC77F80BE33FDAC3568AED2DF5EF1F1B67
            689084579C4D3493AB672238E5F26153EAD8EA281247F50FE28F13E9FE09F0D6
            A1ACEAF796FA7695A4DB497979753B848ADA18D4BBC8CC780AAA0927D057857F
            C3D87F66CFFA2D7F0F7FF06D1FF8D79CFC32FDA31FF6ACFF00821DEA7E35B9B9
            8EEF54D43E1A6A76DA9C8ADB89BC82CE78272DDC12F1B360FF007857E427FC12
            37E357ECB5F0A7C2BE378BF688F09C3E24D42F2EED5B4577D24DE982254944A0
            10C36E58A7D7140247F407F047F6B3F863FB49C9751F807C7BE13F17CD62BBEE
            21D2F538AE26817206E7453B957240C918E6B03E2C7FC140FE09FC09F1DDE786
            3C63F13FC1DE1BF10E9E236B9D3EFF005048A780488B221653C8DC8CAC3D88AF
            C67FF8256782746F8DFF00F05B8FF84BBE075ACBE0DF85FA2DF5DDF8B1BABF8D
            6E4591B664788405FCC68E49586140611AB0C9F9453BFE0A6D79E05D3FFE0E1F
            9A6F8982C5BC031DEE88DAE0BD89E5B736DFD996DBB7AA02C474E00340EC7EC7
            FC3AFF00828C7C08F8B5E2DB2D07C39F16FC05AB6B5A94821B4B2835887CFBA9
            0F448D490598F60324D767F1C7F68EF027ECD3E1DB4D5FC7FE2BD13C23A65F5C
            8B3B7B9D4EE5608E69B6B3EC527AB6D5638F406BF077FE0AEFFF000CB7F126E3
            E1D699FB2A69705F78E6EB51962BB87C37A7DDC4B3C6CAA224F2E4405E5F3395
            F2C640DD9ED5EF5FF05BDD1BC59E1DFF00822DFECDB61E3A17A3C5F67A869D0E
            AA2F24325CACCBA5DC82256249320180C49249079A0563F467FE1EC3FB367FD1
            6BF879FF008368FF00C6BA91FB7A7C193F080F8FFF00E165F843FE10A1A8FF00
            649D67FB413EC62EF66FF237F4DFB79C7A57E387EC81F1A3FE09F3A07ECCDE0C
            B2F89DE05BFD4BC7F6FA7AA6B97296574EB35C6E6C90566553C63A015F44FF00
            C170BE05FC3BF809FF000470D0EC7E176830F877C27AE78C74DD6E1B68DA46DE
            D716931DE77B3104A2A719E314058FB793FE0ABFFB3648E147C6CF87993C73AB
            C607F3AF64F869F153C33F19BC216DE20F08F88346F13687764886FF004BBC8E
            EEDA420E1807425720F046722BF123F650F16FEC2167FF0004CCD2ED7E26DB78
            6E6F8AE344D416F843A75DFF006AB5C99AE3C8D932A797E66C316D25B68E33D0
            8AF4AFF8353BC1DE38D293E27EAF776BAB5B7C3FD4E1B44B19270EB6B757A8F2
            6F6841E0954387651FDD04F18A02C7EA6FC76FDAA3E1CFECC56DA6CDF10BC67E
            1FF07C5AC348962DAA5DADB8BA31852E133D76EF5CFA6E1EB5D1FC36F897A07C
            61F03E9FE25F0B6AF61AF681AB2192CEFECA512C172A18A92AC38386561F506B
            F0F3FE0A95A178C3FE0AB3FF000540F88BE07F0C19AE746F819E15D40DB436DF
            BCF366B583CC95429C0F365BC78E0E3F8517FBB5F4B7FC1AD7FB464BE35FD98F
            C67F0D750BC125DF8175717B61048E7CC8ECEEC12CAAA7F85678E4271D0CDEF4
            058FD49A28A281057E4BFECB1F0F4FC7DFF83953E3178A3572674F8696924964
            8FF308DC5BDBD9478CF4C2C9237D79AFD68AFC9BFD927E208F81BFF0726FC6CF
            0BEAC05BFF00C2C5B3912C5A4CAF98FE4DBDEC7B7D728920FA8A0684FF0082AE
            6A76B27FC179FF00658B5F103463C3F6F6F612C6273FB9F3DF51B9009CF1CBA4
            20FD057E81FEDC5F143E227C2BF8376971F0BF42B3D77C55ACEB763A2466EE37
            921D363BA97CA6BC74520B2C4595882718C93C0AF9E7FE0B5DFF0004B5D57F6F
            AF057873C51E07BF8F4EF88FE01F35B4E123F969A844CC8FE5171CABABA6E43D
            8B37AD69FECA7FF052EF15DB783EC3C39F1B3E13FC41F0A78CF4A812DEEAF2D7
            4B6BEB1D4591429983213B5988248E79CF4E94033A487FE099BE20F1989EF7C7
            5FB407C64D7358BA1F39D2F593A3D8C07FE995BC015547D735F347ED79AE7C79
            FF00822A8D23E21E8DF107C4FF001A7E13DDDF7D8759D1FC5321B8B9D28391E5
            3ADC0E5431DCA1800036D0436EC57BCFED11FB487C5DFDAB2DD3C09F04BC0DE2
            1F0DDB6A33C1FDA5E35F10C66C20D3A05951DC411677C8ECA0AF38182C383835
            D57FC16AE0B4B8FF008259FC6417DE59897468D9770E3CD173098F19EFBF6E28
            03D5BE0FFC4BF0BFEDD9FB25E95E22B6B7F3FC2DF123426135ACD86291CD1B47
            340FD8B236F43DB2A6BF3D3FE0D71D527D03C1DF1DFC1124ACF0F867C4B6D2C6
            A4FF0014893C2E71EFF654AF6DFF008208EB8FF0CFFE08F9E16D73C4D71F61D2
            34D3AC6A4269CE160B24BB9DD9F9E8BF2C8DF4AF10FF00835CF4F9BC43E1BF8F
            7E3578996DFC49E25B58A363D3722DC4CEB9F61729F98A00FD5CAFC99FF83807
            FE090DE2BF8FFE351F1B7E19DBDCEB7AFA5B5B58EB3A15BC6BE7CE910654BA89
            B23732AEC529C921411D307F59ABE6EF8E1FF056DF807FB397C52D5BC19E30F1
            D5AE91E23D11912F2D1EDE4630978D645E42E395753F8D008FCD7D0BFE0B6BFB
            58F87FE08A7C3DBDF82BAD5F78D23D3CE94BAECBA2DF0BB66286359D9000A661
            90777DD2C324726BD67FE0DEDFF825FF00C40F80BE35D5FE307C51B5BCD1EF6F
            74E7D3B43D22F242D731895D5A5BA91727612A9B141E70EF9038AFA78FFC1733
            F65769FCD3F11B4D327F7FEC52EEFCF6D4BFF0FDAFD977FE8A6597FE02CDFF00
            C4D007C03AFF00EC5BF117FE0AD9FF00056CF8BDE2BB2F117887E1CE83E049D2
            D743F103D84C32B030B7816DB718C80FE5CF3654F1B8FF007ABC8FFE0A57FF00
            04D6F8B9FF0004F6F8E1F0F7E20E97E2FF00167C56D7EFEE4DE2EB5169D3C971
            617166D11895D833B105586324708457EAB5B7FC1737F658B5DDE4FC46D3A3DD
            CB6CB29467EB85A2E7FE0B9DFB2C5D80B37C47D3A50A7203D94AD8FCD681DD9F
            9E5FF05F0D2B5EFDA3FF00692F807E2CD23C2DAF5FD86B7E0DD3EF6E121D3669
            56D8CD75248D14985F9594360AB608EF5EDDFF00070DFF00C134B446F80BE1DF
            89BF0C3C231699E20F08EA09677D67A069C14DDDACEDF2CA5225C968A5098207
            495B3D38FA724FF82E37ECA92EDDDF1134B6D830B9B190ED1E83E5A966FF0082
            EA7ECB57119493E24D8488DD55AD2520FF00E3B406A7996BFF00B42F89FF006D
            1FF8206F8EB59D6BC3DAA58F8DC7866EB47D4F4F3652A4F3DD42557CC58CA863
            E6A6C9300100B903A57CD7F11FF636D5FE357FC1B59F0F58691AAC5E2DF86F77
            73AE5BE9E6CDC5DCA8DA95D43345E591BF98A6F3318E7CA5AFB7A3FF0082E5FE
            CAD140D12FC46D31627FBC82CA50ADF51B6957FE0B9FFB2C2DBF923E23E9C22C
            6360B3976FE5B6816A7C35FF0004DCFD927C49F0F7FE08A5FB4C78B35AD0F558
            BC4DF1174CBDB6B3B69ED5FEDB3DB5ADBB226108DFF34D24C318E76035D97FC1
            003F6494F8CBFF0004FAF8BDE00F883A1EAFA6699E20F14DACAF0DDDABDBC922
            C51DBCAACA1D4646F8C738F5AFACD7FE0B9FFB2C25BF923E2469C22C6360B397
            6E3E9B68B6FF0082E77ECB1668443F11F4E8958E484B395413F82D03BB3F3AFF
            0065AF88FF00137FE0DF8FDA47E2478575FF0086FE20F1CFC3EF135D45F66D56
            D2178D6E12032882E237557452C9361E36E72063A73B7F053E147C46FF0082D3
            FF00C155341F8B9E34F01EB3E0AF867E114B69625BB81D23921B4732C16C1A40
            A646965725D957014B74E2BEF6BFFF0082E3FECA9AA4412EBE226977283F865B
            191C7E4569F6DFF05D0FD962CA111C3F1234E8A35E8A9672A81F805A00F9E757
            F02EB6DFF0742695AE8D1B553A22F87590EA1F6493ECA1BFB1655C79B8DB9DDC
            75EBC57CC7FF0007047FC12CF5CF85DFB40CBF153E1E787AF2FF00C29E3E907F
            6A5969568D21D3B51C65D8A202764DB7CCCE301F7E71915FA45FF0FCEFD963ED
            3E77FC2C7D3BCEE9BFEC72EEFCF6E696E3FE0BA3FB2CDD47B65F891A7C884E70
            F67291FAAD01A9F9FF00FF000507BAF1AF897FE0941FB267C16F0EE85E239F55
            F11595ADE6AF6F0584E4DBAC4BE4C11CF85C28696666C37430835BDFB52FFC1B
            D9F113E1EFEC91AFB41F1BFC43E34D37C0FA64BAA69BE16FECF94C133C11B308
            E24F3982B6D2E06149F9B1DEBEDE3FF05C7FD9519909F889A59318010FD865F9
            00F4F978A99BFE0BB1FB2E3A907E25D8907820DA4DCFFE3B40B53C7FFE0DA4F8
            91E28BCFD8F35FF00F8AF4AD674B9FC0BAC16D35750B496DCB59DD032855DE06
            42CCB31E3A6F15F65FEDA5FB29E89FB6C7ECD3E27F86DAFCD2DAD978860411DD
            44A0C9673C6EB2452A83C12AE8A71DC6477AF10B6FF82E67ECAD664F93F11B4D
            8B775D9652AE7F25A97FE1FB5FB2EFFD14CB2FFC059BFF0089A0353F2BBF6675
            FDA73FE0867FB40F8B63B7F86BACF8B7C37A98FB1DD245673DC69DA92A39305D
            46F0E4A3EDDD8DDC8123022ADFC71D13F6A0FF0082E4FED33E16BAB9F006B7E0
            7F0CE9689A7C4F25BCF6961A542F26E9EE58CA43492118C85C9211060019AFD4
            49BFE0BA5FB2D5CC5B64F89361221ECD67291FFA0D10FF00C1753F65AB740B1F
            C49B0451D96D2503FF0041A0773C33FE0B756FACFECA7FF04C3F04FC10F867A6
            6BDAAAEBAD06813C9696F2DC5C358DB461E6773183F34B2F97BB3C1DEE2BC76D
            BFE0DD7F8A87F6461A4FFC2F0D6E38E4D13EDEDE0CFB349F61FB66CFB47D948F
            3B6FFAFE37EDEBF362BED2B8FF0082E6FECAF7857CDF88FA6CBB7EEEFB295B1F
            4CAD4BFF000FDAFD977FE8A6597FE02CDFFC4D02D4F83BFE08B9E23F15F85FF6
            02FDA8BE12788BC3DE25D36F61F0F6A3ACE8F05DE9F3C7F683258CB05C471EE5
            C160E901DA3926435E1BFF0004A0FDADAF7FE09F7E18F1A5878ABF67EF16F8EE
            5F135D5ADC5BC8DA6491FD904492AB0F9E07CEEDE3A63A57EAE47FF05C7FD952
            26665F889A5AB382188B1901607A83F2D33FE1F7FF00B287FD140D23FF000024
            FF00E2281DCFCD8FD9C3E197C52FDB77FE0B0BE16F8B3E0CF857AE7C1BF0B41A
            CD95FDFB8B392D6D61B6B654FB42B3944123CEAAC842AF265E46326BBCFDAF3E
            086A5E3EFF008394B47B8D43C25A86B1E13BBD5F434BA9A6D31E7B09631A75B8
            60EC54A150460E4E0115F79C1FF05D2FD96ADD0245F126C117FBAB67281FFA0D
            46DFF05CBFD959EE3CE3F11B4C328E779B29777E7B73405D9F067FC1593F646D
            73FE09E5FF000521F877F1F3E13F84EEB51D1351BF8B509747D2AC1CC167716A
            B1473418897E48E788E7A7DE692BD97FE0E2CD46FBF699FF0082757C23F10785
            743D77504D6FC476DAA0B48AC257B9B58E4D3EE4959230BB94A96DA720735F48
            5CFF00C173BF658BC5026F88FA74A07203D9CAD8FCD69B27FC172BF656960589
            BE22E98D1A7DD43652955FA0DB408FCF1FD93BFE0A94DFB39FECE3E10F03EA7F
            B236ADE27BFF000D582D9CFAA4B64E8F7AC189DE41B5623AF727A57A9FFC14EB
            F68FF11FFC142FFE08CF6DE21B4F863E21F08DFD9FC42B5D39342F225B9B810C
            36B211305112B04FDEEDFBB81B7AD7D6FF00F0FBFF00D943FE8A0691FF008012
            7FF114F3FF0005C7FD95441E57FC2C4D2FCBCEED9F61976E7D71B6803E51F057
            FC135F4DFDA13FE0DEFD161B6F07DA695F13F4DD2EF35A82E1F4B116A77335AD
            F5D3F90C4A890992105003FDE4ED5BBFF0435FDAEFC43F0A7FE09C1F11FC37E2
            8F0DF88AC757F8416977ABE8F1DDE9D3A1D4EDE659248E18C14CB30B805703B4
            C9EF5F4AC5FF0005D3FD96A088469F1274F48C70156CE5007E1B6A24FF0082E2
            7ECA71AB05F887A528718602C640187BFCB406A7E76FFC133BFE08D5F17FF69B
            F863AB7C5ABAF8ADE2AF84BAEF8AB53B98A48C5A4C97BA9C6AE19E794F988D86
            98C9C11CECCF7158FF00B1B7C0BF1FFF00C12A3FE0B5BA67876EA3F116B9E16B
            CBB4D1F52D7534D996D351B4BD81596672BB940499909CB1C188E715FA610FFC
            1753F65AB78C247F126C2345E8AB692803F0DB4FB1FF0082DB7ECB7E23D5EDED
            A3F885A65C5DDCC8B0C41ACA42CCC4E00C95F5340EECFAA7C13E2BB6F1E78334
            8D72CD665B4D66CA1BE81658CC7208E58D5D432900A9C30C82320D69D647C3EF
            1AE95F127C05A1F88B42B84BBD135FD3E0D4B4F9D576ACD6F346B244E01E80A3
            29C7BD6BD04857E597FC17FBF672F167C2BF8ADF0EBF6ACF8796A25D57E1B4B0
            45AE2C487779514C64866931D63F99E27FF65D7B57EA6D52F12786EC3C63E1FB
            DD2B55B3B7D434DD4616B7BAB69D03C53C6C30CACA7820834023CDBF635FDAFB
            C23FB6CFC0CD1FC6BE12D42DAE63BCB788DFDA2481A5D2EE59033DBC83A86539
            1EF8C8AE77FE0A47F183C69F01FF00657BFF0014F80746D435FF0010E95AB697
            3FD86CA32F2DC5AADF42F72981CE1A059109EDBEBF3D3F685FF8271FC6BFF824
            E7C63BCF8B5FB31DE5FF0088FC21AA5F349AA784962694DB46CC4846881FDE44
            B92038F9978CF1D7D4FE03FF00C1CB5F0E758D423D1BE2B7853C45F0E35B8BE4
            B86781AE2DD5FE806F033DC8A0763E99F839FF00055BF853F13BC070EABAADE6
            ABE0CD53666EB47D674E9E2BBB671D57010861E8475AF9F3F6C5FF0084F3FE0B
            15AD59FC23F06689E23F04FC1EB3D423BFF1278BF5280DB8D6A388FC96F6D0B6
            198799F37CDC128A7A0AF48F187FC173BF654D134D6D4A4F1A58EA93AA9658ED
            B4F69E76207031B720D7CAFF001BFF00E0BB7F12FF006D0B2BDF017ECCFF000C
            FC4C9A9EB0DF648FC412C5BA5B646383246A01543D7E673F2F5C50091D2FFC16
            4BF6A4D23F663FD9A7C39FB207C1CD3CEABE24F146990E80D6B6327993E9B681
            A3511328E4CD71F3039ECCE4F515F70FFC1387F63BD3BF619FD917C2BE03B448
            CEA30402F759B80B83777F280D339F500E107FB28B5F3FFF00C12BBFE08FA3F6
            5ED72EBE28FC59BD87C6BF18F5D65BB6BCB86338D15CA9DEA8E7EFC87760BF41
            B405E2BEF4A01857F325FF0005E0FF0094AFFC5CFF00AFAB1FFD375AD7F4DB5F
            827FF057AFF825B7C77FDA03FE0A2DF127C5DE12F879AD6B3E1DD62E2D1ACEF6
            08F31CE12CADE3623E8CAC3F0A011F987457D53FF0E51FDA6BFE894F88BFEFD5
            1FF0E51FDA6BFE894F88BFEFD505DCF5BFF8237F823C33ACFECABFB4CEBDAEDF
            784FC3D79E1D8BC36D61E21D7F4DFB7DB68C66BBB949098FA9F306138EECA7B5
            7CFDE0DFD9ED3F6BDFF828941F0EF4DF15E89749E2FD7A4B3875ED3AC4C36328
            DACE258E1EAA876F03B66BE81FD9AFF625FDB3FF00656F0BF8B744F0CFC2ABA9
            F47F1B8B45D62CF52D316EE1BA16CEEF0E549FE16918FD71E9591E07FF008278
            7ED85F0DBF68EB3F8A7A17C2AD434CF14E9F7EDA8DB79160A96B04ACA54ED8B3
            80B863C5023C67F69AFD89747F83BFB3D687F127C2DE3687C5FA0DFF00892F3C
            2579FE84F6AF6F7D6D1ACAC5437DE8D95B20D75DF03FFE09B3A17C51F0EF832C
            B55F88D0683E3CF1DF87EF7C53A668ADA73CD1FD82DD6E5977CA381248B6B232
            8F4C575DAEFF00C1377F6C2F11FC0D83E1DDD7C33D71FC316DE209FC4E900B50
            1C5ECD12C2EFBB3D0A2818AFA6FF00654FD9CBE3B7C08F843A241ACFC27F17EB
            7E21F0DE93A96936513E83135C471DCC3731C70C57A5F296CAD71BD94AEEC865
            1C11405CFCF3FD89BF63297F6B6D47C657373ADA787FC3FE03D206AFAA5DF91E
            74AE1A648628624C8CBBBBE064E38359DF1B7F6541F0A3F694D1BC0B6BAEDB6A
            B61E22FECF9AC3524400886EF663CC8C13B244666565CF543EB5F467ECEDFF00
            04EFFDB03F666D7B54BAD03E156A77365AF5A8B1D5B4CD42C96E2CB538048B20
            8E58C9E40755604104119159FE39FF008264FED6BE3BF8C51F8DA6F84BA858EA
            96D7104F6B0D9582C16B6BE46DF291231FC2A114739271C93405CE7BF69FFF00
            8262697F033E18FC55D6B43F8856FE28D47E0C7882D341F12D98D3DEDD51EEA4
            78E2689CF0D86421BDC1ACCF859F07BE1F78E3F612F086ADE39F18278320B7F1
            DEBF6692DBE9AD79777C5B4FD1DD46171FBB8F6BE73D0CC31D4D7AD78CBF629F
            DB63C77A3FC50B0D47E1CEB125B7C60D56DB5AF12AAD905FB4DCDBCAF2C6C9CF
            C803C8C715C2DEFF00C127FF006B1D43E17E9BE0F97E17EBC743D2753BAD5EDA
            2FB38DCB717315BC52B16CF20A5AC231DB07D680B9E61E22FD84F53B6FF82805
            B7C07D275AB3D4AFB51D6ED34AB3D576158248EE12391272BD4011C8188F6357
            3F68DFD8EFC25F0CFE02FF00C2C1F05FC425F19E97178A9BC27710BE9AF692C3
            3ADBBCC64F98E190851B48EB9F6AF64D4FFE09E3FB66EA5FB40DA7C501F0FBC4
            76BE33B1B9B5BBB7BEB7B7086296DE38E38980E9C2C6A3DF9AE87E3EFEC59FB6
            37ED05E074F0CDFF00C1A4D17C3E9AA0D6BEC3A3E92B6B1B5E794D134C704925
            958E7B74C6280B9F2CF8D3F66CF0EF807F652F0878F750F1883E24F1CDBCF75A
            5F87E2B2662B1417F2DA48F24BF754111332FA90451F17FC0DA8689FB1BFC1CD
            727B8D2A4D3F5DBCD7A3B58A0B311DD44619EDD5CCD2F59012E368FE100FAD7B
            2F8B7FE0943FB58F8D7C23E17D12FF00E17EBD269FE0FB39AC74D45B700C514B
            732DCB827BFEF6690FE3563C4FFF0004B4FDADFC5DF0BBC2FE0EBDF861AEBE87
            E0E96F26D3225B701A26BA7479896CF3931AE3D31405CAFE07FF008253587893
            C2FF0063D43E22DA695F1022F87D3FC479F407B07755D3D6DDAE218C4C3E5333
            46118AF657F6AF8E6CED24BFBB8A0894BCB3384451D5989C015FA51E18F807FB
            73F84BE1DC3A0DAFC2F9DE78F41B8F0BBEAD3E96B26A53E952C462FB1B4A4E4C
            68AC42F191803240C57CFD17FC115BF69C864574F857E23574395223C107D680
            B9A5FB427FC12B64F80BF073C59ABDCF8D2C5FC59E00B7B19F5CD12784442437
            2503476B26EFDEB426401F81D0E2BC23F643F83761FB437ED41E02F03EABA92E
            8FA6F8AB5BB5D36E6F0903C88E49029233C6483819EE457D9BF173F643FDB4BE
            35FC367F0EEB7F091DE4BD585355D5A3D2631A9EB3E4EDF28CF31C92576AF2BB
            49C739AF1AB0FF0082307ED43A5DF43736DF0BBC4D05C5BB89229634DAF1B039
            0C08E41079CD0170FDA87F6D6BAB1F885F103E1FD87C39F04E8FE0DB2FB7787A
            C7493A4A8B8D3447BE14B9F3BEFF00DA10AF9858FF00167B579E7ECDDFB2FF00
            87FE25FC32F1078E7C73E321E08F08E8BA8DAE8B0DCAD935E4D7F7D3A4920891
            17B247133B13D0115F5C78EBF662FDB43E237C3AD4344D5BE0B595C6A7ABDBB5
            A5FF00887FB0A21ABDE44CBB5C3CDD3730C82C1431C9E73CD727FB3EFEC01FB5
            E7ECEF65A9E9F61F0766D7743D5DE39EE74AD6B4E17766D3C61847384246D914
            3B00C0F4620E680B9F3CFC66FD88B53F82BFB67E97F086F75AB0BF3AD5F6990D
            86B36AA4DBDD5ADF889A0B9553CE0A4AA483CE4115B1FB4EFEC5BE1AF827F0B3
            59D7BC39E3E8BC5D77E12F172F83B5EB75B07B7482E5E2B99124899BEFC67EC9
            32E7D40AF5DF187FC13ABF6CCF1FFC78B6F891ACFC3FF126A1E2BB3BCB6BD82E
            65B75D9135B943022A0C0088111428E00502AA788FFE0995FB5EF8AFC31E25D2
            2F3E196BAF65E2CD7E3F12EA2A2D80325EC6B72AAE0E7818BB9B8FF687A50173
            C987EC53609FB1741F14C7896E2FAFEEADA5BAFECEB0B06B886C365E7D9BC9B9
            941FDCC8CB99464636E39C9AE06CFE014975FB2F7FC2CAFED18D61FF0084B53C
            2DF62D8776E6B46B9F37774C6176E2BEC6F0BFEC59FB64F82FF677D57E1BE97F
            08A6B2D2B5BB46D3AFAFA2D382DF5D5A34C26303C81B0CBE60CE4A9603807150
            7ECF5FB0C7ED81FB3A786754D0EC3E0D7F6F687AA5D45A8369FADE96B796F05D
            C68C91DC229231205761E841E450173C87F657F81D07C22FF82B0699F0F35192
            D75C83C31E2ABED1A691E1CC577E409E3DDB1BB1299C1A7FFC1287F67FF00FED
            0BF177C79A778FAE04769A4F81B58D52CE336ED2859A1B676F3FE5EF081BC0FE
            2C62BB8F0DFF00C1367F6C4F0BFC796F89507C39F10CBE2F7D467D564BC9ADC3
            F9971317323B0E8725D8FE3517C13FF8265FED7BFB3EF88B54D53C33F0CB5CB6
            BCD6347BCD0EE5A4B61206B5BA88C532819E0952707B50173C17F657FD982C3E
            3CDB78DB5DD7FC4B1F853C17F0F74D8F52D5F5336CD7121F36E12DE08A38D792
            EF238C76001AABFB537ECC6FFB3B78EF42B6B3D5E3F107867C61A55B6BBE1FD5
            D21308BFB398950C633CA3AC8922329EE86BE93FD9EFFE09CBFB5E7ECDFAEEA3
            73A37C27D4AFB4FD6EDC59EABA56A3642E2C754843875496324676BAAB020820
            81CD54F8DFFF0004D0FDAF3E3FF8E63D775EF861ADF99670C76961696D6C22B4
            D36DE3FF0057043183848D7278F5249E4D0173C37F6EAFD97342FD8F7E35DD78
            0F4EF177FC257ADE872B41AC325935BC36B2611D150B7DFF0095F9F42A456E7C
            6FFD99BC4BF127FE0A2927C2DB49B48B9F12EBBAB58E9714B696C2D2CC3CD042
            4308C7DD5556C9F5DA4F7AF4AF8D7FF04B6FDADFF681F8AFADF8D3C4BF0C75EB
            AD7BC43726EEF658EDC22BC840190B9E3802B47C45FF0004E5FDB2FC47F1E97E
            2637C3EF12DA78CA3BB82FA2BFB58044D0CD0AA2C6EA3B10117F2A02E79EFED2
            1FB00786FE157ECC7AAFC50F08FC4683C63A568DE345F045D5BFF67496B225D8
            82595E41BB831E231B4F70DED5F2ED7E8D7C7AFD94BF6D3FDA07E17CFE0BD47E
            10FF0064F862EB588FC413D8E95A52DAA4BA82C4F135C1209259C3B6EED9C631
            8AF0EFF8728FED35FF0044A7C45FF7EA80B9F2B5741F09BFE4A87877FEC256FF
            00FA316BE89FF8728FED35FF0044A7C45FF7EAB67E1E7FC1193F695D17C7BA2D
            DCFF000AFC42905B5F432C8C63002A87049FCA81DCFE81FF00E09EFF00F260FF
            0003FF00EC40D07FF4DD6F5EBF5E67FB16783753F875FB1C7C26F0FEB569269F
            ACE85E0CD1F4EBFB593EFDB5C43630C72467DD5D483F4AF4CA0CC28A28A002BC
            77F68DFF00827F7C1BFDAD1CC9F103C03A3EBD70461AE434B6772C3DE681D243
            F8B57B151401F1EE9BFF00040EFD92F49BE8EE60F84B189616DCBBFC49AC48B9
            F756BB20FE22BE9EF85DF07FC2FF00053C2D0689E12D074BF0FE976CA1120B28
            163040EEC472C7DD893EF5D25140051451400514514005145140051451400514
            5140051451400514514005145140051451400514514005145140051451400514
            5140051451400514514005145140051451400514514005145140051451401FFF
            D9}
          HightQuality = False
        end
        object Memo1: TfrxMemoView
          Left = 302.362400000000000000
          Top = 11.338590000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'SISTEMA DE GEST'#195#402'O FINANCEIRA')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 302.362400000000000000
          Top = 52.913420000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'EXTRATO DE CAIXA - CONTA:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 589.606680000000000000
          Top = 11.338590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#161'gina:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 672.756340000000000000
          Top = 11.338590000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[Page]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 94.488250000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13296895
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'ITEM')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 34.015770000000000000
          Top = 94.488250000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13296895
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'D/C')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 317.480520000000000000
          Top = 94.488250000000000000
          Width = 294.803340000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13296895
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'HIST'#195#8220'RICO')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 616.063390000000000000
          Top = 94.488250000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13296895
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'VALOR')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 464.882190000000000000
          Top = 52.913420000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[sConta]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 302.362400000000000000
          Top = 30.236240000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'DESPESA: [sUnidade]  - [sTipo]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 302.362400000000000000
          Top = 75.590600000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'DATA: [dDataCaixa]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 68.031540000000000000
          Top = 94.488250000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13296895
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'FORNECEDOR')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 132.283550000000000000
        Top = 661.417750000000000000
        Width = 718.110700000000000000
        object Memo41: TfrxMemoView
          Left = 75.590600000000000000
          Top = 22.677180000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[FrDtStEmpresa."emp_custos"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 75.590600000000000000
          Top = 18.897650000000000000
          Width = 170.078850000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo42: TfrxMemoView
          Left = 75.590600000000000000
          Top = 41.574830000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'COORDENADOR')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 294.803340000000000000
          Top = 22.677180000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[FrDtStEmpresa."emp_financeiro"]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 294.803340000000000000
          Top = 18.897650000000000000
          Width = 170.078850000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo45: TfrxMemoView
          Left = 294.803340000000000000
          Top = 41.574830000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'FINANCEIRO')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 491.338900000000000000
          Top = 22.677180000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[FrDtStEmpresa."emp_diretor"]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 491.338900000000000000
          Top = 18.897650000000000000
          Width = 170.078850000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo47: TfrxMemoView
          Left = 491.338900000000000000
          Top = 41.574830000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'DIRETOR')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Top = 109.606370000000000000
          Width = 721.890230000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Impressor por: [sUsuario] - Em: [sData] / [sHora] - iMoney')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 192.756030000000000000
        Width = 718.110700000000000000
        Condition = '<FrDtStRCaixaItem."cax_desc">'
        object Memo8: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          Memo.UTF8 = (
            '[FrDtStRCaixaItem."cax_desc"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 41.574830000000000000
        Top = 283.464750000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Sans Typewriter'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<FrDtStRCaixaItem."cax_valor">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 464.882190000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'TOTAL GRUPO:')
          ParentFont = False
        end
      end
    end
  end
  object FrDtStRCaixaItem: TfrxDBDataset
    UserName = 'FrDtStRCaixaItem'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cax_desc=cax_desc'
      'cax_item=cax_item'
      'cax_dce=cax_dce'
      'cax_historico=cax_historico'
      'cax_credito=cax_credito'
      'cax_debito=cax_debito'
      'cax_estorno=cax_estorno'
      'cax_valor=cax_valor'
      'cax_transf=cax_transf'
      'cax_favorecido=cax_favorecido')
    DataSet = CltDtStMaster
    Left = 264
    Top = 88
  end
  object QryContaDesc: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'ccr_codigo'
        ParamType = ptInput
        Value = '0'
      end>
    SQL.Strings = (
      'select'
      '  a.`ccr_codigo`,'
      
        '  CONCAT(b.`bco_sigla`, " - ", a.`ccr_agencia`, "-", a.`ccr_cont' +
        'a`, "-", a.`ccr_conta_dv`) as ccr_nome'
      'from'
      '  `mny_conta_corrente` a'
      '  join `sys_banco` b on( b.`bco_codigo`=a.`ban_codigo`)'
      'where'
      '  a.`ccr_codigo` = :ccr_codigo'
      'order by 2')
    SQLConnection = FrmLogin.conWebMaster
    Left = 296
    Top = 56
    object QryContaDescccr_codigo: TSmallintField
      FieldName = 'ccr_codigo'
      Required = True
    end
    object QryContaDescccr_nome: TStringField
      FieldName = 'ccr_nome'
      Size = 38
    end
  end
  object DtStPrvdrMaster: TDataSetProvider
    DataSet = QryRCaixaItem
    Left = 264
    Top = 128
  end
  object CltDtStMaster: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DtStPrvdrMaster'
    Left = 264
    Top = 160
    object CltDtStMastercax_desc: TStringField
      FieldName = 'cax_desc'
      Required = True
      Size = 17
    end
    object CltDtStMastercax_item: TBCDField
      FieldName = 'cax_item'
      Required = True
      Precision = 6
      Size = 0
    end
    object CltDtStMastercax_dce: TStringField
      FieldName = 'cax_dce'
      Size = 1
    end
    object CltDtStMastercax_historico: TStringField
      FieldName = 'cax_historico'
      Size = 203
    end
    object CltDtStMastercax_credito: TFMTBCDField
      FieldName = 'cax_credito'
      Precision = 17
      Size = 2
    end
    object CltDtStMastercax_debito: TFMTBCDField
      FieldName = 'cax_debito'
      Precision = 17
      Size = 2
    end
    object CltDtStMastercax_estorno: TFMTBCDField
      FieldName = 'cax_estorno'
      Precision = 17
      Size = 2
    end
    object CltDtStMastercax_valor: TFMTBCDField
      FieldName = 'cax_valor'
      Precision = 17
      Size = 2
    end
    object CltDtStMastercax_transf: TFMTBCDField
      FieldName = 'cax_transf'
      Precision = 17
      Size = 2
    end
    object CltDtStMastercax_favorecido: TStringField
      FieldName = 'cax_favorecido'
      Size = 100
    end
  end
  object QryResumo: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'cax_num'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'cax_num'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cax_num'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cax_num'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cax_num'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '  '#39'S'#39' as cax_tipo,'
      '  '#39'TOTAL DE SALDOS'#39' as cax_desc,'
      '  sum(a.`cax_saldo`)'
      'from'
      '  `mny_caixa_conta` a'
      'where'
      '  a.`cax_num` = :cax_num'
      ''
      'union'
      ''
      'select'
      '  '#39'T'#39' as cax_tipo,'
      '  '#39'TOTAL DE TRANSF'#39' as cax_desc,'
      '  sum(b.`cax_valor`)'
      'from'
      '  `mny_caixa_item` b'
      'where'
      '  b.`cax_dce` = '#39'T'#39
      '  and b.`cax_num` = :cax_num'
      '  '
      'union'
      ''
      'select'
      '  '#39'D'#39' as cax_tipo,'
      '  '#39'TOTAL DE D'#201'BITOS'#39' as cax_desc,'
      '  sum(b.`cax_valor`)'
      'from'
      '  `mny_caixa_item` b'
      'where'
      '  b.`cax_dce` = '#39'D'#39
      '  and b.`cax_num` = :cax_num'
      'union'
      ''
      'select'
      '  '#39'C'#39' as cax_tipo,'
      '  '#39'TOTAL DE CR'#201'DITOS'#39' as cax_desc,'
      '  sum(b.`cax_valor`)'
      'from'
      '  `mny_caixa_item` b'
      'where'
      '  b.`cax_dce` = '#39'C'#39
      '  and b.`cax_num` = :cax_num'
      'union'
      ''
      'select'
      '  '#39'E'#39' as cax_tipo,'
      '  '#39'TOTAL DE ESTORNOS'#39' as cax_desc,'
      '  sum(b.`cax_valor`)'
      'from'
      '  `mny_caixa_item` b'
      'where'
      '  b.`cax_dce` = '#39'E'#39
      '  and b.`cax_num` = :cax_num')
    SQLConnection = FrmLogin.conWebMaster
    Left = 264
    Top = 192
    object QryResumocax_tipo: TStringField
      FieldName = 'cax_tipo'
      Required = True
      Size = 1
    end
    object QryResumocax_desc: TStringField
      FieldName = 'cax_desc'
      Required = True
      Size = 17
    end
    object QryResumosumacax_saldo: TFMTBCDField
      FieldName = 'sum(a.`cax_saldo`)'
      Precision = 32
      Size = 2
    end
  end
  object QrySaldo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = FrmLogin.conWebMaster
    Left = 368
    Top = 192
  end
end
