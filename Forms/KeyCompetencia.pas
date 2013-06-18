unit KeyCompetencia;

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
  cxTextEdit, cxGroupBox, cxPC, cxButtons, cxDBLookupComboBox;

type
  TFrmCompetencia = class(TFrmPadraoTabela)
    CdsMastercom_codigo: TSmallintField;
    CdsMastercom_ano_mes: TIntegerField;
    CdsMastercom_nome: TStringField;
    CdsMastersit_codigo: TSmallintField;
    CdsMastercom_inc: TStringField;
    CdsMastercom_alt: TStringField;
    DbgTabelaDBcom_codigo: TcxGridDBColumn;
    DbgTabelaDBcom_ano_mes: TcxGridDBColumn;
    DbgTabelaDBcom_nome: TcxGridDBColumn;
    DbgTabelaDBsit_codigo: TcxGridDBColumn;
    QrySituacao: TSQLQuery;
    DspSituacao: TDataSetProvider;
    CdsSituacao: TClientDataSet;
    DtsSituacao: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure CdsMasterBeforePost(DataSet: TDataSet);
    procedure CdsMasterNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
  end;

var
  FrmCompetencia: TFrmCompetencia;

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

function TFrmCompetencia.ExecutarPesquisa: Boolean;
begin
  RefreshDB;
  
  CdsMaster.Close;
  QryMaster.SQL.Clear;
  QryMaster.SQL.AddStrings( SQL_Master );
  QryMaster.SQL.Add('where (1 = 1)');

  if Trim(EdtPesquisa.Text) <> EmptyStr then
    if StrIsInteger( Trim(EdtPesquisa.Text) ) then
      QryMaster.SQL.Add('  and c.com_codigo = ' + Trim(EdtPesquisa.Text))
    else
      QryMaster.SQL.Add('  and upper(c.com_nome) like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%'));

  QryMaster.SQL.Add('order by c.com_ano_mes');

  CdsMaster.Open;

  Result := not CdsMaster.IsEmpty;
end;

procedure TFrmCompetencia.FormCreate(Sender: TObject);
begin
  inherited;
  ComponenteLogin := FrmLogin;
  ConexaoDB       := FrmLogin.conWebMaster;
  
  NomeTabela     := 'sys_competencia';
  CampoChave     := 'com_codigo';
  CampoDescricao := 'com_nome';
  CampoOrdenacao := 'com_ano_mes';

  CdsSituacao.Close;
  CdsSituacao.Open;
  
  AbrirTabela := True;
end;

procedure TFrmCompetencia.CdsMasterBeforePost(DataSet: TDataSet);
begin
  if ( CdsMaster.Modified and (CdsMaster.State = dsEdit) ) then
    CdsMastercom_alt.AsString := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;
  inherited;
end;

procedure TFrmCompetencia.CdsMasterNewRecord(DataSet: TDataSet);
begin
  CdsMastercom_codigo.AsInteger := MaxCod(NomeTabela, CampoChave, EmptyStr);
  CdsMastersit_codigo.AsInteger := 1;
  CdsMastercom_inc.AsString     := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;
end;

end.
 