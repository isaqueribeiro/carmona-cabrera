inherited FrmUnidadeMedida: TFrmUnidadeMedida
  Caption = 'Unidades de Medidas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTabela: TPanel
    inherited PgCtrlMain: TcxPageControl
      inherited TbsPrincipal: TcxTabSheet
        inherited GrpBxPesquisa: TcxGroupBox
          Caption = 'Pesquise a Unidade de Medida'
        end
        inherited DbgTabela: TcxGrid
          inherited DbgTabelaDB: TcxGridDBTableView
            object DbgTabelaDBund_codigo: TcxGridDBColumn
              DataBinding.FieldName = 'und_codigo'
              MinWidth = 60
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 60
            end
            object DbgTabelaDBund_descricao: TcxGridDBColumn
              DataBinding.FieldName = 'und_descricao'
            end
            object DbgTabelaDBund_sigla: TcxGridDBColumn
              DataBinding.FieldName = 'und_sigla'
              MinWidth = 100
              Options.Filtering = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 100
            end
          end
        end
        inherited Pnl: TPanel
          inherited LblDados: TLabel
            Width = 162
            Caption = 'Dados da Unidade de Medida'
          end
        end
      end
    end
  end
  inherited QryMaster: TSQLQuery
    SQL.Strings = (
      'Select'
      '    u.und_codigo'
      '  , u.und_descricao'
      '  , u.und_sigla'
      'from str_unidade u')
  end
  inherited CdsMaster: TClientDataSet
    OnNewRecord = CdsMasterNewRecord
    object CdsMasterund_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'und_codigo'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object CdsMasterund_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'und_descricao'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object CdsMasterund_sigla: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'und_sigla'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
  end
end
