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
          Height = 113
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
            DataBinding.DataSource = DtsMaster
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'tip_codigo'
            Properties.ListColumns = <
              item
                FieldName = 'tip_descricao'
              end>
            Properties.ListOptions.ShowHeader = False
            TabOrder = 8
            Width = 129
          end
          object dbData: TcxDBDateEdit
            Left = 360
            Top = 48
            DataBinding.DataSource = DtsMaster
            TabOrder = 6
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
            TabOrder = 14
            Width = 153
          end
        end
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
      FieldName = 'eaj_competencia'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastereaj_unidade_neg: TSmallintField
      FieldName = 'eaj_unidade_neg'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CdsMastereaj_obs: TStringField
      FieldName = 'eaj_obs'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object CdsMastereaj_status: TSmallintField
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
end
