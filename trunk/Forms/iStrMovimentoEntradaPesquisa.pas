unit iStrMovimentoEntradaPesquisa;

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
  TFrmMovimentoEntradaPesquisa = class(TFrmPadraoTabelaCadastro)
    edDataInicio: TcxDateEdit;
    edDataFinal: TcxDateEdit;
    CdsMasterent_ano: TSmallintField;
    CdsMasterent_codigo: TFMTBCDField;
    CdsMasterent_pessoa: TIntegerField;
    CdsMasterent_doc_tipo: TSmallintField;
    CdsMasterent_doc_numero: TStringField;
    CdsMasterent_doc_serie: TStringField;
    CdsMasterent_doc_emissao: TDateField;
    CdsMasterent_valor_nota: TFMTBCDField;
    CdsMasterent_data: TDateField;
    CdsMasterent_hora: TTimeField;
    CdsMasterent_unidade_neg: TSmallintField;
    CdsMasterent_obs: TMemoField;
    CdsMasterent_status: TSmallintField;
    CdsMasterent_usuario_abertura: TStringField;
    CdsMasterent_usuario_fechamento: TStringField;
    CdsMasterent_log_insert: TStringField;
    CdsMasterent_log_update: TStringField;
    CdsMasterent_log_inactive: TStringField;
    CdsMasteruni_nome: TStringField;
    CdsMasterpes_razao_social: TStringField;
    CdsMasterpes_nome_fantasia: TStringField;
    CdsMastertip_nome: TStringField;
    CdsMasterent_status_desc: TStringField;
    CdsMasterCodigo: TStringField;
    CdsMasterent_mov_codigo: TIntegerField;
    DbgTabelaDBent_doc_numero: TcxGridDBColumn;
    DbgTabelaDBent_doc_emissao: TcxGridDBColumn;
    DbgTabelaDBent_valor_nota: TcxGridDBColumn;
    DbgTabelaDBent_data: TcxGridDBColumn;
    DbgTabelaDBent_status: TcxGridDBColumn;
    DbgTabelaDBent_usuario_fechamento: TcxGridDBColumn;
    DbgTabelaDBent_mov_codigo: TcxGridDBColumn;
    DbgTabelaDBuni_nome: TcxGridDBColumn;
    DbgTabelaDBpes_razao_social: TcxGridDBColumn;
    DbgTabelaDBCodigo: TcxGridDBColumn;
    ImgStatus: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure CdsMasterCalcFields(DataSet: TDataSet);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
  private
    { Private declarations }
    procedure InciarDatas;
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
    function PermitirExcluirRegistro : Boolean; override;
  end;

var
  FrmMovimentoEntradaPesquisa: TFrmMovimentoEntradaPesquisa;

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
  , KeyPadraoTabela
  , iStrMovimentoEntradaCadastro;

{$R *.dfm}

{ TFrmMovimentoEntradaPesquisa }

function TFrmMovimentoEntradaPesquisa.ExecutarPesquisa: Boolean;
begin
  RefreshDB;

  CdsMaster.Close;
  QryMaster.SQL.Clear;
  QryMaster.SQL.AddStrings( SQL_Master );
  QryMaster.SQL.Add('where (1 = 1)');

  if not VarIsNullDate(edDataInicio.EditValue) then
    if ( CmbTipoPesquisa.ItemIndex <> 4 ) then
      QryMaster.SQL.Add('  and me.ent_data >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', edDataInicio.Date)))
    else
      QryMaster.SQL.Add('  and me.ent_doc_emissao >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', edDataInicio.Date)));

  if not VarIsNullDate(edDataFinal.EditValue) then
    if ( CmbTipoPesquisa.ItemIndex <> 4 ) then
      QryMaster.SQL.Add('  and me.ent_data <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', edDataFinal.Date)))
    else
      QryMaster.SQL.Add('  and me.ent_doc_emissao <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', edDataFinal.Date)));

  Case CmbTipoPesquisa.ItemIndex of
    0:
      begin
        if Trim(EdtPesquisa.Text) <> EmptyStr then
          if StrIsInteger( Trim(EdtPesquisa.Text) ) then
            QryMaster.SQL.Add('  and me.ent_codigo = ' + Trim(EdtPesquisa.Text))
          else
            QryMaster.SQL.Add('  and upper(un.uni_nome) like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%'));
      end;

    1:
      begin
        if Trim(EdtPesquisa.Text) <> EmptyStr then
          if StrIsInteger( Trim(EdtPesquisa.Text) ) then
            QryMaster.SQL.Add('  and me.ent_unidade_neg = ' + Trim(EdtPesquisa.Text))
          else
            QryMaster.SQL.Add('  and upper(un.uni_nome) like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%'));
      end;

    2, 4:
      begin
        if Trim(EdtPesquisa.Text) <> EmptyStr then
          if StrIsInteger( Trim(EdtPesquisa.Text) ) then
            QryMaster.SQL.Add('  and me.ent_pessoa = ' + Trim(EdtPesquisa.Text))
          else
            QryMaster.SQL.Add('  and ((upper(ps.pes_razao_social)  like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%') + ')' +
                              '   or  (upper(ps.pes_nome_fantasia) like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%') + '))');
      end;

    3:
      QryMaster.SQL.Add('  and me.ent_status = ' + IntToStr(StrToIntDef(Trim(EdtPesquisa.Text), 0)))
  end;

  QryMaster.SQL.Add('order by me.ent_data, me.ent_hora');
  CdsMaster.Open;

  Result := not CdsMaster.IsEmpty;
end;

procedure TFrmMovimentoEntradaPesquisa.InciarDatas;
begin
  if (Trim(edDataInicio.Text) = EmptyStr) or (Trim(edDataInicio.Text) = STRING_DATA_NULA) or VarIsNullDate(edDataInicio.EditValue) then
    edDataInicio.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', Date));

  if (Trim(edDataFinal.Text) = EmptyStr) or (Trim(edDataFinal.Text) = STRING_DATA_NULA) or VarIsNullDate(edDataFinal.EditValue) then
    edDataFinal.Date  := Date;
end;

function TFrmMovimentoEntradaPesquisa.PermitirExcluirRegistro: Boolean;
var
  sMsg : String;
begin
  Case CdsMasterent_status.AsInteger of
    STATUS_ENTRADA_ESTOQUE_ENCERRADA:
      sMsg := 'Movimento de entrada encerrado!';
    STATUS_ENTRADA_ESTOQUE_CANCELADA:
      sMsg := 'Movimento de entrada cancelado!';
  end;

  Result := (CdsMasterent_status.AsInteger = 0);

  if not Result then
    ShowMessageStop('Este movimento não poderá ser excluído.' + #13 + sMsg);
end;

procedure TFrmMovimentoEntradaPesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  InciarDatas;

  ComponenteLogin := FrmLogin;
  ConexaoDB       := FrmLogin.conWebMaster;

  NomeTabela     := 'str_entrada';
  CampoChave     := 'ent_codigo';
  CampoDescricao := 'pes_razao_social';
  CampoOrdenacao := 'ent_data, ent_hora';

  AbrirTabela := True;
end;

procedure TFrmMovimentoEntradaPesquisa.CdsMasterCalcFields(
  DataSet: TDataSet);
begin
  CdsMasterCodigo.AsString := CdsMasterent_ano.AsString + '/' + FormatFloat('#######000', CdsMasterent_codigo.AsCurrency);
end;

procedure TFrmMovimentoEntradaPesquisa.BtnNovoClick(Sender: TObject);
var
  AForm : TFrmMovimentoEntradaCadastro;
begin
  AForm := TFrmMovimentoEntradaCadastro.CreateTable(Self, FrmLogin, FrmLogin.conWebMaster);
  try
    AForm.SetParametrosPesquisa([0, 0]);

    if ( AForm.ExecutarInsercao ) then
      CdsMaster.Refresh;
  finally
    AForm.Free;
  end;
end;

procedure TFrmMovimentoEntradaPesquisa.BtnEditarClick(Sender: TObject);
var
  AForm : TFrmMovimentoEntradaCadastro;
  sMsg  : String;
begin
  Case CdsMasterent_status.AsInteger of
    STATUS_ENTRADA_ESTOQUE_ENCERRADA:
      sMsg := 'Movimento de entrada encerrado!';
    STATUS_ENTRADA_ESTOQUE_CANCELADA:
      sMsg := 'Movimento de entrada cancelado!';
  end;

  PermitirEditar := (CdsMasterent_status.AsInteger = STATUS_ENTRADA_ESTOQUE_ABERTA);

  AForm := TFrmMovimentoEntradaCadastro.CreateTable(Self, FrmLogin, FrmLogin.conWebMaster);
  try
    AForm.SetParametrosPesquisa([CdsMasterent_ano.AsInteger, CdsMasterent_codigo.AsCurrency]);
    AForm.ExecutarPesquisa;

    if not PermitirEditar then
      AForm.VisualizarConsulta
    else
    if ( AForm.ExecutarAlteracao ) then
      CdsMaster.Refresh;
  finally
    AForm.Free;
  end;
end;

end.
