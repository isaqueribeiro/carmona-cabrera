unit iStrMaterialCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadraoCadastro, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, dxSkinsCore,
  dxSkinscxPCPainter, cxContainer, cxEdit, FMTBcd, DB, DBClient, Provider,
  SqlExpr, cxGroupBox, cxPC, StdCtrls, cxButtons, ExtCtrls, cxTextEdit,
  cxDBEdit, cxLabel, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxMemo, cxImageComboBox, cxButtonEdit;

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
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
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
    procedure FormCreate(Sender: TObject);
    procedure CdsMasterNewRecord(DataSet: TDataSet);
    procedure CdsMasterBeforePost(DataSet: TDataSet);
    procedure DtsMasterStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbDescricaoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
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
  , iStrMaterialDescricao;

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
  PgCtrlDadosAdcionais.ActivePage := cxTabSheet1;
end;

procedure TFrmMaterialCadastro.CdsMasterNewRecord(DataSet: TDataSet);
begin
  CdsMastermat_codigo.AsInteger    := MaxCod(NomeTabela, CampoChave, EmptyStr);
  CdsMastermat_status.AsInteger    := 1;
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
      end;
    end;
  finally
    AForm.Free;
  end;
end;

end.
