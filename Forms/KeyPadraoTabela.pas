unit KeyPadraoTabela;

interface

uses
  KeyResource,
  KeyPadrao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  StdCtrls, cxButtons, ExtCtrls, cxControls, dxSkinsCore,
  dxSkinscxPCPainter, cxContainer, cxEdit, cxTextEdit, cxGroupBox, cxPC,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxMaskEdit, cxDropDownEdit,
  cxImageComboBox, FMTBcd, Provider, DBClient, SqlExpr;

type
  TFrmPadraoTabela = class(TFrmPadrao)
    PnlMain: TPanel;
    btnFechar: TcxButton;
    Bevel1: TBevel;
    PnlTabela: TPanel;
    PgCtrlMain: TcxPageControl;
    TbShtPrincipal: TcxTabSheet;
    GrpBxPesquisa: TcxGroupBox;
    EdtPesquisa: TcxTextEdit;
    BtnPesquisar: TcxButton;
    DbgTabela: TcxGrid;
    DbgTabelaDB: TcxGridDBTableView;
    DbgTabelaLvl: TcxGridLevel;
    Pnl: TPanel;
    ShpTitulo: TShape;
    LblDados: TLabel;
    CmbTipoPesquisa: TcxImageComboBox;
    QryMaster: TSQLQuery;
    CdsMaster: TClientDataSet;
    DspMaster: TDataSetProvider;
    DtsMaster: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    FSQL_Master : TStringList;
  public
    { Public declarations }
    property SQL_Master : TStringList read FSQL_Master write FSQL_Master;
    
    function MaxCod(sTabela, sCampo, sWhereSQL : String) : Integer;
    function ExecutarPesquisa : Boolean; virtual;
  end;

var
  FrmPadraoTabela: TFrmPadraoTabela;

implementation

{$R *.dfm}

procedure TFrmPadraoTabela.FormShow(Sender: TObject);
begin
  inherited;
  if ( Assigned(ConexaoDB) and (QryMaster.SQLConnection = nil) ) then
    QryMaster.SQLConnection := ConexaoDB;
end;

function TFrmPadraoTabela.MaxCod(sTabela, sCampo, sWhereSQL: String): Integer;
var
  qry : TSQLQuery;
begin
  sTabela   := Trim( AnsiLowerCase(sTabela) );
  sCampo    := Trim( AnsiLowerCase(sCampo) );
  sWhereSQL := Trim( AnsiLowerCase(sWhereSQL) );

  if sWhereSQL <> EmptyStr then
    sWhereSQL := Trim('where ' + sWhereSQL);

  qry := TSQLQuery.Create(nil);
  try
    qry.SQLConnection := ConexaoDB;
    qry.SQL.Text := 'Select max(' + sCampo + ') as ID from ' + sTabela + ' ' + sWhereSQL;
    qry.ExecSQL;

    Result := qry.FieldByName('ID').AsInteger + 1;
  finally
    qry.Free;
  end;
end;

procedure TFrmPadraoTabela.FormCreate(Sender: TObject);
begin
  inherited;
  FSQL_Master := TStringList.Create;
  FSQL_Master.AddStrings( QryMaster.SQL );
end;

function TFrmPadraoTabela.ExecutarPesquisa: Boolean;
begin
  raise Exception.Create('Implementar função "ExecutarPesquisa()" em "' + Self.Name + '".');
end;

procedure TFrmPadraoTabela.BtnPesquisarClick(Sender: TObject);
begin
  if ExecutarPesquisa() then
    DbgTabela.SetFocus;
end;

end.
