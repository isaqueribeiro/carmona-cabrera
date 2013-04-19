object FrmContaPR: TFrmContaPR
  Left = 71
  Top = 84
  Width = 971
  Height = 646
  Caption = 'Cadastro de Contas a Pagar e Receber'
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
    Left = 9
    Top = 83
    Width = 936
    Height = 518
    ActivePage = TbShtPrincipal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ClientRectBottom = 514
    ClientRectLeft = 4
    ClientRectRight = 932
    ClientRectTop = 24
    object TbShtPrincipal: TcxTabSheet
      Caption = 'Principal'
      ImageIndex = 79
      object GrpMain: TcxGroupBox
        Left = 8
        Top = 8
        Caption = 'Dados Gerais'
        TabOrder = 0
        Height = 201
        Width = 449
        object cxLabel1: TcxLabel
          Left = 8
          Top = 16
          Caption = 'C'#243'digo:'
          Transparent = True
        end
        object DbEdtCodigo: TcxDBTextEdit
          Left = 80
          Top = 16
          DataBinding.DataField = 'mov_codigo'
          DataBinding.DataSource = DtSMaster
          Properties.ReadOnly = True
          Style.Color = 8454143
          TabOrder = 1
          Width = 121
        end
        object cxLabel3: TcxLabel
          Left = 208
          Top = 16
          Caption = 'Tipo de Aceite:'
          Transparent = True
        end
        object DbLkpCmbBxAceite: TcxDBLookupComboBox
          Left = 288
          Top = 16
          DataBinding.DataField = 'tip_ace_codigo'
          DataBinding.DataSource = DtSMaster
          Properties.KeyFieldNames = 'tip_codigo'
          Properties.ListColumns = <
            item
              FieldName = 'tip_nome'
            end>
          Properties.ListOptions.CaseInsensitive = True
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DtSTipoAceite
          Style.Color = 8454143
          TabOrder = 2
          Width = 145
        end
        object cxLabel4: TcxLabel
          Left = 8
          Top = 40
          Caption = 'Pessoa:'
          Transparent = True
        end
        object LkpCmbBxPessoa: TcxDBLookupComboBox
          Left = 80
          Top = 40
          DataBinding.DataField = 'pes_codigo'
          DataBinding.DataSource = DtSMaster
          Properties.KeyFieldNames = 'pes_codigo'
          Properties.ListColumns = <
            item
              FieldName = 'pes_nome_fantasia'
            end>
          Properties.ListOptions.CaseInsensitive = True
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DtSPessoa
          Style.Color = 8454143
          TabOrder = 3
          Width = 329
        end
        object btnPessoa: TcxButton
          Left = 409
          Top = 40
          Width = 24
          Height = 20
          Caption = '...'
          TabOrder = 4
          OnClick = btnPessoaClick
        end
        object cxLabel5: TcxLabel
          Left = 8
          Top = 64
          Caption = 'Emiss'#227'o:'
          Transparent = True
        end
        object DbEdtEmissao: TcxDBDateEdit
          Left = 80
          Top = 64
          DataBinding.DataField = 'mov_data_emissao'
          DataBinding.DataSource = DtSMaster
          TabOrder = 5
          Width = 121
        end
        object cxLabel6: TcxLabel
          Left = 208
          Top = 64
          Caption = 'Contrato:'
          Transparent = True
        end
        object DbEdtContrato: TcxDBTextEdit
          Left = 264
          Top = 64
          DataBinding.DataField = 'mov_contrato'
          DataBinding.DataSource = DtSMaster
          TabOrder = 6
          Width = 169
        end
        object cxLabel2: TcxLabel
          Left = 8
          Top = 88
          Caption = 'Hist'#243'rico:'
          Transparent = True
        end
        object DbEdtObs: TcxDBTextEdit
          Left = 80
          Top = 88
          DataBinding.DataField = 'mov_obs'
          DataBinding.DataSource = DtSMaster
          TabOrder = 7
          Width = 353
        end
        object cxLabel7: TcxLabel
          Left = 8
          Top = 112
          Caption = 'Comp:'
          Transparent = True
        end
        object DbLkpCmbBxComp: TcxDBLookupComboBox
          Left = 80
          Top = 112
          DataBinding.DataField = 'com_codigo'
          DataBinding.DataSource = DtSMaster
          Properties.KeyFieldNames = 'com_codigo'
          Properties.ListColumns = <
            item
              FieldName = 'com_nome'
            end>
          Properties.ListOptions.CaseInsensitive = True
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DtSComp
          Style.Color = 8454143
          TabOrder = 8
          Width = 145
        end
        object cxLabel14: TcxLabel
          Left = 256
          Top = 112
          Caption = 'Situa'#231#227'o:'
          Transparent = True
        end
        object LkpCmbBxSituacao: TcxDBLookupComboBox
          Left = 304
          Top = 112
          DataBinding.DataField = 'sit_codigo'
          DataBinding.DataSource = DtSMaster
          Properties.KeyFieldNames = 'sit_codigo'
          Properties.ListColumns = <
            item
              FieldName = 'sit_nome'
            end>
          Properties.ListOptions.CaseInsensitive = True
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DtSSituacao
          Properties.ReadOnly = True
          Style.Color = 8454143
          TabOrder = 10
          Width = 129
        end
        object btnComp: TcxButton
          Left = 225
          Top = 112
          Width = 24
          Height = 20
          Caption = '...'
          TabOrder = 9
          OnClick = btnCompClick
        end
        object cxLabel15: TcxLabel
          Left = 8
          Top = 136
          Caption = 'Documento:'
          Transparent = True
        end
        object DbEdtDocumento: TcxDBTextEdit
          Left = 80
          Top = 136
          DataBinding.DataField = 'mov_documento'
          DataBinding.DataSource = DtSMaster
          TabOrder = 19
          Width = 169
        end
        object cxLabel16: TcxLabel
          Left = 256
          Top = 136
          Caption = 'Previs'#227'o:'
          Transparent = True
        end
        object DbImgCmbBxPrevisao: TcxDBImageComboBox
          Left = 304
          Top = 136
          DataBinding.DataField = 'mov_previsao'
          DataBinding.DataSource = DtSMaster
          Properties.Items = <
            item
              Description = 'N'#227'o'
              ImageIndex = 0
              Value = 0
            end
            item
              Description = 'Sim'
              Value = 1
            end>
          TabOrder = 21
          Width = 129
        end
        object cxLabel17: TcxLabel
          Left = 8
          Top = 160
          Caption = 'Tipo:'
          Transparent = True
        end
        object cxDBImageComboBox1: TcxDBImageComboBox
          Left = 80
          Top = 160
          DataBinding.DataField = 'mov_tipo'
          DataBinding.DataSource = DtSMaster
          Properties.Items = <
            item
              Description = 'Pagar'
              ImageIndex = 0
              Value = 0
            end
            item
              Description = 'Receber'
              Value = 1
            end>
          TabOrder = 22
          Width = 169
        end
        object cxLabel18: TcxLabel
          Left = 256
          Top = 160
          Caption = 'Parcelas:'
          Transparent = True
        end
        object EdtParcelas: TcxDBTextEdit
          Left = 304
          Top = 160
          DataBinding.DataField = 'mov_parcelas'
          DataBinding.DataSource = DtSMaster
          TabOrder = 23
          Width = 129
        end
      end
      object GrpApro: TcxGroupBox
        Left = 464
        Top = 8
        Caption = 'Apropria'#231#227'o'
        TabOrder = 1
        Height = 201
        Width = 449
        object btnTCusto: TcxButton
          Left = 409
          Top = 24
          Width = 24
          Height = 20
          Caption = '...'
          TabOrder = 1
          OnClick = btnTCustoClick
        end
        object DbLkpCmbBxTCusto: TcxDBLookupComboBox
          Left = 80
          Top = 24
          DataBinding.DataField = 'cus_codigo'
          DataBinding.DataSource = DtSMaster
          Properties.KeyFieldNames = 'cus_codigo'
          Properties.ListColumns = <
            item
              FieldName = 'cus_nome'
            end>
          Properties.ListOptions.CaseInsensitive = True
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DtSTCusto
          Style.Color = 8454143
          TabOrder = 0
          Width = 329
        end
        object cxLabel10: TcxLabel
          Left = 8
          Top = 24
          Caption = 'Tipo Custo:'
          Transparent = True
        end
        object cxLabel12: TcxLabel
          Left = 8
          Top = 48
          Caption = 'C. Neg'#243'cio:'
          Transparent = True
        end
        object cxLabel11: TcxLabel
          Left = 8
          Top = 72
          Caption = 'Und Neg'#243'cio:'
          Transparent = True
        end
        object cxLabel8: TcxLabel
          Left = 8
          Top = 96
          Caption = 'C.Custo:'
          Transparent = True
        end
        object cxLabel13: TcxLabel
          Left = 8
          Top = 144
          Caption = 'Setor:'
          Transparent = True
        end
        object cxLabel9: TcxLabel
          Left = 8
          Top = 120
          Caption = 'Conta:'
          Transparent = True
        end
        object DbLkpCmbBxConta: TcxDBLookupComboBox
          Left = 80
          Top = 120
          DataBinding.DataField = 'con_codigo'
          DataBinding.DataSource = DtSMaster
          Properties.KeyFieldNames = 'con_codigo'
          Properties.ListColumns = <
            item
              FieldName = 'con_nome'
            end>
          Properties.ListOptions.CaseInsensitive = True
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DtSConta
          Style.Color = 8454143
          TabOrder = 8
          Width = 329
        end
        object DbLkpCmbBxSetor: TcxDBLookupComboBox
          Left = 80
          Top = 144
          DataBinding.DataField = 'set_codigo'
          DataBinding.DataSource = DtSMaster
          Properties.KeyFieldNames = 'set_codigo'
          Properties.ListColumns = <
            item
              FieldName = 'set_nome'
            end>
          Properties.ListOptions.CaseInsensitive = True
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DtSSetor
          Style.Color = 8454143
          TabOrder = 10
          Width = 329
        end
        object DbLkpCmbBxCCusto: TcxDBLookupComboBox
          Left = 80
          Top = 96
          DataBinding.DataField = 'cen_codigo'
          DataBinding.DataSource = DtSMaster
          Properties.KeyFieldNames = 'cen_codigo'
          Properties.ListColumns = <
            item
              FieldName = 'cen_nome'
            end>
          Properties.ListOptions.CaseInsensitive = True
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DtSCentro
          Style.Color = 8454143
          TabOrder = 6
          Width = 329
        end
        object DbLkpCmbBxUNegocio: TcxDBLookupComboBox
          Left = 80
          Top = 72
          DataBinding.DataField = 'uni_codigo'
          DataBinding.DataSource = DtSMaster
          Properties.KeyFieldNames = 'uni_codigo'
          Properties.ListColumns = <
            item
              FieldName = 'uni_nome'
            end>
          Properties.ListOptions.CaseInsensitive = True
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DtSUnidade
          Style.Color = 8454143
          TabOrder = 4
          Width = 329
        end
        object DbLkpCmbBxCNegocio: TcxDBLookupComboBox
          Left = 80
          Top = 48
          DataBinding.DataField = 'neg_codigo'
          DataBinding.DataSource = DtSMaster
          Properties.KeyFieldNames = 'neg_codigo'
          Properties.ListColumns = <
            item
              FieldName = 'neg_nome'
            end>
          Properties.ListOptions.CaseInsensitive = True
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DtSCNegocio
          Style.Color = 8454143
          TabOrder = 2
          Width = 329
        end
        object btnCNegocio: TcxButton
          Left = 409
          Top = 48
          Width = 24
          Height = 20
          Caption = '...'
          TabOrder = 3
          OnClick = btnCNegocioClick
        end
        object btnUnidade: TcxButton
          Left = 409
          Top = 72
          Width = 24
          Height = 20
          Caption = '...'
          TabOrder = 5
          OnClick = btnUnidadeClick
        end
        object btnCentro: TcxButton
          Left = 409
          Top = 96
          Width = 24
          Height = 20
          Caption = '...'
          TabOrder = 7
          OnClick = btnCentroClick
        end
        object btnSetor: TcxButton
          Left = 409
          Top = 144
          Width = 24
          Height = 20
          Caption = '...'
          TabOrder = 11
          OnClick = btnSetorClick
        end
        object btnConta: TcxButton
          Left = 409
          Top = 120
          Width = 24
          Height = 20
          Caption = '...'
          TabOrder = 9
          OnClick = btnContaClick
        end
      end
      object DbGrd: TcxGrid
        Left = 8
        Top = 264
        Width = 905
        Height = 217
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object DbGridDBTblVw: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = DtSItem
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
          object DbGridDBTblVwmov_item: TcxGridDBColumn
            Caption = 'Seq'
            DataBinding.FieldName = 'mov_item'
            Width = 36
          end
          object DbGridDBTblVwmov_parcela: TcxGridDBColumn
            Caption = 'Parcela'
            DataBinding.FieldName = 'mov_parcela'
            Width = 47
          end
          object DbGridDBTblVwmov_data_vencto: TcxGridDBColumn
            Caption = 'Vencimento'
            DataBinding.FieldName = 'mov_data_vencto'
            Width = 84
          end
          object DbGridDBTblVwmov_data_prev: TcxGridDBColumn
            Caption = 'Previs'#227'o'
            DataBinding.FieldName = 'mov_data_prev'
            Width = 74
          end
          object DbGridDBTblVwfpg_codigo: TcxGridDBColumn
            Caption = 'Forma Pagto'
            DataBinding.FieldName = 'fpg_codigo'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'fpg_codigo'
            Properties.ListColumns = <
              item
                FieldName = 'fpg_nome'
              end>
            Properties.ListOptions.CaseInsensitive = True
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DtSForma
            Width = 106
          end
          object DbGridDBTblVwtip_doc_codigo: TcxGridDBColumn
            Caption = 'Tipo Documento'
            DataBinding.FieldName = 'tip_doc_codigo'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'tip_codigo'
            Properties.ListColumns = <
              item
                FieldName = 'tip_nome'
              end>
            Properties.ListOptions.CaseInsensitive = True
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DtSTipoDoc
            Width = 140
          end
          object DbGridDBTblVwmov_valor: TcxGridDBColumn
            Caption = 'Valor'
            DataBinding.FieldName = 'mov_valor'
            PropertiesClassName = 'TcxTextEditProperties'
            Width = 93
          end
          object DbGridDBTblVwmov_juros: TcxGridDBColumn
            Caption = 'Juros'
            DataBinding.FieldName = 'mov_juros'
            Width = 77
          end
          object DbGridDBTblVwmov_desconto: TcxGridDBColumn
            Caption = 'Desconto'
            DataBinding.FieldName = 'mov_desconto'
            Width = 60
          end
          object DbGridDBTblVwmov_retencao: TcxGridDBColumn
            Caption = 'Reten'#231#227'o'
            DataBinding.FieldName = 'mov_retencao'
            Width = 95
          end
          object DbGridDBTblVwmov_valor_pagar: TcxGridDBColumn
            Caption = 'Total'
            DataBinding.FieldName = 'mov_valor_pagar'
            Width = 91
          end
        end
        object DbGridLvl: TcxGridLevel
          GridView = DbGridDBTblVw
        end
      end
      object btnSomar: TcxButton
        Left = 816
        Top = 239
        Width = 99
        Height = 25
        Caption = '&Somar'
        TabOrder = 3
        OnClick = btnSomarClick
      end
      object GrpBxParcelas: TcxGroupBox
        Left = 8
        Top = 208
        Caption = 'Parcelar Autom'#225'ticas'
        TabOrder = 4
        Height = 49
        Width = 449
        object btnParcelas: TcxButton
          Left = 296
          Top = 18
          Width = 97
          Height = 25
          Caption = '&Gerar Parcelas'
          TabOrder = 0
          OnClick = btnParcelasClick
        end
        object cxLabel19: TcxLabel
          Left = 8
          Top = 24
          Caption = '1o Vencto:'
          Transparent = True
        end
        object EdtData: TcxDateEdit
          Left = 64
          Top = 20
          TabOrder = 2
          Width = 89
        end
        object EdtValor: TcxTextEdit
          Left = 192
          Top = 20
          TabOrder = 3
          Width = 97
        end
        object LblValor: TcxLabel
          Left = 160
          Top = 24
          Caption = 'Valor:'
          Transparent = True
        end
      end
    end
  end
  object PnlMain: TPanel
    Left = 0
    Top = 0
    Width = 955
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
      TabOrder = 1
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
      TabOrder = 2
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
    object btnExcluir: TcxButton
      Left = 296
      Top = 8
      Width = 97
      Height = 57
      Hint = 'Excluir'
      Caption = '&Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnExcluirClick
      Glyph.Data = {
        7E080000424D7E080000000000004200000028000000220000001F0000000100
        1000030000003C080000120B0000120B00000000000000000000007C0000E003
        00001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FD55AD55AB45A
        93567252524E314A10460F42EE3DCD39AC358C358B316A2D6A2D4A2D49294929
        AC392929292929292929292929292929FF7FFF7FFF7FFF7FFF7FFF7F386BD55A
        8A356931482D282907250621E620C51CC418A418841483148310631062106210
        620C620CA418A418A441C549E5490552465A2929FF7FFF7FFF7FFF7FFF7FFF7F
        386B717B717B707B707B707B707B707B70776F774F774F774F774F774F774E77
        4E774E774E774E772729E649A418A545E54D255226562929FF7FFF7FFF7FFF7F
        FF7FFF7F586B717B717B717B707B707B707B7077707B6F776F774F774F774F77
        4F774F774E774E774E774E77CB41A962C645A418A545054E05524929FF7FFF7F
        FF7FFF7FFF7FFF7F586F717B717B717B707B707B707B707B707B70776F776F77
        4F774F774F774F774F774E774E774E770C4ACC6AA962C645A418A545E5494929
        FF7FFF7FFF7FFF7FFF7FFF7F586F917B717B717B717B707B707B707B707B707B
        70776F776F774F774F774F774F774E774E774E770D4A3073CC6AA962A641A418
        A4454A2DFF7FFF7FFF7FFF7FFF7FFF7F596F917B917B717B717B717B707B707B
        707B707B707770776F774F774F774F774F774E774E774E770D4A73773073CC6A
        A962A641A4186A2DFF7FFF7FFF7FFF7FFF7FFF7F596F917B917B717B717B717B
        707B707B707B707B707B707B70776F774F774F774F774F774F774E770D4A0D4A
        0D4ACB4189352729E5208B31FF7FFF7FFF7FFF7FFF7FFF7F596F927B917B717B
        717B717B717B707B707B707B707B707B70776F774F774F774F774F774F774F77
        4E774E774E774E774E774E7783106B31FF7FFF7FFF7FFF7FFF7FFF7F596F927B
        917B917B717B717B717B717B707B707B707B707B707B70776F774F774F774F77
        4F774F774E774E774E774E774E774E7783148B31FF7FFF7FFF7FBD7B0F765172
        716E927B927B917B917B717B717B717B717B707B707B707B707B707770776F77
        4F774F774F774F774F774E774E774E774E774E778314AC35FF7FFF7FFF7F106E
        E570E46CC3688771927B927B917B917B717B717B717B717B707B707B707B707B
        70776F774F774F774F774F774F774F774E774E774E774E77A414AD39FF7FFF7F
        FF7F0F6E27750671E46CC36C507B927B917B917B917B717B717B717B4A7A6471
        707B707B707770776F774F774F774F774F774F774F774E774E774E77A418CD3D
        FF7FFF7FFF7F9C7BED7968794875E46CA871927B927B927B917B717B717B087E
        8170CD76707B707B707B707B70776F774F774F774F774F774F774E774E774E77
        C518EE3DFF7FFF7FFF7FFF7F187B8A79477DE37804758D7E927B927B917B917B
        6A7A816CE87D717B707B707B707B707B707770776F776F774F774F774F774F77
        4E774E77C51C0F42FF7FFF7FFF7FFF7FFF7FD57AE4782775C3704679517B927B
        927BC77D816C887D717B717B717B707B707B707B707770776F776F774F774F77
        4F774F774F774E77E6201046FF7FFF7FFF7FFF7FFF7FFF7FF4764679A370A270
        E97D927B097E816C4579507B717B717B717B707B707B707B707B707770776F77
        4F774F774F774F774F774E770621314AFF7FFF7FFF7FFF7FFF7FFF7F9A73AE7E
        4679A26CA270257D826C25752F7B917B717B717B717B717B717B707B707B707B
        707770776F776F774F774F774F774F770725514EFF7FFF7FFF7FFF7FFF7FFF7F
        9B77927B0F7F4679A270A2704679307B927B917B917B717B717B717B717B707B
        707B707B707B70776F776F774F774F774F774F7728297252FF7FFF7FFF7FFF7F
        FF7FFF7F9B77927B307FCA7D6979CC7DCA7D517B927B917B917B917B717B717B
        717B717B707B707B707B707B70776F776F774F774F774F77482D9356FF7FFF7F
        FF7FFF7FFF7FFF7F9B77EE7ECA7DCA7DEC7D4D7ECB7DCA7D307B927B917B917B
        917B717B717B717B707B707B707B707B7077707B6F774F774F774F779356D55A
        FF7FFF7FFF7FFF7FFF7FFF7F1577887DCA7DF57E9A779A777977B37E717E4E66
        7A737A7379737973796F796F796F596F596F596F586F586F586B586B386B386B
        386BFF7FFF7FFF7FFF7FFF7FFF7F167BF67EEB7DD47EFF7FFF7FFF7FFF7FFF7F
        B27E4F7E9C7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F507A387F0C7EF57EDE7FFF7FFF7FFF7F
        FF7FFF7FFF7FDD7F717E7B7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F167F597F0C7EF67EDE7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FF57ED47EF67EDE7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FBD7BFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7F}
      LookAndFeel.Kind = lfOffice11
    end
    object btnDocumento: TcxButton
      Left = 392
      Top = 8
      Width = 105
      Height = 57
      Hint = 'Excluir'
      Caption = '&Documentos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnDocumentoClick
      Glyph.Data = {
        5E060000424D5E06000000000000360400002800000015000000170000000100
        0800000000002802000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F6F6F6F6F6F6
        F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F6F6F6F6F6F6F6F6F6F6F6F6F6
        F6F6F6F6F6F6F6000000F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F600
        0000F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F608A4A4A4
        F5F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F607FFFFFFA4F6F6F6F6F6F6F6
        F6F6F6F6F6F6F6000000F6F607FFDAFFA4F69B9B9B9BF69B9B9B9BF6F6F6F600
        0000F6F607FFFFFFA4F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F608A4A4A4
        F5F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F607FFFFFFA4F6F6F6F6F6F6F6
        F6F6F6F6F6F6F6000000F6F607FF0FFFA4F69B9B9B9BF69B9B9B9BF6F6F6F600
        0000F6F607FFFFFFA4F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F608A4A4A4
        F5F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F607FFFFFFA4F6F6F6F6F6F6F6
        F6F6F6F6F6F6F6000000F6F607FF63FFA4F69B9B9B9BF69B9B9B9BF6F6F6F600
        0000F6F607FFFFFFA4F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F608070707
        08F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F6F6F6F6F6F6F6F6F6F6F6F6F6
        F6F6F6F6F6F6F6000000F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F600
        0000F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F6F6F6F6F6
        F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F6F6F6F6F6F6F6F6F6F6F6F6F6
        F6F6F6F6F6F6F6000000F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F600
        0000}
      LookAndFeel.Kind = lfOffice11
    end
  end
  object QryTipoAceite: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '  a.`tip_codigo`,'
      '  a.`tip_nome`'
      'from'
      '  `mny_tipo_aceite` a'
      'order by 2')
    SQLConnection = FrmLogin.conWebMaster
    Left = 369
    Top = 128
  end
  object DtSTipoAceite: TDataSource
    DataSet = QryTipoAceite
    Left = 401
    Top = 128
  end
  object QryMaster: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'mov_codigo'
        ParamType = ptInput
        Value = '0'
      end>
    SQL.Strings = (
      'select'
      '  a.`mov_codigo`,'
      '  a.`cen_codigo`,'
      '  a.`com_codigo`,'
      '  a.`con_codigo`,'
      '  a.`cus_codigo`,'
      '  a.`neg_codigo`,'
      '  a.`pes_codigo`,'
      '  a.`set_codigo`,'
      '  a.`sit_codigo`,'
      '  a.`uni_codigo`,'
      '  a.`mov_data_emissao`,'
      '  a.`mov_data_inclusao`,'
      '  a.`mov_obs`,'
      '  a.`mov_inc`,'
      '  a.`mov_alt`,'
      '  a.`mov_contrato`,'
      '  a.`tip_ace_codigo`,'
      '  a.`mov_documento`,'
      '  a.`mov_previsao`,'
      '  a.mov_tipo,'
      '  a.mov_parcelas'
      'from'
      '  `mny_movimento` a'
      'where'
      '  a.`mov_codigo` = :mov_codigo')
    SQLConnection = FrmLogin.conWebMaster
    Left = 688
    Top = 24
    object QryMastercen_codigo: TSmallintField
      FieldName = 'cen_codigo'
    end
    object QryMastercom_codigo: TSmallintField
      FieldName = 'com_codigo'
    end
    object QryMastercon_codigo: TSmallintField
      FieldName = 'con_codigo'
    end
    object QryMastercus_codigo: TSmallintField
      FieldName = 'cus_codigo'
    end
    object QryMasterneg_codigo: TSmallintField
      FieldName = 'neg_codigo'
    end
    object QryMasterpes_codigo: TIntegerField
      FieldName = 'pes_codigo'
    end
    object QryMasterset_codigo: TSmallintField
      FieldName = 'set_codigo'
    end
    object QryMastersit_codigo: TSmallintField
      FieldName = 'sit_codigo'
    end
    object QryMasteruni_codigo: TSmallintField
      FieldName = 'uni_codigo'
    end
    object QryMastermov_data_emissao: TDateField
      FieldName = 'mov_data_emissao'
    end
    object QryMastermov_data_inclusao: TDateField
      FieldName = 'mov_data_inclusao'
    end
    object QryMastermov_obs: TStringField
      FieldName = 'mov_obs'
      Size = 200
    end
    object QryMastermov_inc: TStringField
      FieldName = 'mov_inc'
      Size = 60
    end
    object QryMastermov_alt: TStringField
      FieldName = 'mov_alt'
      Size = 60
    end
    object QryMastermov_contrato: TStringField
      FieldName = 'mov_contrato'
    end
    object QryMastertip_ace_codigo: TSmallintField
      FieldName = 'tip_ace_codigo'
    end
    object QryMastermov_codigo: TIntegerField
      FieldName = 'mov_codigo'
      Required = True
    end
    object QryMastermov_documento: TStringField
      FieldName = 'mov_documento'
    end
    object QryMastermov_previsao: TSmallintField
      FieldName = 'mov_previsao'
    end
    object QryMastermov_tipo: TSmallintField
      FieldName = 'mov_tipo'
    end
    object QryMastermov_parcelas: TSmallintField
      FieldName = 'mov_parcelas'
    end
  end
  object ClntDtStMaster: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DtStPvdMaster'
    BeforePost = ClntDtStMasterBeforePost
    AfterPost = ClntDtStMasterAfterPost
    BeforeDelete = ClntDtStMasterBeforeDelete
    AfterDelete = ClntDtStMasterAfterDelete
    OnNewRecord = ClntDtStMasterNewRecord
    Left = 688
    Top = 56
    object ClntDtStMastercen_codigo: TSmallintField
      FieldName = 'cen_codigo'
    end
    object ClntDtStMastercom_codigo: TSmallintField
      FieldName = 'com_codigo'
    end
    object ClntDtStMastercon_codigo: TSmallintField
      FieldName = 'con_codigo'
    end
    object ClntDtStMastercus_codigo: TSmallintField
      FieldName = 'cus_codigo'
    end
    object ClntDtStMasterneg_codigo: TSmallintField
      FieldName = 'neg_codigo'
    end
    object ClntDtStMasterpes_codigo: TIntegerField
      FieldName = 'pes_codigo'
    end
    object ClntDtStMasterset_codigo: TSmallintField
      FieldName = 'set_codigo'
    end
    object ClntDtStMasteruni_codigo: TSmallintField
      FieldName = 'uni_codigo'
    end
    object ClntDtStMastermov_data_emissao: TDateField
      FieldName = 'mov_data_emissao'
    end
    object ClntDtStMastermov_data_inclusao: TDateField
      FieldName = 'mov_data_inclusao'
    end
    object ClntDtStMastermov_obs: TStringField
      FieldName = 'mov_obs'
      Size = 200
    end
    object ClntDtStMastermov_inc: TStringField
      FieldName = 'mov_inc'
      Size = 60
    end
    object ClntDtStMastermov_alt: TStringField
      FieldName = 'mov_alt'
      Size = 60
    end
    object ClntDtStMastermov_contrato: TStringField
      FieldName = 'mov_contrato'
    end
    object ClntDtStMastertip_ace_codigo: TSmallintField
      FieldName = 'tip_ace_codigo'
    end
    object ClntDtStMastermov_codigo: TIntegerField
      FieldName = 'mov_codigo'
      Required = True
      DisplayFormat = '000000'
    end
    object ClntDtStMastersit_codigo: TSmallintField
      FieldName = 'sit_codigo'
    end
    object ClntDtStMastermov_documento: TStringField
      FieldName = 'mov_documento'
      OnChange = ClntDtStMastermov_documentoChange
    end
    object ClntDtStMastermov_previsao: TSmallintField
      FieldName = 'mov_previsao'
    end
    object ClntDtStMastermov_tipo: TSmallintField
      FieldName = 'mov_tipo'
    end
    object ClntDtStMastermov_parcelas: TSmallintField
      FieldName = 'mov_parcelas'
    end
  end
  object DtStPvdMaster: TDataSetProvider
    DataSet = QryMaster
    Left = 720
    Top = 56
  end
  object DtSMaster: TDataSource
    DataSet = ClntDtStMaster
    Left = 688
    Top = 88
  end
  object QryMax: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '  coalesce(max(a.`mov_codigo`),0) + 1 as seq'
      'from'
      '  `mny_movimento` a')
    SQLConnection = FrmLogin.conWebMaster
    Left = 720
    Top = 24
    object QryMaxseq: TBCDField
      FieldName = 'seq'
      Precision = 12
      Size = 0
    end
  end
  object QryPessoa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '  a.`pes_codigo`,'
      '  a.`pes_nome_fantasia`'
      'from'
      '  `mny_pessoa` a'
      'where  '
      '  a.`pes_status` = 1'
      'order by 2'
      ''
      '  ')
    SQLConnection = FrmLogin.conWebMaster
    Left = 265
    Top = 152
    object QryPessoapes_codigo: TIntegerField
      FieldName = 'pes_codigo'
      Required = True
    end
    object QryPessoapes_nome_fantasia: TStringField
      FieldName = 'pes_nome_fantasia'
      Size = 100
    end
  end
  object DtSPessoa: TDataSource
    DataSet = QryPessoa
    Left = 297
    Top = 152
  end
  object QryComp: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '  a.`com_codigo`,'
      '  a.`com_nome`'
      'from'
      '  `sys_competencia` a'
      'order by 2')
    SQLConnection = FrmLogin.conWebMaster
    Left = 161
    Top = 224
    object QryCompcom_codigo: TSmallintField
      FieldName = 'com_codigo'
      Required = True
    end
    object QryCompcom_nome: TStringField
      FieldName = 'com_nome'
      Size = 60
    end
  end
  object DtSComp: TDataSource
    DataSet = QryComp
    Left = 193
    Top = 224
  end
  object QrySituacao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '  a.`sit_codigo`,'
      '  a.`sit_nome`'
      'from'
      '  `sys_situacao` a'
      'order by 2')
    SQLConnection = FrmLogin.conWebMaster
    Left = 361
    Top = 224
    object QrySituacaosit_codigo: TSmallintField
      FieldName = 'sit_codigo'
      Required = True
    end
    object QrySituacaosit_nome: TStringField
      FieldName = 'sit_nome'
      Size = 60
    end
  end
  object DtSSituacao: TDataSource
    DataSet = QrySituacao
    Left = 393
    Top = 224
  end
  object QryCentro: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '  a.`cen_codigo`,'
      '  a.`cen_nome`'
      'from'
      '  `mny_centro_custo` a'
      'order by 2')
    SQLConnection = FrmLogin.conWebMaster
    Left = 721
    Top = 208
    object QryCentrocen_codigo: TSmallintField
      FieldName = 'cen_codigo'
      Required = True
    end
    object QryCentrocen_nome: TStringField
      FieldName = 'cen_nome'
      Size = 60
    end
  end
  object DtSCentro: TDataSource
    DataSet = QryCentro
    Left = 753
    Top = 208
  end
  object QryConta: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '  a.`con_codigo`,'
      '  a.`con_nome`'
      'from'
      '  `mny_conta` a'
      'order by 2')
    SQLConnection = FrmLogin.conWebMaster
    Left = 721
    Top = 256
    object QryContacon_codigo: TSmallintField
      FieldName = 'con_codigo'
      Required = True
    end
    object QryContacon_nome: TStringField
      FieldName = 'con_nome'
      Size = 60
    end
  end
  object DtSConta: TDataSource
    DataSet = QryConta
    Left = 753
    Top = 256
  end
  object QryTCusto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '  a.`cus_codigo`,'
      '  a.`cus_nome`'
      'from'
      '  `mny_custo` a'
      'order by 2')
    SQLConnection = FrmLogin.conWebMaster
    Left = 793
    Top = 136
    object QryTCustocus_codigo: TSmallintField
      FieldName = 'cus_codigo'
      Required = True
    end
    object QryTCustocus_nome: TStringField
      FieldName = 'cus_nome'
      Size = 60
    end
  end
  object DtSTCusto: TDataSource
    DataSet = QryTCusto
    Left = 825
    Top = 136
  end
  object QryUnidade: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '  a.`uni_codigo`,'
      '  a.`uni_nome`'
      'from'
      '  `mny_unidade` a'
      'order by 2')
    SQLConnection = FrmLogin.conWebMaster
    Left = 793
    Top = 184
    object QryUnidadeuni_codigo: TSmallintField
      FieldName = 'uni_codigo'
      Required = True
    end
    object QryUnidadeuni_nome: TStringField
      FieldName = 'uni_nome'
      Size = 60
    end
  end
  object DtSUnidade: TDataSource
    DataSet = QryUnidade
    Left = 825
    Top = 184
  end
  object QryCNegocio: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '  a.`neg_codigo`,'
      '  a.`neg_nome`'
      'from'
      '  `mny_centro_negocio` a'
      'order by 2')
    SQLConnection = FrmLogin.conWebMaster
    Left = 721
    Top = 160
    object QryCNegocioneg_codigo: TSmallintField
      FieldName = 'neg_codigo'
      Required = True
    end
    object QryCNegocioneg_nome: TStringField
      FieldName = 'neg_nome'
      Size = 60
    end
  end
  object DtSCNegocio: TDataSource
    DataSet = QryCNegocio
    Left = 753
    Top = 160
  end
  object QrySetor: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '  a.`set_codigo`,'
      '  a.`set_nome`'
      'from'
      '  `mny_setor` a'
      'order by 2')
    SQLConnection = FrmLogin.conWebMaster
    Left = 793
    Top = 232
    object QrySetorset_codigo: TSmallintField
      FieldName = 'set_codigo'
      Required = True
    end
    object QrySetorset_nome: TStringField
      FieldName = 'set_nome'
      Size = 60
    end
  end
  object DtSSetor: TDataSource
    DataSet = QrySetor
    Left = 825
    Top = 232
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
    Left = 752
    Top = 24
  end
  object QryItem: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'mov_codigo'
        ParamType = ptInput
        Value = '0'
      end>
    SQL.Strings = (
      'select'
      '  a.`mov_codigo`,'
      '  a.`mov_item`,'
      '  a.`mov_data_prev`,'
      '  a.`mov_data_vencto`,'
      '  a.`fpg_codigo`,'
      '  a.`tip_doc_codigo`,'
      '  a.`mov_valor`,'
      '  a.`mov_juros`,'
      '  a.`mov_desconto`,'
      '  a.`mov_valor_pagar`,'
      '  a.`mov_retencao`,'
      '  a.`mov_data_inclusao`,'
      '  a.mov_parcela'
      'from'
      '  `mny_movimento_item` a'
      'where'
      '  a.`mov_codigo` = :mov_codigo')
    SQLConnection = FrmLogin.conWebMaster
    Left = 720
    Top = 344
    object QryItemmov_item: TSmallintField
      FieldName = 'mov_item'
      Required = True
    end
    object QryItemmov_data_prev: TDateField
      FieldName = 'mov_data_prev'
    end
    object QryItemmov_data_vencto: TDateField
      FieldName = 'mov_data_vencto'
    end
    object QryItemfpg_codigo: TSmallintField
      FieldName = 'fpg_codigo'
    end
    object QryItemtip_doc_codigo: TSmallintField
      FieldName = 'tip_doc_codigo'
    end
    object QryItemmov_valor: TFMTBCDField
      FieldName = 'mov_valor'
      Precision = 17
      Size = 2
    end
    object QryItemmov_juros: TFMTBCDField
      FieldName = 'mov_juros'
      Precision = 17
      Size = 2
    end
    object QryItemmov_desconto: TFMTBCDField
      FieldName = 'mov_desconto'
      Precision = 17
      Size = 2
    end
    object QryItemmov_valor_pagar: TFMTBCDField
      FieldName = 'mov_valor_pagar'
      Precision = 17
      Size = 2
    end
    object QryItemmov_codigo: TIntegerField
      FieldName = 'mov_codigo'
      Required = True
    end
    object QryItemmov_retencao: TFMTBCDField
      FieldName = 'mov_retencao'
      Precision = 17
      Size = 2
    end
    object QryItemmov_data_inclusao: TDateField
      FieldName = 'mov_data_inclusao'
    end
    object QryItemmov_parcela: TSmallintField
      FieldName = 'mov_parcela'
    end
  end
  object ClntDtStItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DtStPvdItem'
    BeforePost = ClntDtStItemBeforePost
    BeforeDelete = ClntDtStItemBeforeDelete
    OnNewRecord = ClntDtStItemNewRecord
    Left = 720
    Top = 376
    object ClntDtStItemmov_item: TSmallintField
      FieldName = 'mov_item'
      Required = True
    end
    object ClntDtStItemmov_data_prev: TDateField
      FieldName = 'mov_data_prev'
    end
    object ClntDtStItemmov_data_vencto: TDateField
      FieldName = 'mov_data_vencto'
    end
    object ClntDtStItemfpg_codigo: TSmallintField
      FieldName = 'fpg_codigo'
    end
    object ClntDtStItemtip_doc_codigo: TSmallintField
      FieldName = 'tip_doc_codigo'
    end
    object ClntDtStItemmov_valor: TFMTBCDField
      FieldName = 'mov_valor'
      OnValidate = ClntDtStItemmov_valorValidate
      DisplayFormat = '#,###,##0.00'
      Precision = 17
      Size = 2
    end
    object ClntDtStItemmov_juros: TFMTBCDField
      FieldName = 'mov_juros'
      OnValidate = ClntDtStItemmov_jurosValidate
      DisplayFormat = '#,###,##0.00'
      Precision = 17
      Size = 2
    end
    object ClntDtStItemmov_desconto: TFMTBCDField
      FieldName = 'mov_desconto'
      OnValidate = ClntDtStItemmov_descontoValidate
      DisplayFormat = '#,###,##0.00'
      Precision = 17
      Size = 2
    end
    object ClntDtStItemmov_valor_pagar: TFMTBCDField
      FieldName = 'mov_valor_pagar'
      DisplayFormat = '#,###,##0.00'
      Precision = 17
      Size = 2
    end
    object ClntDtStItemmov_codigo: TIntegerField
      FieldName = 'mov_codigo'
      Required = True
    end
    object ClntDtStItemmov_retencao: TFMTBCDField
      FieldName = 'mov_retencao'
      OnValidate = ClntDtStItemmov_retencaoValidate
      DisplayFormat = '#,###,##0.00'
      Precision = 17
      Size = 2
    end
    object ClntDtStItemmov_data_inclusao: TDateField
      FieldName = 'mov_data_inclusao'
    end
    object ClntDtStItemmov_parcela: TSmallintField
      FieldName = 'mov_parcela'
    end
  end
  object DtStPvdItem: TDataSetProvider
    DataSet = QryItem
    Left = 752
    Top = 376
  end
  object DtSItem: TDataSource
    DataSet = ClntDtStItem
    Left = 720
    Top = 408
  end
  object QryMaxItem: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'mov_codigo'
        ParamType = ptInput
        Value = '0'
      end>
    SQL.Strings = (
      'select'
      '  coalesce(max(a.`mov_item`),0) + 1 as seq'
      'from'
      '  `mny_movimento_item` a'
      'where'
      '  a.`mov_codigo` = :mov_codigo')
    SQLConnection = FrmLogin.conWebMaster
    Left = 752
    Top = 344
    object QryMaxItemseq: TBCDField
      FieldName = 'seq'
      Precision = 7
      Size = 0
    end
  end
  object QryTrnItem: TSQLQuery
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
    Left = 784
    Top = 344
  end
  object QryForma: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '  a.`fpg_codigo`,'
      '  a.`fpg_nome`'
      'from'
      '  `mny_forma_pagto` a'
      'order by 2')
    SQLConnection = FrmLogin.conWebMaster
    Left = 601
    Top = 440
    object QryFormafpg_codigo: TSmallintField
      FieldName = 'fpg_codigo'
      Required = True
    end
    object QryFormafpg_nome: TStringField
      FieldName = 'fpg_nome'
      Size = 60
    end
  end
  object DtSForma: TDataSource
    DataSet = QryForma
    Left = 633
    Top = 440
  end
  object QryTipoDoc: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '  a.`tip_codigo`,'
      '  a.`tip_nome`'
      'from'
      '  `mny_tipo_documento` a'
      'order by 2')
    SQLConnection = FrmLogin.conWebMaster
    Left = 601
    Top = 472
    object QryTipoDoctip_codigo: TSmallintField
      FieldName = 'tip_codigo'
      Required = True
    end
    object QryTipoDoctip_nome: TStringField
      FieldName = 'tip_nome'
      Size = 60
    end
  end
  object DtSTipoDoc: TDataSource
    DataSet = QryTipoDoc
    Left = 633
    Top = 472
  end
  object QryDoc: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pes_codigo'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'mov_documento'
        ParamType = ptInput
        Value = '0'
      end>
    SQL.Strings = (
      'select'
      '  a.`mov_codigo`,'
      '  a.`mov_data_emissao`,'
      '  a.`mov_documento`'
      'from'
      '  `mny_movimento` a'
      'where'
      '  a.`pes_codigo` = :pes_codigo'
      '  and a.`mov_documento` = :mov_documento')
    SQLConnection = FrmLogin.conWebMaster
    Left = 173
    Top = 307
    object QryDocmov_codigo: TIntegerField
      FieldName = 'mov_codigo'
      Required = True
    end
    object QryDocmov_data_emissao: TDateField
      FieldName = 'mov_data_emissao'
    end
    object QryDocmov_documento: TStringField
      FieldName = 'mov_documento'
    end
  end
end
