inherited FrmTipoDocumento: TFrmTipoDocumento
  Caption = 'Tipos de Documentos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTabela: TPanel
    inherited PgCtrlMain: TcxPageControl
      inherited TbsPrincipal: TcxTabSheet
        inherited GrpBxPesquisa: TcxGroupBox
          Caption = 'Pesquise o Tipo de Documento'
        end
        inherited DbgTabela: TcxGrid
          inherited DbgTabelaDB: TcxGridDBTableView
            object DbgTabelaDBtip_codigo: TcxGridDBColumn
              Caption = '#'
              DataBinding.FieldName = 'tip_codigo'
              HeaderAlignmentHorz = taCenter
              MinWidth = 30
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 30
            end
            object DbgTabelaDBtip_nome: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'tip_nome'
            end
            object DbgTabelaDBtip_doc_entrada: TcxGridDBColumn
              Caption = 'Entrada Almox.'
              DataBinding.FieldName = 'tip_doc_entrada'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = '1'
              Properties.ValueUnchecked = '0'
              HeaderAlignmentHorz = taCenter
              MinWidth = 90
              Options.Filtering = False
              Options.HorzSizing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 90
            end
          end
        end
        inherited Pnl: TPanel
          inherited LblDados: TLabel
            Width = 164
            Caption = 'Dados do Tipo de Documento'
          end
        end
      end
    end
  end
  inherited QryMaster: TSQLQuery
    SQL.Strings = (
      'Select'
      '    t.tip_codigo'
      '  , t.tip_nome'
      '  , t.tip_doc_entrada'
      '  , t.tip_inc'
      '  , t.tip_alt'
      'from mny_tipo_documento t')
  end
  inherited CdsMaster: TClientDataSet
    OnNewRecord = CdsMasterNewRecord
    object CdsMastertip_codigo: TSmallintField
      FieldName = 'tip_codigo'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object CdsMastertip_nome: TStringField
      FieldName = 'tip_nome'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object CdsMastertip_doc_entrada: TSmallintField
      Alignment = taCenter
      FieldName = 'tip_doc_entrada'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CdsMastertip_inc: TStringField
      FieldName = 'tip_inc'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object CdsMastertip_alt: TStringField
      FieldName = 'tip_alt'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
  end
end
