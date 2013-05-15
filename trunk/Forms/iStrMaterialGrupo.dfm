inherited FrmMaterialGrupo: TFrmMaterialGrupo
  Left = 594
  Top = 190
  ActiveControl = dbCodigo
  Caption = 'Grupos/Subgrupos de Materiais'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTabela: TPanel
    inherited PgCtrlMain: TcxPageControl
      ActivePage = TbsFormulario
      inherited TbsPrincipal: TcxTabSheet
        inherited GrpBxPesquisa: TcxGroupBox
          Caption = 'Pesquise o Grupo de Material'
        end
        inherited DbgTabela: TcxGrid
          inherited DbgTabelaDB: TcxGridDBTableView
            object DbgTabelaDBgrp_codigo: TcxGridDBColumn
              DataBinding.FieldName = 'grp_codigo'
              MinWidth = 60
              Options.Filtering = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 60
            end
            object DbgTabelaDBgrp_descricao: TcxGridDBColumn
              DataBinding.FieldName = 'grp_descricao'
              Options.Moving = False
            end
          end
        end
        inherited Pnl: TPanel
          inherited LblDados: TLabel
            Width = 156
            Caption = 'Dados do Grupo de Material'
          end
        end
      end
      inherited TbsFormulario: TcxTabSheet
        object Shape1: TShape [0]
          Left = 0
          Top = 81
          Width = 760
          Height = 17
          Align = alTop
          Brush.Color = 12615680
          Pen.Color = 12615680
          Pen.Style = psClear
        end
        object Label1: TLabel [1]
          Left = 6
          Top = 82
          Width = 121
          Height = 13
          Caption = 'Subgrupo do Material'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        inherited GrpDadosNominais: TcxGroupBox
          Height = 81
          object lblCodigo: TcxLabel
            Left = 68
            Top = 24
            Caption = 'C'#243'digo'
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 105
          end
          object dbCodigo: TcxDBTextEdit
            Left = 112
            Top = 24
            DataBinding.DataField = 'grp_codigo'
            DataBinding.DataSource = DtsMaster
            Properties.ReadOnly = True
            Style.Color = 8454143
            TabOrder = 1
            Width = 41
          end
          object lblDescricao: TcxLabel
            Left = 56
            Top = 48
            Caption = 'Descri'#231#227'o'
            Properties.Alignment.Horz = taRightJustify
            Transparent = True
            AnchorX = 106
          end
          object dbDescricao: TcxDBTextEdit
            Left = 112
            Top = 48
            DataBinding.DataField = 'grp_descricao'
            DataBinding.DataSource = DtsMaster
            Properties.CharCase = ecUpperCase
            TabOrder = 3
            Width = 601
          end
        end
        object DbgDetail: TcxGrid
          Left = 0
          Top = 98
          Width = 760
          Height = 342
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object DbgDetailTbl: TcxGridDBTableView
            OnKeyDown = DbgTabelaDBKeyDown
            NavigatorButtons.ConfirmDelete = False
            NavigatorButtons.Images = DtmResource.ImgNavigator
            NavigatorButtons.First.Hint = 'Primeiro registro'
            NavigatorButtons.PriorPage.Visible = False
            NavigatorButtons.Prior.Hint = 'Registro anterior'
            NavigatorButtons.Next.Hint = 'Pr'#243'ximo registro'
            NavigatorButtons.NextPage.Visible = False
            NavigatorButtons.Last.Hint = #218'ltimo registro'
            NavigatorButtons.Insert.Hint = 'Inserir registro'
            NavigatorButtons.Insert.ImageIndex = 0
            NavigatorButtons.Append.ImageIndex = 0
            NavigatorButtons.Append.Visible = False
            NavigatorButtons.Delete.Hint = 'Excluir registro'
            NavigatorButtons.Delete.ImageIndex = 6
            NavigatorButtons.Edit.Hint = 'Editar registro'
            NavigatorButtons.Edit.ImageIndex = 10
            NavigatorButtons.Post.Hint = 'Salvar edi'#231#227'o'
            NavigatorButtons.Post.ImageIndex = 2
            NavigatorButtons.Cancel.Hint = 'Cancelar edi'#231#227'o'
            NavigatorButtons.Cancel.ImageIndex = 4
            NavigatorButtons.Refresh.Hint = 'Atualizar'
            NavigatorButtons.Refresh.ImageIndex = 19
            NavigatorButtons.Refresh.Visible = True
            NavigatorButtons.SaveBookmark.Visible = False
            NavigatorButtons.GotoBookmark.Visible = False
            NavigatorButtons.Filter.Visible = False
            DataController.DataSource = DtsDetail
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.CellHints = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.FocusFirstCellOnNewRecord = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.ImmediateEditor = False
            OptionsBehavior.NavigatorHints = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsData.Appending = True
            OptionsData.DeletingConfirmation = False
            OptionsSelection.InvertSelect = False
            OptionsView.CellEndEllipsis = True
            OptionsView.Navigator = True
            OptionsView.NoDataToDisplayInfoText = '<Sem dados para exibi'#231#227'o>'
            OptionsView.ColumnAutoWidth = True
            OptionsView.GridLines = glNone
            OptionsView.GroupByBox = False
            Styles.ContentEven = DtmResource.cxStlLinhaImpar
            Styles.ContentOdd = DtmResource.cxStlLinhaPar
            object DbgDetailTblsgp_codigo: TcxGridDBColumn
              DataBinding.FieldName = 'sgp_codigo'
              MinWidth = 60
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 60
            end
            object DbgDetailTblsgp_descricao: TcxGridDBColumn
              DataBinding.FieldName = 'sgp_descricao'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.CharCase = ecUpperCase
            end
          end
          object DbgDetailLvl: TcxGridLevel
            GridView = DbgDetailTbl
          end
        end
      end
    end
  end
  inherited QryMaster: TSQLQuery
    SQL.Strings = (
      'Select'
      '    g.grp_codigo'
      '  , g.grp_descricao'
      'from str_material_grupo g')
    Top = 464
  end
  inherited CdsMaster: TClientDataSet
    AfterPost = CdsMasterAfterPost
    OnNewRecord = CdsMasterNewRecord
    Top = 464
    object CdsMastergrp_codigo: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'grp_codigo'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object CdsMastergrp_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'grp_descricao'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  inherited DspMaster: TDataSetProvider
    Top = 464
  end
  inherited DtsMaster: TDataSource
    Top = 464
  end
  object QryDetail: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftSmallint
        Name = 'sgp_grupo'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'Select'
      '    s.sgp_codigo'
      '  , s.sgp_descricao'
      '  , s.sgp_grupo'
      'from str_material_subgrupo s'
      'where s.sgp_grupo = :sgp_grupo'
      'order by '
      '    s.sgp_descricao')
    SQLConnection = FrmLogin.conWebMaster
    Left = 24
    Top = 496
  end
  object DspDetail: TDataSetProvider
    DataSet = QryDetail
    Left = 56
    Top = 496
  end
  object CdsDetail: TClientDataSet
    Aggregates = <>
    PacketRecords = 100
    Params = <
      item
        DataType = ftSmallint
        Name = 'sgp_grupo'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'DspDetail'
    BeforeDelete = CdsDetailBeforeDelete
    OnNewRecord = CdsDetailNewRecord
    Left = 88
    Top = 496
    object CdsDetailsgp_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'sgp_codigo'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object CdsDetailsgp_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'sgp_descricao'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object CdsDetailsgp_grupo: TSmallintField
      DisplayLabel = 'Grupo'
      FieldName = 'sgp_grupo'
      ProviderFlags = [pfInUpdate]
    end
  end
  object DtsDetail: TDataSource
    AutoEdit = False
    DataSet = CdsDetail
    Left = 120
    Top = 496
  end
end
