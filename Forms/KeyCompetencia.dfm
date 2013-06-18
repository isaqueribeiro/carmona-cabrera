inherited FrmCompetencia: TFrmCompetencia
  Left = 635
  Top = 195
  Caption = 'Compet'#234'ncias'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTabela: TPanel
    inherited PgCtrlMain: TcxPageControl
      inherited TbsPrincipal: TcxTabSheet
        inherited GrpBxPesquisa: TcxGroupBox
          Caption = 'Pesquise a Compet'#234'ncia'
        end
        inherited DbgTabela: TcxGrid
          inherited DbgTabelaDB: TcxGridDBTableView
            object DbgTabelaDBcom_codigo: TcxGridDBColumn
              DataBinding.FieldName = 'com_codigo'
              MinWidth = 50
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.HorzSizing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 50
            end
            object DbgTabelaDBcom_ano_mes: TcxGridDBColumn
              DataBinding.FieldName = 'com_ano_mes'
              MinWidth = 80
              Options.Filtering = False
              Options.HorzSizing = False
              Width = 80
            end
            object DbgTabelaDBcom_nome: TcxGridDBColumn
              DataBinding.FieldName = 'com_nome'
            end
            object DbgTabelaDBsit_codigo: TcxGridDBColumn
              DataBinding.FieldName = 'sit_codigo'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'sit_codigo'
              Properties.ListColumns = <
                item
                  FieldName = 'sit_nome'
                end>
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = DtsSituacao
              MinWidth = 250
              Options.HorzSizing = False
              Width = 250
            end
          end
        end
        inherited Pnl: TPanel
          inherited LblDados: TLabel
            Width = 129
            Caption = 'Dados da Compet'#234'ncia'
          end
        end
      end
    end
  end
  inherited QryMaster: TSQLQuery
    SQL.Strings = (
      'Select'
      '    c.com_codigo'
      '  , c.com_ano_mes  '
      '  , c.com_nome'
      '  , c.sit_codigo'
      '  , c.com_inc'
      '  , c.com_alt'
      'from sys_competencia c')
    Top = 392
  end
  inherited CdsMaster: TClientDataSet
    OnNewRecord = CdsMasterNewRecord
    Top = 392
    object CdsMastercom_codigo: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'com_codigo'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object CdsMastercom_ano_mes: TIntegerField
      DisplayLabel = 'Ano / M'#234's'
      FieldName = 'com_ano_mes'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastercom_nome: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'com_nome'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object CdsMastersit_codigo: TSmallintField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'sit_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastercom_inc: TStringField
      FieldName = 'com_inc'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object CdsMastercom_alt: TStringField
      FieldName = 'com_alt'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
  end
  inherited DspMaster: TDataSetProvider
    Top = 392
  end
  inherited DtsMaster: TDataSource
    Top = 392
  end
  object QrySituacao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select'
      '    s.sit_codigo'
      '  , s.sit_nome'
      'from sys_situacao s'
      'where s.sit_codigo in (0, 1, 2, 4)'
      'order by'
      '    s.sit_codigo')
    SQLConnection = FrmLogin.conWebMaster
    Left = 24
    Top = 424
  end
  object DspSituacao: TDataSetProvider
    DataSet = QrySituacao
    Left = 56
    Top = 424
  end
  object CdsSituacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspSituacao'
    Left = 88
    Top = 424
  end
  object DtsSituacao: TDataSource
    DataSet = CdsSituacao
    Left = 120
    Top = 424
  end
end
