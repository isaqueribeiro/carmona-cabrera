unit iMnyContaPesq;

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
  TFrmContaPesq = class(TForm)
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
    QryOrcamento: TSQLQuery;
    DtSOrcamento: TDataSource;
    QryMastercon_codigo: TSmallintField;
    QryMastercon_nome: TStringField;
    QryMasterorc_codigo: TSmallintField;
    QryMastercon_inc: TStringField;
    QryMastercon_alt: TStringField;
    ClntDtStMastercon_codigo: TSmallintField;
    ClntDtStMastercon_nome: TStringField;
    ClntDtStMasterorc_codigo: TSmallintField;
    ClntDtStMastercon_inc: TStringField;
    ClntDtStMastercon_alt: TStringField;
    DbGridDBTblVwcon_codigo: TcxGridDBColumn;
    DbGridDBTblVwcon_nome: TcxGridDBColumn;
    DbGridDBTblVworc_codigo: TcxGridDBColumn;
    QryOrcamentoorc_codigo: TSmallintField;
    QryOrcamentoorc_nome: TStringField;
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
  FrmContaPesq: TFrmContaPesq;

implementation

uses KeyResource, KeyMain, KeyLogin, KeyUsuario;

{$R *.dfm}

procedure TFrmContaPesq.FormShow(Sender: TObject);
begin
  ClntDtStMaster.Close;
  QryMaster.Close;
  QryMaster.Params.ParamByName('nome').AsString := '%';
  QryMaster.Open;
  ClntDtStMaster.Open;
  QryOrcamento.Open;
  EdtPesquisar.SetFocus;
end;

procedure TFrmContaPesq.ActnIncExecute(Sender: TObject);
begin
  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMastercon_inc.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmContaPesq.ActnAltExecute(Sender: TObject);
begin
  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMastercon_alt.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmContaPesq.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmContaPesq.ClntDtStMasterNewRecord(DataSet: TDataSet);
begin
  FrmLogin.GR_Refresh;
  QryOrcamento.Close;
  QryOrcamento.Open;
  with QryMax do
  begin
    Close;
    Open;
    ClntDtStMastercon_codigo.Value := StrToInt(CurrToStr(QryMaxseq.Value)) + 1;
    ClntDtStMastercon_inc.Value    := FormatDateTime('dd/mm/yyyy', Date) +
                                      FormatDateTime('hh:mm:ss', Time) +
                                      FrmMain.USR_Nome;
  end;
end;

procedure TFrmContaPesq.ClntDtStMasterBeforePost(DataSet: TDataSet);
var
  sSql: String;
begin
   FrmLogin.GR_Refresh;
   QryOrcamento.Close;
   QryOrcamento.Open;
   // Update;
   if ClntDtStMaster.State in[dsEdit] then
    begin
      ClntDtStMastercon_alt.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                     FormatDateTime('hh:mm:ss', Time) +
                                     FrmMain.USR_Nome;
      with QryTransaction do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('update mny_conta a set');
        SQL.Add('   a.con_nome = '      + QuotedStr(ClntDtStMastercon_nome.Value));
        SQL.Add('  ,a.orc_codigo = '    + FormatFloat('000', ClntDtStMasterorc_codigo.Value));
        SQL.Add('  ,a.con_alt  = '      + QuotedStr(ClntDtStMastercon_alt.Value));
        SQL.Add('   where a.con_codigo = ' + FormatFloat('000000', ClntDtStMastercon_codigo.Value));
        if Not Application.MessageBox('Deseja Realmente Alterar os Dados?', 'Confirmação', MB_OKCANCEL+MB_ICONQUESTION) = ID_OK then Exit;
        ExecSQL(True);
        SQL.Text := sSql;
      end;
    end;

  // Insert
  if ClntDtStMaster.State in[dsInsert] then
    begin
      ClntDtStMastercon_inc.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                     FormatDateTime('hh:mm:ss', Time) +
                                     FrmMain.USR_Nome;
      with QryTransaction do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('insert into mny_conta');
        SQL.Add(' (con_codigo, con_nome, orc_codigo, con_inc, con_alt) ');
        SQL.Add(' values ( ' );
        SQL.Add(FormatFloat('000000', ClntDtStMastercon_codigo.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMastercon_nome.Value) + ', ');
        SQL.Add(FormatFloat('000', ClntDtStMasterorc_codigo.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMastercon_inc.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMastercon_alt.Value));
        SQL.Add(')');
//        sSql := SQl.Text;
//        ShowMessage(pchar(ssql));
        ExecSQL(True);
        SQL.Text := sSql;
        Application.MessageBox('Dados Incluídos Com Sucesso !!!', 'Confirmação', MB_OK);
      end;
    end;
end;

procedure TFrmContaPesq.btnPesquisarClick(Sender: TObject);
begin
  FrmLogin.GR_Refresh;
  QryOrcamento.Close;
  QryOrcamento.Open;
  With QryMaster Do
    Begin
      Close;
      Params.ParamByName('nome').AsString := '%' + EdtPesquisar.Text + '%';
      Open;
      ClntDtStMaster.Close;
      ClntDtStMaster.Open;
    End;
end;

procedure TFrmContaPesq.ClntDtStMasterBeforeDelete(DataSet: TDataSet);
var
  sSQL :String;
begin
  FrmLogin.GR_Refresh;
  QryOrcamento.Close;
  QryOrcamento.Open;  
  with QryTransaction do
    begin
      sSql := SQL.Text;
      SQL.Clear;
      SQL.Add('delete from mny_conta ');
      SQL.Add(' where con_codigo = ' + FormatFloat('000000', ClntDtStMastercon_codigo.Value));
      ExecSQL(True);
      SQL.Text := sSql;
    end;
end;

procedure TFrmContaPesq.btnNovoClick(Sender: TObject);
begin
  ClntDtStMaster.Append;
end;

procedure TFrmContaPesq.btnEditarClick(Sender: TObject);
begin
  ClntDtStMaster.Post;
end;

end.
