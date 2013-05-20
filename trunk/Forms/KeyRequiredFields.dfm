inherited FrmRequiredFields: TFrmRequiredFields
  BorderStyle = bsToolWindow
  BorderWidth = 4
  Caption = 'Campos Requiridos'
  ClientHeight = 419
  ClientWidth = 286
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PgCntrlMain: TcxPageControl
    Left = 0
    Top = 0
    Width = 286
    Height = 386
    ActivePage = TbShtMain
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ClientRectBottom = 382
    ClientRectLeft = 4
    ClientRectRight = 282
    ClientRectTop = 24
    object TbShtMain: TcxTabSheet
      Caption = 'Campos'
      ImageIndex = 0
      DesignSize = (
        278
        358)
      object Label1: TLabel
        Left = 48
        Top = 11
        Width = 222
        Height = 28
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 
          'Os seguintes campos devem ser preenchidos com algum valor mas es' +
          't'#227'o vazios:'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12615680
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Bevel1: TBevel
        Left = 8
        Top = 43
        Width = 263
        Height = 6
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object ImgIcon: TImage
        Left = 8
        Top = 8
        Width = 32
        Height = 32
        IncrementalDisplay = True
      end
      object Shape1: TShape
        Left = 8
        Top = 48
        Width = 263
        Height = 20
        Anchors = [akLeft, akTop, akRight]
        Brush.Color = 12615680
        Pen.Color = 14125918
      end
      object LblDescricao: TLabel
        Left = 16
        Top = 51
        Width = 249
        Height = 14
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Descri'#231#227'o da Tabela'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object dbgCmp: TcxGrid
        Left = 8
        Top = 72
        Width = 263
        Height = 279
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = True
        object dbgCmpTbl: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.First.Hint = 'Primeira prescri'#231#227'o'
          NavigatorButtons.PriorPage.Visible = False
          NavigatorButtons.Prior.Hint = 'Prescri'#231#227'o anterior'
          NavigatorButtons.Prior.Visible = True
          NavigatorButtons.Next.Hint = 'Pr'#243'xima prescri'#231#227'o'
          NavigatorButtons.NextPage.Visible = False
          NavigatorButtons.Last.Hint = #218'ltima prescri'#231#227'o'
          NavigatorButtons.Insert.Visible = False
          NavigatorButtons.Delete.Visible = False
          NavigatorButtons.Edit.Visible = False
          NavigatorButtons.Post.Visible = False
          NavigatorButtons.Cancel.Visible = False
          NavigatorButtons.Refresh.Visible = False
          NavigatorButtons.SaveBookmark.Visible = False
          NavigatorButtons.GotoBookmark.Visible = False
          NavigatorButtons.Filter.Visible = False
          FilterBox.CustomizeDialog = False
          DataController.DataSource = DtSrcCampo
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ImmediateEditor = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.HideSelection = True
          OptionsView.CellEndEllipsis = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          OptionsView.Header = False
          OptionsView.HeaderEndEllipsis = True
          Styles.ContentEven = DtmResource.cxStlLinhaImpar
          Styles.ContentOdd = DtmResource.cxStlLinhaPar
          object dbgCmpTblIMAGEM: TcxGridDBColumn
            DataBinding.FieldName = 'IMAGEM'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Images = DtmResource.ImgNavigator
            Properties.Items = <
              item
                ImageIndex = 10
                Value = 1
              end
              item
                ImageIndex = 20
                Value = 2
              end>
            Width = 26
          end
          object dbgCmpTblCAMPO: TcxGridDBColumn
            DataBinding.FieldName = 'CAMPO'
            Width = 240
          end
        end
        object dbgCmpLvl: TcxGridLevel
          GridView = dbgCmpTbl
        end
      end
    end
  end
  object BtnFechar: TcxButton
    Left = 206
    Top = 387
    Width = 80
    Height = 32
    Hint = 'Fecha a janela'
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Fechar'
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    NumGlyphs = 2
  end
  object CdsCampo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 136
    object CdsCampoIMAGEM: TIntegerField
      DisplayLabel = 'Imagem'
      FieldName = 'IMAGEM'
    end
    object CdsCampoCAMPO: TStringField
      DisplayLabel = 'Campo'
      FieldName = 'CAMPO'
      Size = 50
    end
  end
  object DtSrcCampo: TDataSource
    DataSet = CdsCampo
    Left = 104
    Top = 136
  end
end
