unit KeyPessoaCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadraoCadastro, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, dxSkinsCore,
  dxSkinscxPCPainter, cxContainer, cxEdit, FMTBcd, DB, DBClient, Provider,
  SqlExpr, cxGroupBox, cxPC, StdCtrls, cxButtons, ExtCtrls, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxTextEdit, cxDBEdit, cxLabel, cxImageComboBox, ImgList;

type
  TFrmPessoaCadastro = class(TFrmPadraoCadastro)
    lblCodigo: TcxLabel;
    dbCodigo: TcxDBTextEdit;
    lblTipo: TcxLabel;
    dbTipo: TcxDBLookupComboBox;
    lblDocumento: TcxLabel;
    dbDocumento: TcxDBTextEdit;
    lblNome: TcxLabel;
    dbNome: TcxDBTextEdit;
    lblRazaoSocial: TcxLabel;
    dbRazaoSocial: TcxDBTextEdit;
    lblInscMunicipal: TcxLabel;
    dbInscMunicipal: TcxDBTextEdit;
    lblInscEstadual: TcxLabel;
    dbInscEstadual: TcxDBTextEdit;
    GrpDadosEndereco: TcxGroupBox;
    lblLogradouro: TcxLabel;
    dbLogradouro: TcxDBTextEdit;
    lblCidade: TcxLabel;
    lblBairro: TcxLabel;
    dbBairro: TcxDBTextEdit;
    lblCEP: TcxLabel;
    dbCEP: TcxDBTextEdit;
    lblUF: TcxLabel;
    QryPessoaTipo: TSQLQuery;
    DspPessoaTipo: TDataSetProvider;
    CdsPessoaTipo: TClientDataSet;
    DtsPessoaTipo: TDataSource;
    QryUF: TSQLQuery;
    DspUF: TDataSetProvider;
    CdsUF: TClientDataSet;
    DtsUF: TDataSource;
    QryCidade: TSQLQuery;
    DspCidade: TDataSetProvider;
    CdsCidade: TClientDataSet;
    DtsCidade: TDataSource;
    GrpDadosContato: TcxGroupBox;
    lblNomeContato: TcxLabel;
    dbNomeContato: TcxDBTextEdit;
    lblTelefone: TcxLabel;
    dbTelefone: TcxDBTextEdit;
    lblEmail: TcxLabel;
    dbEmail: TcxDBTextEdit;
    GrpDadosOutrasInfo: TcxGroupBox;
    lblContaCorrente: TcxLabel;
    lblStatus: TcxLabel;
    lblObservacoes: TcxLabel;
    dbObservacoes: TcxDBTextEdit;
    dbUF: TcxDBLookupComboBox;
    dbCidade: TcxDBLookupComboBox;
    dbContaCorrente: TcxDBLookupComboBox;
    ImgStatus: TImageList;
    dbStatus: TcxDBImageComboBox;
    QryContaCorrente: TSQLQuery;
    DspContaCorrente: TDataSetProvider;
    CdsContaCorrente: TClientDataSet;
    DtsContaCorrente: TDataSource;
    CdsMasterpes_codigo: TIntegerField;
    CdsMastertip_codigo: TSmallintField;
    CdsMasterpes_documento: TStringField;
    CdsMasterpes_razao_social: TStringField;
    CdsMasterpes_nome_fantasia: TStringField;
    CdsMasterpes_insc_municipal: TStringField;
    CdsMasterpes_insc_estadual: TStringField;
    CdsMasterpes_contato: TStringField;
    CdsMasterpes_fones: TStringField;
    CdsMasterpes_end_logra: TStringField;
    CdsMasterpes_end_cidade: TStringField;
    CdsMasterpes_end_bairro: TStringField;
    CdsMasterpes_end_cep: TStringField;
    CdsMasterpes_end_uf: TStringField;
    CdsMastercid_codigo: TIntegerField;
    CdsMasterpes_obs: TStringField;
    CdsMasterpes_email: TStringField;
    CdsMasterccr_codigo: TSmallintField;
    CdsMasterpes_status: TSmallintField;
    CdsMasterpes_ult_datamov: TSQLTimeStampField;
    CdsMasterpes_inc: TStringField;
    CdsMasterpes_alt: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure CdsMasterBeforePost(DataSet: TDataSet);
    procedure CdsMasterNewRecord(DataSet: TDataSet);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure BuscarCodigoCidade;
  public
    { Public declarations }
    procedure VisualizarConsulta; override;

    function ExecutarPesquisa : Boolean; override;
    function ExecutarInsercao : Boolean; override;
    function ExecutarAlteracao : Boolean; override;
  end;

var
  FrmPessoaCadastro: TFrmPessoaCadastro;

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
  , KeyPadrao;

{$R *.dfm}

{ TFrmPessoaCadastro }

function TFrmPessoaCadastro.ExecutarAlteracao: Boolean;
begin
  RefreshDB;

  if ( not CdsMaster.Active ) then
    CdsMaster.Open;

  AutoEdit := True;

  if not Showing then
    ShowModal;

  Result := RegistroEditado;
end;

function TFrmPessoaCadastro.ExecutarInsercao: Boolean;
begin
  RefreshDB;

  if ( not CdsMaster.Active ) then
    CdsMaster.Open;

  AutoInsert := True;

  if not Showing then
    ShowModal;

  Result := RegistroInserido;
end;

function TFrmPessoaCadastro.ExecutarPesquisa: Boolean;
begin
  RefreshDB;

  CdsMaster.Close;
  CdsMaster.Open;

  Result := not CdsMaster.IsEmpty;
end;

procedure TFrmPessoaCadastro.VisualizarConsulta;
begin
  RefreshDB;

  if ( not CdsMaster.Active ) then
    CdsMaster.Open;

  AutoEdit := False;

  if not Showing then
    ShowModal;
end;

procedure TFrmPessoaCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  ComponenteLogin := FrmLogin;
  ConexaoDB       := FrmLogin.conWebMaster;

  NomeTabela     := 'mny_pessoa';
  CampoChave     := 'pes_codigo';
  CampoDescricao := 'pes_razao_social';

  CdsPessoaTipo.Open;
  CdsUF.Open;
  CdsCidade.Open;
  CdsContaCorrente.Open;

  AbrirTabela := True;
end;

procedure TFrmPessoaCadastro.CdsMasterBeforePost(DataSet: TDataSet);
begin
  if Trim(dbCidade.Text) <> EmptyStr then
    CdsMasterpes_end_cidade.AsString := dbCidade.Text;

  if ( Trim(CdsMasterpes_documento.AsString) = EmptyStr ) then
    CdsMasterpes_documento.Clear;

  if ( Trim(CdsMasterpes_nome_fantasia.AsString) = EmptyStr ) then
    CdsMasterpes_nome_fantasia.Clear;

  if ( Trim(CdsMasterpes_razao_social.AsString) = EmptyStr ) then
    CdsMasterpes_razao_social.Clear;

  if ( CdsMaster.Modified and (CdsMaster.State = dsInsert) ) then
    CdsMasterpes_codigo.AsInteger := MaxCod(NomeTabela, CampoChave, EmptyStr);

  if ( CdsMaster.Modified and (CdsMaster.State = dsEdit) ) then
    CdsMasterpes_alt.AsString := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;

  if ( (CdsMastercid_codigo.AsInteger = 0) and (Trim(CdsMasterpes_end_uf.AsString) <> EmptyStr) and (Trim(CdsMasterpes_end_cidade.AsString) <> EmptyStr) ) then
    BuscarCodigoCidade;

  inherited;
end;

procedure TFrmPessoaCadastro.CdsMasterNewRecord(DataSet: TDataSet);
begin
  CdsMasterpes_status.AsInteger := 1;
  CdsMasterpes_inc.AsString     := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;

  CdsMastercid_codigo.Clear;
  CdsMasterccr_codigo.Clear;
end;

procedure TFrmPessoaCadastro.BtnEditarClick(Sender: TObject);
begin
  inherited;
  if ( (CdsMaster.State = dsEdit) and (CdsMastercid_codigo.AsInteger = 0) and (Trim(CdsMasterpes_end_uf.AsString) <> EmptyStr) and (Trim(CdsMasterpes_end_cidade.AsString) <> EmptyStr) ) then
    BuscarCodigoCidade;
end;

procedure TFrmPessoaCadastro.BtnExcluirClick(Sender: TObject);
begin
  if ( not CdsMasterpes_ult_datamov.IsNull ) then
    ShowMessageStop('Este registro possui não poderá ser excluído.')
  else
    inherited;
end;

procedure TFrmPessoaCadastro.BuscarCodigoCidade;
var
  cds : TClientDataSet;
begin
  if ( CdsMaster.State in [dsEdit, dsInsert] ) then
  begin
    cds := TClientDataSet.Create(nil);
    try

      if GetDataSetDB( cds, 'vw_cidade_estado', 'est_sigla = ' + QuotedStr(AnsiUpperCase(CdsMasterpes_end_uf.AsString)) +
        ' and cid_nome  = ' + QuotedStr(AnsiUpperCase(CdsMasterpes_end_cidade.AsString)) ) then
        CdsMastercid_codigo.Assign( cds.FieldByName('cid_codigo') )
      else
        CdsMastercid_codigo.Clear;

    finally
      cds.Free;
    end;
  end;
end;

end.
