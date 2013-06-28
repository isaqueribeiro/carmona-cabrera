inherited FrmMovimentoEntradaPesquisa: TFrmMovimentoEntradaPesquisa
  Left = 465
  Width = 1137
  Height = 694
  Caption = 'Movimentos de Entrada no Almoxarifado'
  PixelsPerInch = 96
  TextHeight = 13
  inherited BvlMain: TBevel
    Width = 1121
  end
  inherited PnlMain: TPanel
    Width = 1121
    inherited BtnSelecionar: TcxButton
      Left = 993
    end
    inherited BtnNovo: TcxButton
      OnClick = BtnNovoClick
    end
    inherited BtnEditar: TcxButton
      OnClick = BtnEditarClick
    end
  end
  inherited PnlTabela: TPanel
    Width = 1121
    Height = 579
    inherited PgCtrlMain: TcxPageControl
      Width = 1113
      Height = 571
      ClientRectBottom = 567
      ClientRectRight = 1109
      inherited TbsPrincipal: TcxTabSheet
        inherited GrpBxPesquisa: TcxGroupBox
          Caption = 'Pesquise o Movimento de Entrada'
          Width = 1097
          inherited EdtPesquisa: TcxTextEdit
            Left = 440
            TabOrder = 3
            Width = 618
          end
          inherited BtnPesquisar: TcxButton
            Left = 1060
            TabOrder = 4
          end
          inherited CmbTipoPesquisa: TcxImageComboBox
            Enabled = True
            Properties.Items = <
              item
                Description = 'Per'#237'odo, Autom'#225'tica'
                ImageIndex = 18
                Value = 0
              end
              item
                Description = 'Per'#237'odo, Unidade de Neg'#243'cio'
                ImageIndex = 30
                Value = 1
              end
              item
                Description = 'Per'#237'odo, Fornecedor'
                ImageIndex = 30
                Value = 2
              end
              item
                Description = 'Per'#237'odo, Status'
                ImageIndex = 30
                Value = 3
              end
              item
                Description = 'Data Emiss'#227'o, Fornecedor'
                ImageIndex = 30
                Value = 4
              end>
          end
          object edDataInicio: TcxDateEdit
            Left = 248
            Top = 18
            EditValue = 0d
            TabOrder = 1
            Width = 89
          end
          object edDataFinal: TcxDateEdit
            Left = 344
            Top = 18
            EditValue = 0d
            TabOrder = 2
            Width = 89
          end
        end
        inherited DbgTabela: TcxGrid
          Width = 1097
          Height = 466
          inherited DbgTabelaDB: TcxGridDBTableView
            object DbgTabelaDBCodigo: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'Codigo'
              MinWidth = 80
              Options.Filtering = False
              Options.HorzSizing = False
              Width = 80
            end
            object DbgTabelaDBpes_razao_social: TcxGridDBColumn
              Caption = 'Fornecedor'
              DataBinding.FieldName = 'pes_razao_social'
              Width = 350
            end
            object DbgTabelaDBent_doc_numero: TcxGridDBColumn
              Caption = 'No. Documento'
              DataBinding.FieldName = 'ent_doc_numero'
              MinWidth = 85
              Options.Filtering = False
              Options.HorzSizing = False
              Width = 85
            end
            object DbgTabelaDBent_data: TcxGridDBColumn
              Caption = 'Inser'#231#227'o'
              DataBinding.FieldName = 'ent_data'
              MinWidth = 65
              Options.Filtering = False
              Options.HorzSizing = False
              Width = 65
            end
            object DbgTabelaDBent_doc_emissao: TcxGridDBColumn
              Caption = 'Emiss'#227'o'
              DataBinding.FieldName = 'ent_doc_emissao'
              MinWidth = 65
              Options.Filtering = False
              Options.HorzSizing = False
              Width = 65
            end
            object DbgTabelaDBent_valor_nota: TcxGridDBColumn
              Caption = 'Valor (R$)'
              DataBinding.FieldName = 'ent_valor_nota'
              MinWidth = 80
              Options.Filtering = False
              Options.HorzSizing = False
              Width = 80
            end
            object DbgTabelaDBent_status: TcxGridDBColumn
              Caption = 'Situa'#231#227'o'
              DataBinding.FieldName = 'ent_status'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Images = ImgStatus
              Properties.Items = <
                item
                  Description = 'Aberto'
                  ImageIndex = 0
                  Value = 0
                end
                item
                  Description = 'Encerrado'
                  ImageIndex = 1
                  Value = 1
                end
                item
                  Description = 'Cancelado'
                  ImageIndex = 2
                  Value = 2
                end>
              MinWidth = 100
              Options.HorzSizing = False
              Width = 100
            end
            object DbgTabelaDBent_usuario_fechamento: TcxGridDBColumn
              Caption = 'Usu'#225'rio'
              DataBinding.FieldName = 'ent_usuario_fechamento'
              MinWidth = 150
              Options.HorzSizing = False
              Width = 150
            end
            object DbgTabelaDBent_mov_codigo: TcxGridDBColumn
              Caption = 'Financeiro'
              DataBinding.FieldName = 'ent_mov_codigo'
              MinWidth = 60
              Options.Filtering = False
              Options.HorzSizing = False
              Width = 60
            end
            object DbgTabelaDBuni_nome: TcxGridDBColumn
              Caption = 'Unidade de Neg'#243'cio'
              DataBinding.FieldName = 'uni_nome'
              MinWidth = 150
              Options.HorzSizing = False
              Width = 150
            end
          end
        end
        inherited Pnl: TPanel
          Width = 1097
          inherited ShpTitulo: TShape
            Width = 1095
          end
          inherited LblDados: TLabel
            Width = 183
            Caption = 'Dados do Movimento de Entrada'
          end
        end
      end
    end
  end
  inherited QryMaster: TSQLQuery
    SQL.Strings = (
      'Select'
      '    me.ent_ano'
      '  , me.ent_codigo'
      '  , me.ent_pessoa'
      '  , me.ent_doc_tipo'
      '  , me.ent_doc_numero'
      '  , me.ent_doc_serie'
      '  , me.ent_doc_emissao'
      '  , me.ent_valor_nota'
      '  , me.ent_data'
      '  , me.ent_hora'
      '  , me.ent_unidade_neg'
      '  , me.ent_obs'
      '  , me.ent_status'
      '  , me.ent_usuario_abertura'
      '  , me.ent_usuario_fechamento'
      '  , me.ent_log_insert'
      '  , me.ent_log_update'
      '  , me.ent_log_inactive'
      '  , me.ent_mov_codigo'
      '  , un.uni_nome'
      '  , ps.pes_razao_social'
      '  , ps.pes_nome_fantasia'
      '  , td.tip_nome'
      '  , Case me.ent_status'
      '      when 0 then '#39'Aberta'#39
      '      when 1 then '#39'Encerrada'#39
      '      when 2 then '#39'Cancelada'#39
      '    end as ent_status_desc'
      'from str_entrada me'
      
        '  inner join mny_unidade un on (un.uni_codigo = me.ent_unidade_n' +
        'eg)'
      '  inner join mny_pessoa ps on (ps.pes_codigo = me.ent_pessoa)'
      
        '  inner join mny_tipo_documento td on (td.tip_codigo = me.ent_do' +
        'c_tipo)')
  end
  inherited CdsMaster: TClientDataSet
    OnCalcFields = CdsMasterCalcFields
    object CdsMasterent_ano: TSmallintField
      FieldName = 'ent_ano'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object CdsMasterent_codigo: TFMTBCDField
      FieldName = 'ent_codigo'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object CdsMasterent_pessoa: TIntegerField
      FieldName = 'ent_pessoa'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CdsMasterent_doc_tipo: TSmallintField
      FieldName = 'ent_doc_tipo'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMasterent_doc_numero: TStringField
      FieldName = 'ent_doc_numero'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object CdsMasterent_doc_serie: TStringField
      FieldName = 'ent_doc_serie'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object CdsMasterent_doc_emissao: TDateField
      FieldName = 'ent_doc_emissao'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMasterent_valor_nota: TFMTBCDField
      FieldName = 'ent_valor_nota'
      ProviderFlags = [pfInUpdate]
      EditFormat = ',0.00'
      Precision = 20
      Size = 4
    end
    object CdsMasterent_data: TDateField
      FieldName = 'ent_data'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMasterent_hora: TTimeField
      FieldName = 'ent_hora'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMasterent_unidade_neg: TSmallintField
      FieldName = 'ent_unidade_neg'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CdsMasterent_obs: TMemoField
      FieldName = 'ent_obs'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object CdsMasterent_status: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'ent_status'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMasterent_usuario_abertura: TStringField
      FieldName = 'ent_usuario_abertura'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object CdsMasterent_usuario_fechamento: TStringField
      FieldName = 'ent_usuario_fechamento'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object CdsMasterent_log_insert: TStringField
      FieldName = 'ent_log_insert'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object CdsMasterent_log_update: TStringField
      FieldName = 'ent_log_update'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object CdsMasterent_log_inactive: TStringField
      FieldName = 'ent_log_inactive'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object CdsMasterent_mov_codigo: TIntegerField
      DisplayLabel = 'Mov. Financeiro'
      FieldName = 'ent_mov_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMasteruni_nome: TStringField
      FieldName = 'uni_nome'
      ProviderFlags = []
      Size = 60
    end
    object CdsMasterpes_razao_social: TStringField
      FieldName = 'pes_razao_social'
      ProviderFlags = []
      Size = 200
    end
    object CdsMasterpes_nome_fantasia: TStringField
      FieldName = 'pes_nome_fantasia'
      ProviderFlags = []
      Size = 100
    end
    object CdsMastertip_nome: TStringField
      FieldName = 'tip_nome'
      ProviderFlags = []
      Size = 60
    end
    object CdsMasterent_status_desc: TStringField
      FieldName = 'ent_status_desc'
      ProviderFlags = []
      Size = 9
    end
    object CdsMasterCodigo: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'Codigo'
      ProviderFlags = []
    end
  end
  object ImgStatus: TImageList
    Left = 24
    Top = 530
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000063493500634935006349
      3500634935006349350063493500634935006349350063493500634935006349
      3500634935006349350063493500634935000000000063493500634935006349
      3500634935006349350063493500634935006349350063493500634935006349
      3500634935006349350063493500634935000000000063493500634935006349
      3500634935006349350063493500634935006349350063493500634935006349
      3500634935006349350063493500634935000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B8A39400FDFAF800D7D2D000BF97
      7900D6CDC800D6CBC400BF977900D5C4BA00D4C1B500BF977900D2BBAC00D2B9
      A800BF977900D0B4A100D0B19D0063493500B8A39400FDFAF800D7D2D000BF97
      7900D6CDC800D6CBC400BF977900D5C4BA00D4C1B500BF977900D2BBAC00D2B9
      A800BF977900D0B4A100D0B19D0063493500B8A39400FDFAF800D7D2D000BF97
      7900D6CDC800D6CBC400BF977900D5C4BA00D4C1B500BF977900D2BBAC00D2B9
      A800BF977900D0B4A100D0B19D00634935000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BAA49500FEFCFB00FDFAF800CDA3
      8500FCF5F000FBF1EB00CDA38500FAEAE100FAE6DB00CFA78A00F8E0D100F8DE
      CD00CDA38500F6D6C100D1B4A10063493500BAA49500FEFCFB00FDFAF800CDA3
      8500FCF5F000FBF1EB00CDA38500FAEAE100FAE6DB00CDA38500F8E0D000F8DC
      CB00CDA38500F6D6C100D1B4A10063493500BAA49500FEFCFB00FDFAF800CDA3
      8500FCF5F000FBF1EB00CDA38500FAEAE100FAE6DB00CDA38500F8E0D000F8DC
      CB00CDA38500F6D6C300D1B6A300664E3A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BCA79800CDA38500BF977A00B28B
      6F00CDA38500BF977A00B28B6F00CDA38500C19B8000D9C4B600E8D2CB00E6D6
      CB00E1D3C800ECDDD200C4A0860063493500BCA79800CDA38500BF977A00B28B
      6F00CDA38500C0987B00B28B6F00CDA38500BF977A00B28B6F00CDA38500BF97
      7A00B28B6F00CDA38500BF977A0063493500BCA79800CDA38500BF977A00B28B
      6F00CDA38500C0997C00B48D7100CDA58700BF977A00B28B6F00CDA38500BF97
      7A00B28D7100D4B39A00C5A692007D685B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BEA89A00FEFEFE00FEFEFE00BF97
      7900FDFAF800FDF7F400BF977900FBF1EA00F9F1EA00E6D7D000CF6AB400A717
      940074074B00F7EAE700DAC7BC00644A3600BEA89A00FEFEFE00FEFEFE00C098
      7B00FDFAF800FCF7F400DFCCBE00F9F4F100F9F3EF00DCC9BB00FAE7DA00F9E4
      D700BF977900F8DBCA00D1B8A80063493500BEA89A00FEFEFE00FEFEFE00BF97
      7900FCF9F700FDFBF900E1D3C800FCF8F500FAF0E800C7A38800FAE9DE00F9E3
      D500CCAE9600F9EDE900CDC7D700B7AEAF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0AB9C00FEFEFE00FEFEFE00CDA3
      8500FEFCFC00FEFAF800CDA38500FDF4F000FAF4F100EDD8DF00C7A0BD00CD6A
      C400C869B800F2D6E300DDCDC400684F3C00C0AB9C00FEFEFE00FEFEFE00D4B1
      9700FEFCFC00FBF9F900E7D1C300D8BAAB00E9D3C300EEDED300FAEFE800FBEA
      DF00CFA68A00F9E0D000D2BAAD0063493500C0AB9C00FEFEFE00FEFEFE00D2AD
      9200FCFBFB00E8E9FC001734F300E7E6F900FCF8F500DCC2AE00FBEEE600FAEF
      E800E8D8CF00D2CDE4001A29B8009A94AC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C2AE9E00CDA38500BF977A00B28B
      6F00CDA38500BF977A00B28B6F00CDA38500CEB19B00E9DED800EFDCDF00DDB1
      C900E2D3C900EFE1D700CFB29D00735B4900C2AE9E00CDA38500C29C8100CFB9
      A700E8D6C800E2D0C300AB715400904A2700B9795800DEC9BA00EEE0D500D5B8
      A300BE9D8500CEA48600BF977A0063493500C2AE9E00CDA38500BF977A00C0A1
      8A00DDD2D6005164F1000F31FF001A37FB00D1C4CA00E3D4CA00E0CAB900E2D3
      C900BEB2C2003542C7000014BD00091AB2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C5AFA000FEFEFE00FEFEFE00BF97
      7900FEFEFE00FEFEFE00BF977900FDFAF800FBF8F500DDCAC300C35FAA00AC3F
      91007D0B5200FCF4F100EAE2DD00907E6F00C5AFA000FEFEFE00FCFCFC00E5D6
      CA00F2E7E3009D573400CE744800CC734600AF5D3700C0906F00FBF8F700FBF9
      F800D7BCA800FAE9DF00D4C1B50063493500C5AFA000FEFEFE00FEFEFE00C5A1
      8600FCFCFC00F1F3FF002C4AFD001132FF00072AFF00B6B0D000F9F9FD00D3D7
      F5001E2FC7000017CF001125C6008F8BAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C7B1A200FEFEFE00FEFEFE00CDA3
      8500FEFEFE00FEFEFE00CDA38500FEFCFC00FBFAF900DCC7C600C177AF00D473
      C700BA23AA00CC8AC200F0ECE800A5968A00C7B1A200FEFEFE00FDFDFD00E0C7
      B700A0553100CE744800F3936400E89B7500D7865E00B1684100D5B9A700FEFE
      FE00DABCA600FAEEE700DACAC10063493500C7B1A200FEFEFE00FEFEFE00CDA3
      8500FDFDFD00FEFEFE00D6C9CF003451FF001132FF000C2CFC00CCD1F500273C
      DB00001CE000172BD100CBC9DD00BFB4AE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C9B3A400CDA38500BF977A00B28B
      6F00CDA38500BF977A00B28D7100D7B59F00DCC8BA00E5D7D100DBC4C900D7A3
      CF00C858BD00AD23A100D4B1BE00C0B5AC00C9B4A500DDC1AC00E7DACF00A55D
      3A00D87C4E00F3936400E3A58100E4C5B100E5A88700D1886200AD613900DCC7
      B900DFD1C600E8D6C900CEAF9900674D3900C9B3A400CDA38500BF977A00B28B
      6F00D0A98E00D5B9A600E2D4C900CEC3D1004B62F5001136FF00001FF3000824
      E7002F3ECD00CFC1CA00E5D8CE00928072000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBB5A500FEFEFE00FEFEFE00BF97
      7900FEFEFE00FEFEFE00DFCEC100FEFDFE00F8EDF700EBDED700FDFCFB00F7EE
      F400CC94C600CB48C100B31DA500C2A3B300CCB6A600FEFEFE00FEFEFE00F4CA
      B700F0AE8E00ECAC8700E1CCBD00FBFBFB00FAF3EF00E5A78700D1886200AD6D
      4F00EBD3C300FCF7F500E2DCD80063493500CBB5A500FEFEFE00FEFEFE00BF97
      7900FEFEFE00FEFEFE00D7C0AF00FDFEFF00C4CDFF002446FF000D31FF000928
      F100BEB4C700FAF6F500EAE5E20071533E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCB6A700FEFEFE00FEFEFE00CDA3
      8500FEFEFE00FEFEFE00ECDED300CD8AC10089047E00A95E9600FCF9FA00FDFC
      FB00E3BAD200D187CC00B72EAC008B247800CCB6A700FEFEFE00FCFCFC00F0DC
      CD00FAE5DC00FEFCFA00EAD9CD00FDFAF800FBFAFA00E7D1C200E89F7C00C978
      5000BA866800F5E3D700F9F3F000A5968B00CCB6A700FEFEFE00FEFEFE00CDA3
      8500FEFEFE00FBFBFB00E9D7CA00CDD5FF003C5CFF002C4CFF003250FF001334
      FF000523E900D8D9F700FDFBF800977A65000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAAA8B00EAAA8B00EAA88700EBA9
      8A00ECB29500F1C3AD00F4DBD800B83E9800D278C9008B117900EEC5B900EEC4
      AE00E8AEC800CC87C600940F87007E105D00EAAA8B00EAAB8C00EDBAA000EFC3
      AC00EEC2AB00EEBFA900E7A17C00ECA58200F2B19000F4BFA200EFBCA300E79A
      7300C26F4500C4917500EABDA200D4A99300EAAA8B00EAAA8B00EAA88700E9A4
      8200EBB29600F5D4C400D0BBCD004362FF003A59FF00526CFA00C8B0C5004A65
      FA001F41FF00001FED00CBA8B400E7B59B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAAA8B00FEEBE200FEEBE100FEED
      E500FEEEE500FDEDE700FDF7F400E4A4C300DB98D200A4239900CC81AE00EDC7
      C700D483B700BF43B10093028300BD799100EAAA8B00FEEBE200FEEBE100FEEA
      E000FEE9DE00FEE8DD00F9AF8800F9B18B00F8BA9A00F7C0A100F8C3A700F8C4
      A900E89C7500C26F4500CD9E8200E7C8B700EAAA8B00FEEBE200FEEBE100FDEB
      E200FEF5F100E3DFF200506FFF005776FF007485F400E8CCCC00F5D8CB00DCC3
      D0004A65FB00284AFF000021F700C19FAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAAA8B00EAAA8B00E9A88700E9A9
      8800EAAA8C00EDB69C00F1D3C300F1CCCA00E3AFDA00DC8CD500B543AE009614
      8D0097119000B601AB00A4256200F2CFBD00EAAA8B00EAAA8B00E9A88700E8A5
      8300E7A07E00E69D7900E4987100E3926B00E5967000E89F7B00EFAC8A00EFB2
      9300EEBFA600ECB29600C3714800E6D7CE00EAAA8B00EAAA8B00E9A88700E9AC
      8E00E9CFCC005E79FE005D7BFF006980F900E7C4BA00E9B49800E49D7600E9B2
      9300D4B1B5004A64F9003251FF000026FD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF0000E0A9DB00E0A2D600DA90
      CD00D680C300D49BBD0000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF0000F0D9CE00D5A48C0000FF000000FF000000FF000000FF
      000000FF0000D4D9F0006984FE00DFE2EF0000FF000000FF000000FF000000FF
      000000FF0000D3D8F1005571FD00D6D9F0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0080008000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
