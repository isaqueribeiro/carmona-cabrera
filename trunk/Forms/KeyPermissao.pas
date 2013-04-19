unit KeyPermissao;

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
  TFrmPermissao = class(TForm)
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
    QryUpdate: TSQLQuery;
    QryInsert: TSQLQuery;
    QryDelete: TSQLQuery;
    QryMasterusr_codigo: TSmallintField;
    QryMasterobj_codigo: TSmallintField;
    QryMasterper_nivel: TSmallintField;
    QryMasterper_inc: TStringField;
    QryMasterper_alt: TStringField;
    ClntDtStMasterusr_codigo: TSmallintField;
    ClntDtStMasterobj_codigo: TSmallintField;
    ClntDtStMasterper_nivel: TSmallintField;
    ClntDtStMasterper_inc: TStringField;
    ClntDtStMasterper_alt: TStringField;
    DbGridDBTblVwusr_codigo: TcxGridDBColumn;
    DbGridDBTblVwobj_codigo: TcxGridDBColumn;
    DbGridDBTblVwper_nivel: TcxGridDBColumn;
    QryUsuario: TSQLQuery;
    QryUsuariousr_codigo: TSmallintField;
    QryUsuariousr_nome: TStringField;
    QryObjeto: TSQLQuery;
    QryObjetoobj_codigo: TSmallintField;
    QryObjetoobj_nome: TStringField;
    DtSUsuario: TDataSource;
    DtSObjeto: TDataSource;
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
  FrmPermissao: TFrmPermissao;

implementation

uses KeyResource, KeyMain, KeyLogin;

{$R *.dfm}

procedure TFrmPermissao.FormShow(Sender: TObject);
begin
  QryUsuario.Open;
  QryObjeto.Open;
  ClntDtStMaster.Close;
  QryMaster.Close;
  QryMaster.Params.ParamByName('nome').AsString := '%';
  QryMaster.Open;
  ClntDtStMaster.Open;
  EdtPesquisar.SetFocus;
end;

procedure TFrmPermissao.ActnIncExecute(Sender: TObject);
begin
  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMasterper_inc.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmPermissao.ActnAltExecute(Sender: TObject);
begin
  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMasterper_alt.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmPermissao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPermissao.ClntDtStMasterNewRecord(DataSet: TDataSet);
begin
  FrmLogin.GR_Refresh;
  ClntDtStMasterper_inc.Value    := FormatDateTime('dd/mm/yyyy', Date) +
                                    FormatDateTime('hh:mm:ss', Time) +
                                    FrmMain.USR_Nome;
end;

procedure TFrmPermissao.ClntDtStMasterBeforePost(DataSet: TDataSet);
var
  sSql: String;
begin
  FrmLogin.GR_Refresh;
  // Update
  if ClntDtStMaster.State in[dsEdit] then
    begin
      ClntDtStMasterper_alt.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                     FormatDateTime('hh:mm:ss', Time) +
                                     FrmMain.USR_Nome;
      with QryUpdate do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('update sys_permissao a set');
        SQL.Add('   a.per_nivel = ' + QuotedStr(IntToStr(ClntDtStMasterper_nivel.Value)));
        SQL.Add('  ,a.per_alt  = '  + QuotedStr(ClntDtStMasterper_alt.Value));
        SQL.Add('   where a.usr_codigo = ' + FormatFloat('000000', ClntDtStMasterobj_codigo.Value));
        SQL.Add('   and a.obj_codigo = ' + FormatFloat('000000', ClntDtStMasterobj_codigo.Value));
        if Not Application.MessageBox('Deseja Realmente Alterar os Dados?', 'Confirmação', MB_OKCANCEL+MB_ICONQUESTION) = ID_OK then Exit;
        ExecSQL(True);
        SQL.Text := sSql;
      end;
    end;

  // Insert
  if ClntDtStMaster.State in[dsInsert] then
    begin
      ClntDtStMasterper_inc.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                     FormatDateTime('hh:mm:ss', Time) +
                                     FrmMain.USR_Nome;
      with QryInsert do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('insert into sys_permissao');
        SQL.Add(' (usr_codigo, obj_codigo, per_nivel, per_inc, per_alt) ');
        SQL.Add(' values ( ' );
        SQL.Add(FormatFloat('000000', ClntDtStMasterusr_codigo.Value) + ', ');
        SQL.Add(FormatFloat('000000', ClntDtStMasterobj_codigo.Value) + ', ');
        SQL.Add(FormatFloat('0', ClntDtStMasterper_nivel.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterper_inc.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterper_alt.Value));
        SQL.Add(')');
        ExecSQL(True);
        SQL.Text := sSql;
        Application.MessageBox('Dados Incluídos Com Sucesso !!!', 'Confirmação', MB_OK+MB_ICONINFORMATION);
      end;
    end;
end;

procedure TFrmPermissao.btnPesquisarClick(Sender: TObject);
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

procedure TFrmPermissao.ClntDtStMasterBeforeDelete(DataSet: TDataSet);
var
  sSQL :String;
begin
  FrmLogin.GR_Refresh;
  with QryDelete do
    begin
      sSql := SQL.Text;
      SQL.Clear;
      SQL.Add('delete from sys_permissao ');
      SQL.Add(' where usr_codigo = ' + FormatFloat('000000', ClntDtStMasterusr_codigo.Value));
      SQL.Add(' and usr_codigo = ' + FormatFloat('000000', ClntDtStMasterobj_codigo.Value));
      ExecSQL(True);
      SQL.Text := sSql;
    end;
end;

end.
