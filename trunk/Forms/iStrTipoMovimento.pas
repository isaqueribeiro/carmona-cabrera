unit iStrTipoMovimento;

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
  cxTextEdit, cxGroupBox, cxPC, cxButtons;

type
  TFrmTipoMovimento = class(TFrmPadraoTabela)
    CdsMastertmv_codigo: TStringField;
    CdsMastertmv_grupo: TSmallintField;
    CdsMastertmv_descricao: TStringField;
    DbgTabelaDBtmv_codigo: TcxGridDBColumn;
    DbgTabelaDBtmv_grupo: TcxGridDBColumn;
    DbgTabelaDBtmv_descricao: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure DtsMasterDataChange(Sender: TObject; Field: TField);
    procedure DtsMasterStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
  end;

var
  FrmTipoMovimento: TFrmTipoMovimento;

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

{ TFrmTipoMovimento }

function TFrmTipoMovimento.ExecutarPesquisa: Boolean;
begin
  RefreshDB;
  
  CdsMaster.Close;
  QryMaster.SQL.Clear;
  QryMaster.SQL.AddStrings( SQL_Master );

  if Trim(EdtPesquisa.Text) <> EmptyStr then
    if StrIsInteger( Trim(EdtPesquisa.Text) ) then
      QryMaster.SQL.Add('  and t.tmv_codigo = ' + Trim(EdtPesquisa.Text))
    else
      QryMaster.SQL.Add('  and upper(t.tmv_descricao) like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%'));

  QryMaster.SQL.Add('order by t.tmv_grupo, t.tmv_codigo');

  CdsMaster.Open;

  Result := not CdsMaster.IsEmpty;
end;

procedure TFrmTipoMovimento.FormCreate(Sender: TObject);
begin
  inherited;
  ComponenteLogin := FrmLogin;
  ConexaoDB       := FrmLogin.conWebMaster;
  
  NomeTabela     := 'str_tipo_movimento';
  CampoChave     := 'tmv_codigo';
  CampoDescricao := 'tmv_descricao';
  CampoOrdenacao := 'tmv_grupo, tmv_codigo';

  AbrirTabela := True;
end;

procedure TFrmTipoMovimento.DtsMasterDataChange(Sender: TObject;
  Field: TField);
var
  sCodigo : String;
begin
  if ( Field = CdsMastertmv_grupo ) then
  begin
    sCodigo := VarToStr(GetValorDB('str_tipo_movimento', 'max(tmv_codigo) + 1', 'tmv_grupo = ' + CdsMastertmv_grupo.AsString));
    if ( Trim(sCodigo) = EmptyStr ) then
      sCodigo := '001';
      
    if ( CdsMaster.State = dsInsert ) then
      CdsMastertmv_codigo.AsString := CdsMastertmv_grupo.AsString + Copy(sCodigo, 2, 2);
  end;
end;

procedure TFrmTipoMovimento.DtsMasterStateChange(Sender: TObject);
begin
  inherited;
  CdsMastertmv_grupo.ReadOnly := ( CdsMaster.State = dsEdit );
end;

end.
