inherited FrmAjusteEstoqueCadastro: TFrmAjusteEstoqueCadastro
  Left = 669
  Top = 244
  Caption = 'Cadastro de Ajuste de Estoque'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTabela: TPanel
    inherited PgCtrlMain: TcxPageControl
      inherited TbsPrincipal: TcxTabSheet
        inherited GrpDadosNominais: TcxGroupBox
          Height = 193
          object lblCodigo: TcxLabel
            Left = 39
            Top = 26
            Caption = 'Ano / C'#243'digo'
            FocusControl = dbCodigo
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object dbCodigo: TcxDBTextEdit
            Left = 168
            Top = 24
            DataBinding.DataSource = DtsMaster
            Properties.ReadOnly = True
            Style.Color = 8454143
            TabOrder = 2
            Width = 73
          end
          object lblUnidadeNegocio: TcxLabel
            Left = 255
            Top = 26
            Caption = 'Unidade de Neg'#243'cio'
            FocusControl = dbUnidadeNegocio
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 354
          end
          object dbUnidadeNegocio: TcxDBLookupComboBox
            Left = 360
            Top = 24
            DataBinding.DataSource = DtsMaster
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'tip_codigo'
            Properties.ListColumns = <
              item
                FieldName = 'tip_descricao'
              end>
            Properties.ListOptions.ShowHeader = False
            TabOrder = 4
            Width = 425
          end
          object lblData: TcxLabel
            Left = 326
            Top = 50
            Caption = 'Data'
            FocusControl = dbData
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 353
          end
          object dbAno: TcxDBTextEdit
            Left = 112
            Top = 24
            DataBinding.DataSource = DtsMaster
            Properties.ReadOnly = True
            Style.Color = 8454143
            TabOrder = 1
            Width = 49
          end
          object lblCompetencia: TcxLabel
            Left = 39
            Top = 50
            Caption = 'Compet'#234'ncia'
            FocusControl = dbCompetencia
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object dbCompetencia: TcxDBLookupComboBox
            Left = 112
            Top = 48
            DataBinding.DataField = 'eaj_competencia'
            DataBinding.DataSource = DtsMaster
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'com_codigo'
            Properties.ListColumns = <
              item
                FieldName = 'com_nome'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DtsCompetencia
            TabOrder = 6
            Width = 129
          end
          object dbData: TcxDBDateEdit
            Left = 360
            Top = 48
            DataBinding.DataSource = DtsMaster
            TabOrder = 8
            Width = 121
          end
          object lblHora: TcxLabel
            Left = 494
            Top = 50
            Caption = 'Hora'
            FocusControl = dbHora
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 521
          end
          object dbHora: TcxDBTextEdit
            Left = 528
            Top = 48
            DataBinding.DataSource = DtsMaster
            Properties.ReadOnly = True
            Style.Color = 8454143
            TabOrder = 10
            Width = 49
          end
          object lblUsuarioAbertura: TcxLabel
            Left = 585
            Top = 50
            Caption = 'Usu'#225'rio'
            FocusControl = dbUsuarioAbertura
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 625
          end
          object dbUsuarioAbertura: TcxDBTextEdit
            Left = 632
            Top = 48
            DataBinding.DataSource = DtsMaster
            Properties.ReadOnly = True
            Style.Color = 8454143
            TabOrder = 12
            Width = 153
          end
          object lblSituacao: TcxLabel
            Left = 580
            Top = 74
            Caption = 'Situa'#231#227'o'
            FocusControl = dbSituacao
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 625
          end
          object dbSituacao: TcxDBTextEdit
            Left = 632
            Top = 72
            DataBinding.DataSource = DtsMaster
            Properties.ReadOnly = True
            Style.Color = 8454143
            TabOrder = 16
            Width = 153
          end
          object lblTipoAjuste: TcxLabel
            Left = 81
            Top = 74
            Caption = 'Tipo'
            FocusControl = dbTipoAjuste
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object dbTipoAjuste: TcxDBLookupComboBox
            Left = 112
            Top = 72
            DataBinding.DataField = 'eaj_tipo'
            DataBinding.DataSource = DtsMaster
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'tmv_codigo'
            Properties.ListColumns = <
              item
                FieldName = 'tmv_descricao'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DtsTipoAjuste
            TabOrder = 14
            Width = 465
          end
          object lblObservacao: TcxLabel
            Left = 38
            Top = 98
            Caption = 'Observa'#231#245'es'
            FocusControl = dbObservacao
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object dbObservacao: TcxDBMemo
            Left = 112
            Top = 96
            DataBinding.DataField = 'eaj_obs'
            DataBinding.DataSource = DtsMaster
            Properties.MaxLength = 250
            TabOrder = 18
            Height = 81
            Width = 673
          end
        end
      end
      object TbsItem: TcxTabSheet
        Caption = 'Items'
        ImageIndex = 30
      end
    end
  end
  inherited QryMaster: TSQLQuery
    Params = <
      item
        DataType = ftSmallint
        Name = 'eaj_ano'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'eaj_codigo'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'Select'
      '    ae.eaj_ano'
      '  , ae.eaj_codigo'
      '  , ae.eaj_data'
      '  , ae.eaj_hora'
      '  , ae.eaj_competencia'
      '  , ae.eaj_unidade_neg'
      '  , ae.eaj_tipo'
      '  , ae.eaj_obs'
      '  , ae.eaj_status'
      '  , ae.eaj_usuario_abertura'
      '  , ae.eaj_usuario_fechamento'
      '  , ae.eaj_log_insert'
      '  , ae.eaj_log_update'
      '  , ae.eaj_log_inactive'
      '  , un.uni_nome'
      'from str_estoque_ajuste ae'
      
        '  inner join mny_unidade un on (un.uni_codigo = ae.eaj_unidade_n' +
        'eg)'
      'where ae.eaj_ano = :eaj_ano'
      '  and ae.eaj_codigo = :eaj_codigo')
    Left = 568
    Top = 8
  end
  inherited DspMaster: TDataSetProvider
    Left = 600
    Top = 8
  end
  inherited CdsMaster: TClientDataSet
    Params = <
      item
        DataType = ftSmallint
        Name = 'eaj_ano'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'eaj_codigo'
        ParamType = ptInput
        Value = 0
      end>
    OnNewRecord = CdsMasterNewRecord
    Left = 632
    Top = 8
    object CdsMastereaj_ano: TSmallintField
      FieldName = 'eaj_ano'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object CdsMastereaj_codigo: TIntegerField
      FieldName = 'eaj_codigo'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object CdsMastereaj_data: TDateField
      FieldName = 'eaj_data'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastereaj_hora: TTimeField
      FieldName = 'eaj_hora'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastereaj_competencia: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'eaj_competencia'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastereaj_unidade_neg: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'eaj_unidade_neg'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CdsMastereaj_tipo: TStringField
      FieldName = 'eaj_tipo'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object CdsMastereaj_obs: TStringField
      FieldName = 'eaj_obs'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object CdsMastereaj_status: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'eaj_status'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastereaj_usuario_abertura: TStringField
      FieldName = 'eaj_usuario_abertura'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object CdsMastereaj_usuario_fechamento: TStringField
      FieldName = 'eaj_usuario_fechamento'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object CdsMastereaj_log_insert: TStringField
      FieldName = 'eaj_log_insert'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object CdsMastereaj_log_update: TStringField
      FieldName = 'eaj_log_update'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object CdsMastereaj_log_inactive: TStringField
      FieldName = 'eaj_log_inactive'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object CdsMasteruni_nome: TStringField
      FieldName = 'uni_nome'
      ProviderFlags = []
      Size = 60
    end
  end
  inherited DtsMaster: TDataSource
    Left = 664
    Top = 8
  end
  object QryUnidadeNeg: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select'
      '    s.sit_codigo'
      '  , s.sit_nome'
      'from sys_situacao s'
      'where s.sit_codigo in (0, 1, 2, 4)'
      'order by'
      '    s.sit_codigo')
    SQLConnection = FrmLogin.conWebMaster
    Left = 704
    Top = 8
  end
  object DspUnidadeNeg: TDataSetProvider
    DataSet = QryUnidadeNeg
    Left = 736
    Top = 8
  end
  object CdsUnidadeNeg: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspUnidadeNeg'
    Left = 768
    Top = 8
  end
  object DtsUnidadeNeg: TDataSource
    DataSet = CdsUnidadeNeg
    Left = 800
    Top = 8
  end
  object QryCompetencia: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select'
      '    c.com_codigo'
      '  , c.com_ano_mes'
      '  , c.com_nome'
      'from sys_competencia c'
      'order by'
      '    c.com_ano_mes')
    SQLConnection = FrmLogin.conWebMaster
    Left = 704
    Top = 40
  end
  object DspCompetencia: TDataSetProvider
    DataSet = QryCompetencia
    Left = 736
    Top = 40
  end
  object CdsCompetencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCompetencia'
    Left = 768
    Top = 40
  end
  object DtsCompetencia: TDataSource
    DataSet = CdsCompetencia
    Left = 800
    Top = 40
  end
  object QryTipoAjuste: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select'
      '    t.tmv_codigo'
      '  , t.tmv_descricao'
      'from str_tipo_movimento t'
      'where t.tmv_grupo = 1'
      'order by'
      '    t.tmv_codigo')
    SQLConnection = FrmLogin.conWebMaster
    Left = 704
    Top = 72
  end
  object DspTipoAjuste: TDataSetProvider
    DataSet = QryTipoAjuste
    Left = 736
    Top = 72
  end
  object CdsTipoAjuste: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspTipoAjuste'
    Left = 768
    Top = 72
  end
  object DtsTipoAjuste: TDataSource
    DataSet = CdsTipoAjuste
    Left = 800
    Top = 72
  end
end
