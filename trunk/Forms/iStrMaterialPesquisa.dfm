inherited FrmMaterialPesquisa: TFrmMaterialPesquisa
  Left = 436
  Top = 184
  Width = 983
  Height = 620
  Caption = 'Materiais'
  PixelsPerInch = 96
  TextHeight = 13
  inherited BvlMain: TBevel
    Width = 967
  end
  inherited PnlMain: TPanel
    Width = 967
    inherited BtnSelecionar: TcxButton
      Left = 839
    end
  end
  inherited PnlTabela: TPanel
    Width = 967
    Height = 505
    inherited PgCtrlMain: TcxPageControl
      Width = 959
      Height = 497
      ClientRectBottom = 493
      ClientRectRight = 955
      inherited TbsPrincipal: TcxTabSheet
        inherited GrpBxPesquisa: TcxGroupBox
          Caption = 'Pesquise o Material'
          Width = 943
          inherited EdtPesquisa: TcxTextEdit
            Width = 657
          end
          inherited BtnPesquisar: TcxButton
            Left = 906
          end
        end
        inherited DbgTabela: TcxGrid
          Width = 943
          Height = 392
        end
        inherited Pnl: TPanel
          Width = 943
          inherited ShpTitulo: TShape
            Width = 941
          end
          inherited LblDados: TLabel
            Width = 102
            Caption = 'Dados do Material'
          end
        end
      end
    end
  end
  inherited QryMaster: TSQLQuery
    SQL.Strings = (
      'Select'
      '    m.mat_codigo'
      '  , m.mat_tipo'
      '  , m.mat_descricao_resumo'
      '  , m.mat_referencia'
      '  , m.mat_status'
      '  , m.mat_grupo'
      '  , m.mat_subgrupo'
      '  , m.mat_custo_direto'
      '  , m.mat_custo_indireto'
      '  , m.mat_valor_custo_int'
      '  , m.mat_valor_custo_frc'
      '  , m.mat_valor_venda_int'
      '  , m.mat_valor_venda_frc'
      '  , m.mat_data_cadastro'
      '  , m.mat_ultcompra_data'
      '  , t.tip_descricao'
      '  , g.grp_descricao'
      '  , s.sgp_descricao'
      'from str_material m'
      '  left join str_material_tipo t on (t.tip_codigo = m.mat_tipo)'
      '  left join str_material_grupo g on (g.grp_codigo = m.mat_grupo)'
      
        '  left join str_material_subgrupo s on (s.sgp_codigo = m.mat_sub' +
        'grupo)'
      '')
  end
  inherited CdsMaster: TClientDataSet
    object CdsMastermat_codigo: TFMTBCDField
      FieldName = 'mat_codigo'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object CdsMastermat_tipo: TSmallintField
      FieldName = 'mat_tipo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CdsMastermat_descricao_resumo: TStringField
      FieldName = 'mat_descricao_resumo'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object CdsMastermat_referencia: TStringField
      FieldName = 'mat_referencia'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object CdsMastermat_status: TSmallintField
      FieldName = 'mat_status'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_grupo: TSmallintField
      FieldName = 'mat_grupo'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_subgrupo: TIntegerField
      FieldName = 'mat_subgrupo'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_custo_direto: TSmallintField
      FieldName = 'mat_custo_direto'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_custo_indireto: TSmallintField
      FieldName = 'mat_custo_indireto'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_valor_custo_int: TFMTBCDField
      FieldName = 'mat_valor_custo_int'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object CdsMastermat_valor_custo_frc: TFMTBCDField
      FieldName = 'mat_valor_custo_frc'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object CdsMastermat_valor_venda_int: TFMTBCDField
      FieldName = 'mat_valor_venda_int'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object CdsMastermat_valor_venda_frc: TFMTBCDField
      FieldName = 'mat_valor_venda_frc'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object CdsMastermat_data_cadastro: TDateField
      FieldName = 'mat_data_cadastro'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_ultcompra_data: TDateField
      FieldName = 'mat_ultcompra_data'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastertip_descricao: TStringField
      FieldName = 'tip_descricao'
      ProviderFlags = []
      Size = 100
    end
    object CdsMastergrp_descricao: TStringField
      FieldName = 'grp_descricao'
      ProviderFlags = []
      Size = 100
    end
    object CdsMastersgp_descricao: TStringField
      FieldName = 'sgp_descricao'
      ProviderFlags = []
      Size = 100
    end
  end
end
