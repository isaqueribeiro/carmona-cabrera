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
            TabOrder = 15
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
            TabOrder = 11
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
            TabOrder = 10
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
            Properties.OnButtonClick = dbApresentacaoPropertiesButtonClick
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
            ActivePage = TbsClassificar
            Align = alClient
            LookAndFeel.Kind = lfStandard
            LookAndFeel.NativeStyle = True
            TabOrder = 0
            ClientRectBottom = 195
            ClientRectLeft = 4
            ClientRectRight = 808
            ClientRectTop = 24
            object TbsClassificar: TcxTabSheet
              BorderWidth = 4
              Caption = 'Classifica'#231#227'o'
              ImageIndex = 0
              object GrpBxTipoCusto: TcxGroupBox
                Left = 112
                Top = 0
                Caption = 'Tipo de Custo'
                TabOrder = 0
                Height = 57
                Width = 185
                object ckCustoDireto: TcxDBCheckBox
                  Left = 8
                  Top = 24
                  Caption = 'Direto'
                  DataBinding.DataField = 'mat_custo_direto'
                  DataBinding.DataSource = DtsMaster
                  Properties.ValueChecked = '1'
                  Properties.ValueUnchecked = '0'
                  TabOrder = 0
                  Transparent = True
                  Width = 65
                end
                object ckCustoIndireto: TcxDBCheckBox
                  Left = 96
                  Top = 24
                  Caption = 'Indireto'
                  DataBinding.DataField = 'mat_custo_indireto'
                  DataBinding.DataSource = DtsMaster
                  Properties.ValueChecked = '1'
                  Properties.ValueUnchecked = '0'
                  TabOrder = 1
                  Transparent = True
                  Width = 65
                end
              end
              object lblGrupo: TcxLabel
                Left = 72
                Top = 66
                Caption = 'Grupo'
                FocusControl = dbGrupo
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 105
              end
              object dbGrupo: TcxDBButtonEdit
                Left = 112
                Top = 64
                Hint = 'Pesquisar grupos'#13#10'(Ctrl + Enter)'#13#10#13#10'Limpar'#13#10'(Ctrl + Delete)'
                DataBinding.DataField = 'grp_descricao'
                DataBinding.DataSource = DtsMaster
                ParentShowHint = False
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.ReadOnly = True
                Properties.OnButtonClick = dbGrupoPropertiesButtonClick
                ShowHint = True
                TabOrder = 2
                Width = 449
              end
              object lblSubgrupo: TcxLabel
                Left = 55
                Top = 90
                Caption = 'Subgrupo'
                FocusControl = dbSubgrupo
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 105
              end
              object dbSubgrupo: TcxDBLookupComboBox
                Left = 112
                Top = 88
                DataBinding.DataField = 'mat_subgrupo'
                DataBinding.DataSource = DtsMaster
                Properties.DropDownListStyle = lsFixedList
                Properties.KeyFieldNames = 'sgp_codigo'
                Properties.ListColumns = <
                  item
                    FieldName = 'sgp_descricao'
                  end>
                Properties.ListOptions.ShowHeader = False
                Properties.ListSource = DtsMaterialSubgrupo
                TabOrder = 4
                Width = 449
              end
              object lblUnidadeCompra: TcxLabel
                Left = 7
                Top = 114
                Caption = 'Unidade de Compra'
                FocusControl = dbUnidadeCompra
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 105
              end
              object dbUnidadeCompra: TcxDBLookupComboBox
                Left = 112
                Top = 112
                DataBinding.DataField = 'mat_unidade_compra'
                DataBinding.DataSource = DtsMaster
                Properties.DropDownListStyle = lsFixedList
                Properties.KeyFieldNames = 'und_codigo'
                Properties.ListColumns = <
                  item
                    FieldName = 'und_descricao'
                  end>
                Properties.ListOptions.ShowHeader = False
                Properties.ListSource = DtsUnidade
                TabOrder = 6
                Width = 449
              end
              object lblFracionador: TcxLabel
                Left = 572
                Top = 114
                Caption = 'Fracionador'
                FocusControl = dbFracionador
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 633
              end
              object dbFracionador: TcxDBTextEdit
                Left = 640
                Top = 112
                DataBinding.DataField = 'mat_fracionador'
                DataBinding.DataSource = DtsMaster
                Properties.CharCase = ecUpperCase
                TabOrder = 8
                Width = 121
              end
              object lblUnidadeConsumo: TcxLabel
                Left = 0
                Top = 138
                Caption = 'Unidade de Consumo'
                FocusControl = dbUnidadeConsumo
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 105
              end
              object dbUnidadeConsumo: TcxDBLookupComboBox
                Left = 112
                Top = 136
                DataBinding.DataField = 'mat_unidade_consumo'
                DataBinding.DataSource = DtsMaster
                Properties.DropDownListStyle = lsFixedList
                Properties.KeyFieldNames = 'und_codigo'
                Properties.ListColumns = <
                  item
                    FieldName = 'und_descricao'
                  end>
                Properties.ListOptions.ShowHeader = False
                Properties.ListSource = DtsUnidade
                TabOrder = 10
                Width = 449
              end
              object lblNCM_SH: TcxLabel
                Left = 590
                Top = 138
                Caption = 'NCM/SH'
                FocusControl = dbNCM_SH
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 633
              end
              object dbNCM_SH: TcxDBTextEdit
                Left = 640
                Top = 136
                DataBinding.DataField = 'mat_ncm_sh'
                DataBinding.DataSource = DtsMaster
                Properties.CharCase = ecUpperCase
                TabOrder = 12
                Width = 121
              end
            end
            object TbsTributacao: TcxTabSheet
              BorderWidth = 4
              Caption = 'Tributa'#231#227'o'
              ImageIndex = 1
              object lblAliquotaTipo: TcxLabel
                Left = 40
                Top = 10
                Caption = 'Tipo al'#237'quota'
                FocusControl = dbAliquotaTipo
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 105
              end
              object dbAliquotaTipo: TcxDBImageComboBox
                Left = 112
                Top = 8
                DataBinding.DataField = 'mat_aliquota_tipo'
                DataBinding.DataSource = DtsMaster
                Properties.Items = <
                  item
                    Description = 'ICMS'
                    ImageIndex = 0
                    Value = 0
                  end
                  item
                    Description = 'ISS'
                    Value = 1
                  end>
                TabOrder = 1
                Width = 89
              end
              object lblTributacaoICMS: TcxLabel
                Left = 22
                Top = 34
                Caption = 'Tributa'#231#227'o ICMS'
                FocusControl = dbTributacaoICMS
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 105
              end
              object dbTributacaoICMS: TcxDBLookupComboBox
                Left = 112
                Top = 32
                DataBinding.DataField = 'mat_tributacao_icms'
                DataBinding.DataSource = DtsMaster
                Properties.DropDownListStyle = lsFixedList
                Properties.KeyFieldNames = 'sgp_codigo'
                Properties.ListColumns = <
                  item
                    FieldName = 'sgp_descricao'
                  end>
                Properties.ListOptions.ShowHeader = False
                Properties.ListSource = DtsMaterialSubgrupo
                TabOrder = 9
                Width = 489
              end
              object lblAliquotaOrigem: TcxLabel
                Left = 475
                Top = 10
                Caption = 'Origem'
                FocusControl = dbAliquotaOrigem
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 513
              end
              object dbAliquotaOrigem: TcxDBImageComboBox
                Left = 520
                Top = 8
                DataBinding.DataField = 'mat_aliquota_origem'
                DataBinding.DataSource = DtsMaster
                Properties.Items = <
                  item
                    Description = 'Nacional'
                    ImageIndex = 0
                    Value = 0
                  end
                  item
                    Description = 'Estrangeira - Importa'#231#227'o direta'
                    Value = 1
                  end
                  item
                    Description = 'Estrangeira - Adquirida no mercado interno'
                    Value = 2
                  end>
                TabOrder = 7
                Width = 233
              end
              object lblAliquotaPercentual: TcxLabel
                Left = 208
                Top = 10
                Caption = '% Al'#237'quota'
                FocusControl = dbAliquotaPercentual
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 265
              end
              object dbAliquotaPercentual: TcxDBTextEdit
                Left = 272
                Top = 8
                DataBinding.DataField = 'mat_aliquota'
                DataBinding.DataSource = DtsMaster
                Properties.CharCase = ecUpperCase
                TabOrder = 3
                Width = 49
              end
              object lblCFOP: TcxLabel
                Left = 618
                Top = 34
                Caption = 'CFOP'
                Enabled = False
                FocusControl = dbCFOP
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 649
              end
              object dbCFOP: TcxDBButtonEdit
                Left = 656
                Top = 32
                DataBinding.DataSource = DtsMaster
                Enabled = False
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                TabOrder = 11
                Width = 97
              end
              object lblAliquotaPercentualSN: TcxLabel
                Left = 328
                Top = 10
                Caption = '% Al'#237'quota SN'
                Enabled = False
                FocusControl = dbAliquotaPercentualSN
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 401
              end
              object dbAliquotaPercentualSN: TcxDBTextEdit
                Left = 408
                Top = 8
                DataBinding.DataSource = DtsMaster
                Enabled = False
                Properties.CharCase = ecUpperCase
                TabOrder = 5
                Width = 49
              end
            end
            object TbsSetor: TcxTabSheet
              Caption = 'Setores'
              ImageIndex = 3
            end
            object TbsHistorico: TcxTabSheet
              BorderWidth = 4
              Caption = 'Hist'#243'rico'
              ImageIndex = 2
              object lblDataCadastro: TcxLabel
                Left = 56
                Top = 10
                Caption = 'Data de Cadastro'
                FocusControl = dbDataCadastro
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 145
              end
              object dbDataCadastro: TcxDBTextEdit
                Left = 152
                Top = 8
                DataBinding.DataField = 'mat_data_cadastro'
                DataBinding.DataSource = DtsMaster
                Properties.ReadOnly = True
                Style.Color = 8454143
                TabOrder = 1
                Width = 105
              end
              object lblUltimaCompraData: TcxLabel
                Left = 34
                Top = 34
                Caption = 'Data da '#250'ltima compra'
                FocusControl = dbUltimaCompraData
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 145
              end
              object dbUltimaCompraData: TcxDBTextEdit
                Left = 152
                Top = 32
                DataBinding.DataField = 'mat_ultcompra_data'
                DataBinding.DataSource = DtsMaster
                Properties.ReadOnly = True
                Style.Color = 8454143
                TabOrder = 3
                Width = 105
              end
              object lblUltimaCompraFornecedor: TcxLabel
                Left = 2
                Top = 58
                Caption = 'Fornecedor da '#250'ltima compra'
                FocusControl = d1UltimaCompraFornecedor
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 145
              end
              object d1UltimaCompraFornecedor: TcxDBTextEdit
                Left = 152
                Top = 56
                DataBinding.DataField = 'pes_razao_social'
                DataBinding.DataSource = DtsMaster
                Properties.ReadOnly = True
                Style.Color = 8454143
                TabOrder = 5
                Width = 457
              end
              object d2UltimaCompraFornecedor: TcxDBTextEdit
                Left = 616
                Top = 56
                DataBinding.DataField = 'pes_documento'
                DataBinding.DataSource = DtsMaster
                Properties.ReadOnly = True
                Style.Color = 8454143
                TabOrder = 6
                Width = 145
              end
              object GrpBxCustoMedio: TcxGroupBox
                Left = 152
                Top = 80
                Caption = 'Custo M'#233'dio (R$)'
                TabOrder = 7
                Height = 73
                Width = 297
                object lblValorCustoInteiro: TcxLabel
                  Left = 53
                  Top = 18
                  Caption = 'Inteiro (Compra)'
                  FocusControl = dbValorCustoInteiro
                  Properties.Alignment.Horz = taRightJustify
                  Transparent = True
                  AnchorX = 137
                end
                object dbValorCustoInteiro: TcxDBTextEdit
                  Left = 144
                  Top = 16
                  DataBinding.DataField = 'mat_valor_custo_int'
                  DataBinding.DataSource = DtsMaster
                  Properties.ReadOnly = True
                  Style.Color = 8454143
                  TabOrder = 1
                  Width = 145
                end
                object lblValorCustoFrac: TcxLabel
                  Left = 25
                  Top = 42
                  Caption = 'Fracionado (Consumo)'
                  FocusControl = dbValorCustoFrac
                  Properties.Alignment.Horz = taRightJustify
                  Transparent = True
                  AnchorX = 137
                end
                object dbValorCustoFrac: TcxDBTextEdit
                  Left = 144
                  Top = 40
                  DataBinding.DataField = 'mat_valor_custo_frc'
                  DataBinding.DataSource = DtsMaster
                  Properties.ReadOnly = True
                  Style.Color = 8454143
                  TabOrder = 3
                  Width = 145
                end
              end
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
      '  , m.mat_aliquota_origem'
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
      Alignment = taLeftJustify
      FieldName = 'mat_grupo'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_subgrupo: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'mat_subgrupo'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_unidade_compra: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'mat_unidade_compra'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_unidade_consumo: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'mat_unidade_consumo'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_fracionador: TFMTBCDField
      FieldName = 'mat_fracionador'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.0000'
      Precision = 20
      Size = 4
    end
    object CdsMastermat_custo_direto: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'mat_custo_direto'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_custo_indireto: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'mat_custo_indireto'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_aliquota_tipo: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'mat_aliquota_tipo'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMastermat_aliquota: TFMTBCDField
      FieldName = 'mat_aliquota'
      ProviderFlags = [pfInUpdate]
      Precision = 17
      Size = 2
    end
    object CdsMastermat_aliquota_origem: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'mat_aliquota_origem'
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
    Left = 224
    Top = 240
  end
  object DspMaterialTipo: TDataSetProvider
    DataSet = QryMaterialTipo
    Left = 256
    Top = 240
  end
  object CdsMaterialTipo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspMaterialTipo'
    Left = 288
    Top = 240
  end
  object DtsMaterialTipo: TDataSource
    DataSet = CdsMaterialTipo
    Left = 320
    Top = 240
  end
  object QryMaterialSubgrupo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select'
      '    s.sgp_codigo'
      '  , s.sgp_descricao'
      '  , s.sgp_grupo'
      'from str_material_subgrupo s'
      'order by '
      '    s.sgp_grupo'
      '  , s.sgp_descricao')
    SQLConnection = FrmLogin.conWebMaster
    Left = 224
    Top = 272
  end
  object DspMaterialSubgrupo: TDataSetProvider
    DataSet = QryMaterialSubgrupo
    Left = 256
    Top = 272
  end
  object CdsMaterialSubgrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspMaterialSubgrupo'
    Left = 288
    Top = 272
  end
  object DtsMaterialSubgrupo: TDataSource
    DataSet = CdsMaterialSubgrupo
    Left = 320
    Top = 272
  end
  object QryUnidade: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select'
      '    u.und_codigo'
      '  , u.und_descricao'
      'from str_unidade u'
      'order by '
      '    u.und_descricao')
    SQLConnection = FrmLogin.conWebMaster
    Left = 352
    Top = 240
  end
  object DspUnidade: TDataSetProvider
    DataSet = QryUnidade
    Left = 384
    Top = 240
  end
  object CdsUnidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspUnidade'
    Left = 416
    Top = 240
  end
  object DtsUnidade: TDataSource
    DataSet = CdsUnidade
    Left = 448
    Top = 240
  end
end
