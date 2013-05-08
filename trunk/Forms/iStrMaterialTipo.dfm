inherited FrmMaterialTipo: TFrmMaterialTipo
  Caption = 'Tipos de Materiais'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTabela: TPanel
    inherited PgCtrlMain: TcxPageControl
      inherited TbShtPrincipal: TcxTabSheet
        inherited GrpBxPesquisa: TcxGroupBox
          Caption = 'Pesquisar Tipo'
        end
        inherited DbgTabela: TcxGrid
          inherited DbgTabelaDB: TcxGridDBTableView
            object DbgTabelaDBtip_codigo: TcxGridDBColumn
              DataBinding.FieldName = 'tip_codigo'
              MinWidth = 64
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.HorzSizing = False
              Options.Moving = False
            end
            object DbgTabelaDBtip_descricao: TcxGridDBColumn
              DataBinding.FieldName = 'tip_descricao'
            end
          end
        end
        inherited Pnl: TPanel
          inherited LblDados: TLabel
            Width = 79
            Caption = 'Dados do Tipo'
          end
        end
      end
    end
  end
  inherited QryMaster: TSQLQuery
    SQL.Strings = (
      'Select '
      '    t.tip_codigo'
      '  , t.tip_descricao'
      'from str_material_tipo t')
  end
  inherited CdsMaster: TClientDataSet
    OnNewRecord = CdsMasterNewRecord
    object CdsMastertip_codigo: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'tip_codigo'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object CdsMastertip_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'tip_descricao'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
end
