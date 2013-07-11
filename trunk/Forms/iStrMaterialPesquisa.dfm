inherited FrmMaterialPesquisa: TFrmMaterialPesquisa
  Left = 430
  Top = 182
  Width = 1125
  Height = 693
  Caption = 'Materiais'
  PixelsPerInch = 96
  TextHeight = 13
  inherited BvlMain: TBevel
    Width = 1109
  end
  inherited PnlMain: TPanel
    Width = 1109
    inherited BtnSelecionar: TcxButton
      Left = 981
    end
    inherited BtnNovo: TcxButton
      OnClick = BtnNovoClick
    end
    inherited BtnEditar: TcxButton
      OnClick = BtnEditarClick
    end
  end
  inherited PnlTabela: TPanel
    Width = 1109
    Height = 578
    inherited PgCtrlMain: TcxPageControl
      Width = 1101
      Height = 570
      ClientRectBottom = 566
      ClientRectRight = 1097
      inherited TbsPrincipal: TcxTabSheet
        inherited GrpBxPesquisa: TcxGroupBox
          Caption = 'Pesquise o Material'
          Width = 1085
          inherited EdtPesquisa: TcxTextEdit
            Width = 799
          end
          inherited BtnPesquisar: TcxButton
            Left = 1048
          end
        end
        inherited DbgTabela: TcxGrid
          Width = 900
          Height = 465
          inherited DbgTabelaDB: TcxGridDBTableView
            object DbgTabelaDBmat_codigo: TcxGridDBColumn
              DataBinding.FieldName = 'mat_codigo'
              MinWidth = 60
              Options.Filtering = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 60
            end
            object DbgTabelaDBmat_descricao_resumo: TcxGridDBColumn
              DataBinding.FieldName = 'mat_descricao_resumo'
              Options.Filtering = False
              Options.Moving = False
            end
            object DbgTabelaDBmat_referencia: TcxGridDBColumn
              DataBinding.FieldName = 'mat_referencia'
              MinWidth = 100
              Options.Filtering = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 100
            end
            object DbgTabelaDBtip_descricao: TcxGridDBColumn
              DataBinding.FieldName = 'tip_descricao'
              Width = 250
            end
            object DbgTabelaDBgrp_descricao: TcxGridDBColumn
              DataBinding.FieldName = 'grp_descricao'
              Width = 250
            end
            object DbgTabelaDBsgp_descricao: TcxGridDBColumn
              DataBinding.FieldName = 'sgp_descricao'
              Width = 250
            end
            object DbgTabelaDBmat_status: TcxGridDBColumn
              DataBinding.FieldName = 'mat_status'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <
                item
                  Description = 'Inativo'
                  ImageIndex = 0
                  Value = 0
                end
                item
                  Description = 'Ativo'
                  Value = 1
                end
                item
                  Description = 'Emprestado'
                  Value = 2
                end>
              MinWidth = 85
              Options.HorzSizing = False
              Options.Moving = False
              Width = 85
            end
          end
        end
        inherited Pnl: TPanel
          Width = 1085
          inherited ShpTitulo: TShape
            Width = 1083
          end
          inherited LblDados: TLabel
            Width = 102
            Caption = 'Dados do Material'
          end
        end
        object pnlDadosTabela: TPanel
          Left = 900
          Top = 68
          Width = 185
          Height = 465
          Align = alRight
          BevelOuter = bvNone
          BorderWidth = 4
          TabOrder = 3
          object Bevel1: TBevel
            Left = 4
            Top = 57
            Width = 177
            Height = 4
            Align = alTop
            Shape = bsSpacer
          end
          object Bevel2: TBevel
            Left = 4
            Top = 177
            Width = 177
            Height = 4
            Align = alTop
            Shape = bsSpacer
          end
          object GrpBxTipoCusto: TcxGroupBox
            Left = 4
            Top = 4
            Align = alTop
            Caption = 'Tipo Custo'
            TabOrder = 0
            Height = 53
            Width = 177
            object cxDBCheckBox1: TcxDBCheckBox
              Left = 8
              Top = 24
              TabStop = False
              Caption = 'Direto'
              DataBinding.DataField = 'mat_custo_direto'
              DataBinding.DataSource = DtsMaster
              Properties.ReadOnly = True
              Properties.ValueChecked = '1'
              Properties.ValueUnchecked = '0'
              TabOrder = 0
              Transparent = True
              Width = 73
            end
            object cxDBCheckBox2: TcxDBCheckBox
              Left = 88
              Top = 24
              TabStop = False
              Caption = 'Indireto'
              DataBinding.DataField = 'mat_custo_indireto'
              DataBinding.DataSource = DtsMaster
              Properties.ReadOnly = True
              Properties.ValueChecked = '1'
              Properties.ValueUnchecked = '0'
              TabOrder = 1
              Transparent = True
              Width = 73
            end
          end
          object GrpBxCustoMedio: TcxGroupBox
            Left = 4
            Top = 61
            Align = alTop
            Caption = 'Custo M'#233'dio (R$)'
            TabOrder = 1
            Height = 116
            Width = 177
            object lblCustoCP: TcxLabel
              Left = 16
              Top = 24
              Caption = 'Custo Inteiro (Compra)'
              FocusControl = dbCustoCP
            end
            object dbCustoCP: TcxDBTextEdit
              Left = 16
              Top = 40
              TabStop = False
              DataBinding.DataField = 'mat_valor_custo_int'
              DataBinding.DataSource = DtsMaster
              Properties.ReadOnly = True
              TabOrder = 1
              Width = 145
            end
            object lblCustoCS: TcxLabel
              Left = 16
              Top = 64
              Caption = 'Custo Fracionado (Consumo)'
              FocusControl = dbCustoCS
            end
            object dbCustoCS: TcxDBTextEdit
              Left = 16
              Top = 80
              TabStop = False
              DataBinding.DataField = 'mat_valor_custo_frc'
              DataBinding.DataSource = DtsMaster
              Properties.ReadOnly = True
              TabOrder = 3
              Width = 145
            end
          end
          object GrpBxHistorico: TcxGroupBox
            Left = 4
            Top = 181
            Align = alTop
            Caption = 'Hist'#243'rico'
            TabOrder = 2
            Height = 116
            Width = 177
            object lblDataCadastro: TcxLabel
              Left = 16
              Top = 24
              Caption = 'Data cadastro'
              FocusControl = dbDataCadastro
            end
            object dbDataCadastro: TcxDBTextEdit
              Left = 16
              Top = 40
              TabStop = False
              DataBinding.DataField = 'mat_data_cadastro'
              DataBinding.DataSource = DtsMaster
              Properties.ReadOnly = True
              TabOrder = 1
              Width = 145
            end
            object lblDataUltimaCompra: TcxLabel
              Left = 16
              Top = 64
              Caption = 'Data '#250'ltima compra'
              FocusControl = dbDataUltimaCompra
            end
            object dbDataUltimaCompra: TcxDBTextEdit
              Left = 16
              Top = 80
              TabStop = False
              DataBinding.DataField = 'mat_ultcompra_data'
              DataBinding.DataSource = DtsMaster
              Properties.ReadOnly = True
              TabOrder = 3
              Width = 145
            end
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
      '  , m.mat_unidade_compra'
      '  , m.mat_unidade_consumo'
      '  , m.mat_fracionador'
      '  , m.mat_cst'
      '  , m.mat_csosn'
      '  , m.mat_ncm_sh'
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
      DisplayLabel = 'C'#243'digo'
      FieldName = 'mat_codigo'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object CdsMastermat_tipo: TSmallintField
      DisplayLabel = 'Tipo'
      FieldName = 'mat_tipo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CdsMastermat_descricao_resumo: TStringField
      DisplayLabel = 'Nome resumido'
      FieldName = 'mat_descricao_resumo'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object CdsMastermat_referencia: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'mat_referencia'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object CdsMastermat_status: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'mat_status'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_grupo: TSmallintField
      DisplayLabel = 'Grupo'
      FieldName = 'mat_grupo'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_subgrupo: TIntegerField
      DisplayLabel = 'Subgrupo'
      FieldName = 'mat_subgrupo'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_custo_direto: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'C. Direto'
      FieldName = 'mat_custo_direto'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_custo_indireto: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'C. Indireto'
      FieldName = 'mat_custo_indireto'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_valor_custo_int: TFMTBCDField
      DisplayLabel = 'VCCP (R$)'
      FieldName = 'mat_valor_custo_int'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.0000'
      Precision = 20
      Size = 4
    end
    object CdsMastermat_valor_custo_frc: TFMTBCDField
      DisplayLabel = 'VCCS (R$)'
      FieldName = 'mat_valor_custo_frc'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.0000'
      Precision = 20
      Size = 4
    end
    object CdsMastermat_valor_venda_int: TFMTBCDField
      DisplayLabel = 'VVCP (R$)'
      FieldName = 'mat_valor_venda_int'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.0000'
      Precision = 20
      Size = 4
    end
    object CdsMastermat_valor_venda_frc: TFMTBCDField
      DisplayLabel = 'VVCS (R$)'
      FieldName = 'mat_valor_venda_frc'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.0000'
      Precision = 20
      Size = 4
    end
    object CdsMastermat_data_cadastro: TDateField
      DisplayLabel = 'D. Cadastro'
      FieldName = 'mat_data_cadastro'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsMastermat_ultcompra_data: TDateField
      DisplayLabel = 'D. '#218'ltima Compra'
      FieldName = 'mat_ultcompra_data'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsMastermat_unidade_compra: TIntegerField
      FieldName = 'mat_unidade_compra'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_unidade_consumo: TIntegerField
      FieldName = 'mat_unidade_consumo'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_fracionador: TFMTBCDField
      FieldName = 'mat_fracionador'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 20
      Size = 4
    end
    object CdsMastermat_cst: TStringField
      FieldName = 'mat_cst'
      Size = 3
    end
    object CdsMastermat_csosn: TStringField
      FieldName = 'mat_csosn'
      Size = 3
    end
    object CdsMastermat_ncm_sh: TStringField
      FieldName = 'mat_ncm_sh'
      Size = 15
    end
    object CdsMastertip_descricao: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tip_descricao'
      ProviderFlags = []
      Size = 100
    end
    object CdsMastergrp_descricao: TStringField
      DisplayLabel = 'Grupo'
      FieldName = 'grp_descricao'
      ProviderFlags = []
      Size = 100
    end
    object CdsMastersgp_descricao: TStringField
      DisplayLabel = 'Subgrupo'
      FieldName = 'sgp_descricao'
      ProviderFlags = []
      Size = 100
    end
  end
end
