unit iMnyCustoPesq;

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
  TFrmCustoPesq = class(TForm)
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
    QryMastercus_codigo: TSmallintField;
    QryMastercus_nome: TStringField;
    QryMastercus_inc: TStringField;
    QryMastercus_alt: TStringField;
    ClntDtStMastercus_codigo: TSmallintField;
    ClntDtStMastercus_nome: TStringField;
    ClntDtStMastercus_inc: TStringField;
    ClntDtStMastercus_alt: TStringField;
    DbGridDBTblVwcus_codigo: TcxGridDBColumn;
    DbGridDBTblVwcus_nome: TcxGridDBColumn;
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
  FrmCustoPesq: TFrmCustoPesq;

implementation

uses KeyResource, KeyMain, KeyLogin, KeyUsuario;

{$R *.dfm}

procedure TFrmCustoPesq.FormShow(Sender: TObject);
begin
  ClntDtStMaster.Close;
  QryMaster.Close;
  QryMaster.Params.ParamByName('nome').AsString := '%';
  QryMaster.Open;
  ClntDtStMaster.Open;
  EdtPesquisar.SetFocus;
end;

procedure TFrmCustoPesq.ActnIncExecute(Sender: TObject);
begin
  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMastercus_inc.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmCustoPesq.ActnAltExecute(Sender: TObject);
begin
  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMastercus_alt.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmCustoPesq.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCustoPesq.ClntDtStMasterNewRecord(DataSet: TDataSet);
begin
  FrmLogin.GR_Refresh;
  with QryMax do
  begin
    Close;
    Open;
    ClntDtStMastercus_codigo.Value := StrToInt(CurrToStr(QryMaxseq.Value)) + 1;
    ClntDtStMastercus_inc.Value    := FormatDateTime('dd/mm/yyyy', Date) +
                                      FormatDateTime('hh:mm:ss', Time) +
                                      FrmMain.USR_Nome;
  end;
end;

procedure TFrmCustoPesq.ClntDtStMasterBeforePost(DataSet: TDataSet);
var
  sSql: String;
begin
   FrmLogin.GR_Refresh;
   //Update;
   if ClntDtStMaster.State in[dsEdit] then
    begin
      ClntDtStMastercus_alt.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                     FormatDateTime('hh:mm:ss', Time) +
                                     FrmMain.USR_Nome;
      with QryTransaction do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('update mny_custo a set');
        SQL.Add('   a.cus_nome = '      + QuotedStr(ClntDtStMastercus_nome.Value));
        SQL.Add('  ,a.cus_alt  = '      + QuotedStr(ClntDtStMastercus_alt.Value));
        SQL.Add('   where a.cus_codigo = ' + FormatFloat('000000', ClntDtStMastercus_codigo.Value));
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
      ClntDtStMastercus_inc.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                     FormatDateTime('hh:mm:ss', Time) +
                                     FrmMain.USR_Nome;
      with QryTransaction do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('insert into mny_custo');
        SQL.Add(' (cus_codigo, cus_nome, cus_inc, cus_alt) ');
        SQL.Add(' values ( ' );
        SQL.Add(FormatFloat('000000', ClntDtStMastercus_codigo.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMastercus_nome.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMastercus_inc.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMastercus_alt.Value));
        SQL.Add(')');
//        sSql := SQl.Text;
//        ShowMessage(pchar(ssql));
        ExecSQL(True);
        SQL.Text := sSql;
        Application.MessageBox('Dados Incluídos Com Sucesso !!!', 'Confirmação', MB_OK);
      end;
    end;
end;

procedure TFrmCustoPesq.btnPesquisarClick(Sender: TObject);
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

procedure TFrmCustoPesq.ClntDtStMasterBeforeDelete(DataSet: TDataSet);
var
  sSQL :String;
begin
  FrmLogin.GR_Refresh;
  with QryTransaction do
    begin
      sSql := SQL.Text;
      SQL.Clear;
      SQL.Add('delete from mny_custo ');
      SQL.Add(' where cus_codigo = ' + FormatFloat('000000', ClntDtStMastercus_codigo.Value));
      ExecSQL(True);
      SQL.Text := sSql;
    end;
end;

procedure TFrmCustoPesq.btnNovoClick(Sender: TObject);
begin
  ClntDtStMaster.Append;
end;

procedure TFrmCustoPesq.btnEditarClick(Sender: TObject);
begin
  ClntDtStMaster.Post;
end;

end.
