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
  private
    { Private declarations }
    procedure CarregarItens;
    procedure CarregarDuplicatas;
    procedure GravarItens;
    procedure GravarDuplicatas;
    procedure CarregarDadosMaterial;

    function GetCompetenciaID(inData : TDateTime) : Smallint;
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
  , iStrMaterialPesquisa, DateUtils;

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
  CdsMasterent_ano.AsInteger    := YearOf(Date);
  CdsMasterent_codigo.AsInteger := 0;
  CdsMasterent_data.AsDateTime  := Date;
  CdsMasterent_hora.AsDateTime  := Time;
  CdsMasterent_competencia.AsInteger     := GetCompetenciaID(CdsMasterent_data.AsDateTime);
  CdsMasterent_usuario_abertura.AsString := gUsuario.Login;
  CdsMasterent_status.AsInteger          := STATUS_ENTRADA_ESTOQUE_ABERTA;
  CdsMasterent_log_insert.AsString       := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;

  CdsMasterent_unidade_neg.Clear;
  CdsMasterent_usuario_fechamento.Clear;
  CdsMasterItens.Clear;

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
      begin (*
        CdsDuplicatas.Edit;
        CdsItement_ano.Assign( CdsMasterent_ano );
        CdsItement_codigo.Assign( CdsMasterent_codigo );
        CdsItem.Post;

        ExecutarInsertUpdateTable(CdsDuplicatas, 'str_entrada_duplicata'); *)
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
    if ( CdsItemitm_quantidade.AsInteger <= 0 ) then
      CdsItemitm_quantidade.Clear;

    if ( CdsItemitm_valor_unitario.AsCurrency <= 0 ) then
      CdsItemitm_valor_unitario.Clear;

    if ( CdsItemitm_valor_ipi.AsCurrency < 0 ) then
      CdsItemitm_valor_ipi.AsCurrency := 0.0;

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

end.
