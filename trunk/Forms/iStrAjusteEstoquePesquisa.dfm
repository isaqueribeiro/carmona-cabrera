inherited FrmAjusteEstoquePesquisa: TFrmAjusteEstoquePesquisa
  Left = 443
  Top = 193
  Width = 1057
  Height = 694
  Caption = 'Ajustes de Estoques'
  PixelsPerInch = 96
  TextHeight = 13
  inherited BvlMain: TBevel
    Width = 1041
  end
  inherited PnlMain: TPanel
    Width = 1041
    inherited BtnSelecionar: TcxButton
      Left = 913
    end
  end
  inherited PnlTabela: TPanel
    Width = 1041
    Height = 579
    inherited PgCtrlMain: TcxPageControl
      Width = 1033
      Height = 571
      ClientRectBottom = 567
      ClientRectRight = 1029
      inherited TbsPrincipal: TcxTabSheet
        inherited GrpBxPesquisa: TcxGroupBox
          Caption = 'Pesquise o Ajuste de Estoque'
          Width = 1017
          inherited EdtPesquisa: TcxTextEdit
            Left = 440
            TabOrder = 3
            Width = 538
          end
          inherited BtnPesquisar: TcxButton
            Left = 980
            TabOrder = 4
          end
          inherited CmbTipoPesquisa: TcxImageComboBox
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
                Description = 'Per'#237'odo, Status'
                ImageIndex = 30
                Value = 2
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
          Width = 1017
          Height = 466
        end
        inherited Pnl: TPanel
          Width = 1017
          inherited ShpTitulo: TShape
            Width = 1015
          end
          inherited LblDados: TLabel
            Width = 157
            Caption = 'Dados do Ajuste de Estoque'
          end
        end
      end
    end
  end
end
