unit KeyObjeto;

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
  FMTBcd, SqlExpr, DBClient, Provider, cxLookAndFeels;

type
  TFrmObjeto = class(TForm)
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
    QryMasterobj_codigo: TSmallintField;
    QryMasterobj_nome: TStringField;
    QryMasterobj_tipo: TSmallintField;
    QryMasterobj_inc: TStringField;
    QryMasterobj_alt: TStringField;
    DbGridDBTblVwobj_codigo: TcxGridDBColumn;
    DbGridDBTblVwobj_nome: TcxGridDBColumn;
    DbGridDBTblVwobj_tipo: TcxGridDBColumn;
    DtStPvdMaster: TDataSetProvider;
    ClntDtStMaster: TClientDataSet;
    ClntDtStMasterobj_codigo: TSmallintField;
    ClntDtStMasterobj_nome: TStringField;
    ClntDtStMasterobj_tipo: TSmallintField;
    ClntDtStMasterobj_inc: TStringField;
    ClntDtStMasterobj_alt: TStringField;
    QryMax: TSQLQuery;
    QryMaxseq: TBCDField;
    QryUpdate: TSQLQuery;
    QryInsert: TSQLQuery;
    QryDelete: TSQLQuery;
    procedure FormShow(Sender: TObject);
    procedure ActnIncExecute(Sender: TObject);
    procedure ActnAltExecute(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure ClntDtStMasterNewRecord(DataSet: TDataSet);
    procedure ClntDtStMasterBeforePost(DataSet: TDataSet);
    procedure btnPesquisarClick(Sender: TObject);
    procedure ClntDtStMasterBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FrmObjeto: TFrmObjeto;

implementation

uses
  {$IFDEF IMONEY}
    KeyMain
  , KeyLogin
  {$ENDIF}
  {$IFDEF ISTORE}
    iStrMain
  , iStrLogin
  {$ENDIF}
  , KeyResource;

{$R *.dfm}

procedure TFrmObjeto.FormShow(Sender: TObject);
begin
  ClntDtStMaster.Close;
  QryMaster.Close;
  QryMaster.Params.ParamByName('nome').AsString := '%';
  QryMaster.Open;
  ClntDtStMaster.Open;
  EdtPesquisar.SetFocus;
end;

procedure TFrmObjeto.ActnIncExecute(Sender: TObject);
begin
  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMasterobj_inc.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmObjeto.ActnAltExecute(Sender: TObject);
begin
  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMasterobj_alt.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmObjeto.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmObjeto.ClntDtStMasterNewRecord(DataSet: TDataSet);
begin
  FrmLogin.GR_Refresh;
  with QryMax do
  begin
    Close;
    Open;
    ClntDtStMasterobj_codigo.Value := StrToInt(CurrToStr(QryMaxseq.Value)) + 1;
    ClntDtStMasterobj_inc.Value    := FormatDateTime('dd/mm/yyyy', Date) +
                                      FormatDateTime('hh:mm:ss', Time) +
                                      FrmMain.USR_Nome;
  end;  
end;

procedure TFrmObjeto.ClntDtStMasterBeforePost(DataSet: TDataSet);
var
  sSql: String;
begin
  FrmLogin.GR_Refresh;
  
  // Update
  if ClntDtStMaster.State in[dsEdit] then
    begin
      ClntDtStMasterobj_alt.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                     FormatDateTime('hh:mm:ss', Time) +
                                     FrmMain.USR_Nome;
      with QryUpdate do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('update sys_objeto a set');
        SQL.Add('   a.obj_nome = ' + QuotedStr(ClntDtStMasterobj_nome.Value));
        SQL.Add('  ,a.obj_tipo = ' + QuotedStr(IntToStr(ClntDtStMasterobj_tipo.Value)));
        SQL.Add('  ,a.obj_alt  = ' + QuotedStr(ClntDtStMasterobj_alt.Value));
        SQL.Add('   where a.obj_codigo = ' + FormatFloat('000000', ClntDtStMasterobj_codigo.Value));
        if Not Application.MessageBox('Deseja Realmente Alterar os Dados?', 'Confirmação', MB_OKCANCEL+MB_ICONQUESTION) = ID_OK then Exit;
        ExecSQL(True);
        SQL.Text := sSql;
      end;
    end;

  // Insert
  if ClntDtStMaster.State in[dsInsert] then
    begin
      ClntDtStMasterobj_inc.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                     FormatDateTime('hh:mm:ss', Time) +
                                     FrmMain.USR_Nome;
      with QryInsert do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('insert into sys_objeto');
        SQL.Add(' (obj_codigo, obj_nome, obj_tipo, obj_inc, obj_alt) ');
        SQL.Add(' values ( ' );
        SQL.Add(FormatFloat('000000', ClntDtStMasterobj_codigo.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterobj_nome.Value) + ', ');
        SQL.Add(FormatFloat('0', ClntDtStMasterobj_tipo.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterobj_inc.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterobj_alt.Value));
        SQL.Add(')');
        ExecSQL(True);
        SQL.Text := sSql;
        Application.MessageBox('Dados Incluídos Com Sucesso !!!', 'Confirmação', MB_OK+MB_ICONINFORMATION);
      end;
    end;
end;

procedure TFrmObjeto.btnPesquisarClick(Sender: TObject);
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

procedure TFrmObjeto.ClntDtStMasterBeforeDelete(DataSet: TDataSet);
var
  sSQL :String;
begin
  FrmLogin.GR_Refresh;
  with QryDelete do
    begin
      sSql := SQL.Text;
      SQL.Clear;
      SQL.Add('delete from sys_objeto ');
      SQL.Add(' where obj_codigo = ' + FormatFloat('000000', ClntDtStMasterobj_codigo.Value));
      ExecSQL(True);
      SQL.Text := sSql;
    end;
end;

end.
