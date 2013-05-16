unit iStrMaterialApresentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadraoTabela, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, dxSkinsCore,
  dxSkinscxPCPainter, cxContainer, cxEdit, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, FMTBcd, Provider,
  DBClient, SqlExpr, StdCtrls, ExtCtrls, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxMaskEdit, cxDropDownEdit, cxImageComboBox,
  cxTextEdit, cxGroupBox, cxPC, cxButtons, cxCheckBox;

type
  TFrmMaterialApresentacao = class(TFrmPadraoTabela)
    CdsMasterapr_codigo: TIntegerField;
    CdsMasterapr_descricao: TStringField;
    CdsMasterapr_ativa: TSmallintField;
    CdsMasterapr_log_insert: TStringField;
    CdsMasterapr_log_update: TStringField;
    CdsMasterapr_log_inactive: TStringField;
    DbgTabelaDBapr_codigo: TcxGridDBColumn;
    DbgTabelaDBapr_descricao: TcxGridDBColumn;
    DbgTabelaDBapr_ativa: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure CdsMasterNewRecord(DataSet: TDataSet);
    procedure CdsMasterBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
  end;

var
  FrmMaterialApresentacao: TFrmMaterialApresentacao;

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

{ TFrmMaterialApresentacao }

function TFrmMaterialApresentacao.ExecutarPesquisa: Boolean;
begin
  RefreshDB;
  
  CdsMaster.Close;
  QryMaster.SQL.Clear;
  QryMaster.SQL.AddStrings( SQL_Master );
  QryMaster.SQL.Add('where (1 = 1)');

  if Trim(EdtPesquisa.Text) <> EmptyStr then
    if StrIsInteger( Trim(EdtPesquisa.Text) ) then
      QryMaster.SQL.Add('  and a.apr_codigo = ' + Trim(EdtPesquisa.Text))
    else
      QryMaster.SQL.Add('  and upper(d.apr_descricao) like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%'));

  QryMaster.SQL.Add('order by a.apr_descricao');

  CdsMaster.Open;

  Result := not CdsMaster.IsEmpty;
end;

procedure TFrmMaterialApresentacao.FormCreate(Sender: TObject);
begin
  inherited;
  ComponenteLogin := FrmLogin;
  ConexaoDB       := FrmLogin.conWebMaster;

  NomeTabela     := 'str_material_apresentacao';
  CampoChave     := 'apr_codigo';
  CampoDescricao := 'apr_descricao';
  CampoOrdenacao := 'apr_descricao';

  AbrirTabela := True;
end;

procedure TFrmMaterialApresentacao.CdsMasterNewRecord(DataSet: TDataSet);
begin
  inherited;
  CdsMasterapr_codigo.AsInteger    := MaxCod(NomeTabela, CampoChave, EmptyStr);
  CdsMasterapr_ativa.AsInteger     := 1;
  CdsMasterapr_log_insert.AsString := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;
end;

procedure TFrmMaterialApresentacao.CdsMasterBeforePost(DataSet: TDataSet);
begin
  if ( CdsMaster.Modified and (CdsMaster.State = dsEdit) ) then
    CdsMasterapr_log_update.AsString := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;

  if ( CdsMasterapr_ativa.AsInteger = 0 ) then
    CdsMasterapr_log_inactive.AsString := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;
  inherited;
end;

end.
