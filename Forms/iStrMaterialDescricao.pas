unit iStrMaterialDescricao;

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
  TFrmMaterialDescricao = class(TFrmPadraoTabela)
    CdsMasterdes_codigo: TIntegerField;
    CdsMasterdes_descricao: TStringField;
    CdsMasterdes_ativa: TSmallintField;
    CdsMasterdes_log_insert: TStringField;
    CdsMasterdes_log_update: TStringField;
    CdsMasterdes_log_inactive: TStringField;
    DbgTabelaDBdes_codigo: TcxGridDBColumn;
    DbgTabelaDBdes_descricao: TcxGridDBColumn;
    DbgTabelaDBdes_ativa: TcxGridDBColumn;
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
  FrmMaterialDescricao: TFrmMaterialDescricao;

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

{ TFrmMaterialDescricao }

function TFrmMaterialDescricao.ExecutarPesquisa: Boolean;
begin
  RefreshDB;
  
  CdsMaster.Close;
  QryMaster.SQL.Clear;
  QryMaster.SQL.AddStrings( SQL_Master );
  QryMaster.SQL.Add('where (1 = 1)');

  if Trim(EdtPesquisa.Text) <> EmptyStr then
    if StrIsInteger( Trim(EdtPesquisa.Text) ) then
      QryMaster.SQL.Add('  and d.des_codigo = ' + Trim(EdtPesquisa.Text))
    else
      QryMaster.SQL.Add('  and upper(d.des_descricao) like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%'));

  QryMaster.SQL.Add('order by d.des_descricao');

  CdsMaster.Open;

  Result := not CdsMaster.IsEmpty;
end;

procedure TFrmMaterialDescricao.FormCreate(Sender: TObject);
begin
  inherited;
  ComponenteLogin := FrmLogin;
  ConexaoDB       := FrmLogin.conWebMaster;

  NomeTabela     := 'str_material_descricao';
  CampoChave     := 'des_codigo';
  CampoDescricao := 'des_descricao';
  CampoOrdenacao := 'des_descricao';

  AbrirTabela := True;
end;

procedure TFrmMaterialDescricao.CdsMasterNewRecord(DataSet: TDataSet);
begin
  CdsMasterdes_codigo.AsInteger    := MaxCod(NomeTabela, CampoChave, EmptyStr);
  CdsMasterdes_ativa.AsInteger     := 1;
  CdsMasterdes_log_insert.AsString := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;
end;

procedure TFrmMaterialDescricao.CdsMasterBeforePost(DataSet: TDataSet);
begin
  if ( CdsMaster.Modified and (CdsMaster.State = dsEdit) ) then
    CdsMasterdes_log_update.AsString := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;

  if ( CdsMasterdes_ativa.AsInteger = 0 ) then
    CdsMasterdes_log_inactive.AsString := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;
  inherited;
end;

end.
 