inherited FrmPessoaCadastro: TFrmPessoaCadastro
  Left = 556
  Top = 266
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 495
  ClientWidth = 680
  PixelsPerInch = 96
  TextHeight = 13
  inherited BvlMain: TBevel
    Width = 680
  end
  inherited PnlMain: TPanel
    Width = 680
    inherited BtnImprimir: TcxButton
      Left = 616
    end
  end
  inherited PnlTabela: TPanel
    Width = 680
    Height = 418
    inherited PgCtrlMain: TcxPageControl
      Width = 672
      Height = 410
      ClientRectBottom = 406
      ClientRectRight = 668
      inherited TbsPrincipal: TcxTabSheet
        inherited GrpDadosNominais: TcxGroupBox
          Height = 129
          Width = 656
          object lblCodigo: TcxLabel
            Left = 68
            Top = 26
            Caption = 'C'#243'digo'
            FocusControl = dbCodigo
            StyleFocused.TextStyle = []
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object dbCodigo: TcxDBTextEdit
            Left = 112
            Top = 24
            DataBinding.DataField = 'pes_codigo'
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
          object dbTipo: TcxDBLookupComboBox
            Left = 232
            Top = 24
            DataBinding.DataField = 'tip_codigo'
            DataBinding.DataSource = DtsMaster
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'tip_codigo'
            Properties.ListColumns = <
              item
                FieldName = 'tip_nome'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DtsPessoaTipo
            TabOrder = 3
            Width = 177
          end
          object lblDocumento: TcxLabel
            Left = 421
            Top = 26
            Caption = 'CPF/CNPJ'
            FocusControl = dbDocumento
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 473
          end
          object dbDocumento: TcxDBTextEdit
            Left = 480
            Top = 24
            DataBinding.DataField = 'pes_documento'
            DataBinding.DataSource = DtsMaster
            TabOrder = 5
            Width = 145
          end
          object lblNome: TcxLabel
            Left = 74
            Top = 50
            Caption = 'Nome'
            FocusControl = dbNome
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object dbNome: TcxDBTextEdit
            Left = 112
            Top = 48
            DataBinding.DataField = 'pes_nome_fantasia'
            DataBinding.DataSource = DtsMaster
            TabOrder = 7
            Width = 513
          end
          object lblRazaoSocial: TcxLabel
            Left = 41
            Top = 74
            Caption = 'Raz'#227'o Social'
            FocusControl = dbRazaoSocial
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object dbRazaoSocial: TcxDBTextEdit
            Left = 112
            Top = 72
            DataBinding.DataField = 'pes_razao_social'
            DataBinding.DataSource = DtsMaster
            TabOrder = 9
            Width = 513
          end
          object lblInscMunicipal: TcxLabel
            Left = 31
            Top = 98
            Caption = 'Insc. Municipal'
            FocusControl = dbInscMunicipal
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object dbInscMunicipal: TcxDBTextEdit
            Left = 112
            Top = 96
            DataBinding.DataField = 'pes_insc_municipal'
            DataBinding.DataSource = DtsMaster
            TabOrder = 11
            Width = 169
          end
          object lblInscEstadual: TcxLabel
            Left = 377
            Top = 98
            Caption = 'Insc. Estadual'
            FocusControl = dbInscEstadual
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 449
          end
          object dbInscEstadual: TcxDBTextEdit
            Left = 456
            Top = 96
            DataBinding.DataField = 'pes_insc_estadual'
            DataBinding.DataSource = DtsMaster
            TabOrder = 13
            Width = 169
          end
        end
        object GrpDadosEndereco: TcxGroupBox
          Left = 0
          Top = 129
          Align = alTop
          Caption = 'Endere'#231'o'
          Style.LookAndFeel.Kind = lfStandard
          StyleDisabled.LookAndFeel.Kind = lfStandard
          StyleFocused.LookAndFeel.Kind = lfStandard
          StyleHot.LookAndFeel.Kind = lfStandard
          TabOrder = 1
          Height = 80
          Width = 656
          object lblLogradouro: TcxLabel
            Left = 46
            Top = 26
            Caption = 'Logradouro'
            FocusControl = dbLogradouro
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object dbLogradouro: TcxDBTextEdit
            Left = 112
            Top = 24
            DataBinding.DataField = 'pes_end_logra'
            DataBinding.DataSource = DtsMaster
            TabOrder = 1
            Width = 393
          end
          object lblCidade: TcxLabel
            Left = 68
            Top = 50
            Caption = 'Cidade'
            FocusControl = dbCidade
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object lblBairro: TcxLabel
            Left = 297
            Top = 50
            Caption = 'Bairro'
            FocusControl = dbBairro
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 329
          end
          object dbBairro: TcxDBTextEdit
            Left = 336
            Top = 48
            DataBinding.DataField = 'pes_end_bairro'
            DataBinding.DataSource = DtsMaster
            TabOrder = 7
            Width = 169
          end
          object lblCEP: TcxLabel
            Left = 514
            Top = 50
            Caption = 'CEP'
            FocusControl = dbCEP
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 537
          end
          object dbCEP: TcxDBTextEdit
            Left = 544
            Top = 48
            DataBinding.DataField = 'pes_end_cep'
            DataBinding.DataSource = DtsMaster
            TabOrder = 9
            Width = 81
          end
          object lblUF: TcxLabel
            Left = 520
            Top = 26
            Caption = 'UF'
            FocusControl = dbUF
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 537
          end
          object dbUF: TcxDBLookupComboBox
            Left = 544
            Top = 24
            DataBinding.DataField = 'pes_end_uf'
            DataBinding.DataSource = DtsMaster
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'est_sigla'
            Properties.ListColumns = <
              item
                FieldName = 'est_sigla'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DtsUF
            TabOrder = 3
            Width = 81
          end
          object dbCidade: TcxDBLookupComboBox
            Left = 112
            Top = 48
            DataBinding.DataField = 'cid_codigo'
            DataBinding.DataSource = DtsMaster
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'cid_codigo'
            Properties.ListColumns = <
              item
                FieldName = 'cid_nome'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DtsCidade
            TabOrder = 5
            Width = 169
          end
        end
        object GrpDadosContato: TcxGroupBox
          Left = 0
          Top = 209
          Align = alTop
          Caption = 'Contato'
          Style.LookAndFeel.Kind = lfStandard
          StyleDisabled.LookAndFeel.Kind = lfStandard
          StyleFocused.LookAndFeel.Kind = lfStandard
          StyleHot.LookAndFeel.Kind = lfStandard
          TabOrder = 2
          Height = 80
          Width = 656
          object lblNomeContato: TcxLabel
            Left = 74
            Top = 26
            Caption = 'Nome'
            FocusControl = dbNomeContato
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object dbNomeContato: TcxDBTextEdit
            Left = 112
            Top = 24
            DataBinding.DataField = 'pes_contato'
            DataBinding.DataSource = DtsMaster
            TabOrder = 1
            Width = 513
          end
          object lblTelefone: TcxLabel
            Left = 59
            Top = 50
            Caption = 'Telefone'
            FocusControl = dbTelefone
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object dbTelefone: TcxDBTextEdit
            Left = 112
            Top = 48
            DataBinding.DataField = 'pes_fones'
            DataBinding.DataSource = DtsMaster
            TabOrder = 3
            Width = 169
          end
          object lblEmail: TcxLabel
            Left = 297
            Top = 50
            Caption = 'E-mail'
            FocusControl = dbEmail
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 329
          end
          object dbEmail: TcxDBTextEdit
            Left = 336
            Top = 48
            DataBinding.DataField = 'pes_email'
            DataBinding.DataSource = DtsMaster
            Properties.CharCase = ecLowerCase
            TabOrder = 5
            Width = 289
          end
        end
        object GrpDadosOutrasInfo: TcxGroupBox
          Left = 0
          Top = 289
          Align = alClient
          Caption = 'Outras Informa'#231#245'es'
          Style.LookAndFeel.Kind = lfStandard
          StyleDisabled.LookAndFeel.Kind = lfStandard
          StyleFocused.LookAndFeel.Kind = lfStandard
          StyleHot.LookAndFeel.Kind = lfStandard
          TabOrder = 3
          Height = 84
          Width = 656
          object lblContaCorrente: TcxLabel
            Left = 83
            Top = 26
            Caption = 'C/C'
            FocusControl = dbContaCorrente
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object lblStatus: TcxLabel
            Left = 70
            Top = 50
            Caption = 'Status'
            FocusControl = dbStatus
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object lblObservacoes: TcxLabel
            Left = 214
            Top = 50
            Caption = 'Obs.'
            FocusControl = dbObservacoes
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 241
          end
          object dbObservacoes: TcxDBTextEdit
            Left = 248
            Top = 48
            DataBinding.DataField = 'pes_obs'
            DataBinding.DataSource = DtsMaster
            TabOrder = 5
            Width = 377
          end
          object dbContaCorrente: TcxDBLookupComboBox
            Left = 112
            Top = 24
            DataBinding.DataField = 'ccr_codigo'
            DataBinding.DataSource = DtsMaster
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'ccr_codigo'
            Properties.ListColumns = <
              item
                FieldName = 'banco_conta'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DtsContaCorrente
            TabOrder = 1
            Width = 513
          end
          object dbStatus: TcxDBImageComboBox
            Left = 112
            Top = 48
            DataBinding.DataField = 'pes_status'
            DataBinding.DataSource = DtsMaster
            Properties.Images = ImgStatus
            Properties.Items = <
              item
                Description = 'Inativo'
                ImageIndex = 2
                Value = 0
              end
              item
                Description = 'Ativo'
                ImageIndex = 1
                Value = 1
              end>
            TabOrder = 3
            Width = 89
          end
        end
      end
    end
  end
  inherited QryMaster: TSQLQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'pes_codigo'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'Select'
      '    p.pes_codigo'
      '  , p.tip_codigo'
      '  , p.pes_documento'
      '  , p.pes_razao_social'
      '  , p.pes_nome_fantasia'
      '  , p.pes_insc_municipal'
      '  , p.pes_insc_estadual'
      '  , p.pes_contato'
      '  , p.pes_fones'
      '  , p.pes_end_logra'
      '  , upper(p.pes_end_cidade) as pes_end_cidade'
      '  , p.pes_end_bairro'
      '  , p.pes_end_cep'
      '  , upper(p.pes_end_uf) as pes_end_uf'
      '  , p.cid_codigo'
      '  , p.pes_obs'
      '  , p.pes_email'
      '  , p.ccr_codigo'
      '  , p.pes_status'
      '  , p.pes_ult_datamov'
      '  , p.pes_inc'
      '  , p.pes_alt'
      'from mny_pessoa p'
      'where p.pes_codigo = :pes_codigo')
    Left = 472
    Top = 8
  end
  inherited DspMaster: TDataSetProvider
    Left = 504
    Top = 8
  end
  inherited CdsMaster: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'pes_codigo'
        ParamType = ptInput
        Value = 0
      end>
    OnNewRecord = CdsMasterNewRecord
    Left = 536
    Top = 8
    object CdsMasterpes_codigo: TIntegerField
      FieldName = 'pes_codigo'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object CdsMastertip_codigo: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo'
      FieldName = 'tip_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMasterpes_documento: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'pes_documento'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMasterpes_nome_fantasia: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'pes_nome_fantasia'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object CdsMasterpes_razao_social: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'pes_razao_social'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object CdsMasterpes_insc_municipal: TStringField
      DisplayLabel = 'Inscri'#231#227'o Municipal'
      FieldName = 'pes_insc_municipal'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMasterpes_insc_estadual: TStringField
      DisplayLabel = 'Inscri'#231#227'o Estadual'
      FieldName = 'pes_insc_estadual'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMasterpes_end_logra: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'pes_end_logra'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object CdsMasterpes_end_uf: TStringField
      DisplayLabel = 'UF'
      FieldName = 'pes_end_uf'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object CdsMasterpes_end_cidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'pes_end_cidade'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object CdsMastercid_codigo: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Cidade'
      FieldName = 'cid_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMasterpes_end_bairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'pes_end_bairro'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object CdsMasterpes_end_cep: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'pes_end_cep'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object CdsMasterpes_contato: TStringField
      DisplayLabel = 'Nome Contato'
      FieldName = 'pes_contato'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMasterpes_fones: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'pes_fones'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object CdsMasterpes_email: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'pes_email'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object CdsMasterccr_codigo: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Conta Corrente'
      FieldName = 'ccr_codigo'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMasterpes_status: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Status'
      FieldName = 'pes_status'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMasterpes_obs: TStringField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'pes_obs'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object CdsMasterpes_ult_datamov: TSQLTimeStampField
      FieldName = 'pes_ult_datamov'
      ProviderFlags = [pfInUpdate]
    end
    object CdsMasterpes_inc: TStringField
      FieldName = 'pes_inc'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object CdsMasterpes_alt: TStringField
      FieldName = 'pes_alt'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
  end
  inherited DtsMaster: TDataSource
    Left = 568
    Top = 8
  end
  object QryPessoaTipo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select'
      '    t.tip_codigo'
      '  , t.tip_nome'
      'from mny_tipo_pessoa t')
    SQLConnection = FrmLogin.conWebMaster
    Left = 552
    Top = 80
  end
  object DspPessoaTipo: TDataSetProvider
    DataSet = QryPessoaTipo
    Left = 584
    Top = 80
  end
  object CdsPessoaTipo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspPessoaTipo'
    Left = 616
    Top = 80
  end
  object DtsPessoaTipo: TDataSource
    DataSet = CdsPessoaTipo
    Left = 648
    Top = 80
  end
  object QryUF: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select'
      '    e.est_codigo'
      '  , e.est_nome'
      '  , e.est_sigla'
      'from sys_estado e'
      'order by'
      '    e.est_sigla'
      '    ')
    SQLConnection = FrmLogin.conWebMaster
    Left = 552
    Top = 112
  end
  object DspUF: TDataSetProvider
    DataSet = QryUF
    Left = 584
    Top = 112
  end
  object CdsUF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspUF'
    Left = 616
    Top = 112
  end
  object DtsUF: TDataSource
    DataSet = CdsUF
    Left = 648
    Top = 112
  end
  object QryCidade: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select'
      '    c.cid_codigo'
      '  , c.cid_estado'
      '  , c.cid_nome'
      '  , c.cid_cep_inicial'
      '  , c.cid_cep_final'
      '  , c.cid_ddd'
      'from sys_cidade c'
      'order by'
      '    c.cid_estado'
      '  , c.cid_nome  ')
    SQLConnection = FrmLogin.conWebMaster
    Left = 552
    Top = 144
  end
  object DspCidade: TDataSetProvider
    DataSet = QryCidade
    Left = 584
    Top = 144
  end
  object CdsCidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCidade'
    Left = 616
    Top = 144
  end
  object DtsCidade: TDataSource
    DataSet = CdsCidade
    Left = 648
    Top = 144
  end
  object ImgStatus: TImageList
    Left = 24
    Top = 426
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
  object QryContaCorrente: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select'
      '    ccr_codigo'
      '  , ban_codigo  '
      '  , bco_nome'
      '  , bco_sigla'
      '  , ccr_agencia'
      '  , ccr_agencia_dv'
      '  , ccr_conta'
      '  , ccr_conta_dv'
      '  , banco_conta'
      'from vw_conta_corrente')
    SQLConnection = FrmLogin.conWebMaster
    Left = 552
    Top = 176
  end
  object DspContaCorrente: TDataSetProvider
    DataSet = QryContaCorrente
    Left = 584
    Top = 176
  end
  object CdsContaCorrente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspContaCorrente'
    Left = 616
    Top = 176
  end
  object DtsContaCorrente: TDataSource
    DataSet = CdsContaCorrente
    Left = 648
    Top = 176
  end
end
