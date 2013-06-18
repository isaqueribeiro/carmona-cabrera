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
  cxMemo;

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
    CdsMastereaj_competencia: TSmallintField;
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
    procedure FormCreate(Sender: TObject);
    procedure CdsMasterNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    function GetCompetenciaID(inData : TDateTime) : Integer;
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
  , KeyPadrao, DateUtils;

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
  CampoChave     := 'eaj_ano;eaj_codigo';
  CampoDescricao := 'uni_nome';

  CdsUnidadeNeg.Open;
  CdsCompetencia.Open;
  CdsTipoAjuste.Open;
  
  AbrirTabela := True;
//  PgCtrlDadosAdcionais.ActivePage := TbsClassificar;
end;

procedure TFrmAjusteEstoqueCadastro.CdsMasterNewRecord(DataSet: TDataSet);
begin
  inherited;
  CdsMastereaj_ano.AsInteger   := YearOf(Date);
  CdsMastereaj_data.AsDateTime := Date;
  CdsMastereaj_hora.AsDateTime := Time;
  CdsMastereaj_competencia.AsInteger     := GetCompetenciaID(CdsMastereaj_data.AsDateTime);
  CdsMastereaj_usuario_abertura.AsString := gUsuario.Login;

  CdsMastereaj_unidade_neg.Clear;
  CdsMastereaj_usuario_fechamento.Clear;
end;

function TFrmAjusteEstoqueCadastro.GetCompetenciaID(inData : TDateTime): Integer;
begin
  if not CdsCompetencia.Active then
    CdsCompetencia.Open;

  CdsCompetencia.Locate('com_ano_mes', FormatDateTime('yyyymm', inData), []);
end;

end.
