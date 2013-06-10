unit iStrAjusteEstoquePesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadraoTabelaCadastro, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, dxSkinsCore,
  dxSkinscxPCPainter, cxContainer, cxEdit, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, FMTBcd, Provider,
  DBClient, SqlExpr, StdCtrls, ExtCtrls, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxMaskEdit, cxDropDownEdit, cxImageComboBox,
  cxTextEdit, cxGroupBox, cxPC, cxButtons, cxCalendar;

type
  TFrmAjusteEstoquePesquisa = class(TFrmPadraoTabelaCadastro)
    edDataInicio: TcxDateEdit;
    edDataFinal: TcxDateEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure InciarDatas;
  public
    { Public declarations }
  end;

var
  FrmAjusteEstoquePesquisa: TFrmAjusteEstoquePesquisa;

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
  , KeyPadrao
  , KeyPadraoTabela;

{$R *.dfm}

procedure TFrmAjusteEstoquePesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  InciarDatas;

  ComponenteLogin := FrmLogin;
  ConexaoDB       := FrmLogin.conWebMaster;

  NomeTabela     := 'str_estoque_ajuste';
  CampoChave     := 'eaj_ano;eaj_codigo';
  CampoDescricao := 'uni_nome';
  CampoOrdenacao := 'eaj_data, eaj_hora';

  AbrirTabela := True;
end;

procedure TFrmAjusteEstoquePesquisa.InciarDatas;
begin
  if (Trim(edDataInicio.Text) = EmptyStr) or VarIsNullDate(edDataInicio.EditValue) then
    edDataInicio.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', Date));

  if (Trim(edDataFinal.Text) = EmptyStr) or VarIsNullDate(edDataFinal.EditValue) then
    edDataFinal.Date  := Date;
end;

end.
