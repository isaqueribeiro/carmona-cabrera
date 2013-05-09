unit KeyObjeto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadraoTabela, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, dxSkinsCore,
  dxSkinscxPCPainter, cxContainer, cxEdit, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, FMTBcd, cxImageComboBox,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, Provider,
  DBClient, SqlExpr, StdCtrls, ExtCtrls, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, cxMaskEdit, cxDropDownEdit, cxTextEdit,
  cxGroupBox, cxPC, cxButtons;

type
  TFrmObjeto = class(TFrmPadraoTabela)
    CdsMasterobj_codigo: TSmallintField;
    CdsMasterobj_nome: TStringField;
    CdsMasterobj_tipo: TSmallintField;
    CdsMasterobj_inc: TStringField;
    CdsMasterobj_alt: TStringField;
    DbgTabelaDBobj_codigo: TcxGridDBColumn;
    DbgTabelaDBobj_nome: TcxGridDBColumn;
    DbgTabelaDBobj_tipo: TcxGridDBColumn;
    procedure CdsMasterNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure CdsMasterAfterEdit(DataSet: TDataSet);
    procedure CdsMasterAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
  end;

var
  FrmObjeto: TFrmObjeto;

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

procedure TFrmObjeto.CdsMasterNewRecord(DataSet: TDataSet);
begin
  CdsMasterobj_codigo.AsInteger := MaxCod(NomeTabela, CampoChave, EmptyStr);
  CdsMasterobj_inc.AsString     := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;
end;

function TFrmObjeto.ExecutarPesquisa: Boolean;
begin
  RefreshDB;

  CdsMaster.Close;
  QryMaster.SQL.Clear;
  QryMaster.SQL.AddStrings( SQL_Master );
  QryMaster.SQL.Add('where (1 = 1)');

  if Trim(EdtPesquisa.Text) <> EmptyStr then
    if StrIsInteger( Trim(EdtPesquisa.Text) ) then
      QryMaster.SQL.Add('  and o.obj_codigo = ' + Trim(EdtPesquisa.Text))
    else
      QryMaster.SQL.Add('  and upper(o.obj_nome) like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%'));

  QryMaster.SQL.Add('order by o.obj_nome');

  CdsMaster.Open;

  Result := not CdsMaster.IsEmpty;
end;

procedure TFrmObjeto.FormCreate(Sender: TObject);
begin
  inherited;
  ComponenteLogin := FrmLogin;
  ConexaoDB       := FrmLogin.conWebMaster;

  NomeTabela     := 'sys_objeto';
  CampoChave     := 'obj_codigo';
  CampoDescricao := 'obj_nome';
  CampoOrdenacao := 'obj_nome';

  AbrirTabela := True;
end;

procedure TFrmObjeto.CdsMasterAfterEdit(DataSet: TDataSet);
begin
  CdsMasterobj_alt.AsString := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;
end;

procedure TFrmObjeto.CdsMasterAfterPost(DataSet: TDataSet);
var
  sis ,
  obj : Integer;
const
  sWHR = 'sis_codigo = %d and obj_codigo = %d';
begin
  sis := ComponenteLogin.Tag;
  obj := CdsMasterobj_codigo.AsInteger;

  if VarIsNull(GetValorDB('sys_sistema_objeto', 'obj_codigo', Format(sWHR, [sis, obj]))) then
    ConexaoDB.ExecuteDirect('Insert Into sys_sistema_objeto (sis_codigo, obj_codigo) values (' + IntToStr(sis) + ', ' + IntToStr(obj) + ')');
end;

end.
 