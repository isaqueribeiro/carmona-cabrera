inherited FrmMaterialTipo: TFrmMaterialTipo
  Caption = 'Tipos de Materiais'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TPanel
    inherited btnFechar: TcxButton
      OnClick = nil
    end
  end
  inherited PnlTabela: TPanel
    inherited PgCtrlMain: TcxPageControl
      inherited TbShtPrincipal: TcxTabSheet
        inherited GrpBxPesquisa: TcxGroupBox
          Caption = 'Pesquisar Tipo'
        end
        inherited Pnl: TPanel
          inherited LblDados: TLabel
            Width = 79
            Caption = 'Dados do Tipo'
          end
        end
      end
    end
  end
  inherited QryMaster: TSQLQuery
    Params = <>
    SQL.Strings = (
      'Select '
      '    t.tip_codigo'
      '  , t.tip_descricao'
      'from str_material_tipo t')
  end
  inherited CdsMaster: TClientDataSet
    BeforePost = nil
    BeforeDelete = nil
    OnNewRecord = nil
  end
end
