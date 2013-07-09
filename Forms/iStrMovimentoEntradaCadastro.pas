unit iStrMovimentoEntradaCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadraoCadastro, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, dxSkinsCore,
  dxSkinscxPCPainter, cxContainer, cxEdit, FMTBcd, DB, DBClient, Provider,
  SqlExpr, cxGroupBox, cxPC, StdCtrls, cxButtons, ExtCtrls, cxMemo,
  cxDBEdit, cxDropDownEdit, cxCalendar, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxLabel, cxButtonEdit;

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
    cxLabel1: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxGroupBox2: TcxGroupBox;
    cxLabel2: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxLabel4: TcxLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    cxLabel5: TcxLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    cxLabel6: TcxLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure CdsMasterNewRecord(DataSet: TDataSet);
    procedure CdsMasterAfterCancel(DataSet: TDataSet);
    procedure CdsMasterAfterDelete(DataSet: TDataSet);
    procedure CdsMasterAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure CarregarItens;
  public
    { Public declarations }
  end;

var
  FrmMovimentoEntradaCadastro: TFrmMovimentoEntradaCadastro;

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
  , KeyRequiredFields
  , iStrMaterialPesquisa;

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

  CarregarItens;
end;

procedure TFrmMovimentoEntradaCadastro.CdsMasterAfterCancel(
  DataSet: TDataSet);
begin
  CarregarItens;
end;

procedure TFrmMovimentoEntradaCadastro.CdsMasterAfterDelete(
  DataSet: TDataSet);
begin
  CarregarItens;
end;

procedure TFrmMovimentoEntradaCadastro.CdsMasterAfterOpen(
  DataSet: TDataSet);
begin
  CarregarItens;
end;

end.
