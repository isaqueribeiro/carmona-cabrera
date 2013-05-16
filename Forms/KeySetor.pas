unit KeySetor;

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
  TFrmSetor = class(TFrmPadraoTabela)
    CdsMasterset_codigo: TSmallintField;
    CdsMasterset_nome: TStringField;
    CdsMasterset_gerente: TStringField;
    CdsMasterset_inc: TStringField;
    CdsMasterset_alt: TStringField;
    DbgTabelaDBset_codigo: TcxGridDBColumn;
    DbgTabelaDBset_nome: TcxGridDBColumn;
    DbgTabelaDBset_gerente: TcxGridDBColumn;
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
  FrmSetor: TFrmSetor;

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

procedure TFrmSetor.FormCreate(Sender: TObject);
begin
  inherited;
  ComponenteLogin := FrmLogin;
  ConexaoDB       := FrmLogin.conWebMaster;
  
  NomeTabela     := 'mny_setor';
  CampoChave     := 'set_codigo';
  CampoDescricao := 'set_nome';
  CampoOrdenacao := 'set_nome';

  AbrirTabela := True;
end;

procedure TFrmSetor.CdsMasterNewRecord(DataSet: TDataSet);
begin
  CdsMasterset_codigo.AsInteger := MaxCod(NomeTabela, CampoChave, EmptyStr);
  CdsMasterset_inc.AsString     := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;
end;

function TFrmSetor.ExecutarPesquisa: Boolean;
begin
  RefreshDB;
  
  CdsMaster.Close;
  QryMaster.SQL.Clear;
  QryMaster.SQL.AddStrings( SQL_Master );
  QryMaster.SQL.Add('where (1 = 1)');

  if Trim(EdtPesquisa.Text) <> EmptyStr then
    if StrIsInteger( Trim(EdtPesquisa.Text) ) then
      QryMaster.SQL.Add('  and s.set_codigo = ' + Trim(EdtPesquisa.Text))
    else
      QryMaster.SQL.Add('  and upper(s.set_nome) like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%'));

  QryMaster.SQL.Add('order by s.set_nome');

  CdsMaster.Open;

  Result := not CdsMaster.IsEmpty;
end;

procedure TFrmSetor.CdsMasterBeforePost(DataSet: TDataSet);
begin
  if ( CdsMaster.Modified and (CdsMaster.State = dsEdit) ) then
    CdsMasterset_alt.AsString := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;
  inherited;
end;

end.
