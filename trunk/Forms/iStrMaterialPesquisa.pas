unit iStrMaterialPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadraoTabelaCadastro, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, dxSkinsCore,
  dxSkinscxPCPainter, cxContainer, cxEdit, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, FMTBcd, Provider,
  DBClient, SqlExpr, StdCtrls, ExtCtrls, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxMaskEdit, cxDropDownEdit, cxImageComboBox,
  cxTextEdit, cxGroupBox, cxPC, cxButtons, cxCheckBox, cxDBEdit, cxLabel;

type
  TFrmMaterialPesquisa = class(TFrmPadraoTabelaCadastro)
    CdsMastermat_codigo: TFMTBCDField;
    CdsMastermat_tipo: TSmallintField;
    CdsMastermat_descricao_resumo: TStringField;
    CdsMastermat_referencia: TStringField;
    CdsMastermat_status: TSmallintField;
    CdsMastermat_grupo: TSmallintField;
    CdsMastermat_subgrupo: TIntegerField;
    CdsMastermat_custo_direto: TSmallintField;
    CdsMastermat_custo_indireto: TSmallintField;
    CdsMastermat_valor_custo_int: TFMTBCDField;
    CdsMastermat_valor_custo_frc: TFMTBCDField;
    CdsMastermat_valor_venda_int: TFMTBCDField;
    CdsMastermat_valor_venda_frc: TFMTBCDField;
    CdsMastermat_data_cadastro: TDateField;
    CdsMastermat_ultcompra_data: TDateField;
    CdsMastertip_descricao: TStringField;
    CdsMastergrp_descricao: TStringField;
    CdsMastersgp_descricao: TStringField;
    DbgTabelaDBmat_codigo: TcxGridDBColumn;
    DbgTabelaDBmat_descricao_resumo: TcxGridDBColumn;
    DbgTabelaDBmat_referencia: TcxGridDBColumn;
    DbgTabelaDBmat_status: TcxGridDBColumn;
    DbgTabelaDBtip_descricao: TcxGridDBColumn;
    DbgTabelaDBgrp_descricao: TcxGridDBColumn;
    DbgTabelaDBsgp_descricao: TcxGridDBColumn;
    pnlDadosTabela: TPanel;
    GrpBxTipoCusto: TcxGroupBox;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBCheckBox2: TcxDBCheckBox;
    Bevel1: TBevel;
    GrpBxCustoMedio: TcxGroupBox;
    lblCustoCP: TcxLabel;
    dbCustoCP: TcxDBTextEdit;
    lblCustoCS: TcxLabel;
    dbCustoCS: TcxDBTextEdit;
    Bevel2: TBevel;
    GrpBxHistorico: TcxGroupBox;
    lblDataCadastro: TcxLabel;
    dbDataCadastro: TcxDBTextEdit;
    lblDataUltimaCompra: TcxLabel;
    dbDataUltimaCompra: TcxDBTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
  end;

var
  FrmMaterialPesquisa: TFrmMaterialPesquisa;

implementation

uses
  KeyFuncoes
  {$IFDEF IMONEY}
  , KeyMain
  , KeyLogin
  {$ENDIF}
  {$IFDEF ISTORE}
  , iStrMain
  , iStrLogin
  {$ENDIF}
  , KeyResource
  , KeyPadrao
  , KeyPadraoTabela
  , iStrMaterialCadastro;

{$R *.dfm}

{ TFrmMaterialPesquisa }

function TFrmMaterialPesquisa.ExecutarPesquisa: Boolean;
begin
  RefreshDB;

  CdsMaster.Close;
  QryMaster.SQL.Clear;
  QryMaster.SQL.AddStrings( SQL_Master );
  QryMaster.SQL.Add('where (1 = 1)');

  Case CmbTipoPesquisa.ItemIndex of
    0:
      begin
        if Trim(EdtPesquisa.Text) <> EmptyStr then
          if StrIsInteger( Trim(EdtPesquisa.Text) ) then
            QryMaster.SQL.Add('  and m.mat_codigo = ' + Trim(EdtPesquisa.Text))
          else
            QryMaster.SQL.Add('  and upper(m.mat_descricao_resumo) like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%'));
      end;

    1:
      ;  
  end;

  QryMaster.SQL.Add('order by m.mat_descricao_resumo');
  CdsMaster.Open;

  Result := not CdsMaster.IsEmpty;
end;

procedure TFrmMaterialPesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  ComponenteLogin := FrmLogin;
  ConexaoDB       := FrmLogin.conWebMaster;

  NomeTabela     := 'str_material';
  CampoChave     := 'mat_codigo';
  CampoDescricao := 'mat_descricao_resumo';
  CampoOrdenacao := 'mat_descricao_resumo';

  AbrirTabela := True;
end;

procedure TFrmMaterialPesquisa.BtnNovoClick(Sender: TObject);
var
  AForm : TFrmMaterialCadastro;
begin
  AForm := TFrmMaterialCadastro.CreateTable(Self, FrmLogin, FrmLogin.conWebMaster);
  try
    AForm.SetParametrosPesquisa([0]);
    
    if ( AForm.ExecutarInsercao ) then
      CdsMaster.Refresh;
  finally
    AForm.Free;
  end;
end;

procedure TFrmMaterialPesquisa.BtnEditarClick(Sender: TObject);
var
  AForm : TFrmMaterialCadastro;
begin
  AForm := TFrmMaterialCadastro.CreateTable(Self, FrmLogin, FrmLogin.conWebMaster);
  try
    AForm.SetParametrosPesquisa([CdsMastermat_codigo.AsCurrency]);
    AForm.ExecutarPesquisa;

    if ( AForm.ExecutarAlteracao ) then
      CdsMaster.Refresh;
  finally
    AForm.Free;
  end;
end;

end.
