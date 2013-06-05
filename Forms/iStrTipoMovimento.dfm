inherited FrmTipoMovimento: TFrmTipoMovimento
  Caption = 'Tipos de Movimentos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTabela: TPanel
    inherited PgCtrlMain: TcxPageControl
      inherited TbsPrincipal: TcxTabSheet
        inherited GrpBxPesquisa: TcxGroupBox
          Caption = 'Pesquise o Tipo de Movimento'
        end
        inherited DbgTabela: TcxGrid
          inherited DbgTabelaDB: TcxGridDBTableView
            object DbgTabelaDBtmv_codigo: TcxGridDBColumn
              DataBinding.FieldName = 'tmv_codigo'
              MinWidth = 50
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 50
            end
            object DbgTabelaDBtmv_grupo: TcxGridDBColumn
              DataBinding.FieldName = 'tmv_grupo'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <
                item
                  Description = 'Ajuste de Estoque'
                  ImageIndex = 0
                  Value = 1
                end
                item
                  Description = 'Tipos de Entrada'
                  Value = 2
                end>
              MinWidth = 250
              Options.HorzSizing = False
              Options.Moving = False
              Width = 250
            end
            object DbgTabelaDBtmv_descricao: TcxGridDBColumn
              DataBinding.FieldName = 'tmv_descricao'
              Options.Moving = False
            end
          end
        end
        inherited Pnl: TPanel
          inherited LblDados: TLabel
            Width = 163
            Caption = 'Dados do Tipo de Movimento'
          end
        end
      end
    end
  end
  inherited QryMaster: TSQLQuery
    SQL.Strings = (
      'Select'
      '    t.tmv_codigo'
      '  , t.tmv_grupo'
      '  , t.tmv_descricao'
      'from str_tipo_movimento t'
      'where (t.tmv_codigo > 0)')
  end
  inherited CdsMaster: TClientDataSet
    object CdsMastertmv_codigo: TStringField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'tmv_codigo'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
      Size = 3
    end
    object CdsMastertmv_grupo: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Grupo'
      FieldName = 'tmv_grupo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CdsMastertmv_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'tmv_descricao'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  inherited DtsMaster: TDataSource
    OnDataChange = DtsMasterDataChange
  end
end
