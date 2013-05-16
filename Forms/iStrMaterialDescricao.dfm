inherited FrmMaterialDescricao: TFrmMaterialDescricao
  Caption = 'Descri'#231#245'es de Materiais'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTabela: TPanel
    inherited PgCtrlMain: TcxPageControl
      inherited TbsPrincipal: TcxTabSheet
        inherited GrpBxPesquisa: TcxGroupBox
          Caption = 'Pesquise a Descri'#231#227'o'
        end
        inherited DbgTabela: TcxGrid
          inherited DbgTabelaDB: TcxGridDBTableView
            object DbgTabelaDBdes_codigo: TcxGridDBColumn
              DataBinding.FieldName = 'des_codigo'
              MinWidth = 60
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 60
            end
            object DbgTabelaDBdes_descricao: TcxGridDBColumn
              DataBinding.FieldName = 'des_descricao'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.CharCase = ecUpperCase
            end
            object DbgTabelaDBdes_ativa: TcxGridDBColumn
              DataBinding.FieldName = 'des_ativa'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = '1'
              Properties.ValueUnchecked = '0'
              HeaderAlignmentHorz = taCenter
              MinWidth = 50
              Options.Filtering = False
              Options.HorzSizing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 50
            end
          end
        end
        inherited Pnl: TPanel
          inherited LblDados: TLabel
            Width = 110
            Caption = 'Dados da Descri'#231#227'o'
          end
        end
      end
    end
  end
  inherited QryMaster: TSQLQuery
    SQL.Strings = (
      'Select'
      '    d.des_codigo'
      '  , d.des_descricao'
      '  , d.des_ativa'
      '  , d.des_log_insert'
      '  , d.des_log_update'
      '  , d.des_log_inactive'
      'from str_material_descricao d')
  end
  inherited CdsMaster: TClientDataSet
    OnNewRecord = CdsMasterNewRecord
    object CdsMasterdes_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'des_codigo'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object CdsMasterdes_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'des_descricao'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object CdsMasterdes_ativa: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Ativa?'
      FieldName = 'des_ativa'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMasterdes_log_insert: TStringField
      FieldName = 'des_log_insert'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object CdsMasterdes_log_update: TStringField
      FieldName = 'des_log_update'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object CdsMasterdes_log_inactive: TStringField
      FieldName = 'des_log_inactive'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
  end
end
