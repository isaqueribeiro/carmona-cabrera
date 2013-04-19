unit iMnyCorrentePesq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin,
  dxSkinSilver, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit, cxControls, cxContainer,
  cxEdit, cxGroupBox, Menus, StdCtrls, cxButtons, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxDBEdit, cxImageComboBox, ExtCtrls, cxPC, ActnList, cxDBLookupComboBox,
  FMTBcd, SqlExpr, DBClient, Provider;

type
  TFrmCorrentePesq = class(TForm)
    DtSMaster: TDataSource;
    PgCtrlMain: TcxPageControl;
    TbShtPrincipal: TcxTabSheet;
    Shape2: TShape;
    LblDados: TLabel;
    GrpBxPesquisa: TcxGroupBox;
    EdtPesquisar: TcxTextEdit;
    btnPesquisar: TcxButton;
    DbGrd: TcxGrid;
    DbGridDBTblVw: TcxGridDBTableView;
    DbGridLvl: TcxGridLevel;
    ActnMain: TActionList;
    ActnInc: TAction;
    ActnAlt: TAction;
    ActnBlock: TAction;
    PnlMain: TPanel;
    btnFechar: TcxButton;
    QryMaster: TSQLQuery;
    DtStPvdMaster: TDataSetProvider;
    ClntDtStMaster: TClientDataSet;
    QryMax: TSQLQuery;
    QryTransaction: TSQLQuery;
    btnNovo: TcxButton;
    btnEditar: TcxButton;
    QryMaxseq: TBCDField;
    QryBanco: TSQLQuery;
    DtSBanco: TDataSource;
    QryBancobco_codigo: TSmallintField;
    QryBancobco_nome: TStringField;
    QryMasterccr_codigo: TSmallintField;
    QryMasterccr_agencia: TStringField;
    QryMasterccr_agencia_dv: TStringField;
    QryMasterccr_conta: TStringField;
    QryMasterccr_conta_dv: TStringField;
    QryMasterccr_tipo: TSmallintField;
    QryMasterban_codigo: TSmallintField;
    QryMasterccr_inc: TStringField;
    QryMasterccr_alt: TStringField;
    ClntDtStMasterccr_codigo: TSmallintField;
    ClntDtStMasterccr_agencia: TStringField;
    ClntDtStMasterccr_agencia_dv: TStringField;
    ClntDtStMasterccr_conta: TStringField;
    ClntDtStMasterccr_conta_dv: TStringField;
    ClntDtStMasterccr_tipo: TSmallintField;
    ClntDtStMasterban_codigo: TSmallintField;
    ClntDtStMasterccr_inc: TStringField;
    ClntDtStMasterccr_alt: TStringField;
    DbGridDBTblVwccr_codigo: TcxGridDBColumn;
    DbGridDBTblVwccr_agencia: TcxGridDBColumn;
    DbGridDBTblVwccr_agencia_dv: TcxGridDBColumn;
    DbGridDBTblVwccr_conta: TcxGridDBColumn;
    DbGridDBTblVwccr_conta_dv: TcxGridDBColumn;
    DbGridDBTblVwccr_tipo: TcxGridDBColumn;
    DbGridDBTblVwban_codigo: TcxGridDBColumn;
    QryMasterccr_caixa: TSmallintField;
    ClntDtStMasterccr_caixa: TSmallintField;
    DbGridDBTblVwccr_caixa: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure ActnIncExecute(Sender: TObject);
    procedure ActnAltExecute(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure ClntDtStMasterNewRecord(DataSet: TDataSet);
    procedure ClntDtStMasterBeforePost(DataSet: TDataSet);
    procedure btnPesquisarClick(Sender: TObject);
    procedure ClntDtStMasterBeforeDelete(DataSet: TDataSet);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FrmCorrentePesq: TFrmCorrentePesq;

implementation

uses KeyResource, KeyMain, KeyLogin, KeyUsuario;

{$R *.dfm}

procedure TFrmCorrentePesq.FormShow(Sender: TObject);
begin
  ClntDtStMaster.Close;
  QryMaster.Close;
  QryMaster.Params.ParamByName('nome').AsString := '%';
  QryMaster.Open;
  ClntDtStMaster.Open;
  QryBanco.Open;
  EdtPesquisar.SetFocus;
end;

procedure TFrmCorrentePesq.ActnIncExecute(Sender: TObject);
begin
  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMasterccr_inc.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmCorrentePesq.ActnAltExecute(Sender: TObject);
begin
  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMasterccr_alt.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmCorrentePesq.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCorrentePesq.ClntDtStMasterNewRecord(DataSet: TDataSet);
begin
  FrmLogin.GR_Refresh;
  QryBanco.Open;  
  with QryMax do
  begin
    Close;
    Open;
    ClntDtStMasterccr_codigo.Value := StrToInt(CurrToStr(QryMaxseq.Value)) + 1;
    ClntDtStMasterccr_inc.Value    := FormatDateTime('dd/mm/yyyy', Date) +
                                      FormatDateTime('hh:mm:ss', Time) +
                                      FrmMain.USR_Nome;
  end;
end;

procedure TFrmCorrentePesq.ClntDtStMasterBeforePost(DataSet: TDataSet);
var
  sSql: String;
begin
   FrmLogin.GR_Refresh;
   QryBanco.Open;
   //Update;
   if ClntDtStMaster.State in[dsEdit] then
    begin
      ClntDtStMasterccr_alt.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                     FormatDateTime('hh:mm:ss', Time) +
                                     FrmMain.USR_Nome;
      with QryTransaction do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('update mny_conta_corrente a set');
        SQL.Add('   a.ccr_agencia = '      + QuotedStr(ClntDtStMasterccr_agencia.Value));
        SQL.Add('  ,a.ccr_agencia_dv = '   + QuotedStr(ClntDtStMasterccr_agencia_dv.Value));
        SQL.Add('  ,a.ccr_conta = '        + QuotedStr(ClntDtStMasterccr_conta.Value));
        SQL.Add('  ,a.ccr_conta_dv = '     + QuotedStr(ClntDtStMasterccr_conta_dv.Value));
        SQL.Add('  ,a.ccr_tipo = '         + FormatFloat('000', ClntDtStMasterccr_tipo.Value));
        SQL.Add('  ,a.ban_codigo = '       + FormatFloat('000', ClntDtStMasterban_codigo.Value));
        SQL.Add('  ,a.ccr_alt  = '         + QuotedStr(ClntDtStMasterccr_alt.Value));
        SQL.Add('  ,a.ccr_caixa = '        + FormatFloat('000', ClntDtStMasterccr_caixa.Value));
        SQL.Add('   where a.ccr_codigo = ' + FormatFloat('000000', ClntDtStMasterccr_codigo.Value));
        if Not Application.MessageBox('Deseja Realmente Alterar os Dados?', 'Confirmação', MB_OKCANCEL+MB_ICONQUESTION) = ID_OK then Exit;
//        sSql := SQl.Text;
//        ShowMessage(pchar(ssql));
        ExecSQL(True);
        SQL.Text := sSql;
      end;
    end;   

  // Insert
  if ClntDtStMaster.State in[dsInsert] then
    begin
      ClntDtStMasterccr_inc.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                     FormatDateTime('hh:mm:ss', Time) +
                                     FrmMain.USR_Nome;
      with QryTransaction do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('insert into mny_conta_corrente');
        SQL.Add(' (ccr_codigo, ccr_agencia, ccr_agencia_dv, ccr_conta, ccr_conta_dv, ccr_tipo, ban_codigo, ccr_inc, ccr_alt, ccr_caixa) ');
        SQL.Add(' values ( ' );
        SQL.Add(FormatFloat('000000', ClntDtStMasterccr_codigo.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterccr_agencia.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterccr_agencia_dv.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterccr_conta.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterccr_conta_dv.Value) + ', ');
        SQL.Add(FormatFloat('000', ClntDtStMasterccr_tipo.Value) + ', ');
        SQL.Add(FormatFloat('000', ClntDtStMasterban_codigo.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterccr_inc.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterccr_alt.Value) + ', ');
        SQL.Add(FormatFloat('000', ClntDtStMasterccr_caixa.Value));
        SQL.Add(')');
//        sSql := SQl.Text;
//        ShowMessage(pchar(ssql));
        ExecSQL(True);
        SQL.Text := sSql;
        Application.MessageBox('Dados Incluídos Com Sucesso !!!', 'Confirmação', MB_OK);
      end;
    end;
end;

procedure TFrmCorrentePesq.btnPesquisarClick(Sender: TObject);
begin
  FrmLogin.GR_Refresh;
  QryBanco.Open;
  With QryMaster Do
    Begin
      Close;
      Params.ParamByName('nome').AsString := '%' + EdtPesquisar.Text + '%';
      Open;
      ClntDtStMaster.Close;
      ClntDtStMaster.Open;
    End;
end;

procedure TFrmCorrentePesq.ClntDtStMasterBeforeDelete(DataSet: TDataSet);
var
  sSQL :String;
begin
  FrmLogin.GR_Refresh;
  QryBanco.Open;
  with QryTransaction do
    begin
      sSql := SQL.Text;
      SQL.Clear;
      SQL.Add('delete from mny_conta_corrente ');
      SQL.Add(' where ccr_codigo = ' + FormatFloat('000000', ClntDtStMasterccr_codigo.Value));
      ExecSQL(True);
      SQL.Text := sSql;
    end;
end;

procedure TFrmCorrentePesq.btnNovoClick(Sender: TObject);
begin
  ClntDtStMaster.Append;
end;

procedure TFrmCorrentePesq.btnEditarClick(Sender: TObject);
begin
  ClntDtStMaster.Post;
end;

end.
