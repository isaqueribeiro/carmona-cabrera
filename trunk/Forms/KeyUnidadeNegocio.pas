unit KeyUnidadeNegocio;

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
  TFrmUnidadeNegocio = class(TFrmPadraoTabela)
    CdsMasteruni_codigo: TSmallintField;
    CdsMasteruni_nome: TStringField;
    CdsMasteruni_centro_distribuicao: TSmallintField;
    CdsMasteruni_inc: TStringField;
    CdsMasteruni_alt: TStringField;
    DbgTabelaDBuni_codigo: TcxGridDBColumn;
    DbgTabelaDBuni_nome: TcxGridDBColumn;
    DbgTabelaDBuni_centro_distribuicao: TcxGridDBColumn;
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
  FrmUnidadeNegocio: TFrmUnidadeNegocio;

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

procedure TFrmUnidadeNegocio.FormCreate(Sender: TObject);
begin
  inherited;
  ComponenteLogin := FrmLogin;
  ConexaoDB       := FrmLogin.conWebMaster;
  
  NomeTabela     := 'mny_unidade';
  CampoChave     := 'uni_codigo';
  CampoDescricao := 'uni_nome';
  CampoOrdenacao := 'uni_nome';

  AbrirTabela := True;
end;

procedure TFrmUnidadeNegocio.CdsMasterNewRecord(DataSet: TDataSet);
begin
  CdsMasteruni_codigo.AsInteger := MaxCod(NomeTabela, CampoChave, EmptyStr);
  CdsMasteruni_inc.AsString     := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;
  CdsMasteruni_centro_distribuicao.AsInteger := 0;
end;

procedure TFrmUnidadeNegocio.CdsMasterBeforePost(DataSet: TDataSet);
begin
  if ( CdsMaster.Modified and (CdsMaster.State = dsEdit) ) then
    CdsMasteruni_alt.AsString := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;
  inherited;
end;

function TFrmUnidadeNegocio.ExecutarPesquisa: Boolean;
begin
  RefreshDB;
  
  CdsMaster.Close;
  QryMaster.SQL.Clear;
  QryMaster.SQL.AddStrings( SQL_Master );

  if Trim(EdtPesquisa.Text) <> EmptyStr then
    if StrIsInteger( Trim(EdtPesquisa.Text) ) then
      QryMaster.SQL.Add('  and u.uni_codigo = ' + Trim(EdtPesquisa.Text))
    else
      QryMaster.SQL.Add('  and upper(u.uni_nome) like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%'));

  QryMaster.SQL.Add('order by u.uni_nome');

  CdsMaster.Open;

  Result := not CdsMaster.IsEmpty;
end;

end.
