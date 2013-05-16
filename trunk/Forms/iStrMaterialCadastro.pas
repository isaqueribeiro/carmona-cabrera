unit iStrMaterialCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadraoCadastro, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, dxSkinsCore,
  dxSkinscxPCPainter, cxContainer, cxEdit, FMTBcd, DB, DBClient, Provider,
  SqlExpr, cxGroupBox, cxPC, StdCtrls, cxButtons, ExtCtrls, cxTextEdit,
  cxDBEdit, cxLabel, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxMemo, cxImageComboBox, cxButtonEdit,
  cxCheckBox, cxRadioGroup;

type
  TFrmMaterialCadastro = class(TFrmPadraoCadastro)
    lblCodigo: TcxLabel;
    dbCodigo: TcxDBTextEdit;
    lblTipo: TcxLabel;
    lblDescricao: TcxLabel;
    dbTipo: TcxDBLookupComboBox;
    lblApresentacao: TcxLabel;
    lblEspecificacao: TcxLabel;
    dbEspecificacao: TcxDBMemo;
    lblSituacao: TcxLabel;
    dbSituacao: TcxDBImageComboBox;
    lblNomeResumido: TcxLabel;
    dbNomeResumido: TcxDBTextEdit;
    Bevel1: TBevel;
    GrpDadosAdcionais: TcxGroupBox;
    lblReferencia: TcxLabel;
    dbReferencia: TcxDBTextEdit;
    PgCtrlDadosAdcionais: TcxPageControl;
    TbsClassificar: TcxTabSheet;
    TbsTributacao: TcxTabSheet;
    TbsHistorico: TcxTabSheet;
    CdsMastermat_codigo: TFMTBCDField;
    CdsMastermat_tipo: TSmallintField;
    CdsMastermat_descricao: TIntegerField;
    CdsMastermat_apresentacao: TIntegerField;
    CdsMastermat_descricao_resumo: TStringField;
    CdsMastermat_especificacao: TStringField;
    CdsMastermat_referencia: TStringField;
    CdsMastermat_status: TSmallintField;
    CdsMastermat_grupo: TSmallintField;
    CdsMastermat_subgrupo: TIntegerField;
    CdsMastermat_unidade_compra: TIntegerField;
    CdsMastermat_unidade_consumo: TIntegerField;
    CdsMastermat_fracionador: TFMTBCDField;
    CdsMastermat_custo_direto: TSmallintField;
    CdsMastermat_custo_indireto: TSmallintField;
    CdsMastermat_aliquota_tipo: TSmallintField;
    CdsMastermat_aliquota: TFMTBCDField;
    CdsMastermat_tributacao_icms: TStringField;
    CdsMastermat_tributacao_pis: TStringField;
    CdsMastermat_tributacao_cofins: TStringField;
    CdsMastermat_cst: TStringField;
    CdsMastermat_csosn: TStringField;
    CdsMastermat_ncm_sh: TStringField;
    CdsMastermat_aliquota_pis: TFMTBCDField;
    CdsMastermat_aliquota_cofins: TFMTBCDField;
    CdsMastermat_valor_custo_int: TFMTBCDField;
    CdsMastermat_valor_custo_frc: TFMTBCDField;
    CdsMastermat_valor_venda_int: TFMTBCDField;
    CdsMastermat_valor_venda_frc: TFMTBCDField;
    CdsMastermat_data_cadastro: TDateField;
    CdsMastermat_ultcompra_data: TDateField;
    CdsMastermat_ultcompra_forn: TIntegerField;
    CdsMastermat_log_insert: TStringField;
    CdsMastermat_log_update: TStringField;
    CdsMastermat_log_inactive: TStringField;
    CdsMastertip_descricao: TStringField;
    CdsMastergrp_descricao: TStringField;
    CdsMastersgp_descricao: TStringField;
    CdsMasterdes_descricao: TStringField;
    CdsMasterapr_descricao: TStringField;
    CdsMasterpes_razao_social: TStringField;
    CdsMasterpes_documento: TStringField;
    dbDescricao: TcxDBButtonEdit;
    dbApresentacao: TcxDBButtonEdit;
    QryMaterialTipo: TSQLQuery;
    DspMaterialTipo: TDataSetProvider;
    CdsMaterialTipo: TClientDataSet;
    DtsMaterialTipo: TDataSource;
    GrpBxTipoCusto: TcxGroupBox;
    ckCustoDireto: TcxDBCheckBox;
    ckCustoIndireto: TcxDBCheckBox;
    lblGrupo: TcxLabel;
    dbGrupo: TcxDBButtonEdit;
    lblSubgrupo: TcxLabel;
    dbSubgrupo: TcxDBLookupComboBox;
    QryMaterialSubgrupo: TSQLQuery;
    DspMaterialSubgrupo: TDataSetProvider;
    CdsMaterialSubgrupo: TClientDataSet;
    DtsMaterialSubgrupo: TDataSource;
    QryUnidade: TSQLQuery;
    DspUnidade: TDataSetProvider;
    CdsUnidade: TClientDataSet;
    DtsUnidade: TDataSource;
    lblUnidadeCompra: TcxLabel;
    dbUnidadeCompra: TcxDBLookupComboBox;
    lblFracionador: TcxLabel;
    dbFracionador: TcxDBTextEdit;
    lblUnidadeConsumo: TcxLabel;
    dbUnidadeConsumo: TcxDBLookupComboBox;
    lblNCM_SH: TcxLabel;
    dbNCM_SH: TcxDBTextEdit;
    lblDataCadastro: TcxLabel;
    dbDataCadastro: TcxDBTextEdit;
    lblUltimaCompraData: TcxLabel;
    dbUltimaCompraData: TcxDBTextEdit;
    lblUltimaCompraFornecedor: TcxLabel;
    d1UltimaCompraFornecedor: TcxDBTextEdit;
    d2UltimaCompraFornecedor: TcxDBTextEdit;
    lblAliquotaTipo: TcxLabel;
    dbAliquotaTipo: TcxDBImageComboBox;
    lblTributacaoICMS: TcxLabel;
    dbTributacaoICMS: TcxDBLookupComboBox;
    CdsMastermat_aliquota_origem: TSmallintField;
    lblAliquotaOrigem: TcxLabel;
    dbAliquotaOrigem: TcxDBImageComboBox;
    lblAliquotaPercentual: TcxLabel;
    dbAliquotaPercentual: TcxDBTextEdit;
    lblCFOP: TcxLabel;
    dbCFOP: TcxDBButtonEdit;
    lblAliquotaPercentualSN: TcxLabel;
    dbAliquotaPercentualSN: TcxDBTextEdit;
    GrpBxCustoMedio: TcxGroupBox;
    lblValorCustoInteiro: TcxLabel;
    dbValorCustoInteiro: TcxDBTextEdit;
    lblValorCustoFrac: TcxLabel;
    dbValorCustoFrac: TcxDBTextEdit;
    TbsSetor: TcxTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure CdsMasterNewRecord(DataSet: TDataSet);
    procedure CdsMasterBeforePost(DataSet: TDataSet);
    procedure DtsMasterStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbDescricaoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure dbApresentacaoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure dbGrupoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    function MontarNomeResumido : String;
    procedure FiltrarSubgrupos;
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
    function ExecutarInsercao : Boolean; override;
    function ExecutarAlteracao : Boolean; override;
  end;

var
  FrmMaterialCadastro: TFrmMaterialCadastro;

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
  , iStrMaterialDescricao
  , iStrMaterialApresentacao, iStrMaterialGrupo;

{$R *.dfm}

{ TFrmMaterialCadastro }

function TFrmMaterialCadastro.ExecutarAlteracao: Boolean;
begin
  RefreshDB;

  if ( not CdsMaster.Active ) then
    CdsMaster.Open;

  AutoEdit := True;

  if not Showing then
    ShowModal;

  Result := RegistroEditado;
end;

function TFrmMaterialCadastro.ExecutarInsercao: Boolean;
begin
  RefreshDB;

  if ( not CdsMaster.Active ) then
    CdsMaster.Open;

  AutoInsert := True;

  if not Showing then
    ShowModal;

  Result := RegistroInserido;
end;

function TFrmMaterialCadastro.ExecutarPesquisa: Boolean;
begin
  RefreshDB;

  CdsMaster.Close;
  CdsMaster.Open;

  Result := not CdsMaster.IsEmpty;
end;

procedure TFrmMaterialCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  ComponenteLogin := FrmLogin;
  ConexaoDB       := FrmLogin.conWebMaster;

  NomeTabela     := 'str_material';
  CampoChave     := 'mat_codigo';
  CampoDescricao := 'mat_descricao_resumo';

  AbrirTabela := True;
  PgCtrlDadosAdcionais.ActivePage := TbsClassificar;
end;

procedure TFrmMaterialCadastro.CdsMasterNewRecord(DataSet: TDataSet);
begin
  CdsMastermat_codigo.AsInteger    := MaxCod(NomeTabela, CampoChave, EmptyStr);
  CdsMastermat_status.AsInteger    := 1;
  CdsMastermat_custo_direto.AsInteger   := 0;
  CdsMastermat_custo_indireto.AsInteger := 0;
  CdsMastermat_fracionador.AsInteger    := 1;

  CdsMastermat_aliquota_tipo.AsInteger  := 0;
  CdsMastermat_aliquota_origem.AsInteger:= 0;

  CdsMastermat_valor_custo_int.AsCurrency := 0.0;
  CdsMastermat_valor_custo_frc.AsCurrency := 0.0;
  CdsMastermat_valor_venda_int.AsCurrency := 0.0;
  CdsMastermat_valor_venda_frc.AsCurrency := 0.0;

  CdsMastermat_data_cadastro.AsDateTime := Now;
  CdsMastermat_log_insert.AsString := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;
end;

procedure TFrmMaterialCadastro.CdsMasterBeforePost(DataSet: TDataSet);
begin
  if ( CdsMaster.Modified and (CdsMaster.State = dsEdit) ) then
    CdsMastermat_log_update.AsString := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;

  if ( CdsMastermat_status.AsInteger = 0 ) then
    CdsMastermat_log_inactive.AsString := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;
  inherited;
end;

procedure TFrmMaterialCadastro.DtsMasterStateChange(Sender: TObject);
begin
  inherited;
  if ( CdsMaster.State in [dsEdit, dsInsert] ) then
    if ( dbTipo.Visible and dbTipo.Enabled ) then
      dbTipo.SetFocus;

  dbDescricao.Properties.Buttons[0].Enabled    := (CdsMaster.State in [dsEdit, dsInsert]);
  dbApresentacao.Properties.Buttons[0].Enabled := (CdsMaster.State in [dsEdit, dsInsert]);
end;

procedure TFrmMaterialCadastro.FormActivate(Sender: TObject);
begin
  inherited;
  // Carregar tabela de Tipos
  CdsMaterialTipo.Close;
  CdsMaterialTipo.Open;

  // Carregar tabela de Subgrupos
  CdsMaterialSubgrupo.Close;
  CdsMaterialSubgrupo.Open;
  FiltrarSubgrupos;

  // Carregar tabela de Unidades de Medidas
  CdsUnidade.Close;
  CdsUnidade.Open;
end;

procedure TFrmMaterialCadastro.dbDescricaoPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AForm : TFrmMaterialDescricao;
begin
  AForm := TFrmMaterialDescricao.CreateTable(Self, FrmLogin, FrmLogin.conWebMaster);
  try
    if ( CdsMaster.State in [dsEdit, dsInsert] ) then
    begin
      AForm.SelecionarRegistro := True;
      if ( AForm.ShowModal = mrOk ) then
      begin
        CdsMastermat_descricao.Assign( AForm.CdsMasterdes_codigo );
        CdsMasterdes_descricao.Assign( AForm.CdsMasterdes_descricao );

        if ( (CdsMaster.State = dsInsert) or (CdsMastermat_descricao.OldValue <> CdsMastermat_descricao.NewValue) ) then
          CdsMastermat_descricao_resumo.AsString := MontarNomeResumido;
      end;
    end;
  finally
    AForm.Free;
  end;
end;

procedure TFrmMaterialCadastro.dbApresentacaoPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AForm : TFrmMaterialApresentacao;
begin
  AForm := TFrmMaterialApresentacao.CreateTable(Self, FrmLogin, FrmLogin.conWebMaster);
  try
    if ( CdsMaster.State in [dsEdit, dsInsert] ) then
    begin
      AForm.SelecionarRegistro := True;
      if ( AForm.ShowModal = mrOk ) then
      begin
        CdsMastermat_apresentacao.Assign( AForm.CdsMasterapr_codigo );
        CdsMasterapr_descricao.Assign( AForm.CdsMasterapr_descricao );

        if ( (CdsMaster.State = dsInsert) or (CdsMastermat_apresentacao.OldValue <> CdsMastermat_apresentacao.NewValue) ) then
          CdsMastermat_descricao_resumo.AsString := MontarNomeResumido;
      end;
    end;
  finally
    AForm.Free;
  end;
end;

function TFrmMaterialCadastro.MontarNomeResumido: String;
begin
  Result := Trim(AnsiUpperCase(CdsMasterdes_descricao.AsString)) + ' ' + Trim(CdsMasterapr_descricao.AsString)
end;

procedure TFrmMaterialCadastro.dbGrupoPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AForm : TFrmMaterialGrupo;
begin
  AForm := TFrmMaterialGrupo.CreateTable(Self, FrmLogin, FrmLogin.conWebMaster);
  try
    if ( CdsMaster.State in [dsEdit, dsInsert] ) then
    begin
      AForm.SelecionarRegistro := True;
      if ( AForm.ShowModal = mrOk ) then
      begin
        CdsMastermat_grupo.Assign( AForm.CdsMastergrp_codigo );
        CdsMastergrp_descricao.Assign( AForm.CdsMastergrp_descricao );

        FiltrarSubgrupos;
        CdsMaterialSubgrupo.Refresh;

        if not CdsMaterialSubgrupo.Locate('sgp_codigo', CdsMastermat_subgrupo.AsInteger, []) then
          CdsMastermat_subgrupo.Clear;
      end;
    end;
  finally
    AForm.Free;
  end;
end;

procedure TFrmMaterialCadastro.FiltrarSubgrupos;
begin
  CdsMaterialSubgrupo.Filter   := 'sgp_grupo = ' + CdsMastermat_grupo.AsString;
  CdsMaterialSubgrupo.Filtered := ( CdsMastermat_grupo.AsInteger > 0 );
end;

end.
