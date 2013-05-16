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
          object cxLabel1: TcxLabel
            Left = 55
            Top = 50
            Caption = 'Descri'#231#227'o'
            FocusControl = cxDBTextEdit1
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object cxDBTextEdit1: TcxDBTextEdit
            Left = 112
            Top = 48
            DataBinding.DataSource = DtsMaster
            Properties.CharCase = ecUpperCase
            TabOrder = 5
            Width = 449
          end
          object dbTipo: TcxDBLookupComboBox
            Left = 232
            Top = 24
            DataBinding.DataSource = DtsMaster
            Properties.DropDownListStyle = lsFixedList
            Properties.ListColumns = <>
            TabOrder = 3
            Width = 329
          end
          object cxLabel2: TcxLabel
            Left = 34
            Top = 74
            Caption = 'Apresenta'#231#227'o'
            FocusControl = cxDBTextEdit2
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object cxDBTextEdit2: TcxDBTextEdit
            Left = 112
            Top = 72
            DataBinding.DataSource = DtsMaster
            Properties.CharCase = ecUpperCase
            TabOrder = 7
            Width = 449
          end
          object cxLabel3: TcxLabel
            Left = 37
            Top = 122
            Caption = 'Especifica'#231#227'o'
            FocusControl = cxDBTextEdit3
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object cxDBTextEdit3: TcxDBMemo
            Left = 112
            Top = 120
            DataBinding.DataSource = DtsMaster
            Properties.MaxLength = 250
            TabOrder = 9
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
            TabOrder = 11
            Width = 121
          end
          object cxLabel4: TcxLabel
            Left = 25
            Top = 98
            Caption = 'Nome Resumido'
            FocusControl = cxDBTextEdit4
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object cxDBTextEdit4: TcxDBTextEdit
            Left = 112
            Top = 96
            DataBinding.DataSource = DtsMaster
            Properties.CharCase = ecUpperCase
            TabOrder = 13
            Width = 449
          end
          object cxLabel5: TcxLabel
            Left = 577
            Top = 74
            Caption = 'Refer'#234'ncia'
            FocusControl = cxDBTextEdit5
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 633
          end
          object cxDBTextEdit5: TcxDBTextEdit
            Left = 640
            Top = 72
            DataBinding.DataSource = DtsMaster
            Properties.CharCase = ecUpperCase
            TabOrder = 15
            Width = 121
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
        end
      end
    end
  end
  inherited QryMaster: TSQLQuery
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
      '  , d.des_descricao'
      '  , a.apr_descricao'
      'from str_material m'
      '  left join str_material_tipo t on (t.tip_codigo = m.mat_tipo)'
      
        '  left join str_material_descricao d on (d.des_codigo = m.mat_de' +
        'scricao)'
      
        '  left join str_material_apresentacao a on (a.apr_codigo = m.mat' +
        '_apresentacao)')
  end
end
