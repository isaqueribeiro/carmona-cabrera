inherited FrmMovimentoEntradaApropriar: TFrmMovimentoEntradaApropriar
  Left = 704
  Top = 277
  Width = 609
  Height = 417
  ActiveControl = dbTipoAceite
  Caption = 'Apropriar Movimento de Entrada'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlBotoes: TPanel
    Top = 321
    Width = 593
    inherited btnCancelar: TcxButton
      Left = 488
    end
    inherited BtnConfirmar: TcxButton
      Left = 391
      ModalResult = 0
      OnClick = BtnConfirmarClick
    end
  end
  inherited PnlControle: TPanel
    Width = 593
    Height = 321
    inherited GrpBxControle: TcxGroupBox
      Align = alTop
      Height = 85
      Width = 585
      object lblCodigo: TcxLabel
        Left = 39
        Top = 26
        Caption = 'Ano / C'#243'digo'
        FocusControl = dbCodigo
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        AnchorX = 105
      end
      object dbAno: TcxDBTextEdit
        Left = 112
        Top = 24
        DataBinding.DataField = 'ent_ano'
        DataBinding.DataSource = DtsMovimento
        Properties.ReadOnly = True
        Style.Color = 8454143
        TabOrder = 1
        Width = 49
      end
      object dbCodigo: TcxDBTextEdit
        Left = 168
        Top = 24
        DataBinding.DataField = 'ent_codigo'
        DataBinding.DataSource = DtsMovimento
        Properties.ReadOnly = True
        Style.Color = 8454143
        TabOrder = 2
        Width = 73
      end
      object lblFornecedor: TcxLabel
        Left = 46
        Top = 50
        Caption = 'Fornecedor'
        FocusControl = dbFornecedor
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        AnchorX = 105
      end
      object dbFornecedor: TcxDBTextEdit
        Left = 112
        Top = 48
        DataBinding.DataField = 'pes_razao_social'
        DataBinding.DataSource = DtsMovimento
        Properties.ReadOnly = True
        Style.Color = 8454143
        TabOrder = 6
        Width = 441
      end
      object lblSituacao: TcxLabel
        Left = 348
        Top = 26
        Caption = 'Situa'#231#227'o'
        FocusControl = dbSituacao
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        AnchorX = 393
      end
      object dbSituacao: TcxDBTextEdit
        Left = 400
        Top = 24
        DataBinding.DataField = 'ent_status'
        DataBinding.DataSource = DtsMovimento
        Properties.ReadOnly = True
        Style.Color = 8454143
        TabOrder = 4
        Width = 153
      end
    end
    object GrpBxApropriacao: TcxGroupBox
      Left = 4
      Top = 89
      Align = alClient
      Caption = 'Apropria'#231#227'o'
      Style.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.Kind = lfStandard
      TabOrder = 1
      Height = 228
      Width = 585
      object lblTipoCusto: TcxLabel
        Left = 75
        Top = 50
        Caption = 'Tipo de Custo'
        FocusControl = dbTipoCusto
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        AnchorX = 145
      end
      object dbTipoCusto: TcxDBLookupComboBox
        Left = 152
        Top = 48
        DataBinding.DataField = 'ent_aprop_tipo_custo'
        DataBinding.DataSource = DtsMovimento
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'cus_codigo'
        Properties.ListColumns = <
          item
            FieldName = 'cus_nome'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = DtsTipoCusto
        Properties.ReadOnly = True
        TabOrder = 3
        Width = 401
      end
      object lblCentroNegocio: TcxLabel
        Left = 52
        Top = 74
        Caption = 'Centro de Neg'#243'cio'
        FocusControl = dbCentroNegocio
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        AnchorX = 145
      end
      object dbCentroNegocio: TcxDBLookupComboBox
        Left = 152
        Top = 72
        DataBinding.DataField = 'ent_aprop_centro_negocio'
        DataBinding.DataSource = DtsMovimento
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'neg_codigo'
        Properties.ListColumns = <
          item
            FieldName = 'neg_nome'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = DtsCentroNegocio
        Properties.ReadOnly = True
        TabOrder = 5
        Width = 401
      end
      object lblUnidadeNegocio: TcxLabel
        Left = 46
        Top = 98
        Caption = 'Unidade de Neg'#243'cio'
        FocusControl = dbUnidadeNegocio
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        AnchorX = 145
      end
      object dbUnidadeNegocio: TcxDBLookupComboBox
        Left = 152
        Top = 96
        DataBinding.DataField = 'ent_aprop_unidade_negocio'
        DataBinding.DataSource = DtsMovimento
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'uni_codigo'
        Properties.ListColumns = <
          item
            FieldName = 'uni_nome'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = DtsUnidadeNegocio
        Properties.ReadOnly = True
        TabOrder = 7
        Width = 401
      end
      object lblCentroCusto: TcxLabel
        Left = 62
        Top = 122
        Caption = 'Centro de Custo'
        FocusControl = dbCentroCusto
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        AnchorX = 145
      end
      object dbCentroCusto: TcxDBLookupComboBox
        Left = 152
        Top = 120
        DataBinding.DataField = 'ent_aprop_centro_custo'
        DataBinding.DataSource = DtsMovimento
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'cen_codigo'
        Properties.ListColumns = <
          item
            FieldName = 'cen_nome'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = DtsCentroCusto
        Properties.ReadOnly = True
        TabOrder = 9
        Width = 401
      end
      object lblSetor: TcxLabel
        Left = 115
        Top = 146
        Caption = 'Setor'
        FocusControl = dbSetor
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        AnchorX = 145
      end
      object dbSetor: TcxDBLookupComboBox
        Left = 152
        Top = 144
        DataBinding.DataField = 'ent_aprop_setor'
        DataBinding.DataSource = DtsMovimento
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'set_codigo'
        Properties.ListColumns = <
          item
            FieldName = 'set_nome'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = DtsSetor
        Properties.ReadOnly = True
        TabOrder = 11
        Width = 401
      end
      object lblConta: TcxLabel
        Left = 112
        Top = 170
        Caption = 'Conta'
        FocusControl = dbConta
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        AnchorX = 145
      end
      object dbConta: TcxDBLookupComboBox
        Left = 152
        Top = 168
        DataBinding.DataField = 'ent_aprop_conta'
        DataBinding.DataSource = DtsMovimento
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'con_codigo'
        Properties.ListColumns = <
          item
            FieldName = 'con_nome'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = DtsConta
        Properties.ReadOnly = True
        TabOrder = 13
        Width = 401
      end
      object lblTipoAceite: TcxLabel
        Left = 88
        Top = 26
        Caption = 'Tipo Aceite'
        FocusControl = dbTipoAceite
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        AnchorX = 145
      end
      object dbTipoAceite: TcxDBLookupComboBox
        Left = 152
        Top = 24
        DataBinding.DataField = 'ent_aprop_tipo_aceite'
        DataBinding.DataSource = DtsMovimento
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'tip_codigo'
        Properties.ListColumns = <
          item
            FieldName = 'tip_nome'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = DtsTipoAceite
        Properties.ReadOnly = True
        TabOrder = 1
        Width = 401
      end
    end
  end
  object DtsMovimento: TDataSource
    DataSet = FrmMovimentoEntradaCadastro.CdsMaster
    OnStateChange = DtsMovimentoStateChange
    Left = 552
    Top = 8
  end
  object QryTipoCusto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select'
      '    c.cus_codigo'
      '  , c.cus_nome'
      'from mny_custo c')
    SQLConnection = FrmLogin.conWebMaster
    Left = 456
    Top = 72
  end
  object DspTipoCusto: TDataSetProvider
    DataSet = QryTipoCusto
    Left = 488
    Top = 72
  end
  object CdsTipoCusto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspTipoCusto'
    Left = 520
    Top = 72
  end
  object DtsTipoCusto: TDataSource
    DataSet = CdsTipoCusto
    Left = 552
    Top = 72
  end
  object QryCentroNegocio: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select'
      '    c.neg_codigo'
      '  , c.neg_nome'
      'from mny_centro_negocio c')
    SQLConnection = FrmLogin.conWebMaster
    Left = 456
    Top = 104
  end
  object DspCentroNegocio: TDataSetProvider
    DataSet = QryCentroNegocio
    Left = 488
    Top = 104
  end
  object CdsCentroNegocio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCentroNegocio'
    Left = 520
    Top = 104
  end
  object DtsCentroNegocio: TDataSource
    DataSet = CdsCentroNegocio
    Left = 552
    Top = 104
  end
  object QryUnidadeNegocio: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select'
      '    u.uni_codigo'
      '  , u.uni_nome'
      'from mny_unidade u')
    SQLConnection = FrmLogin.conWebMaster
    Left = 456
    Top = 136
  end
  object DspUnidadeNegocio: TDataSetProvider
    DataSet = QryUnidadeNegocio
    Left = 488
    Top = 136
  end
  object CdsUnidadeNegocio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspUnidadeNegocio'
    Left = 520
    Top = 136
  end
  object DtsUnidadeNegocio: TDataSource
    DataSet = CdsUnidadeNegocio
    Left = 552
    Top = 136
  end
  object QryCentroCusto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select'
      '    c.cen_codigo'
      '  , c.cen_nome'
      'from mny_centro_custo c')
    SQLConnection = FrmLogin.conWebMaster
    Left = 456
    Top = 168
  end
  object DspCentroCusto: TDataSetProvider
    DataSet = QryCentroCusto
    Left = 488
    Top = 168
  end
  object CdsCentroCusto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCentroCusto'
    Left = 520
    Top = 168
  end
  object DtsCentroCusto: TDataSource
    DataSet = CdsCentroCusto
    Left = 552
    Top = 168
  end
  object QrySetor: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select'
      '    s.set_codigo'
      '  , s.set_nome'
      'from mny_setor s')
    SQLConnection = FrmLogin.conWebMaster
    Left = 456
    Top = 200
  end
  object DspSetor: TDataSetProvider
    DataSet = QrySetor
    Left = 488
    Top = 200
  end
  object CdsSetor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspSetor'
    Left = 520
    Top = 200
  end
  object DtsSetor: TDataSource
    DataSet = CdsSetor
    Left = 552
    Top = 200
  end
  object QryConta: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select'
      '    c.con_codigo'
      '  , c.con_nome'
      'from mny_conta c')
    SQLConnection = FrmLogin.conWebMaster
    Left = 456
    Top = 232
  end
  object DspConta: TDataSetProvider
    DataSet = QryConta
    Left = 488
    Top = 232
  end
  object CdsConta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspConta'
    Left = 520
    Top = 232
  end
  object DtsConta: TDataSource
    DataSet = CdsConta
    Left = 552
    Top = 232
  end
  object QryTipoAceite: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select'
      '    a.tip_codigo'
      '  , a.tip_nome'
      'from mny_tipo_aceite a')
    SQLConnection = FrmLogin.conWebMaster
    Left = 456
    Top = 40
  end
  object DspTipoAceite: TDataSetProvider
    DataSet = QryTipoAceite
    Left = 488
    Top = 40
  end
  object CdsTipoAceite: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspTipoAceite'
    Left = 520
    Top = 40
  end
  object DtsTipoAceite: TDataSource
    DataSet = CdsTipoAceite
    Left = 552
    Top = 40
  end
end
