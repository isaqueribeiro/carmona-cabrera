object FrmContaPRDoc: TFrmContaPRDoc
  Left = 378
  Top = 226
  Width = 663
  Height = 412
  Caption = 'Documentos do Item'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PgCtrlMain: TcxPageControl
    Left = 8
    Top = 8
    Width = 633
    Height = 321
    ActivePage = TbShtPrincipal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ClientRectBottom = 317
    ClientRectLeft = 4
    ClientRectRight = 629
    ClientRectTop = 24
    object TbShtPrincipal: TcxTabSheet
      Caption = 'Principal'
      ImageIndex = 79
      object Shape2: TShape
        Left = 0
        Top = 8
        Width = 625
        Height = 17
        Brush.Color = 12615680
        Pen.Color = clHighlight
        Pen.Style = psClear
      end
      object LblDados: TLabel
        Left = 10
        Top = 9
        Width = 121
        Height = 13
        Caption = 'Envio de Documentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object DbGrd: TcxGrid
        Left = 0
        Top = 24
        Width = 625
        Height = 265
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object DbGridDBTblVw: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = DtSMaster
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsData.Appending = True
          OptionsSelection.InvertSelect = False
          OptionsView.Navigator = True
          OptionsView.NoDataToDisplayInfoText = '<Sem Dados Para Exibi'#231#227'o>'
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          Styles.ContentEven = DtmResource.cxStlLinhaImpar
          Styles.ContentOdd = DtmResource.cxStlLinhaPar
          object DbGridDBTblVwdoc_seq: TcxGridDBColumn
            Caption = 'Seq'
            DataBinding.FieldName = 'doc_seq'
            Width = 39
          end
          object DbGridDBTblVwdoc_nome: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'doc_nome'
            Width = 155
          end
          object DbGridDBTblVwdoc_origem: TcxGridDBColumn
            Caption = 'Origem'
            DataBinding.FieldName = 'doc_origem'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = DbGridDBTblVwdoc_origemPropertiesButtonClick
            Width = 234
          end
        end
        object DbGridLvl: TcxGridLevel
          GridView = DbGridDBTblVw
        end
      end
    end
  end
  object btnDocumento: TcxButton
    Left = 536
    Top = 336
    Width = 105
    Height = 33
    Hint = 'Excluir'
    Caption = '&Enviar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnDocumentoClick
    Glyph.Data = {
      5E060000424D5E06000000000000360400002800000015000000170000000100
      0800000000002802000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A6000020400000206000002080000020A0000020C0000020E000004000000040
      20000040400000406000004080000040A0000040C0000040E000006000000060
      20000060400000606000006080000060A0000060C0000060E000008000000080
      20000080400000806000008080000080A0000080C0000080E00000A0000000A0
      200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
      200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
      200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
      20004000400040006000400080004000A0004000C0004000E000402000004020
      20004020400040206000402080004020A0004020C0004020E000404000004040
      20004040400040406000404080004040A0004040C0004040E000406000004060
      20004060400040606000406080004060A0004060C0004060E000408000004080
      20004080400040806000408080004080A0004080C0004080E00040A0000040A0
      200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
      200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
      200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
      20008000400080006000800080008000A0008000C0008000E000802000008020
      20008020400080206000802080008020A0008020C0008020E000804000008040
      20008040400080406000804080008040A0008040C0008040E000806000008060
      20008060400080606000806080008060A0008060C0008060E000808000008080
      20008080400080806000808080008080A0008080C0008080E00080A0000080A0
      200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
      200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
      200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
      2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
      2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
      2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
      2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
      2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
      2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
      2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F6F6F6F6F6F6
      F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F6F6F6F6F6F6F6F6F6F6F6F6F6
      F6F6F6F6F6F6F6000000F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F600
      0000F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F608A4A4A4
      F5F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F607FFFFFFA4F6F6F6F6F6F6F6
      F6F6F6F6F6F6F6000000F6F607FFDAFFA4F69B9B9B9BF69B9B9B9BF6F6F6F600
      0000F6F607FFFFFFA4F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F608A4A4A4
      F5F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F607FFFFFFA4F6F6F6F6F6F6F6
      F6F6F6F6F6F6F6000000F6F607FF0FFFA4F69B9B9B9BF69B9B9B9BF6F6F6F600
      0000F6F607FFFFFFA4F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F608A4A4A4
      F5F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F607FFFFFFA4F6F6F6F6F6F6F6
      F6F6F6F6F6F6F6000000F6F607FF63FFA4F69B9B9B9BF69B9B9B9BF6F6F6F600
      0000F6F607FFFFFFA4F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F608070707
      08F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F6F6F6F6F6F6F6F6F6F6F6F6F6
      F6F6F6F6F6F6F6000000F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F600
      0000F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F6F6F6F6F6
      F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F6F6F6F6F6F6F6F6F6F6F6F6F6
      F6F6F6F6F6F6F6000000F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F600
      0000}
    LookAndFeel.Kind = lfOffice11
  end
  object btnDocumentos: TcxButton
    Left = 8
    Top = 336
    Width = 97
    Height = 31
    Caption = '&Ver Documentos'
    TabOrder = 2
    OnClick = btnDocumentosClick
  end
  object QryDoc: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'mov_codigo'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'select'
      '  a.`mov_codigo`,'
      '  a.`doc_nome`,'
      '  a.`doc_seq`,'
      '  a.doc_origem,'
      '  a.`doc_path`'
      'from'
      '  `mny_movimento_doc` a'
      'where'
      '  a.`mov_codigo` = :mov_codigo')
    SQLConnection = FrmLogin.conWebMaster
    Left = 188
    Top = 96
    object QryDocmov_codigo: TIntegerField
      FieldName = 'mov_codigo'
      Required = True
    end
    object QryDocdoc_seq: TSmallintField
      FieldName = 'doc_seq'
      Required = True
    end
    object QryDocdoc_nome: TStringField
      FieldName = 'doc_nome'
      Size = 100
    end
    object QryDocdoc_path: TStringField
      FieldName = 'doc_path'
      Size = 200
    end
    object QryDocdoc_origem: TStringField
      FieldName = 'doc_origem'
      Size = 100
    end
  end
  object DtStPrvdr: TDataSetProvider
    DataSet = QryDoc
    Left = 220
    Top = 96
  end
  object ClntDtStMaster: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DtStPrvdr'
    BeforePost = ClntDtStMasterBeforePost
    BeforeDelete = ClntDtStMasterBeforeDelete
    OnNewRecord = ClntDtStMasterNewRecord
    Left = 188
    Top = 128
    object ClntDtStMastermov_codigo: TIntegerField
      FieldName = 'mov_codigo'
      Required = True
    end
    object ClntDtStMasterdoc_seq: TSmallintField
      FieldName = 'doc_seq'
      Required = True
    end
    object ClntDtStMasterdoc_nome: TStringField
      FieldName = 'doc_nome'
      Size = 100
    end
    object ClntDtStMasterdoc_path: TStringField
      FieldName = 'doc_path'
      ReadOnly = True
      Size = 200
    end
    object ClntDtStMasterdoc_origem: TStringField
      FieldName = 'doc_origem'
      Size = 100
    end
  end
  object DtSMaster: TDataSource
    DataSet = ClntDtStMaster
    Left = 220
    Top = 128
  end
  object QryMax: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'mov_codigo'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'select'
      ' max(coalesce(a.`doc_seq`,0)) as seq'
      'from'
      '  `mny_movimento_doc` a'
      'where'
      '  a.`mov_codigo` = :mov_codigo')
    SQLConnection = FrmLogin.conWebMaster
    Left = 260
    Top = 96
    object QryMaxseq: TBCDField
      FieldName = 'seq'
      Precision = 6
      Size = 0
    end
  end
  object QryTransaction: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = FrmLogin.conWebMaster
    Left = 260
    Top = 128
  end
  object OpnDlgOrigem: TOpenDialog
    Filter = 'Arquivos PDF|*.pdf|Arquivos JPG|*.jpg'
    Left = 388
    Top = 120
  end
  object IdFTP1: TIdFTP
    MaxLineAction = maException
    ReadTimeout = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 444
    Top = 120
  end
end
