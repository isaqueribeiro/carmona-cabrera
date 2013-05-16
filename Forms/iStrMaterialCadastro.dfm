inherited FrmMaterialCadastro: TFrmMaterialCadastro
  Caption = 'Cadastro do Material'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTabela: TPanel
    inherited PgCtrlMain: TcxPageControl
      inherited TbsPrincipal: TcxTabSheet
        object Bevel1: TBevel [0]
          Left = 0
          Top = 217
          Width = 816
          Height = 4
          Align = alTop
          Shape = bsSpacer
        end
        inherited GrpDadosNominais: TcxGroupBox
          Height = 217
          object lblCodigo: TcxLabel
            Left = 68
            Top = 26
            Caption = 'C'#243'digo'
            FocusControl = dbCodigo
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object dbCodigo: TcxDBTextEdit
            Left = 112
            Top = 24
            DataBinding.DataField = 'mat_codigo'
            DataBinding.DataSource = DtsMaster
            Properties.ReadOnly = True
            Style.Color = 8454143
            TabOrder = 1
            Width = 73
          end
          object lblTipo: TcxLabel
            Left = 202
            Top = 26
            Caption = 'Tipo'
            FocusControl = dbTipo
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 226
          end
          object lblDescricao: TcxLabel
            Left = 55
            Top = 50
            Caption = 'Descri'#231#227'o'
            FocusControl = dbDescricao
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object dbTipo: TcxDBLookupComboBox
            Left = 232
            Top = 24
            DataBinding.DataField = 'mat_tipo'
            DataBinding.DataSource = DtsMaster
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'tip_codigo'
            Properties.ListColumns = <
              item
                FieldName = 'tip_descricao'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DtsMaterialTipo
            TabOrder = 3
            Width = 329
          end
          object lblApresentacao: TcxLabel
            Left = 34
            Top = 74
            Caption = 'Apresenta'#231#227'o'
            FocusControl = dbApresentacao
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object lblEspecificacao: TcxLabel
            Left = 37
            Top = 122
            Caption = 'Especifica'#231#227'o'
            FocusControl = dbEspecificacao
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object dbEspecificacao: TcxDBMemo
            Left = 112
            Top = 120
            DataBinding.DataField = 'mat_especificacao'
            DataBinding.DataSource = DtsMaster
            Properties.CharCase = ecUpperCase
            Properties.MaxLength = 250
            TabOrder = 11
            Height = 81
            Width = 649
          end
          object lblSituacao: TcxLabel
            Left = 588
            Top = 26
            Caption = 'Situa'#231#227'o'
            FocusControl = dbSituacao
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 633
          end
          object dbSituacao: TcxDBImageComboBox
            Left = 640
            Top = 24
            DataBinding.DataField = 'mat_status'
            DataBinding.DataSource = DtsMaster
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
            TabOrder = 5
            Width = 121
          end
          object lblNomeResumido: TcxLabel
            Left = 25
            Top = 98
            Caption = 'Nome Resumido'
            FocusControl = dbNomeResumido
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object dbNomeResumido: TcxDBTextEdit
            Left = 112
            Top = 96
            DataBinding.DataField = 'mat_descricao_resumo'
            DataBinding.DataSource = DtsMaster
            Properties.CharCase = ecUpperCase
            TabOrder = 13
            Width = 449
          end
          object lblReferencia: TcxLabel
            Left = 577
            Top = 74
            Caption = 'Refer'#234'ncia'
            FocusControl = dbReferencia
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 633
          end
          object dbReferencia: TcxDBTextEdit
            Left = 640
            Top = 72
            DataBinding.DataField = 'mat_referencia'
            DataBinding.DataSource = DtsMaster
            Properties.CharCase = ecUpperCase
            TabOrder = 15
            Width = 121
          end
          object dbDescricao: TcxDBButtonEdit
            Left = 112
            Top = 48
            Hint = 'Pesquisar descri'#231#245'es'#13#10'(Ctrl + Enter)'#13#10#13#10'Limpar'#13#10'(Ctrl + Delete)'
            DataBinding.DataField = 'des_descricao'
            DataBinding.DataSource = DtsMaster
            ParentShowHint = False
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.ReadOnly = True
            Properties.OnButtonClick = dbDescricaoPropertiesButtonClick
            ShowHint = True
            TabOrder = 7
            Width = 449
          end
          object dbApresentacao: TcxDBButtonEdit
            Left = 112
            Top = 72
            Hint = 
              'Pesquisar apresenta'#231#245'es'#13#10'(Ctrl + Enter)'#13#10#13#10'Limpar'#13#10'(Ctrl + Delet' +
              'e)'
            DataBinding.DataField = 'apr_descricao'
            DataBinding.DataSource = DtsMaster
            ParentShowHint = False
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.ReadOnly = True
            ShowHint = True
            TabOrder = 9
            Width = 449
          end
        end
        object GrpDadosAdcionais: TcxGroupBox
          Left = 0
          Top = 221
          Align = alClient
          Caption = 'Dados Adicionais'
          Style.LookAndFeel.Kind = lfStandard
          StyleDisabled.LookAndFeel.Kind = lfStandard
          StyleFocused.LookAndFeel.Kind = lfStandard
          StyleHot.LookAndFeel.Kind = lfStandard
          TabOrder = 1
          Height = 219
          Width = 816
          object PgCtrlDadosAdcionais: TcxPageControl
            Left = 2
            Top = 18
            Width = 812
            Height = 199
            ActivePage = cxTabSheet3
            Align = alClient
            TabOrder = 0
            ClientRectBottom = 195
            ClientRectLeft = 4
            ClientRectRight = 808
            ClientRectTop = 24
            object cxTabSheet1: TcxTabSheet
              Caption = 'cxTabSheet1'
              ImageIndex = 0
            end
            object cxTabSheet2: TcxTabSheet
              Caption = 'cxTabSheet2'
              ImageIndex = 1
            end
            object cxTabSheet3: TcxTabSheet
              Caption = 'cxTabSheet3'
              ImageIndex = 2
            end
          end
        end
      end
    end
  end
  inherited QryMaster: TSQLQuery
    Params = <
      item
        DataType = ftCurrency
        Name = 'mat_codigo'
        ParamType = ptInput
        Value = 0c
      end>
    SQL.Strings = (
      'Select'
      '    m.mat_codigo'
      '  , m.mat_tipo'
      '  , m.mat_descricao'
      '  , m.mat_apresentacao'
      '  , m.mat_descricao_resumo'
      '  , m.mat_especificacao'
      '  , m.mat_referencia'
      '  , m.mat_status'
      '  , m.mat_grupo'
      '  , m.mat_subgrupo'
      '  , m.mat_unidade_compra'
      '  , m.mat_unidade_consumo'
      '  , m.mat_fracionador'
      '  , m.mat_custo_direto'
      '  , m.mat_custo_indireto'
      '  , m.mat_aliquota_tipo'
      '  , m.mat_aliquota'
      '  , m.mat_tributacao_icms'
      '  , m.mat_tributacao_pis'
      '  , m.mat_tributacao_cofins'
      '  , m.mat_cst'
      '  , m.mat_csosn'
      '  , m.mat_ncm_sh'
      '  , m.mat_aliquota_pis'
      '  , m.mat_aliquota_cofins'
      '  , m.mat_valor_custo_int'
      '  , m.mat_valor_custo_frc'
      '  , m.mat_valor_venda_int'
      '  , m.mat_valor_venda_frc'
      '  , m.mat_data_cadastro'
      '  , m.mat_ultcompra_data'
      '  , m.mat_ultcompra_forn'
      '  , m.mat_log_insert'
      '  , m.mat_log_update'
      '  , m.mat_log_inactive'
      '  , t.tip_descricao'
      '  , g.grp_descricao'
      '  , s.sgp_descricao'
      '  , d.des_descricao'
      '  , a.apr_descricao'
      '  , f.pes_razao_social'
      '  , f.pes_documento'
      'from str_material m'
      '  left join str_material_tipo t on (t.tip_codigo = m.mat_tipo)'
      
        '  left join str_material_descricao d on (d.des_codigo = m.mat_de' +
        'scricao)'
      
        '  left join str_material_apresentacao a on (a.apr_codigo = m.mat' +
        '_apresentacao)'
      '  left join str_material_grupo g on (g.grp_codigo = m.mat_grupo)'
      
        '  left join str_material_subgrupo s on (s.sgp_codigo = m.mat_sub' +
        'grupo)'
      
        '  left join mny_pessoa f on (f.pes_codigo = m.mat_ultcompra_forn' +
        ')'
      'where m.mat_codigo = :mat_codigo')
  end
  inherited CdsMaster: TClientDataSet
    Params = <
      item
        DataType = ftCurrency
        Name = 'mat_codigo'
        ParamType = ptInput
        Value = 0c
      end>
    OnNewRecord = CdsMasterNewRecord
    object CdsMastermat_codigo: TFMTBCDField
      FieldName = 'mat_codigo'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object CdsMastermat_tipo: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'mat_tipo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CdsMastermat_descricao: TIntegerField
      FieldName = 'mat_descricao'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_apresentacao: TIntegerField
      FieldName = 'mat_apresentacao'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_descricao_resumo: TStringField
      FieldName = 'mat_descricao_resumo'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object CdsMastermat_especificacao: TStringField
      FieldName = 'mat_especificacao'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object CdsMastermat_referencia: TStringField
      FieldName = 'mat_referencia'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object CdsMastermat_status: TSmallintField
      Alignment = taLeftJustify
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
      Precision = 20
      Size = 4
    end
    object CdsMastermat_custo_direto: TSmallintField
      FieldName = 'mat_custo_direto'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_custo_indireto: TSmallintField
      FieldName = 'mat_custo_indireto'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_aliquota_tipo: TSmallintField
      FieldName = 'mat_aliquota_tipo'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_aliquota: TFMTBCDField
      FieldName = 'mat_aliquota'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object CdsMastermat_tributacao_icms: TStringField
      FieldName = 'mat_tributacao_icms'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object CdsMastermat_tributacao_pis: TStringField
      FieldName = 'mat_tributacao_pis'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object CdsMastermat_tributacao_cofins: TStringField
      FieldName = 'mat_tributacao_cofins'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object CdsMastermat_cst: TStringField
      FieldName = 'mat_cst'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object CdsMastermat_csosn: TStringField
      FieldName = 'mat_csosn'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object CdsMastermat_ncm_sh: TStringField
      FieldName = 'mat_ncm_sh'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object CdsMastermat_aliquota_pis: TFMTBCDField
      FieldName = 'mat_aliquota_pis'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object CdsMastermat_aliquota_cofins: TFMTBCDField
      FieldName = 'mat_aliquota_cofins'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
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
    object CdsMastermat_ultcompra_forn: TIntegerField
      FieldName = 'mat_ultcompra_forn'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_log_insert: TStringField
      FieldName = 'mat_log_insert'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object CdsMastermat_log_update: TStringField
      FieldName = 'mat_log_update'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object CdsMastermat_log_inactive: TStringField
      FieldName = 'mat_log_inactive'
      ProviderFlags = [pfInUpdate]
      Size = 150
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
    object CdsMasterdes_descricao: TStringField
      FieldName = 'des_descricao'
      ProviderFlags = []
      Size = 100
    end
    object CdsMasterapr_descricao: TStringField
      FieldName = 'apr_descricao'
      ProviderFlags = []
      Size = 100
    end
    object CdsMasterpes_razao_social: TStringField
      FieldName = 'pes_razao_social'
      ProviderFlags = []
      Size = 200
    end
    object CdsMasterpes_documento: TStringField
      FieldName = 'pes_documento'
      ProviderFlags = []
    end
  end
  object QryMaterialTipo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select'
      '    t.tip_codigo'
      '  , t.tip_descricao'
      'from str_material_tipo t'
      'order by '
      '    t.tip_descricao')
    SQLConnection = FrmLogin.conWebMaster
    Left = 592
    Top = 408
  end
  object DspMaterialTipo: TDataSetProvider
    DataSet = QryMaterialTipo
    Left = 624
    Top = 408
  end
  object CdsMaterialTipo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspMaterialTipo'
    Left = 656
    Top = 408
  end
  object DtsMaterialTipo: TDataSource
    DataSet = CdsMaterialTipo
    Left = 688
    Top = 408
  end
end
