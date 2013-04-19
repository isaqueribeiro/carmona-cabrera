unit iMnyNegocioPesq;

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
  TFrmNegocioPesq = class(TForm)
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
    QryMasterneg_codigo: TSmallintField;
    QryMasterneg_nome: TStringField;
    QryMasterneg_inc: TStringField;
    QryMasterneg_alt: TStringField;
    ClntDtStMasterneg_codigo: TSmallintField;
    ClntDtStMasterneg_nome: TStringField;
    ClntDtStMasterneg_inc: TStringField;
    ClntDtStMasterneg_alt: TStringField;
    DbGridDBTblVwneg_codigo: TcxGridDBColumn;
    DbGridDBTblVwneg_nome: TcxGridDBColumn;
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
  FrmNegocioPesq: TFrmNegocioPesq;

implementation

uses KeyResource, KeyMain, KeyLogin, KeyUsuario;

{$R *.dfm}

procedure TFrmNegocioPesq.FormShow(Sender: TObject);
begin
  ClntDtStMaster.Close;
  QryMaster.Close;
  QryMaster.Params.ParamByName('nome').AsString := '%';
  QryMaster.Open;
  ClntDtStMaster.Open;
  EdtPesquisar.SetFocus;
end;

procedure TFrmNegocioPesq.ActnIncExecute(Sender: TObject);
begin
  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMasterneg_inc.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmNegocioPesq.ActnAltExecute(Sender: TObject);
begin
  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMasterneg_alt.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmNegocioPesq.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmNegocioPesq.ClntDtStMasterNewRecord(DataSet: TDataSet);
begin
  FrmLogin.GR_Refresh;
  with QryMax do
  begin
    Close;
    Open;
    ClntDtStMasterneg_codigo.Value := StrToInt(CurrToStr(QryMaxseq.Value)) + 1;
    ClntDtStMasterneg_inc.Value    := FormatDateTime('dd/mm/yyyy', Date) +
                                      FormatDateTime('hh:mm:ss', Time) +
                                      FrmMain.USR_Nome;
  end;
end;

procedure TFrmNegocioPesq.ClntDtStMasterBeforePost(DataSet: TDataSet);
var
  sSql: String;
begin
   FrmLogin.GR_Refresh;
   //Update;
   if ClntDtStMaster.State in[dsEdit] then
    begin
      ClntDtStMasterneg_alt.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                     FormatDateTime('hh:mm:ss', Time) +
                                     FrmMain.USR_Nome;
      with QryTransaction do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('update mny_centro_negocio a set');
        SQL.Add('   a.neg_nome = '      + QuotedStr(ClntDtStMasterneg_nome.Value));
        SQL.Add('  ,a.neg_alt  = '      + QuotedStr(ClntDtStMasterneg_alt.Value));
        SQL.Add('   where a.neg_codigo = ' + FormatFloat('000000', ClntDtStMasterneg_codigo.Value));
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
      ClntDtStMasterneg_inc.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                     FormatDateTime('hh:mm:ss', Time) +
                                     FrmMain.USR_Nome;
      with QryTransaction do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('insert into mny_centro_negocio ');
        SQL.Add(' (neg_codigo, neg_nome, neg_inc, neg_alt) ');
        SQL.Add(' values ( ' );
        SQL.Add(FormatFloat('000000', ClntDtStMasterneg_codigo.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterneg_nome.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterneg_inc.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterneg_alt.Value));
        SQL.Add(')');
//        sSql := SQl.Text;
//        ShowMessage(pchar(ssql));
        ExecSQL(True);
        SQL.Text := sSql;
        Application.MessageBox('Dados Incluídos Com Sucesso !!!', 'Confirmação', MB_OK);
      end;
    end;
end;

procedure TFrmNegocioPesq.btnPesquisarClick(Sender: TObject);
begin
  FrmLogin.GR_Refresh;
  With QryMaster Do
    Begin
      Close;
      Params.ParamByName('nome').AsString := '%' + EdtPesquisar.Text + '%';
      Open;
      ClntDtStMaster.Close;
      ClntDtStMaster.Open;
    End;
end;

procedure TFrmNegocioPesq.ClntDtStMasterBeforeDelete(DataSet: TDataSet);
var
  sSQL :String;
begin
  FrmLogin.GR_Refresh;
  with QryTransaction do
    begin
      sSql := SQL.Text;
      SQL.Clear;
      SQL.Add('delete from mny_centro_negocio ');
      SQL.Add(' where neg_codigo = ' + FormatFloat('000000', ClntDtStMasterneg_codigo.Value));
      ExecSQL(True);
      SQL.Text := sSql;
    end;
end;

procedure TFrmNegocioPesq.btnNovoClick(Sender: TObject);
begin
  ClntDtStMaster.Append;
end;

procedure TFrmNegocioPesq.btnEditarClick(Sender: TObject);
begin
  ClntDtStMaster.Post;
end;

end.
