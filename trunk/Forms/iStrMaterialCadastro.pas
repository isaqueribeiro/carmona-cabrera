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
  cxCheckBox, cxRadioGroup, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

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
    QryTributacaoICMS: TSQLQuery;
    DspTributacaoICMS: TDataSetProvider;
    CdsTributacaoICMS: TClientDataSet;
    DtsTributacaoICMS: TDataSource;
    CdsTributacaoICMStrb_codigo: TStringField;
    CdsTributacaoICMStrb_descricao: TStringField;
    CdsTributacaoICMStrb_crt: TSmallintField;
    CdsTributacaoICMStrb_descricao_full: TStringField;
    lblTributacaoPIS: TcxLabel;
    dbTributacaoPIS: TcxDBLookupComboBox;
    lblTributacaoPIS_Percent: TcxLabel;
    dbTributacaoPIS_Percent: TcxDBTextEdit;
    lblTributacaoCOFINS: TcxLabel;
    dbTributacaoCOFINS: TcxDBLookupComboBox;
    lblTributacaoCOFINS_Percent: TcxLabel;
    dbTributacaoCOFINS_Percent: TcxDBTextEdit;
    QryTributacaoPIS: TSQLQuery;
    DspTributacaoPIS: TDataSetProvider;
    CdsTributacaoPIS: TClientDataSet;
    DtsTributacaoPIS: TDataSource;
    QryTributacaoCOFINS: TSQLQuery;
    DspTributacaoCOFINS: TDataSetProvider;
    CdsTributacaoCOFINS: TClientDataSet;
    DtsTributacaoCOFINS: TDataSource;
    CdsTributacaoPIStrb_codigo: TStringField;
    CdsTributacaoPIStrb_descricao: TStringField;
    CdsTributacaoPIStrb_descricao_full: TStringField;
    CdsTributacaoCOFINStrb_codigo: TStringField;
    CdsTributacaoCOFINStrb_descricao: TStringField;
    CdsTributacaoCOFINStrb_descricao_full: TStringField;
    DbgSetor: TcxGrid;
    DbgSetorDB: TcxGridDBTableView;
    DbgSetorLvl: TcxGridLevel;
    QrySetor: TSQLQuery;
    DspSetor: TDataSetProvider;
    CdsSetor: TClientDataSet;
    DtsSetor: TDataSource;
    CdsSetormat_codigo: TFMTBCDField;
    CdsSetormat_setor: TSmallintField;
    CdsSetorset_nome: TStringField;
    CdsSetormat_setor_requisita: TBCDField;
    DbgSetorDBmat_setor: TcxGridDBColumn;
    DbgSetorDBset_nome: TcxGridDBColumn;
    DbgSetorDBmat_setor_requisita: TcxGridDBColumn;
    CdsMastermat_imagem: TBlobField;
    CdsMastermat_ultcompra_valor: TFMTBCDField;
    lblValorUltimaCompra: TcxLabel;
    dbValorUltimaCompra: TcxDBTextEdit;
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
    procedure CdsTributacaoICMSCalcFields(DataSet: TDataSet);
    procedure CdsTributacaoPISCalcFields(DataSet: TDataSet);
    procedure CdsTributacaoCOFINSCalcFields(DataSet: TDataSet);
    procedure CdsMasterAfterPost(DataSet: TDataSet);
    procedure CdsMasterAfterOpen(DataSet: TDataSet);
    procedure CdsMasterAfterCancel(DataSet: TDataSet);
    procedure CdsMasterAfterDelete(DataSet: TDataSet);
    procedure dbDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbApresentacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure FiltrarSubgrupos;
    procedure CarregarSetores;
    procedure GravarSetores;
    function MontarNomeResumido : String;
  public
    { Public declarations }
    procedure VisualizarConsulta; override;

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
  CdsMastermat_fracionador.AsCurrency   := 1;

  CdsMastermat_aliquota_tipo.AsInteger    := 0;
  CdsMastermat_aliquota_origem.AsInteger  := 0;
  CdsMastermat_tributacao_icms.AsString   := '41';  // Não tributada
  CdsMastermat_tributacao_pis.AsString    := '99';  // Outras operações
  CdsMastermat_tributacao_cofins.AsString := '99';  // Outras operações
  CdsMastermat_cst.AsString               := CdsMastermat_aliquota_origem.AsString + CdsMastermat_tributacao_icms.AsString;
  CdsMastermat_csosn.AsString             := '102'; // Tributada pelo Simples Nacional sem permissão de Crédito

  CdsMastermat_aliquota.AsCurrency        := 0.0;
  CdsMastermat_aliquota_pis.AsCurrency    := 0.0;
  CdsMastermat_aliquota_cofins.AsCurrency := 0.0;

  CdsMastermat_valor_custo_int.AsCurrency := 0.0;
  CdsMastermat_valor_custo_frc.AsCurrency := 0.0;
  CdsMastermat_valor_venda_int.AsCurrency := 0.0;
  CdsMastermat_valor_venda_frc.AsCurrency := 0.0;

  CdsMastermat_data_cadastro.AsDateTime := Now;
  CdsMastermat_log_insert.AsString := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;
end;

procedure TFrmMaterialCadastro.CdsMasterBeforePost(DataSet: TDataSet);
begin
  CdsMastermat_cst.AsString := CdsMastermat_aliquota_origem.AsString + CdsMastermat_tributacao_icms.AsString;

  if ( Trim(CdsMastermat_descricao_resumo.AsString) = EmptyStr ) then
    CdsMastermat_descricao_resumo.Clear;

  if ( CdsMastermat_fracionador.AsCurrency = 0.0 ) then
    CdsMastermat_fracionador.AsCurrency := 1;
    
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
  dbGrupo.Properties.Buttons[0].Enabled := (CdsMaster.State in [dsEdit, dsInsert]);
  dbCFOP.Properties.Buttons[0].Enabled  := (CdsMaster.State in [dsEdit, dsInsert]);

  DtsSetor.AutoEdit := (CdsMaster.State in [dsEdit, dsInsert]);
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

  // Carregar tabela de Tributação ICMS
  CdsTributacaoICMS.Close;
  CdsTributacaoICMS.Open;

  // Carregar tabela de Tributação PIS
  CdsTributacaoPIS.Close;
  CdsTributacaoPIS.Open;

  // Carregar tabela de Tributação COFINS
  CdsTributacaoCOFINS.Close;
  CdsTributacaoCOFINS.Open;
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

procedure TFrmMaterialCadastro.CdsTributacaoICMSCalcFields(
  DataSet: TDataSet);
begin
  CdsTributacaoICMStrb_descricao_full.AsString := CdsTributacaoICMStrb_codigo.AsString + ' - ' +
    CdsTributacaoICMStrb_descricao.AsString; 
end;

procedure TFrmMaterialCadastro.CdsTributacaoPISCalcFields(
  DataSet: TDataSet);
begin
  CdsTributacaoPIStrb_descricao_full.AsString := CdsTributacaoPIStrb_codigo.AsString + ' - ' +
    CdsTributacaoPIStrb_descricao.AsString;
end;

procedure TFrmMaterialCadastro.CdsTributacaoCOFINSCalcFields(
  DataSet: TDataSet);
begin
  CdsTributacaoCOFINStrb_descricao_full.AsString := CdsTributacaoCOFINStrb_codigo.AsString + ' - ' +
    CdsTributacaoCOFINStrb_descricao.AsString;
end;

procedure TFrmMaterialCadastro.CarregarSetores;
begin
  with CdsSetor, Params do
  begin
    Close;
    ParamByName('mat_codigo').AsCurrency := CdsMastermat_codigo.AsCurrency;
    Open;
  end;
end;

procedure TFrmMaterialCadastro.GravarSetores;
begin
  if CdsSetor.IsEmpty then
    Exit
  else
  begin
    CdsSetor.First;
    while not CdsSetor.Eof do
    begin
      CdsSetor.Edit;
      CdsSetormat_codigo.Assign( CdsMastermat_codigo );
      CdsSetor.Post;

      ExecutarInsertUpdateTable(CdsSetor, 'str_material_setor');
      CdsSetor.Next;
    end;
  end;
end;

procedure TFrmMaterialCadastro.CdsMasterAfterPost(DataSet: TDataSet);
begin
  GravarSetores;
end;

procedure TFrmMaterialCadastro.CdsMasterAfterOpen(DataSet: TDataSet);
begin
  CarregarSetores;
end;

procedure TFrmMaterialCadastro.CdsMasterAfterCancel(DataSet: TDataSet);
begin
  CarregarSetores;
end;

procedure TFrmMaterialCadastro.CdsMasterAfterDelete(DataSet: TDataSet);
begin
  CarregarSetores;
end;

procedure TFrmMaterialCadastro.dbDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
    if ( CdsMaster.State in [dsEdit, dsInsert] ) then
    begin
      CdsMastermat_descricao.Clear;
      CdsMasterdes_descricao.Clear;
    end;
end;

procedure TFrmMaterialCadastro.dbApresentacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
    if ( CdsMaster.State in [dsEdit, dsInsert] ) then
    begin
      CdsMastermat_apresentacao.Clear;
      CdsMasterapr_descricao.Clear;
    end;
end;

procedure TFrmMaterialCadastro.dbGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
    if ( CdsMaster.State in [dsEdit, dsInsert] ) then
    begin
      CdsMastermat_grupo.Clear;
      CdsMastergrp_descricao.Clear;
      CdsMastermat_subgrupo.Clear;
    end;
end;

procedure TFrmMaterialCadastro.VisualizarConsulta;
begin
  RefreshDB;

  if ( not CdsMaster.Active ) then
    CdsMaster.Open;

  AutoEdit := False;

  if not Showing then
    ShowModal;
end;

end.
