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
  cxTextEdit, cxGroupBox, cxPC, cxButtons, cxCalendar, ImgList;

type
  TFrmAjusteEstoquePesquisa = class(TFrmPadraoTabelaCadastro)
    edDataInicio: TcxDateEdit;
    edDataFinal: TcxDateEdit;
    CdsMastereaj_ano: TSmallintField;
    CdsMastereaj_codigo: TIntegerField;
    CdsMastereaj_data: TDateField;
    CdsMastereaj_hora: TTimeField;
    CdsMastereaj_unidade_neg: TSmallintField;
    CdsMastereaj_obs: TStringField;
    CdsMastereaj_status: TSmallintField;
    CdsMastereaj_usuario_abertura: TStringField;
    CdsMastereaj_usuario_fechamento: TStringField;
    CdsMastereaj_log_insert: TStringField;
    CdsMastereaj_log_update: TStringField;
    CdsMastereaj_log_inactive: TStringField;
    CdsMasteruni_nome: TStringField;
    CdsMasterCodigo: TStringField;
    ImgStatus: TImageList;
    DbgTabelaDBeaj_data: TcxGridDBColumn;
    DbgTabelaDBeaj_status: TcxGridDBColumn;
    DbgTabelaDBeaj_usuario_abertura: TcxGridDBColumn;
    DbgTabelaDBeaj_usuario_fechamento: TcxGridDBColumn;
    DbgTabelaDBuni_nome: TcxGridDBColumn;
    DbgTabelaDBCodigo: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure CdsMasterCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure InciarDatas;
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
    function PermitirExcluirRegistro : Boolean; override;
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

function TFrmAjusteEstoquePesquisa.ExecutarPesquisa: Boolean;
begin
  RefreshDB;

  CdsMaster.Close;
  QryMaster.SQL.Clear;
  QryMaster.SQL.AddStrings( SQL_Master );
  QryMaster.SQL.Add('where (1 = 1)');

  if not VarIsNullDate(edDataInicio.EditValue) then
    QryMaster.SQL.Add('  and ae.eaj_data >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', edDataInicio.Date)));

  if not VarIsNullDate(edDataFinal.EditValue) then
    QryMaster.SQL.Add('  and ae.eaj_data <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', edDataFinal.Date)));

  Case CmbTipoPesquisa.ItemIndex of
    0:
      begin
        if Trim(EdtPesquisa.Text) <> EmptyStr then
          if StrIsInteger( Trim(EdtPesquisa.Text) ) then
            QryMaster.SQL.Add('  and ae.eaj_codigo = ' + Trim(EdtPesquisa.Text))
          else
            QryMaster.SQL.Add('  and upper(ae.uni_nome) like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%'));
      end;

    1:
      begin
        if Trim(EdtPesquisa.Text) <> EmptyStr then
          if StrIsInteger( Trim(EdtPesquisa.Text) ) then
            QryMaster.SQL.Add('  and ae.eaj_unidade_neg = ' + Trim(EdtPesquisa.Text))
          else
            QryMaster.SQL.Add('  and upper(ae.uni_nome) like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%'));
      end;

    2:
      QryMaster.SQL.Add('  and ae.eaj_status = ' + IntToStr(StrToIntDef(Trim(EdtPesquisa.Text), 0)))
  end;

  QryMaster.SQL.Add('order by ae.eaj_data, ae.eaj_hora');
  CdsMaster.Open;

  Result := not CdsMaster.IsEmpty;
end;

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
  if (Trim(edDataInicio.Text) = EmptyStr) or (Trim(edDataInicio.Text) = '30/12/1899') or VarIsNullDate(edDataInicio.EditValue) then
    edDataInicio.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', Date));

  if (Trim(edDataFinal.Text) = EmptyStr) or (Trim(edDataFinal.Text) = '30/12/1899') or VarIsNullDate(edDataFinal.EditValue) then
    edDataFinal.Date  := Date;
end;

function TFrmAjusteEstoquePesquisa.PermitirExcluirRegistro: Boolean;
begin
  Result := (CdsMastereaj_status.AsInteger = 0);

  if not Result then
    ShowMessageWarning('Registro de Ajuste de Estoque n�o pode ser exclu�do por est� encerrado ou cancelado!', 'Exclus�o');
end;

procedure TFrmAjusteEstoquePesquisa.CdsMasterCalcFields(DataSet: TDataSet);
begin
  CdsMasterCodigo.AsString := CdsMastereaj_ano.AsString + '/' + FormatFloat('#######000', CdsMastereaj_codigo.AsInteger);
end;

end.