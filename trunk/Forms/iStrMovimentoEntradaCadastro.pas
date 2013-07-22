unit iStrMovimentoEntradaCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadraoCadastro, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, dxSkinsCore,
  dxSkinscxPCPainter, cxContainer, cxEdit, FMTBcd, DB, DBClient, Provider,
  SqlExpr, cxGroupBox, cxPC, StdCtrls, cxButtons, ExtCtrls, cxMemo,
  cxDBEdit, cxDropDownEdit, cxCalendar, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxLabel, cxButtonEdit,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid;

type
  TFrmMovimentoEntradaCadastro = class(TFrmPadraoCadastro)
    popupProcesso: TPopupMenu;
    pmEncerrar: TMenuItem;
    pmCancelar: TMenuItem;
    BtnProcesso: TcxButton;
    QryUnidadeNeg: TSQLQuery;
    DspUnidadeNeg: TDataSetProvider;
    CdsUnidadeNeg: TClientDataSet;
    DtsUnidadeNeg: TDataSource;
    QryCompetencia: TSQLQuery;
    DspCompetencia: TDataSetProvider;
    CdsCompetencia: TClientDataSet;
    DtsCompetencia: TDataSource;
    QryTipoEntrada: TSQLQuery;
    DspTipoEntrada: TDataSetProvider;
    CdsTipoEntrada: TClientDataSet;
    DtsTipoEntrada: TDataSource;
    QryUnidade: TSQLQuery;
    DspUnidade: TDataSetProvider;
    CdsUnidade: TClientDataSet;
    DtsUnidade: TDataSource;
    QryItem: TSQLQuery;
    DspItem: TDataSetProvider;
    CdsItem: TClientDataSet;
    DtsItem: TDataSource;
    QryDuplicata: TSQLQuery;
    DspDuplicata: TDataSetProvider;
    CdsDuplicata: TClientDataSet;
    DtsDuplicata: TDataSource;
    QryTipoDocumento: TSQLQuery;
    DspTipoDocumento: TDataSetProvider;
    CdsTipoDocumento: TClientDataSet;
    DtsTipoDocumento: TDataSource;
    TbsItem: TcxTabSheet;
    CdsMasterent_ano: TSmallintField;
    CdsMasterent_codigo: TFMTBCDField;
    CdsMasterent_tipo: TStringField;
    CdsMasterent_unidade_neg: TSmallintField;
    CdsMasterent_setor: TSmallintField;
    CdsMasterent_pessoa: TIntegerField;
    CdsMasterent_data: TDateField;
    CdsMasterent_hora: TTimeField;
    CdsMasterent_doc_tipo: TSmallintField;
    CdsMasterent_doc_numero: TStringField;
    CdsMasterent_doc_serie: TStringField;
    CdsMasterent_doc_emissao: TDateField;
    CdsMasterent_competencia: TSmallintField;
    CdsMasterent_obs: TMemoField;
    CdsMasterent_cfop: TIntegerField;
    CdsMasterent_base_icms: TFMTBCDField;
    CdsMasterent_valor_icms: TFMTBCDField;
    CdsMasterent_base_icms_st: TFMTBCDField;
    CdsMasterent_valor_icms_st: TFMTBCDField;
    CdsMasterent_valor_total_prod: TFMTBCDField;
    CdsMasterent_valor_frete: TFMTBCDField;
    CdsMasterent_valor_seguro: TFMTBCDField;
    CdsMasterent_valor_desconto: TFMTBCDField;
    CdsMasterent_valor_outros: TFMTBCDField;
    CdsMasterent_valor_ipi: TFMTBCDField;
    CdsMasterent_valor_nota: TFMTBCDField;
    CdsMasterent_valor_total_serv: TFMTBCDField;
    CdsMasterent_base_issqn: TFMTBCDField;
    CdsMasterent_percent_issqn: TFMTBCDField;
    CdsMasterent_valor_issqn: TFMTBCDField;
    CdsMasterent_status: TSmallintField;
    CdsMasterent_usuario_abertura: TStringField;
    CdsMasterent_usuario_fechamento: TStringField;
    CdsMasterent_log_insert: TStringField;
    CdsMasterent_log_update: TStringField;
    CdsMasterent_log_inactive: TStringField;
    CdsMasterent_mov_codigo: TIntegerField;
    CdsMasteruni_nome: TStringField;
    CdsMasterpes_razao_social: TStringField;
    CdsMasterpes_nome_fantasia: TStringField;
    CdsMastertip_nome: TStringField;
    CdsMasterent_status_desc: TStringField;
    lblCodigo: TcxLabel;
    dbAno: TcxDBTextEdit;
    dbCodigo: TcxDBTextEdit;
    lblUnidadeNegocio: TcxLabel;
    dbUnidadeNegocio: TcxDBLookupComboBox;
    lblCompetencia: TcxLabel;
    dbCompetencia: TcxDBLookupComboBox;
    lblData: TcxLabel;
    dbData: TcxDBDateEdit;
    lblHora: TcxLabel;
    dbHora: TcxDBTextEdit;
    lblUsuarioAbertura: TcxLabel;
    dbUsuarioAbertura: TcxDBTextEdit;
    lblTipoEntrada: TcxLabel;
    dbTipoEntrada: TcxDBLookupComboBox;
    lblSituacao: TcxLabel;
    dbSituacao: TcxDBTextEdit;
    lblObservacao: TcxLabel;
    dbObservacao: TcxDBMemo;
    GrpDadosFornecedor: TcxGroupBox;
    lblFornecedor: TcxLabel;
    dbFornecedor: TcxDBButtonEdit;
    lblCfop: TcxLabel;
    dbCfop: TcxDBTextEdit;
    dbCfopDescricao: TcxDBTextEdit;
    lblCpfCnpj: TcxLabel;
    dbCpfCnpj: TcxDBTextEdit;
    GrpDadosDocumento: TcxGroupBox;
    lblDocumentoTipo: TcxLabel;
    dbDocumentoTipo: TcxDBLookupComboBox;
    lblDocumentoEmissao: TcxLabel;
    dbDocumentoEmissao: TcxDBDateEdit;
    lblDocumentoNumero: TcxLabel;
    d1DocumentoNumero: TcxDBTextEdit;
    d2DocumentoNumero: TcxDBTextEdit;
    cxGroupBox1: TcxGroupBox;
    lblBaseICMS: TcxLabel;
    dbBaseICMS: TcxDBTextEdit;
    lblValorICMS: TcxLabel;
    dbValorICMS: TcxDBTextEdit;
    CdsMasterpes_documento: TStringField;
    CdsMastercfop_descricao: TStringField;
    lblBaseICMSSubst: TcxLabel;
    dbBaseICMSSubst: TcxDBTextEdit;
    lblValorICMSSubst: TcxLabel;
    dbValorICMSSubst: TcxDBTextEdit;
    lblTotalProduto: TcxLabel;
    dbTotalProduto: TcxDBTextEdit;
    lblTotalFrete: TcxLabel;
    dbTotalFrete: TcxDBTextEdit;
    lblTotalSeguro: TcxLabel;
    dbTotalSeguro: TcxDBTextEdit;
    lblTotalDesconto: TcxLabel;
    dbTotalDesconto: TcxDBTextEdit;
    lblTotalOutros: TcxLabel;
    dbTotalOutros: TcxDBTextEdit;
    lblTotalIPI: TcxLabel;
    dbTotalIPI: TcxDBTextEdit;
    lblTotalNota: TcxLabel;
    dbTotalNota: TcxDBTextEdit;
    lblTotalServico: TcxLabel;
    dbTotalServico: TcxDBTextEdit;
    lblBaseISSQN: TcxLabel;
    dbBaseISSQN: TcxDBTextEdit;
    lblPercentualISS: TcxLabel;
    dbPercentualISS: TcxDBTextEdit;
    lblValorISSQN: TcxLabel;
    dbValorISSQN: TcxDBTextEdit;
    CdsMasterent_aprop_tipo_custo: TSmallintField;
    CdsMasterent_aprop_centro_negocio: TSmallintField;
    CdsMasterent_aprop_unidade_negocio: TSmallintField;
    CdsMasterent_aprop_centro_custo: TSmallintField;
    CdsMasterent_aprop_setor: TSmallintField;
    CdsMasterent_aprop_conta: TSmallintField;
    Panel1: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    pnlItemControle: TPanel;
    BtnSalvarItem: TcxButton;
    BtnCancelarItem: TcxButton;
    GrpItemEdit: TcxGroupBox;
    lblItemSequencial: TcxLabel;
    dbItemSequencial: TcxDBTextEdit;
    lblItemCodigo: TcxLabel;
    dbItemCodigo: TcxDBButtonEdit;
    dbItemDescricao: TcxDBTextEdit;
    lblItemQuantidade: TcxLabel;
    dbItemQuantidade: TcxDBTextEdit;
    lblItemUnidadeCompra: TcxLabel;
    dbItemUnidadeCompra: TcxDBLookupComboBox;
    CdsItement_ano: TSmallintField;
    CdsItement_codigo: TFMTBCDField;
    CdsItemitm_sequencia: TSmallintField;
    CdsItemitm_material: TFMTBCDField;
    CdsItemitm_ncm_sh: TStringField;
    CdsItemitm_cst: TStringField;
    CdsItemitm_csosn: TStringField;
    CdsItemitm_cfop: TIntegerField;
    CdsItemitm_unidade_compra: TIntegerField;
    CdsItemitm_quantidade: TFMTBCDField;
    CdsItemitm_valor_unitario: TFMTBCDField;
    CdsItemitm_valor_total: TFMTBCDField;
    CdsItemitm_valor_ipi: TFMTBCDField;
    CdsItemitm_percent_participa: TFMTBCDField;
    CdsItemitm_valor_frete: TFMTBCDField;
    CdsItemitm_valor_desconto: TFMTBCDField;
    CdsItemitm_valor_seguro: TFMTBCDField;
    CdsItemitm_valor_outros: TFMTBCDField;
    CdsItemitm_valor_custo: TFMTBCDField;
    CdsItemmat_descricao_resumo: TStringField;
    CdsItemund_descricao: TStringField;
    CdsItemund_sigla: TStringField;
    CdsMasterItens: TBCDField;
    lblItemNCM: TcxLabel;
    dbItemNCM: TcxDBTextEdit;
    GrpItemTributacao: TcxGroupBox;
    cxLabel2: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxLabel4: TcxLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    lblItemValorUn: TcxLabel;
    dbItemValorUn: TcxDBTextEdit;
    lblItemValorIPI: TcxLabel;
    dbItemValorIPI: TcxDBTextEdit;
    Panel3: TPanel;
    Shape2: TShape;
    Label2: TLabel;
    DbgItem: TcxGrid;
    DbgItemDB: TcxGridDBTableView;
    DbgItemDBitm_sequencia: TcxGridDBColumn;
    DbgItemDBitm_material: TcxGridDBColumn;
    DbgItemDBmat_descricao_resumo: TcxGridDBColumn;
    DbgItemDBitm_qtde_nova: TcxGridDBColumn;
    DbgItemDBund_descricao: TcxGridDBColumn;
    DbgItemLvl: TcxGridLevel;
    DbgItemDBitm_valor_unitario: TcxGridDBColumn;
    DbgItemDBitm_valor_total: TcxGridDBColumn;
    DbgItemDBitm_valor_ipi: TcxGridDBColumn;
    CdsItemitm_fracionador: TFMTBCDField;
    pmApropriar: TMenuItem;
    N1: TMenuItem;
    CdsDuplicataent_ano: TSmallintField;
    CdsDuplicataent_codigo: TFMTBCDField;
    CdsDuplicatadup_sequencia: TSmallintField;
    CdsDuplicatadup_numero: TStringField;
    CdsDuplicatadup_vencimento: TDateField;
    CdsDuplicatadup_valor: TFMTBCDField;
    CdsDuplicatadup_mov_codigo: TIntegerField;
    CdsDuplicatadup_mov_item: TSmallintField;
    CdsMasterent_aprop_tipo_aceite: TSmallintField;
    TbsDuplicata: TcxTabSheet;
    pnlDuplicataTitulo: TPanel;
    Shape3: TShape;
    Label3: TLabel;
    DbgDuplicata: TcxGrid;
    DbgDuplicataDB: TcxGridDBTableView;
    DbgDuplicataLvl: TcxGridLevel;
    DbgDuplicataDBdup_sequencia: TcxGridDBColumn;
    DbgDuplicataDBdup_numero: TcxGridDBColumn;
    DbgDuplicataDBdup_vencimento: TcxGridDBColumn;
    DbgDuplicataDBdup_valor: TcxGridDBColumn;
    DbgDuplicataDBdup_mov_codigo: TcxGridDBColumn;
    DbgDuplicataDBdup_mov_item: TcxGridDBColumn;
    QryFinanceiro: TSQLQuery;
    DspFinanceiro: TDataSetProvider;
    CdsFinanceiro: TClientDataSet;
    DtsFinanceiro: TDataSource;
    QryFinanceiroParcela: TSQLQuery;
    DspFinanceiroParcela: TDataSetProvider;
    CdsFinanceiroParcela: TClientDataSet;
    DtsFinanceiroParcela: TDataSource;
    CdsFinanceiromov_codigo: TIntegerField;
    CdsFinanceiromov_data_inclusao: TDateField;
    CdsFinanceiromov_data_emissao: TDateField;
    CdsFinanceirocus_codigo: TSmallintField;
    CdsFinanceironeg_codigo: TSmallintField;
    CdsFinanceirocen_codigo: TSmallintField;
    CdsFinanceirouni_codigo: TSmallintField;
    CdsFinanceiropes_codigo: TIntegerField;
    CdsFinanceirocon_codigo: TSmallintField;
    CdsFinanceiroset_codigo: TSmallintField;
    CdsFinanceirosit_codigo: TSmallintField;
    CdsFinanceirocom_codigo: TSmallintField;
    CdsFinanceiromov_obs: TStringField;
    CdsFinanceiromov_inc: TStringField;
    CdsFinanceiromov_alt: TStringField;
    CdsFinanceiromov_contrato: TStringField;
    CdsFinanceirotip_ace_codigo: TSmallintField;
    CdsFinanceiromov_documento: TStringField;
    CdsFinanceiromov_previsao: TSmallintField;
    CdsFinanceiromov_parcelas: TSmallintField;
    CdsFinanceiromov_tipo: TSmallintField;
    CdsFinanceiroParcelamov_codigo: TIntegerField;
    CdsFinanceiroParcelamov_item: TSmallintField;
    CdsFinanceiroParcelamov_data_vencto: TDateField;
    CdsFinanceiroParcelamov_data_prev: TDateField;
    CdsFinanceiroParcelamov_valor: TFMTBCDField;
    CdsFinanceiroParcelamov_juros: TFMTBCDField;
    CdsFinanceiroParcelamov_desconto: TFMTBCDField;
    CdsFinanceiroParcelamov_valor_pagar: TFMTBCDField;
    CdsFinanceiroParcelafpg_codigo: TSmallintField;
    CdsFinanceiroParcelatip_doc_codigo: TSmallintField;
    CdsFinanceiroParcelamov_status: TSmallintField;
    CdsFinanceiroParcelamov_retencao: TFMTBCDField;
    CdsFinanceiroParcelamov_data_inclusao: TDateField;
    CdsFinanceiroParcelamov_parcela: TSmallintField;
    CdsFinanceiroParcelamov_aut_financeiro: TStringField;
    CdsFinanceiroParcelamov_aut_gerencia: TStringField;
    CdsDuplicatadup_forma_pagto: TSmallintField;
    QryFormaPagto: TSQLQuery;
    DspFormaPagto: TDataSetProvider;
    CdsFormaPagto: TClientDataSet;
    DtsFormaPagto: TDataSource;
    DbgDuplicataDBdup_forma_pagto: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure CdsMasterNewRecord(DataSet: TDataSet);
    procedure CdsMasterAfterCancel(DataSet: TDataSet);
    procedure CdsMasterAfterDelete(DataSet: TDataSet);
    procedure CdsMasterAfterOpen(DataSet: TDataSet);
    procedure dbItemCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbItemCodigoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BtnCancelarItemClick(Sender: TObject);
    procedure BtnSalvarItemClick(Sender: TObject);
    procedure DtsItemDataChange(Sender: TObject; Field: TField);
    procedure DtsMasterDataChange(Sender: TObject; Field: TField);
    procedure BtnProcessoClick(Sender: TObject);
    procedure DtsMasterStateChange(Sender: TObject);
    procedure DtsItemStateChange(Sender: TObject);
    procedure CdsMasterent_statusGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CdsMasterBeforePost(DataSet: TDataSet);
    procedure CdsMasterAfterPost(DataSet: TDataSet);
    procedure dbFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbFornecedorPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CdsItemNewRecord(DataSet: TDataSet);
    procedure pmApropriarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pmEncerrarClick(Sender: TObject);
    procedure PgCtrlMainChange(Sender: TObject);
    procedure CdsDuplicataNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    procedure CarregarItens;
    procedure CarregarDuplicatas;
    procedure GravarItens;
    procedure GravarDuplicatas;
    procedure CarregarDadosMaterial;
    procedure CarregarDadosCFOP;
    procedure GerarMovimentoFinanceiro;

    function GetCompetenciaID(inData : TDateTime) : Smallint;
    function IsMovimentoApropriado : Boolean;
    function GetValorTotalProduto : Currency;
    function GetValorTotalDuplicata : Currency;
  public
    { Public declarations }
    procedure VisualizarConsulta; override;

    function ExecutarPesquisa : Boolean; override;
    function ExecutarInsercao : Boolean; override;
    function ExecutarAlteracao : Boolean; override;
  end;

var
  FrmMovimentoEntradaCadastro: TFrmMovimentoEntradaCadastro;

implementation

uses
    DateUtils
  , KeyFuncoes
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
  , KeyRequiredFields
  , KeyPessoaPesquisa
  , iStrMaterialPesquisa, iStrMovimentoEntradaApropriar;

{$R *.dfm}

procedure TFrmMovimentoEntradaCadastro.CarregarItens;
begin
  with CdsItem, Params do
  begin
    Close;
    ParamByName('ent_ano').AsInteger     := CdsMasterent_ano.AsInteger;
    ParamByName('ent_codigo').AsCurrency := CdsMasterent_codigo.AsCurrency;
    Open;
  end;
end;

procedure TFrmMovimentoEntradaCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  ComponenteLogin := FrmLogin;
  ConexaoDB       := FrmLogin.conWebMaster;

  NomeTabela     := 'str_entrada';
  CampoChave     := 'ent_codigo';
  CampoDescricao := 'pes_razao_social';

  CdsUnidadeNeg.Open;
  CdsFormaPagto.Open;
  
  CdsCompetencia.Open;
  CdsTipoEntrada.Open;
  CdsTipoDocumento.Open;
  CdsUnidade.Open;

  AbrirTabela := True;
//  PgCtrlMain.ActivePage := TbsPrincipal;
end;

procedure TFrmMovimentoEntradaCadastro.CdsMasterNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  CdsMasterent_ano.AsInteger    := YearOf(Date);
  CdsMasterent_codigo.AsInteger := 0;
  CdsMasterent_data.AsDateTime  := Date;
  CdsMasterent_hora.AsDateTime  := Time;
  CdsMasterent_competencia.AsInteger     := GetCompetenciaID(CdsMasterent_data.AsDateTime);
  CdsMasterent_usuario_abertura.AsString := gUsuario.Login;
  CdsMasterent_status.AsInteger          := STATUS_ENTRADA_ESTOQUE_ABERTA;
  CdsMasterent_log_insert.AsString       := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;

  CdsMasterent_base_icms.AsCurrency     := 0.0;
  CdsMasterent_valor_icms.AsCurrency    := 0.0;
  CdsMasterent_base_icms_st.AsCurrency  := 0.0;
  CdsMasterent_valor_icms_st.AsCurrency := 0.0;
  CdsMasterent_valor_frete.AsCurrency   := 0.0;
  CdsMasterent_valor_seguro.AsCurrency   := 0.0;
  CdsMasterent_valor_desconto.AsCurrency := 0.0;
  CdsMasterent_valor_outros.AsCurrency   := 0.0;
  CdsMasterent_valor_ipi.AsCurrency      := 0.0;
  CdsMasterent_valor_total_serv.AsCurrency := 0.0;
  CdsMasterent_base_issqn.AsCurrency       := 0.0;
  CdsMasterent_percent_issqn.AsCurrency    := 0.0;
  CdsMasterent_valor_issqn.AsCurrency      := 0.0;

  CdsMasterent_valor_total_prod.Clear;
  CdsMasterent_valor_nota.Clear;

  CdsMasterent_unidade_neg.Clear;
  CdsMasterent_usuario_fechamento.Clear;
  CdsMasterItens.Clear;

  CdsMasterent_aprop_tipo_custo.Clear;
  CdsMasterent_aprop_centro_negocio.Clear;
  CdsMasterent_aprop_unidade_negocio.Clear;
  CdsMasterent_aprop_centro_custo.Clear;
  CdsMasterent_aprop_setor.Clear;
  CdsMasterent_aprop_conta.Clear;
  CdsMasterent_aprop_tipo_aceite.Clear;

  CarregarItens;
  CarregarDuplicatas;
end;

procedure TFrmMovimentoEntradaCadastro.CdsMasterAfterCancel(
  DataSet: TDataSet);
begin
  CarregarItens;
  CarregarDuplicatas;
end;

procedure TFrmMovimentoEntradaCadastro.CdsMasterAfterDelete(
  DataSet: TDataSet);
begin
  CarregarItens;
  CarregarDuplicatas;
end;

procedure TFrmMovimentoEntradaCadastro.CdsMasterAfterOpen(
  DataSet: TDataSet);
begin
  CarregarItens;
  CarregarDuplicatas;
end;

procedure TFrmMovimentoEntradaCadastro.VisualizarConsulta;
begin
  RefreshDB;

  if ( not CdsMaster.Active ) then
    CdsMaster.Open;

  AutoEdit := False;

  if not Showing then
    ShowModal;
end;

function TFrmMovimentoEntradaCadastro.ExecutarAlteracao: Boolean;
begin
  RefreshDB;

  if ( not CdsMaster.Active ) then
    CdsMaster.Open;

  AutoEdit := True;

  if not Showing then
    ShowModal;

  Result := RegistroEditado;
end;

function TFrmMovimentoEntradaCadastro.ExecutarInsercao: Boolean;
begin
  RefreshDB;

  if ( not CdsMaster.Active ) then
    CdsMaster.Open;

  AutoInsert := True;

  if not Showing then
    ShowModal;

  Result := RegistroInserido;
end;

function TFrmMovimentoEntradaCadastro.ExecutarPesquisa: Boolean;
begin
  RefreshDB;

  CdsMaster.Close;
  CdsMaster.Open;

  Result := not CdsMaster.IsEmpty;
end;

procedure TFrmMovimentoEntradaCadastro.GravarItens;
begin
  try
    CdsItem.DisableControls;

    if CdsItem.IsEmpty then
      Exit
    else
    begin
      CdsItem.First;
      while not CdsItem.Eof do
      begin
        CdsItem.Edit;
        CdsItement_ano.Assign( CdsMasterent_ano );
        CdsItement_codigo.Assign( CdsMasterent_codigo );
        CdsItem.Post;

        ExecutarInsertUpdateTable(CdsItem, 'str_entrada_item');
        CdsItem.Next;
      end;
    end;
  finally
    CdsItem.First;
    CdsItem.EnableControls;
  end;
end;

procedure TFrmMovimentoEntradaCadastro.CarregarDadosMaterial;
var
  cds : TClientDataSet;
begin
  if ( CdsItem.State in [dsEdit, dsInsert] ) then
  begin
    cds := TClientDataSet.Create(nil);
    try
      if GetDataSetDB(cds, 'str_material', 'mat_codigo = ' + CdsItemitm_material.AsString) then
      begin
        CdsItemmat_descricao_resumo.Assign( cds.FieldByName('mat_descricao_resumo') );
        CdsItemitm_unidade_compra.Assign( cds.FieldByName('mat_unidade_compra') );
        CdsItemitm_fracionador.Assign( cds.FieldByName('mat_fracionador') );
        CdsItemitm_ncm_sh.Assign( cds.FieldByName('mat_ncm_sh') );
        CdsItemitm_cst.Assign( cds.FieldByName('mat_cst') );
        CdsItemitm_csosn.Assign( cds.FieldByName('mat_csosn') );
        CdsItemitm_cfop.Assign( CdsMasterent_cfop );
      end
      else
      begin
        CdsItemitm_fracionador.AsInteger := 1;

        CdsItemmat_descricao_resumo.Clear;
        CdsItemitm_unidade_compra.Clear;
        CdsItemitm_ncm_sh.Clear;
        CdsItemitm_cst.Clear;
        CdsItemitm_csosn.Clear;
        CdsItemitm_cfop.Clear;
      end;
    finally
      cds.Free;
    end;
  end;
end;

procedure TFrmMovimentoEntradaCadastro.CarregarDadosCFOP;
var
  cds : TClientDataSet;
begin
  if ( CdsMaster.State in [dsEdit, dsInsert] ) then
  begin
    cds := TClientDataSet.Create(nil);
    try
      if GetDataSetDB(cds, 'sys_cfop', 'cfop_codigo = ' + CdsMasterent_cfop.AsString) then
        CdsMastercfop_descricao.Assign( cds.FieldByName('cfop_descricao') )
      else
        CdsMastercfop_descricao.Clear;
    finally
      cds.Free;
    end;
  end;
end;

function TFrmMovimentoEntradaCadastro.GetCompetenciaID(
  inData: TDateTime): Smallint;
begin
  if not CdsCompetencia.Active then
    CdsCompetencia.Open;

  if CdsCompetencia.Locate('com_ano_mes', FormatDateTime('yyyymm', inData), []) then
    Result := CdsCompetencia.FieldByName('com_codigo').AsInteger
  else
    Result := 0;  
end;

procedure TFrmMovimentoEntradaCadastro.CarregarDuplicatas;
begin
  with CdsDuplicata, Params do
  begin
    Close;
    ParamByName('ent_ano').AsInteger     := CdsMasterent_ano.AsInteger;
    ParamByName('ent_codigo').AsCurrency := CdsMasterent_codigo.AsCurrency;
    Open;
  end;
end;

procedure TFrmMovimentoEntradaCadastro.GravarDuplicatas;
begin
  try
    CdsDuplicata.DisableControls;

    if CdsDuplicata.IsEmpty then
      Exit
    else
    begin
      CdsDuplicata.First;
      while not CdsDuplicata.Eof do
      begin
        CdsDuplicata.Edit;
        CdsDuplicataent_ano.Assign( CdsMasterent_ano );
        CdsDuplicataent_codigo.Assign( CdsMasterent_codigo );
        CdsDuplicata.Post;

        ExecutarInsertUpdateTable(CdsDuplicata, 'str_entrada_duplicata');
        CdsDuplicata.Next;
      end;
    end;
  finally
    CdsDuplicata.First;
    CdsDuplicata.EnableControls;
  end;
end;

procedure TFrmMovimentoEntradaCadastro.dbItemCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
    if ( CdsItem.State in [dsEdit, dsInsert] ) then
    begin
      CdsItemitm_fracionador.AsInteger := 1;

      CdsItemmat_descricao_resumo.Clear;
      CdsItemitm_unidade_compra.Clear;
      CdsItemitm_ncm_sh.Clear;
      CdsItemitm_cst.Clear;
      CdsItemitm_csosn.Clear;
      CdsItemitm_cfop.Clear;
    end;
end;

procedure TFrmMovimentoEntradaCadastro.dbItemCodigoPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AForm : TFrmMaterialPesquisa;
begin
  AForm := TFrmMaterialPesquisa.CreateTable(Self, FrmLogin, FrmLogin.conWebMaster);
  try
    if ( CdsItem.State in [dsEdit, dsInsert] ) then
    begin
      AForm.SelecionarRegistro := True;
      if ( AForm.ShowModal = mrOk ) then
      begin
        CdsItemitm_material.Assign( AForm.CdsMastermat_codigo );
        CdsItemmat_descricao_resumo.Assign( AForm.CdsMastermat_descricao_resumo );
        CdsItemitm_unidade_compra.Assign( AForm.CdsMastermat_unidade_compra );
        CdsItemitm_fracionador.Assign( AForm.CdsMastermat_fracionador );
        CdsItemitm_ncm_sh.Assign( AForm.CdsMastermat_ncm_sh );
        CdsItemitm_cst.Assign( AForm.CdsMastermat_cst );
        CdsItemitm_csosn.Assign( AForm.CdsMastermat_csosn );
        CdsItemitm_cfop.Assign( CdsMasterent_cfop );
      end;
    end;
  finally
    AForm.Free;
  end;
end;

procedure TFrmMovimentoEntradaCadastro.BtnCancelarItemClick(
  Sender: TObject);
begin
  if ( CdsItem.State in [dsEdit, dsInsert] ) then
    if CdsItem.Modified then
    begin
      if ShowMessageConfirm('Deseja cancelar a edição do item?', 'Edição Item') then
      begin
        CdsItem.Cancel;
        DbgItem.SetFocus;
      end
    end
    else
    begin
      CdsItem.Cancel;
      DbgItem.SetFocus;
    end
end;

procedure TFrmMovimentoEntradaCadastro.BtnSalvarItemClick(Sender: TObject);
begin
  if ( CdsItem.State in [dsEdit, dsInsert] ) then
  begin
    if ( CdsItemitm_quantidade.AsCurrency <= 0 ) then
      CdsItemitm_quantidade.Clear;

    if ( CdsItemitm_valor_unitario.AsCurrency <= 0 ) then
      CdsItemitm_valor_unitario.Clear;

    if ( CdsItemitm_valor_ipi.AsCurrency < 0 ) then
      CdsItemitm_valor_ipi.AsCurrency := 0.0;

    CdsItemitm_valor_total.AsCurrency := CdsItemitm_quantidade.AsCurrency * CdsItemitm_valor_ipi.AsCurrency;

    if ( not ExistRequiredFields(Self, CdsItem, 'Movimento de Entrada - Item') ) then
    begin
      CdsItem.Post;
      DbgItem.SetFocus;
    end
    else
    if ( dbItemCodigo.Visible and dbItemCodigo.Enabled ) then
      dbItemCodigo.SetFocus;
  end;
end;

procedure TFrmMovimentoEntradaCadastro.DtsItemDataChange(Sender: TObject;
  Field: TField);
begin
  if ( Field = CdsItemitm_material ) then
    if ( not CdsItemitm_material.IsNull ) then
      CarregarDadosMaterial;
end;

procedure TFrmMovimentoEntradaCadastro.DtsMasterDataChange(Sender: TObject;
  Field: TField);
begin
  if ( Field = CdsMasterent_cfop ) then
    if ( not CdsMasterent_cfop.IsNull ) then
      CarregarDadosCFOP;
end;

procedure TFrmMovimentoEntradaCadastro.BtnProcessoClick(Sender: TObject);
begin
  if ( not CdsMaster.IsEmpty ) then
    popupProcesso.Popup(BtnProcesso.ClientOrigin.X, BtnProcesso.ClientOrigin.Y + BtnProcesso.Height);
end;

procedure TFrmMovimentoEntradaCadastro.DtsMasterStateChange(
  Sender: TObject);
begin
  inherited;
  if ( CdsMaster.State = dsInsert ) then
    PgCtrlMain.ActivePage := TbsPrincipal;

  DtsItem.AutoEdit := (CdsMaster.State in [dsEdit, dsInsert]);
  DtsItemStateChange( DtsItem );

  dbUnidadeNegocio.Properties.ReadOnly := (CdsMaster.State = dsEdit);
  dbCompetencia.Properties.ReadOnly    := (CdsMaster.State = dsEdit);

  pmApropriar.Enabled := (not (CdsMaster.State in [dsEdit, dsInsert]))
    and (not CdsMaster.IsEmpty) and (not CdsItem.IsEmpty) and (not CdsDuplicata.IsEmpty);

  pmEncerrar.Enabled := (not (CdsMaster.State in [dsEdit, dsInsert]))
    and (not CdsMaster.IsEmpty) and (not CdsItem.IsEmpty) and (CdsMasterent_status.AsInteger = STATUS_ENTRADA_ESTOQUE_ABERTA);

  pmCancelar.Enabled := (not (CdsMaster.State in [dsEdit, dsInsert]))
    and (not CdsMaster.IsEmpty) and (not CdsItem.IsEmpty) and (CdsMasterent_status.AsInteger = STATUS_ENTRADA_ESTOQUE_ABERTA);
end;

procedure TFrmMovimentoEntradaCadastro.DtsItemStateChange(Sender: TObject);
begin
  BtnSalvarItem.Enabled   := ( CdsItem.State in [dsEdit, dsInsert] );
  BtnCancelarItem.Enabled := ( CdsItem.State in [dsEdit, dsInsert] );
  dbItemCodigo.Properties.ReadOnly := (CdsItem.State = dsEdit);

  with DbgItemDB, OptionsData do
  begin
    Appending := DtsItem.AutoEdit;
    Deleting  := DtsItem.AutoEdit;
    Editing   := DtsItem.AutoEdit;
    Inserting := DtsItem.AutoEdit;
  end;

  if ( BtnSalvarItem.Enabled and (PgCtrlMain.ActivePage = TbsItem) ) then
    if ( dbItemCodigo.Visible and dbItemCodigo.Enabled ) then
      dbItemCodigo.SetFocus;
end;

procedure TFrmMovimentoEntradaCadastro.CdsMasterent_statusGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Exit;

  Case Sender.AsInteger of
    STATUS_ENTRADA_ESTOQUE_ABERTA    : Text := 'Aberto';
    STATUS_ENTRADA_ESTOQUE_ENCERRADA : Text := 'Encerrado';
    STATUS_ENTRADA_ESTOQUE_CANCELADA : Text := 'Cancelado';
  end;
end;

procedure TFrmMovimentoEntradaCadastro.CdsMasterBeforePost(
  DataSet: TDataSet);
begin
  if CdsItem.IsEmpty then
    CdsMasterItens.Clear
  else
    CdsMasterItens.AsInteger := CdsItem.RecordCount;

  if (CdsMaster.State = dsInsert) then
    CdsMasterent_codigo.AsInteger := MaxCod(NomeTabela, CampoChave, 'ent_ano = ' + CdsMasterent_ano.AsString)
  else
  if ( CdsMaster.Modified and (CdsMaster.State = dsEdit) ) then
    CdsMasterent_log_update.AsString := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;

  if ( CdsMasterent_status.AsInteger = STATUS_ENTRADA_ESTOQUE_CANCELADA ) then
    CdsMasterent_log_inactive.AsString := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;

  // Verificar se a Unidade de Negócio possui Almoxarifado
  CdsUnidadeNeg.Locate('uni_codigo', CdsMasterent_unidade_neg.AsInteger, []);
  if ( CdsUnidadeNeg.FieldByName('uni_possui_almox').AsInteger = 0 ) then
  begin
    ShowMessageStop('A Unidade de Negócio ' + QuotedStr(dbUnidadeNegocio.Text) + ' não possui almoxarifado!');
    Abort;
  end;

  // Verificar se a Competência está ativa
  CdsCompetencia.Locate('com_codigo', CdsMasterent_competencia.AsInteger, []);
  if ( CdsCompetencia.FieldByName('sit_codigo').AsInteger <> 1 ) then
  begin
    ShowMessageStop('A Competência ' + QuotedStr(dbCompetencia.Text) + ' não está ativa!');
    Abort;
  end;

  inherited;
end;

procedure TFrmMovimentoEntradaCadastro.CdsMasterAfterPost(
  DataSet: TDataSet);
begin
  GravarItens;
  GravarDuplicatas;
end;

procedure TFrmMovimentoEntradaCadastro.dbFornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
    if ( CdsMaster.State in [dsEdit, dsInsert] ) then
    begin
      CdsMasterent_pessoa.Clear;
      CdsMasterpes_razao_social.Clear;
      CdsMasterpes_nome_fantasia.Clear;
      CdsMasterpes_documento.Clear;
    end;
end;

procedure TFrmMovimentoEntradaCadastro.dbFornecedorPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AForm : TFrmPessoaPesquisa;
begin
  AForm := TFrmPessoaPesquisa.CreateTable(Self, FrmLogin, FrmLogin.conWebMaster);
  try
    if ( CdsMaster.State in [dsEdit, dsInsert] ) then
    begin
      AForm.SelecionarRegistro := True;
      if ( AForm.ShowModal = mrOk ) then
      begin
        CdsMasterent_pessoa.Assign( AForm.CdsMasterpes_codigo );
        CdsMasterpes_razao_social.Assign( AForm.CdsMasterpes_razao_social );
        CdsMasterpes_nome_fantasia.Assign( AForm.CdsMasterpes_nome_fantasia );
        CdsMasterpes_documento.Assign( AForm.CdsMasterpes_documento );
      end;
    end;
  finally
    AForm.Free;
  end;
end;

procedure TFrmMovimentoEntradaCadastro.CdsItemNewRecord(DataSet: TDataSet);
begin
  CdsItement_ano.Assign( CdsMasterent_ano );
  CdsItement_codigo.Assign( CdsMasterent_codigo );
  CdsItemitm_sequencia.AsInteger   := MaxCodDetail(CdsItem, 'itm_sequencia', True);
  CdsItemitm_fracionador.AsInteger := 1;

  CdsItemitm_material.Clear;
  CdsItemitm_quantidade.Clear;
  CdsItemitm_valor_unitario.Clear;
  CdsItemitm_valor_ipi.Clear;
end;

procedure TFrmMovimentoEntradaCadastro.pmApropriarClick(Sender: TObject);
var
  AForm : TFrmMovimentoEntradaApropriar;
begin
  AForm := TFrmMovimentoEntradaApropriar.CreateTable(Self, FrmLogin, FrmLogin.conWebMaster);
  try
    if ( CdsMaster.State in [dsEdit, dsInsert] ) then
      Abort;

    if ( CdsItem.IsEmpty ) then
    begin
      ShowMessageStop('Favor informar os itens do movimento de entrada!', 'Apropriação');
      Abort;
    end;

    if ( CdsDuplicata.IsEmpty ) then
    begin
      ShowMessageStop('Favor informar das duplicatas do movimento de entrada!', 'Apropriação');
      Abort;
    end;

    AForm.DtsMovimento.AutoEdit := (CdsMasterent_status.AsInteger = STATUS_ENTRADA_ESTOQUE_ABERTA);

    if ( AForm.DtsMovimento.AutoEdit ) then
      CdsMaster.Edit;

    if ( AForm.ShowModal = mrOk ) then
      CdsMaster.Post;

    if ( CdsMaster.State = dsEdit ) then
      CdsMaster.Cancel;
  finally
    AForm.Free;
  end;
end;

function TFrmMovimentoEntradaCadastro.IsMovimentoApropriado: Boolean;
begin
  Result :=
    (not CdsMasterent_aprop_tipo_aceite.IsNull)     and
    (not CdsMasterent_aprop_tipo_custo.IsNull)      and
    (not CdsMasterent_aprop_centro_negocio.IsNull)  and
    (not CdsMasterent_aprop_unidade_negocio.IsNull) and
    (not CdsMasterent_aprop_centro_custo.IsNull)    and
    (not CdsMasterent_aprop_setor.IsNull)           and
    (not CdsMasterent_aprop_conta.IsNull);
end;

procedure TFrmMovimentoEntradaCadastro.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( Key = VK_F10 ) then
    pmApropriarClick( pmApropriar );
end;

procedure TFrmMovimentoEntradaCadastro.pmEncerrarClick(Sender: TObject);
var
  sMsg : String;
begin
  if not IsMovimentoApropriado then
  begin
    ShowMessageStop('É necessária a Apropriação do movimento antes de sua finalização!');
    Exit;
  end;

  if ( GetValorTotalProduto <> CdsMasterent_valor_total_prod.AsCurrency ) then
  begin
    ShowMessageStop('O Valor Total dos Materiais/Produtos não está de acordo com o Valor Total do Movimento!');
    Exit;
  end;

  if ( GetValorTotalProduto <> CdsMasterent_valor_total_prod.AsCurrency ) then
  begin
    ShowMessageStop('O Valor Total dos Materiais/Produtos não está de acordo com o Valor Total do Movimento!');
    Exit;
  end;

  if ( GetValorTotalDuplicata <> CdsMasterent_valor_nota.AsCurrency ) then
  begin
    ShowMessageStop('O Valor Total das Duplicatas não está de acordo com o Valor Total da Nota!');
    Exit;
  end;

  sMsg := 'Ao finalizar este movimento de entrada, as quantidades informadas nos ítens para ' +
   'a Unidade de Negócio selecionada serão adicionadas ao estoque.' + #13#13 +
   'Deseja realmente finalizar o movimento?';

  if ( CdsItem.RecordCount > 0 ) then
    if ShowMessageConfirm(sMsg, 'Encerrar Movimento de Entrada') then
    begin
      GerarMovimentoFinanceiro;
      
      CdsMaster.Edit;
      CdsMasterent_usuario_fechamento.AsString := gUsuario.Login;
      CdsMasterent_status.AsInteger            := STATUS_ENTRADA_ESTOQUE_ENCERRADA;
      CdsMaster.Post;
    end;
end;

function TFrmMovimentoEntradaCadastro.GetValorTotalProduto: Currency;
var
  cValor : Currency;
begin
  cValor := 0.0;

  CdsItem.First;
  CdsItem.DisableControls;
  while not CdsItem.Eof do
  begin
    cValor := cValor + CdsItemitm_valor_total.AsCurrency;
    CdsItem.Next;
  end;
  CdsItem.First;
  CdsItem.EnableControls;

  Result := cValor;
end;

procedure TFrmMovimentoEntradaCadastro.PgCtrlMainChange(Sender: TObject);
begin
  Case PgCtrlMain.ActivePageIndex of
    0: // Principal
      ;

    1: // Itens
      DbgItem.SetFocus;

    2: // Duplicatas
      DbgDuplicata.SetFocus;
  end;
end;

procedure TFrmMovimentoEntradaCadastro.CdsDuplicataNewRecord(
  DataSet: TDataSet);
begin
  CdsDuplicataent_ano.Assign( CdsMasterent_ano );
  CdsDuplicataent_codigo.Assign( CdsMasterent_codigo );
  CdsDuplicatadup_sequencia.AsInteger := MaxCodDetail(CdsDuplicata, 'dup_sequencia', True);

  CdsDuplicatadup_numero.Clear;
  CdsDuplicatadup_vencimento.Clear;
  CdsDuplicatadup_valor.Clear;
  CdsDuplicatadup_mov_codigo.Clear;
  CdsDuplicatadup_mov_item.Clear;
end;

function TFrmMovimentoEntradaCadastro.GetValorTotalDuplicata: Currency;
var
  cValor : Currency;
begin
  cValor := 0.0;

  CdsDuplicata.First;
  CdsDuplicata.DisableControls;
  while not CdsDuplicata.Eof do
  begin
    cValor := cValor + CdsDuplicatadup_valor.AsCurrency;
    CdsDuplicata.Next;
  end;
  CdsDuplicata.First;
  CdsDuplicata.EnableControls;

  Result := cValor;
end;

procedure TFrmMovimentoEntradaCadastro.GerarMovimentoFinanceiro;

  procedure CarregarMovimentoFinanceiro(iCodigo, iParcela : Integer);
  begin
    with CdsFinanceiro, Params do
    begin
      Close;
      ParamByName('mov_codigo').AsInteger := iCodigo;
      Open;
    end;

    with CdsFinanceiroParcela, Params do
    begin
      Close;
      ParamByName('mov_codigo').AsInteger := iCodigo;
      ParamByName('mov_item').AsInteger   := iParcela;
      Open;
    end;
  end;

var
  bInserir  : Boolean;
  iFinanMov : Integer;
begin
  Screen.Cursor := crSQLWait;
  try
    iFinanMov := CdsMasterent_mov_codigo.AsInteger;
    bInserir  := (iFinanMov <> 0);

    CarregarMovimentoFinanceiro(iFinanMov, 0);

    // Gerar Movimento Financeiro
    
    if bInserir then
    begin
      iFinanMov := MaxCod('mny_movimento', 'mov_codigo', EmptyStr);
      
      CdsFinanceiro.Append;
      CdsFinanceiromov_codigo.AsInteger         := iFinanMov;
      CdsFinanceiromov_data_inclusao.AsDateTime := Now;
      CdsFinanceiromov_inc.AsString             := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;
    end
    else
    begin
      CdsFinanceiro.Edit;
      CdsFinanceiromov_alt.AsString := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;
    end;

    CdsFinanceiromov_data_emissao.AsDateTime := CdsMasterent_doc_emissao.AsDateTime;
    CdsFinanceirocus_codigo.AsInteger        := CdsMasterent_aprop_tipo_custo.AsInteger;
    CdsFinanceironeg_codigo.AsInteger        := CdsMasterent_aprop_centro_negocio.AsInteger;
    CdsFinanceirocen_codigo.AsInteger        := CdsMasterent_aprop_centro_custo.AsInteger;
    CdsFinanceirouni_codigo.AsInteger        := CdsMasterent_aprop_unidade_negocio.AsInteger;
    CdsFinanceiropes_codigo.AsInteger        := CdsMasterent_pessoa.AsInteger;
    CdsFinanceirocon_codigo.AsInteger        := CdsMasterent_aprop_conta.AsInteger;
    CdsFinanceiroset_codigo.AsInteger        := CdsMasterent_aprop_setor.AsInteger;
    CdsFinanceirosit_codigo.AsInteger        := 1;                                       // Movimento financeiro "Aberto"
    CdsFinanceirocom_codigo.AsInteger        := CdsMasterent_competencia.AsInteger;
    CdsFinanceiromov_obs.AsString            := CdsMasterent_obs.AsString;
    CdsFinanceirotip_ace_codigo.AsInteger    := CdsMasterent_aprop_tipo_aceite.AsInteger;
    CdsFinanceiromov_documento.AsString      := CdsMasterent_doc_numero.AsString;
    CdsFinanceiromov_previsao.AsInteger      := 0;                                       // 0. Não | 1. Sim (Previsao)
    CdsFinanceiromov_tipo.AsInteger          := TIPO_MOVIMENTO_APAGAR;                   // 0. A Pagar | 1. A Receber (Tipo Movimento)
    CdsFinanceiromov_parcelas.AsInteger      := CdsDuplicata.RecordCount;

    CdsFinanceiro.Post;
    ExecutarInsertUpdateTable(CdsFinanceiro, 'mny_movimento');

    // Gerar Parcelas do Movimento Financeiro

    CdsDuplicata.First;
    while not CdsDuplicata.Eof do
    begin
      CarregarMovimentoFinanceiro(iFinanMov, CdsDuplicatadup_sequencia.AsInteger);

      if CdsFinanceiroParcela.IsEmpty then
      begin
        CdsFinanceiroParcela.Append;
        CdsFinanceiroParcelamov_codigo.AsInteger := iFinanMov;
        CdsFinanceiroParcelamov_item.AsInteger   := CdsDuplicatadup_sequencia.AsInteger;
      end
      else
        CdsFinanceiroParcela.Edit;

      CdsFinanceiroParcelamov_data_vencto.AsDateTime   := CdsDuplicatadup_vencimento.AsDateTime;
      CdsFinanceiroParcelamov_data_prev.AsDateTime     := CdsDuplicatadup_vencimento.AsDateTime;
      CdsFinanceiroParcelamov_valor.AsCurrency         := CdsDuplicatadup_valor.AsCurrency;
      CdsFinanceiroParcelamov_juros.AsCurrency         := 0.0;
      CdsFinanceiroParcelamov_desconto.AsCurrency      := 0.0;
      CdsFinanceiroParcelamov_valor_pagar.AsCurrency   := CdsFinanceiroParcelamov_valor.AsCurrency + CdsFinanceiroParcelamov_juros.AsCurrency - CdsFinanceiroParcelamov_desconto.AsCurrency;
      CdsFinanceiroParcelafpg_codigo.AsInteger         := CdsDuplicatadup_forma_pagto.AsInteger;
      CdsFinanceiroParcelatip_doc_codigo.AsInteger     := CdsMasterent_doc_tipo.AsInteger;
      CdsFinanceiroParcelamov_status.AsInteger         := 5; // Pendente
      CdsFinanceiroParcelamov_retencao.AsCurrency      := 0.0;
      CdsFinanceiroParcelamov_data_inclusao.AsDateTime := Now;
      CdsFinanceiroParcelamov_parcela.AsInteger        := CdsDuplicatadup_sequencia.AsInteger;
      CdsFinanceiroParcelamov_aut_financeiro.Clear;
      CdsFinanceiroParcelamov_aut_gerencia.Clear;

      CdsFinanceiroParcela.Post;
      ExecutarInsertUpdateTable(CdsFinanceiroParcela, 'mny_movimento_item');

      CdsDuplicata.Next;
    end;

    // Gravar Relação Movimento Entrada x Movimento Financeiro;
    
    CdsDuplicata.First;
    while not CdsDuplicata.Eof do
    begin
      CdsDuplicata.Edit;
      CdsDuplicatadup_mov_codigo.AsInteger := iFinanMov;
      CdsDuplicatadup_mov_item.AsInteger   := CdsDuplicatadup_sequencia.AsInteger;
      CdsDuplicata.Post;

      CdsDuplicata.Next;
    end;

    CdsMaster.Edit;
    CdsMasterent_mov_codigo.AsInteger := iFinanMov;
    CdsMaster.Post;

  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
