inherited FrmSetor: TFrmSetor
  Caption = 'Setores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTabela: TPanel
    inherited PgCtrlMain: TcxPageControl
      inherited TbsPrincipal: TcxTabSheet
        inherited GrpBxPesquisa: TcxGroupBox
          Caption = 'Pesquise o Setor'
        end
        inherited DbgTabela: TcxGrid
          inherited DbgTabelaDB: TcxGridDBTableView
            object DbgTabelaDBset_codigo: TcxGridDBColumn
              DataBinding.FieldName = 'set_codigo'
              MinWidth = 60
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 60
            end
            object DbgTabelaDBset_nome: TcxGridDBColumn
              DataBinding.FieldName = 'set_nome'
            end
            object DbgTabelaDBset_gerente: TcxGridDBColumn
              DataBinding.FieldName = 'set_gerente'
            end
          end
        end
        inherited Pnl: TPanel
          inherited LblDados: TLabel
            Width = 86
            Caption = 'Dados do Setor'
          end
        end
      end
    end
  end
  inherited QryMaster: TSQLQuery
    SQL.Strings = (
      'Select'
      '    s.set_codigo'
      '  , s.set_nome'
      '  , s.set_gerente'
      '  , s.set_inc'
      '  , s.set_alt'
      'from mny_setor s')
  end
  inherited CdsMaster: TClientDataSet
    AfterEdit = CdsMasterAfterEdit
    OnNewRecord = CdsMasterNewRecord
    object CdsMasterset_codigo: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'set_codigo'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object CdsMasterset_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'set_nome'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object CdsMasterset_gerente: TStringField
      DisplayLabel = 'Gerente'
      FieldName = 'set_gerente'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object CdsMasterset_inc: TStringField
      FieldName = 'set_inc'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object CdsMasterset_alt: TStringField
      FieldName = 'set_alt'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
  end
end
