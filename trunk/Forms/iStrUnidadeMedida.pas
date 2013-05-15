unit iStrUnidadeMedida;

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
  TFrmUnidadeMedida = class(TFrmPadraoTabela)
    CdsMasterund_codigo: TIntegerField;
    CdsMasterund_descricao: TStringField;
    CdsMasterund_sigla: TStringField;
    DbgTabelaDBund_codigo: TcxGridDBColumn;
    DbgTabelaDBund_descricao: TcxGridDBColumn;
    DbgTabelaDBund_sigla: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure CdsMasterNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
  end;

var
  FrmUnidadeMedida: TFrmUnidadeMedida;

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

{ TFrmUnidadeMedida }

function TFrmUnidadeMedida.ExecutarPesquisa: Boolean;
begin
  RefreshDB;
  
  CdsMaster.Close;
  QryMaster.SQL.Clear;
  QryMaster.SQL.AddStrings( SQL_Master );
  QryMaster.SQL.Add('where (1 = 1)');

  if Trim(EdtPesquisa.Text) <> EmptyStr then
    if StrIsInteger( Trim(EdtPesquisa.Text) ) then
      QryMaster.SQL.Add('  and u.und_codigo = ' + Trim(EdtPesquisa.Text))
    else
      QryMaster.SQL.Add('  and upper(u.und_descricao) like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%'));

  QryMaster.SQL.Add('order by u.und_descricao');

  CdsMaster.Open;

  Result := not CdsMaster.IsEmpty;
end;

procedure TFrmUnidadeMedida.FormCreate(Sender: TObject);
begin
  inherited;
  ComponenteLogin := FrmLogin;
  ConexaoDB       := FrmLogin.conWebMaster;
  
  NomeTabela     := 'str_unidade';
  CampoChave     := 'und_codigo';
  CampoDescricao := 'und_descricao';
  CampoOrdenacao := 'und_descricao';

  AbrirTabela := True;
end;

procedure TFrmUnidadeMedida.CdsMasterNewRecord(DataSet: TDataSet);
begin
  CdsMasterund_codigo.AsInteger := MaxCod(NomeTabela, CampoChave, EmptyStr);
end;

end.
