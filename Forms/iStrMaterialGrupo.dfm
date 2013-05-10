inherited FrmMaterialGrupo: TFrmMaterialGrupo
  Left = 594
  Top = 190
  ActiveControl = EdtPesquisa
  Caption = 'Grupos/Subgrupos de Materiais'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTabela: TPanel
    inherited PgCtrlMain: TcxPageControl
      ActivePage = TbsPrincipal
      inherited TbsPrincipal: TcxTabSheet
        inherited GrpBxPesquisa: TcxGroupBox
          Caption = 'Pesquise o Grupo de Material'
        end
        inherited Pnl: TPanel
          inherited LblDados: TLabel
            Width = 156
            Caption = 'Dados do Grupo de Material'
          end
        end
      end
    end
  end
end
