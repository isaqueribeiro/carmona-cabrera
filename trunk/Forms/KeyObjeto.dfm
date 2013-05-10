inherited FrmObjeto: TFrmObjeto
  Left = 549
  Top = 196
  Caption = 'Objetos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTabela: TPanel
    inherited PgCtrlMain: TcxPageControl
      inherited TbsPrincipal: TcxTabSheet
        inherited GrpBxPesquisa: TcxGroupBox
          Caption = 'Pesquise o Objeto'
        end
        inherited DbgTabela: TcxGrid
          inherited DbgTabelaDB: TcxGridDBTableView
            object DbgTabelaDBobj_codigo: TcxGridDBColumn
              DataBinding.FieldName = 'obj_codigo'
              MinWidth = 64
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.HorzSizing = False
              Options.Moving = False
            end
            object DbgTabelaDBobj_nome: TcxGridDBColumn
              DataBinding.FieldName = 'obj_nome'
            end
            object DbgTabelaDBobj_tipo: TcxGridDBColumn
              DataBinding.FieldName = 'obj_tipo'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <
                item
                  Description = 'Formul'#225'rio'
                  ImageIndex = 0
                  Value = 0
                end
                item
                  Description = 'Processo'
                  Value = 1
                end
                item
                  Description = 'Relat'#243'rio'
                  Value = 2
                end>
              Width = 250
            end
          end
        end
        inherited Pnl: TPanel
          inherited LblDados: TLabel
            Width = 93
            Caption = 'Dados do Objeto'
          end
        end
      end
    end
  end
  inherited QryMaster: TSQLQuery
    SQL.Strings = (
      'Select'
      '  o.obj_codigo,'
      '  o.obj_nome,'
      '  o.obj_tipo,'
      '  o.obj_inc,'
      '  o.obj_alt'
      'from sys_objeto o')
    Top = 208
  end
  inherited CdsMaster: TClientDataSet
    AfterEdit = CdsMasterAfterEdit
    AfterPost = CdsMasterAfterPost
    OnNewRecord = CdsMasterNewRecord
    Top = 208
    object CdsMasterobj_codigo: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'obj_codigo'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object CdsMasterobj_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'obj_nome'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object CdsMasterobj_tipo: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo'
      FieldName = 'obj_tipo'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMasterobj_inc: TStringField
      FieldName = 'obj_inc'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object CdsMasterobj_alt: TStringField
      FieldName = 'obj_alt'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
  end
  inherited DspMaster: TDataSetProvider
    Top = 208
  end
  inherited DtsMaster: TDataSource
    Top = 208
  end
end
