unit KeyTipoDocumento;

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
  TFrmTipoDocumento = class(TFrmPadraoTabela)
    CdsMastertip_codigo: TSmallintField;
    CdsMastertip_nome: TStringField;
    CdsMastertip_doc_entrada: TSmallintField;
    CdsMastertip_inc: TStringField;
    CdsMastertip_alt: TStringField;
    DbgTabelaDBtip_codigo: TcxGridDBColumn;
    DbgTabelaDBtip_nome: TcxGridDBColumn;
    DbgTabelaDBtip_doc_entrada: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure CdsMasterBeforePost(DataSet: TDataSet);
    procedure CdsMasterNewRecord(DataSet: TDataSet);
    procedure DbgTabelaDBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
  end;

var
  FrmTipoDocumento: TFrmTipoDocumento;

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

{ TFrmTipoDocumento }

function TFrmTipoDocumento.ExecutarPesquisa: Boolean;
begin
  RefreshDB;
  
  CdsMaster.Close;
  QryMaster.SQL.Clear;
  QryMaster.SQL.AddStrings( SQL_Master );
  QryMaster.SQL.Add('where (1 = 1)');

  if Trim(EdtPesquisa.Text) <> EmptyStr then
    if StrIsInteger( Trim(EdtPesquisa.Text) ) then
      QryMaster.SQL.Add('  and t.tip_codigo = ' + Trim(EdtPesquisa.Text))
    else
      QryMaster.SQL.Add('  and upper(t.tip_nome) like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%'));

  QryMaster.SQL.Add('order by t.tip_nome');

  CdsMaster.Open;

  Result := not CdsMaster.IsEmpty;
end;

procedure TFrmTipoDocumento.FormCreate(Sender: TObject);
begin
  inherited;
  ComponenteLogin := FrmLogin;
  ConexaoDB       := FrmLogin.conWebMaster;
  
  NomeTabela     := 'mny_tipo_documento';
  CampoChave     := 'tip_codigo';
  CampoDescricao := 'tip_nome';
  CampoOrdenacao := 'tip_nome';

  AbrirTabela := True;
end;

procedure TFrmTipoDocumento.CdsMasterBeforePost(DataSet: TDataSet);
begin
  if ( CdsMaster.Modified and (CdsMaster.State = dsEdit) ) then
    CdsMastertip_alt.AsString := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;
  inherited;
end;

procedure TFrmTipoDocumento.CdsMasterNewRecord(DataSet: TDataSet);
begin
  CdsMastertip_codigo.AsInteger      := MaxCod(NomeTabela, CampoChave, EmptyStr);
  CdsMastertip_doc_entrada.AsInteger := 1;
  CdsMastertip_inc.AsString          := FormatDateTime('dd/mm/yyyy', Date) + FormatDateTime('hh:mm:ss', Time) + gUsuario.Login;
end;

procedure TFrmTipoDocumento.DbgTabelaDBKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( Key = VK_SPACE ) then
    if ( DbgTabelaDBtip_doc_entrada.Focused ) then
    begin
      if ( not (CdsMaster.State in [dsEdit, dsInsert]) ) then
        Exit;

      if CdsMastertip_doc_entrada.AsInteger = 0 then
        CdsMastertip_doc_entrada.AsInteger := 1
      else
        CdsMastertip_doc_entrada.AsInteger := 0;
    end;
end;

end.
