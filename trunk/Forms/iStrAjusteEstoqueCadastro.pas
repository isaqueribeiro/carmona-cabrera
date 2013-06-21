unit iStrAjusteEstoqueCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadraoCadastro, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, dxSkinsCore,
  dxSkinscxPCPainter, cxContainer, cxEdit, FMTBcd, DB, DBClient, Provider,
  SqlExpr, cxGroupBox, cxPC, StdCtrls, cxButtons, ExtCtrls,
  cxImageComboBox, cxDBEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxLabel, cxCalendar,
  cxMemo, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxButtonEdit, DateUtils;

type
  TFrmAjusteEstoqueCadastro = class(TFrmPadraoCadastro)
    CdsMastereaj_ano: TSmallintField;
    CdsMastereaj_codigo: TIntegerField;
    CdsMastereaj_data: TDateField;
    CdsMastereaj_hora: TTimeField;
    CdsMastereaj_unidade_neg: TSmallintField;
    CdsMastereaj_obs: TStringField;
    CdsMastereaj_status: TSmallintField;
    CdsMastereaj_usuario_abertura: TStringField;
    CdsMastereaj_usuario_fechamento: TStringField;
    CdsMastereaj_log_insert: TStringField;
    CdsMastereaj_log_update: TStringField;
    CdsMastereaj_log_inactive: TStringField;
    CdsMasteruni_nome: TStringField;
    lblCodigo: TcxLabel;
    dbCodigo: TcxDBTextEdit;
    lblUnidadeNegocio: TcxLabel;
    dbUnidadeNegocio: TcxDBLookupComboBox;
    lblData: TcxLabel;
    dbAno: TcxDBTextEdit;
    lblCompetencia: TcxLabel;
    dbCompetencia: TcxDBLookupComboBox;
    dbData: TcxDBDateEdit;
    lblHora: TcxLabel;
    dbHora: TcxDBTextEdit;
    lblUsuarioAbertura: TcxLabel;
    dbUsuarioAbertura: TcxDBTextEdit;
    lblSituacao: TcxLabel;
    dbSituacao: TcxDBTextEdit;
    lblTipoAjuste: TcxLabel;
    dbTipoAjuste: TcxDBLookupComboBox;
    QryUnidadeNeg: TSQLQuery;
    DspUnidadeNeg: TDataSetProvider;
    CdsUnidadeNeg: TClientDataSet;
    DtsUnidadeNeg: TDataSource;
    QryCompetencia: TSQLQuery;
    DspCompetencia: TDataSetProvider;
    CdsCompetencia: TClientDataSet;
    DtsCompetencia: TDataSource;
    QryTipoAjuste: TSQLQuery;
    DspTipoAjuste: TDataSetProvider;
    CdsTipoAjuste: TClientDataSet;
    DtsTipoAjuste: TDataSource;
    CdsMastereaj_tipo: TStringField;
    lblObservacao: TcxLabel;
    dbObservacao: TcxDBMemo;
    TbsItem: TcxTabSheet;
    CdsMastereaj_competencia: TSmallintField;
    DbgConsulta: TcxGrid;
    DbgConsultaDB: TcxGridDBTableView;
    DbgConsultaLvl: TcxGridLevel;
    Pnl: TPanel;
    ShpTitulo: TShape;
    LblDados: TLabel;
    QryDetail: TSQLQuery;
    DspDetail: TDataSetProvider;
    CdsDetail: TClientDataSet;
    DtsDetail: TDataSource;
    CdsDetaileaj_ano: TSmallintField;
    CdsDetaileaj_codigo: TIntegerField;
    CdsDetailitm_sequencia: TSmallintField;
    CdsDetailitm_material: TFMTBCDField;
    CdsDetailitm_qtde_antiga: TFMTBCDField;
    CdsDetailitm_qtde_nova: TFMTBCDField;
    CdsDetailitm_unidade_consumo: TIntegerField;
    CdsDetailund_descricao: TStringField;
    CdsDetailund_sigla: TStringField;
    CdsDetailitm_fracionador: TFMTBCDField;
    CdsDetailmat_descricao_resumo: TStringField;
    Panel1: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    pnlItemControle: TPanel;
    BtnSalvarItem: TcxButton;
    BtnCancelarItem: TcxButton;
    Panel3: TPanel;
    Shape2: TShape;
    Label2: TLabel;
    DbgConsultaDBitm_sequencia: TcxGridDBColumn;
    DbgConsultaDBitm_material: TcxGridDBColumn;
    DbgConsultaDBitm_qtde_nova: TcxGridDBColumn;
    DbgConsultaDBmat_descricao_resumo: TcxGridDBColumn;
    DbgConsultaDBund_descricao: TcxGridDBColumn;
    GrpItemEdit: TcxGroupBox;
    lblItemSequencial: TcxLabel;
    dbItemSequencial: TcxDBTextEdit;
    lblItemCodigo: TcxLabel;
    dbItemCodigo: TcxDBButtonEdit;
    dbItemDescricao: TcxDBTextEdit;
    lblItemQuantidade: TcxLabel;
    dbItemQuantidade: TcxDBTextEdit;
    QryUnidade: TSQLQuery;
    DspUnidade: TDataSetProvider;
    CdsUnidade: TClientDataSet;
    DtsUnidade: TDataSource;
    lblItemUnidadeCompra: TcxLabel;
    dbItemUnidadeCompra: TcxDBLookupComboBox;
    DbgItem: TcxGrid;
    DbgItemDB: TcxGridDBTableView;
    DbgItemLvl: TcxGridLevel;
    DbgItemDBitm_sequencia: TcxGridDBColumn;
    DbgItemDBitm_material: TcxGridDBColumn;
    DbgItemDBitm_qtde_nova: TcxGridDBColumn;
    DbgItemDBmat_descricao_resumo: TcxGridDBColumn;
    DbgItemDBund_descricao: TcxGridDBColumn;
    CdsMasterItens: TBCDField;
    procedure FormCreate(Sender: TObject);
    procedure CdsMasterNewRecord(DataSet: TDataSet);
    procedure CdsMastereaj_statusGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CdsMasterBeforePost(DataSet: TDataSet);
    procedure CdsMasterAfterCancel(DataSet: TDataSet);
    procedure CdsMasterAfterDelete(DataSet: TDataSet);
    procedure CdsMasterAfterOpen(DataSet: TDataSet);
    procedure CdsMasterAfterPost(DataSet: TDataSet);
    procedure DtsMasterStateChange(Sender: TObject);
    procedure DtsDetailStateChange(Sender: TObject);
    procedure CdsDetailNewRecord(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSalvarItemClick(Sender: TObject);
    procedure BtnCancelarItemClick(Sender: TObject);
    procedure PgCtrlMainChange(Sender: TObject);
    procedure dbItemCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbItemCodigoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure DtsDetailDataChange(Sender: TObject; Field: TField);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarItens;
    procedure GravarItens;
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
  FrmAjusteEstoqueCadastro: TFrmAjusteEstoqueCadastro;

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

{ TFrmAjusteEstoqueCadastro }

function TFrmAjusteEstoqueCadastro.ExecutarAlteracao: Boolean;
begin
  RefreshDB;

  if ( not CdsMaster.Active ) then
    CdsMaster.Open;

  AutoEdit := True;

  if not Showing then
    ShowModal;

  Result := RegistroEditado;
end;

function TFrmAjusteEstoqueCadastro.ExecutarInsercao: Boolean;
begin
  RefreshDB;

  if ( not CdsMaster.Active ) then
    CdsMaster.Open;

  AutoInsert := True;

  if not Showing then
    ShowModal;

  Result := RegistroInserido;
end;

function TFrmAjusteEstoqueCadastro.ExecutarPesquisa: Boolean;
begin
  RefreshDB;

  CdsMaster.Close;
  CdsMaster.Open;

  Result := not CdsMaster.IsEmpty;
end;

procedure TFrmAjusteEstoqueCadastro.VisualizarConsulta;
begin
  RefreshDB;

  if ( not CdsMaster.Active ) then
    CdsMaster.Open;

  AutoEdit := False;

  if not Showing then
    ShowModal;
end;

procedure TFrmAjusteEstoqueCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  ComponenteLogin := FrmLogin;
  ConexaoDB       := FrmLogin.conWebMaster;

  NomeTabela     := 'str_estoque_ajuste';
  CampoChave     := 'eaj_codigo';
  CampoDescricao := 'uni_nome';

  CdsUnidadeNeg.Open;
  CdsCompetencia.Open;
  CdsTipoAjuste.Open;
  CdsUnidade.Open;

  AbrirTabela := True;
//  PgCtrlDadosAdcionais.ActivePage := TbsClassificar;
end;

procedure TFrmAjusteEstoqueCadastro.CdsMasterNewRecord(DataSet: TDataSet);
begin
  inherited;
  CdsMastereaj_ano.AsInteger    := YearOf(Date);
  CdsMastereaj_codigo.AsInteger := 0;
  CdsMastereaj_data.AsDateTime  := Date;
  CdsMastereaj_hora.AsDateTime  := Time;
  CdsMastereaj_competencia.AsInteger     := GetCompetenciaID(CdsMastereaj_data.AsDateTime);
  CdsMastereaj_usuario_abertura.AsString := gUsuario.Login;
  CdsMastereaj_status.AsInteger          := STATUS_AJUSTE_ESTOQUE_ABERTO;
  CdsMastereaj_log_insert.AsString       := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;

  CdsMastereaj_unidade_neg.Clear;
  CdsMastereaj_usuario_fechamento.Clear;
  CdsMasterItens.Clear;

  CarregarItens;
end;

function TFrmAjusteEstoqueCadastro.GetCompetenciaID(inData : TDateTime): Smallint;
begin
  if not CdsCompetencia.Active then
    CdsCompetencia.Open;

  if CdsCompetencia.Locate('com_ano_mes', FormatDateTime('yyyymm', inData), []) then
    Result := CdsCompetencia.FieldByName('com_codigo').AsInteger
  else
    Result := 0;  
end;

procedure TFrmAjusteEstoqueCadastro.CdsMastereaj_statusGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Exit;

  Case Sender.AsInteger of
    STATUS_AJUSTE_ESTOQUE_ABERTO:
      Text := 'Aberto';

    STATUS_AJUSTE_ESTOQUE_ENCERRADO:
      Text := 'Encerrado';

    STATUS_AJUSTE_ESTOQUE_CANCELADO:
      Text := 'Cancelado';
  end;
end;

procedure TFrmAjusteEstoqueCadastro.CdsMasterBeforePost(DataSet: TDataSet);
begin
  if CdsDetail.IsEmpty then
    CdsMasterItens.Clear
  else
    CdsMasterItens.AsInteger := CdsDetail.RecordCount;

  if (CdsMaster.State = dsInsert) then
    CdsMastereaj_codigo.AsInteger := MaxCod(NomeTabela, CampoChave, 'eaj_ano = ' + CdsMastereaj_ano.AsString)
  else
  if ( CdsMaster.Modified and (CdsMaster.State = dsEdit) ) then
    CdsMastereaj_log_update.AsString := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;

  if ( CdsMastereaj_status.AsInteger = STATUS_AJUSTE_ESTOQUE_CANCELADO ) then
    CdsMastereaj_log_inactive.AsString := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;

  inherited;
end;

procedure TFrmAjusteEstoqueCadastro.CarregarItens;
begin
  with CdsDetail, Params do
  begin
    Close;
    ParamByName('eaj_ano').AsInteger    := CdsMastereaj_ano.AsInteger;
    ParamByName('eaj_codigo').AsInteger := CdsMastereaj_codigo.AsInteger;
    Open;
  end;
end;

procedure TFrmAjusteEstoqueCadastro.CdsMasterAfterCancel(
  DataSet: TDataSet);
begin
  CarregarItens;
end;

procedure TFrmAjusteEstoqueCadastro.CdsMasterAfterDelete(
  DataSet: TDataSet);
begin
  CarregarItens;
end;

procedure TFrmAjusteEstoqueCadastro.CdsMasterAfterOpen(DataSet: TDataSet);
begin
  CarregarItens;
end;

procedure TFrmAjusteEstoqueCadastro.GravarItens;
begin
  try
    CdsDetail.DisableControls;

    if CdsDetail.IsEmpty then
      Exit
    else
    begin
      CdsDetail.First;
      while not CdsDetail.Eof do
      begin
        CdsDetail.Edit;
        CdsDetaileaj_ano.Assign( CdsMastereaj_ano );
        CdsDetaileaj_codigo.Assign( CdsMastereaj_codigo );
        CdsDetail.Post;

        ExecutarInsertUpdateTable(CdsDetail, 'str_estoque_ajuste_item');
        CdsDetail.Next;
      end;
    end;
  finally
    CdsDetail.First;
    CdsDetail.EnableControls;
  end;
end;

procedure TFrmAjusteEstoqueCadastro.CdsMasterAfterPost(DataSet: TDataSet);
begin
  GravarItens;
end;

procedure TFrmAjusteEstoqueCadastro.DtsMasterStateChange(Sender: TObject);
begin
  inherited;
  if ( CdsMaster.State = dsInsert ) then
    PgCtrlMain.ActivePage := TbsPrincipal;

  DtsDetail.AutoEdit := (CdsMaster.State in [dsEdit, dsInsert]);
  DtsDetailStateChange( DtsDetail );

  dbUnidadeNegocio.Properties.ReadOnly := (CdsMaster.State = dsEdit);
  dbCompetencia.Properties.ReadOnly    := (CdsMaster.State = dsEdit);
end;

procedure TFrmAjusteEstoqueCadastro.DtsDetailStateChange(Sender: TObject);
begin
  BtnSalvarItem.Enabled   := ( CdsDetail.State in [dsEdit, dsInsert] );
  BtnCancelarItem.Enabled := ( CdsDetail.State in [dsEdit, dsInsert] );
  dbItemCodigo.Properties.ReadOnly := (CdsDetail.State = dsEdit);

  with DbgItemDB, OptionsData do
  begin
    Appending := DtsDetail.AutoEdit;
    Deleting  := DtsDetail.AutoEdit;
    Editing   := DtsDetail.AutoEdit;
    Inserting := DtsDetail.AutoEdit;
  end;

  if ( BtnSalvarItem.Enabled and (PgCtrlMain.ActivePage = TbsItem) ) then
    if ( dbItemCodigo.Visible and dbItemCodigo.Enabled ) then
      dbItemCodigo.SetFocus;
end;

procedure TFrmAjusteEstoqueCadastro.CdsDetailNewRecord(DataSet: TDataSet);
begin
  CdsDetaileaj_ano.Assign( CdsMastereaj_ano );
  CdsDetaileaj_codigo.Assign( CdsMastereaj_codigo );
  CdsDetailitm_sequencia.AsInteger   := MaxCodDetail(CdsDetail, 'itm_sequencia', True);
  CdsDetailitm_fracionador.AsInteger := 1;

  CdsDetailitm_material.Clear;
  CdsDetailitm_qtde_antiga.Clear;
  CdsDetailitm_qtde_nova.Clear;
end;

procedure TFrmAjusteEstoqueCadastro.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  ;
  inherited;

end;

procedure TFrmAjusteEstoqueCadastro.BtnSalvarItemClick(Sender: TObject);
begin
  if ( CdsDetail.State in [dsEdit, dsInsert] ) then
  begin
    if ( CdsDetailitm_qtde_nova.AsInteger <= 0 ) then
      CdsDetailitm_qtde_nova.Clear;

    if ( not ExistRequiredFields(Self, CdsDetail, 'Ajuste de Estoque - Item') ) then
    begin
      CdsDetail.Post;
      DbgItem.SetFocus;
    end
    else
    if ( dbItemCodigo.Visible and dbItemCodigo.Enabled ) then
      dbItemCodigo.SetFocus;
  end;
end;

procedure TFrmAjusteEstoqueCadastro.BtnCancelarItemClick(Sender: TObject);
begin
  if ( CdsDetail.State in [dsEdit, dsInsert] ) then
    if CdsDetail.Modified then
    begin
      if ShowMessageConfirm('Deseja cancelar a edição do item?', 'Edição Item') then
      begin
        CdsDetail.Cancel;
        DbgItem.SetFocus;
      end
    end
    else
    begin
      CdsDetail.Cancel;
      DbgItem.SetFocus;
    end
end;

procedure TFrmAjusteEstoqueCadastro.PgCtrlMainChange(Sender: TObject);
begin
  Case PgCtrlMain.ActivePageIndex of
    0: // Principal
      ;

    1: // Itens
      DbgItem.SetFocus;
  end;
end;

procedure TFrmAjusteEstoqueCadastro.dbItemCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
    if ( CdsDetail.State in [dsEdit, dsInsert] ) then
    begin
      CdsDetailitm_fracionador.AsInteger := 1;
      
      CdsDetailitm_material.Clear;
      CdsDetailmat_descricao_resumo.Clear;
      CdsDetailitm_unidade_consumo.Clear;
    end;
end;

procedure TFrmAjusteEstoqueCadastro.dbItemCodigoPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AForm : TFrmMaterialPesquisa;
begin
  AForm := TFrmMaterialPesquisa.CreateTable(Self, FrmLogin, FrmLogin.conWebMaster);
  try
    if ( CdsDetail.State in [dsEdit, dsInsert] ) then
    begin
      AForm.SelecionarRegistro := True;
      if ( AForm.ShowModal = mrOk ) then
      begin
        CdsDetailitm_material.Assign( AForm.CdsMastermat_codigo );
        CdsDetailmat_descricao_resumo.Assign( AForm.CdsMastermat_descricao_resumo );
        CdsDetailitm_unidade_consumo.Assign( AForm.CdsMastermat_unidade_consumo );
        CdsDetailitm_fracionador.Assign( AForm.CdsMastermat_fracionador );
      end;
    end;
  finally
    AForm.Free;
  end;
end;

procedure TFrmAjusteEstoqueCadastro.CarregarDadosMaterial;
var
  cds : TClientDataSet;
begin
  if ( CdsDetail.State in [dsEdit, dsInsert] ) then
  begin
    cds := TClientDataSet.Create(nil);
    try
      if GetDataSetDB(cds, 'str_material', 'mat_codigo = ' + CdsDetailitm_material.AsString) then
      begin
        CdsDetailmat_descricao_resumo.Assign( cds.FieldByName('mat_descricao_resumo') );
        CdsDetailitm_unidade_consumo.Assign( cds.FieldByName('mat_unidade_consumo') );
        CdsDetailitm_fracionador.Assign( cds.FieldByName('mat_fracionador') );
      end
      else
      begin
        CdsDetailmat_descricao_resumo.Clear;
        CdsDetailitm_unidade_consumo.Clear;
        CdsDetailitm_fracionador.Clear;
      end;
    finally
      cds.Free;
    end;
  end;
end;

procedure TFrmAjusteEstoqueCadastro.DtsDetailDataChange(Sender: TObject;
  Field: TField);
begin
  if ( Field = CdsDetailitm_material ) then
    if ( not CdsDetailitm_material.IsNull ) then
      CarregarDadosMaterial;
end;

procedure TFrmAjusteEstoqueCadastro.BtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  Case CdsMastereaj_status.AsInteger of
    STATUS_AJUSTE_ESTOQUE_ENCERRADO:
      sMsg := 'Ajuste de estoque encerrado!';
    STATUS_AJUSTE_ESTOQUE_CANCELADO:
      sMsg := 'Ajuste de estoque cancelado!';
  end;

  if ( CdsMastereaj_status.AsInteger > 0 ) then
    ShowMessageStop('Este movimento não poderá ser excluído.' + #13 + sMsg)
  else
    inherited;
end;

procedure TFrmAjusteEstoqueCadastro.BtnEditarClick(Sender: TObject);
var
  sMsg : String;
begin
  Case CdsMastereaj_status.AsInteger of
    STATUS_AJUSTE_ESTOQUE_ENCERRADO:
      sMsg := 'Ajuste de estoque encerrado!';
    STATUS_AJUSTE_ESTOQUE_CANCELADO:
      sMsg := 'Ajuste de estoque cancelado!';
  end;

  if ( CdsMastereaj_status.AsInteger > 0 ) then
    ShowMessageStop('Este movimento não poderá ser alterado.' + #13 + sMsg)
  else
    inherited;
end;

end.
