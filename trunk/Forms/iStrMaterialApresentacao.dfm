inherited FrmMaterialApresentacao: TFrmMaterialApresentacao
  Caption = 'Apresenta'#231#245'es de Materiais'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTabela: TPanel
    inherited PgCtrlMain: TcxPageControl
      inherited TbsPrincipal: TcxTabSheet
        inherited GrpBxPesquisa: TcxGroupBox
          Caption = 'Pesquise a Apresenta'#231#227'o'
        end
        inherited DbgTabela: TcxGrid
          inherited DbgTabelaDB: TcxGridDBTableView
            object DbgTabelaDBapr_codigo: TcxGridDBColumn
              DataBinding.FieldName = 'apr_codigo'
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.Moving = False
              Width = 60
            end
            object DbgTabelaDBapr_descricao: TcxGridDBColumn
              DataBinding.FieldName = 'apr_descricao'
            end
            object DbgTabelaDBapr_ativa: TcxGridDBColumn
              DataBinding.FieldName = 'apr_ativa'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = '1'
              Properties.ValueUnchecked = '0'
              HeaderAlignmentHorz = taCenter
              MinWidth = 50
              Options.Filtering = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 50
            end
          end
        end
        inherited Pnl: TPanel
          inherited LblDados: TLabel
            Width = 134
            Caption = 'Dados da Apresenta'#231#227'o'
          end
        end
      end
    end
  end
  inherited QryMaster: TSQLQuery
    SQL.Strings = (
      'Select'
      '    a.apr_codigo'
      '  , a.apr_descricao'
      '  , a.apr_ativa'
      '  , a.apr_log_insert'
      '  , a.apr_log_update'
      '  , a.apr_log_inactive'
      'from str_material_apresentacao a')
  end
  inherited CdsMaster: TClientDataSet
    OnNewRecord = CdsMasterNewRecord
    object CdsMasterapr_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'apr_codigo'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object CdsMasterapr_descricao: TStringField
      DisplayLabel = 'Apresenta'#231#227'o'
      FieldName = 'apr_descricao'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object CdsMasterapr_ativa: TSmallintField
      DisplayLabel = 'Ativa?'
      FieldName = 'apr_ativa'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CdsMasterapr_log_insert: TStringField
      FieldName = 'apr_log_insert'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object CdsMasterapr_log_update: TStringField
      FieldName = 'apr_log_update'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object CdsMasterapr_log_inactive: TStringField
      FieldName = 'apr_log_inactive'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
  end
end
