inherited FrmUnidadeNegocio: TFrmUnidadeNegocio
  Caption = 'Unidades de Neg'#243'cios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTabela: TPanel
    inherited PgCtrlMain: TcxPageControl
      inherited TbsPrincipal: TcxTabSheet
        inherited GrpBxPesquisa: TcxGroupBox
          Caption = 'Pesquise a Unidade de Neg'#243'cio'
        end
        inherited DbgTabela: TcxGrid
          inherited DbgTabelaDB: TcxGridDBTableView
            object DbgTabelaDBuni_codigo: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'uni_codigo'
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.Moving = False
              Width = 30
            end
            object DbgTabelaDBuni_nome: TcxGridDBColumn
              Caption = 'Nome'
              DataBinding.FieldName = 'uni_nome'
            end
            object DbgTabelaDBuni_possui_almox: TcxGridDBColumn
              Caption = 'Almox.'
              DataBinding.FieldName = 'uni_possui_almox'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = '1'
              Properties.ValueUnchecked = '0'
              HeaderAlignmentHorz = taCenter
              MinWidth = 60
              Options.Filtering = False
              Options.HorzSizing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 60
            end
          end
        end
        inherited Pnl: TPanel
          inherited LblDados: TLabel
            Width = 165
            Caption = 'Dados da Unidade de Neg'#243'cio'
          end
        end
      end
    end
  end
  inherited QryMaster: TSQLQuery
    SQL.Strings = (
      'Select'
      '    u.uni_codigo'
      '  , u.uni_nome'
      '  , u.uni_possui_almox'
      '  , u.uni_inc'
      '  , u.uni_alt'
      'from mny_unidade u'
      'where (u.uni_codigo > 0)')
  end
  inherited CdsMaster: TClientDataSet
    OnNewRecord = CdsMasterNewRecord
    object CdsMasteruni_codigo: TSmallintField
      FieldName = 'uni_codigo'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object CdsMasteruni_nome: TStringField
      FieldName = 'uni_nome'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object CdsMasteruni_possui_almox: TSmallintField
      Alignment = taCenter
      FieldName = 'uni_possui_almox'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CdsMasteruni_inc: TStringField
      FieldName = 'uni_inc'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object CdsMasteruni_alt: TStringField
      FieldName = 'uni_alt'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
  end
end
