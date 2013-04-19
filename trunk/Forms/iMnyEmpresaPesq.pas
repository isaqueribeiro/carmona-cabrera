unit iMnyEmpresaPesq;

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
  TFrmEmpresaPesq = class(TForm)
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
    QryMasteremp_codigo: TSmallintField;
    QryMasteremp_razao_social: TStringField;
    QryMasteremp_fantasia: TStringField;
    QryMasteremp_cnpj: TStringField;
    QryMasteremp_imagem: TBlobField;
    QryMasteremp_end_logra: TStringField;
    QryMasteremp_end_cidade: TStringField;
    QryMasteremp_end_bairro: TStringField;
    QryMasteremp_end_cep: TStringField;
    QryMasteremp_end_uf: TStringField;
    QryMasteremp_end_fone: TStringField;
    QryMasteremp_ftp: TStringField;
    QryMasteremp_site: TStringField;
    QryMasteremp_email: TStringField;
    QryMasteremp_inc: TStringField;
    QryMasteremp_alt: TStringField;
    ClntDtStMasteremp_codigo: TSmallintField;
    ClntDtStMasteremp_razao_social: TStringField;
    ClntDtStMasteremp_fantasia: TStringField;
    ClntDtStMasteremp_cnpj: TStringField;
    ClntDtStMasteremp_imagem: TBlobField;
    ClntDtStMasteremp_end_logra: TStringField;
    ClntDtStMasteremp_end_cidade: TStringField;
    ClntDtStMasteremp_end_bairro: TStringField;
    ClntDtStMasteremp_end_cep: TStringField;
    ClntDtStMasteremp_end_uf: TStringField;
    ClntDtStMasteremp_end_fone: TStringField;
    ClntDtStMasteremp_ftp: TStringField;
    ClntDtStMasteremp_site: TStringField;
    ClntDtStMasteremp_email: TStringField;
    ClntDtStMasteremp_inc: TStringField;
    ClntDtStMasteremp_alt: TStringField;
    QryMaxseq: TBCDField;
    DbGridDBTblVwemp_codigo: TcxGridDBColumn;
    DbGridDBTblVwemp_razao_social: TcxGridDBColumn;
    DbGridDBTblVwemp_fantasia: TcxGridDBColumn;
    DbGridDBTblVwemp_cnpj: TcxGridDBColumn;
    QryMasteremp_aceite: TSmallintField;
    ClntDtStMasteremp_aceite: TSmallintField;
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
  FrmEmpresaPesq: TFrmEmpresaPesq;

implementation

uses KeyResource, KeyMain, KeyLogin, KeyUsuario, iMnyEmpresa;

{$R *.dfm}

procedure TFrmEmpresaPesq.FormShow(Sender: TObject);
begin
  ClntDtStMaster.Close;
  QryMaster.Close;
  QryMaster.Params.ParamByName('nome').AsString := '%';
  QryMaster.Open;
  ClntDtStMaster.Open;
  EdtPesquisar.SetFocus;
end;

procedure TFrmEmpresaPesq.ActnIncExecute(Sender: TObject);
begin
{  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMasterusr_inc.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);}
end;

procedure TFrmEmpresaPesq.ActnAltExecute(Sender: TObject);
begin
{  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMasterusr_alt.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);}
end;

procedure TFrmEmpresaPesq.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmEmpresaPesq.ClntDtStMasterNewRecord(DataSet: TDataSet);
begin
  FrmLogin.GR_Refresh;
  with QryMax do
  begin
    Close;
    Open;
    ClntDtStMasteremp_codigo.Value := StrToInt(CurrToStr(QryMaxseq.Value)) + 1;
    ClntDtStMasteremp_inc.Value    := FormatDateTime('dd/mm/yyyy', Date) +
                                      FormatDateTime('hh:mm:ss', Time) +
                                      FrmMain.USR_Nome;
  end;
end;

procedure TFrmEmpresaPesq.ClntDtStMasterBeforePost(DataSet: TDataSet);
var
  sSql: String;
begin
   FrmLogin.GR_Refresh;
   //Update;
   if ClntDtStMaster.State in[dsEdit] then
    begin
      ClntDtStMasteremp_alt.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                     FormatDateTime('hh:mm:ss', Time) +
                                     FrmMain.USR_Nome;
      with QryTransaction do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('update sys_empresa a set');
        SQL.Add('   a.emp_razao_social = '  + QuotedStr(ClntDtStMasteremp_razao_social.Value));
        SQL.Add('  ,a.emp_fantasia = '      + QuotedStr((ClntDtStMasteremp_fantasia.Value)));
        SQL.Add('  ,a.emp_cnpj = '          + QuotedStr((ClntDtStMasteremp_cnpj.Value)));
        SQL.Add('  ,a.emp_imagem = '        + QuotedStr(ClntDtStMasteremp_imagem.Value));
        SQL.Add('  ,a.emp_end_logra  = '    + QuotedStr(ClntDtStMasteremp_end_logra.Value));
        SQL.Add('  ,a.emp_end_cidade = '    + QuotedStr(ClntDtStMasteremp_end_cidade.Value));
        SQL.Add('  ,a.emp_end_bairro = '    + QuotedStr(ClntDtStMasteremp_end_bairro.Value));
        SQL.Add('  ,a.emp_end_cep  = '      + QuotedStr(ClntDtStMasteremp_end_cep.Value));
        SQL.Add('  ,a.emp_end_uf  = '       + QuotedStr(ClntDtStMasteremp_end_uf.Value));
        SQL.Add('  ,a.emp_end_fone  = '     + QuotedStr(ClntDtStMasteremp_end_fone.Value));
        SQL.Add('  ,a.emp_ftp  = '          + QuotedStr(ClntDtStMasteremp_ftp.Value));
        SQL.Add('  ,a.emp_site  = '         + QuotedStr(ClntDtStMasteremp_site.Value));
        SQL.Add('  ,a.emp_email  = '        + QuotedStr(ClntDtStMasteremp_email.Value));
        SQL.Add('  ,a.emp_inc  = '          + QuotedStr(ClntDtStMasteremp_inc.Value));
        SQL.Add('  ,a.emp_alt  = '          + QuotedStr(ClntDtStMasteremp_alt.Value));
        SQL.Add('  ,a.emp_aceite  = '       + FormatFloat('000', ClntDtStMasteremp_aceite.Value));
        SQL.Add('   where a.emp_codigo = '  + FormatFloat('000000', ClntDtStMasteremp_codigo.Value));
        if Not Application.MessageBox('Deseja Realmente Alterar os Dados?', 'Confirmação', MB_OKCANCEL+MB_ICONQUESTION) = ID_OK then Exit;
        ExecSQL(True);
        SQL.Text := sSql;
      end;
    end;

  // Insert
  if ClntDtStMaster.State in[dsInsert] then
    begin
      ClntDtStMasteremp_inc.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                     FormatDateTime('hh:mm:ss', Time) +
                                     FrmMain.USR_Nome;
      with QryTransaction do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('insert into sys_empresa');
        SQL.Add(' (emp_codigo, emp_razao_social, emp_fantasia, emp_cnpj, emp_end_logra,');
        SQL.Add(' emp_end_bairro, emp_end_cidade, emp_end_cep, emp_end_uf, emp_end_fone,');
        SQL.Add(' emp_site, emp_ftp, emp_email, emp_inc, emp_alt, emp_aceite )');
        SQL.Add(' values ( ' );
        SQL.Add(FormatFloat('000000', ClntDtStMasteremp_codigo.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasteremp_razao_social.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasteremp_fantasia.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasteremp_cnpj.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasteremp_end_logra.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasteremp_end_bairro.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasteremp_end_cidade.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasteremp_end_cep.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasteremp_end_uf.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasteremp_end_fone.Value)+ ', ');
        SQL.Add(QuotedStr(ClntDtStMasteremp_site.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasteremp_ftp.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasteremp_email.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasteremp_inc.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasteremp_alt.Value) + ', ');
        SQL.Add(FormatFloat('000', ClntDtStMasteremp_aceite.Value));
        SQL.Add(')');
//        sSql := SQl.Text;
//        ShowMessage(pchar(ssql));
        ExecSQL(True);
        SQL.Text := sSql;
        Application.MessageBox('Dados Incluídos Com Sucesso !!!', 'Confirmação', MB_OK);
      end;
    end;
end;

procedure TFrmEmpresaPesq.btnPesquisarClick(Sender: TObject);
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

procedure TFrmEmpresaPesq.ClntDtStMasterBeforeDelete(DataSet: TDataSet);
var
  sSQL :String;
begin
  FrmLogin.GR_Refresh;
  with QryTransaction do
    begin
      sSql := SQL.Text;
      SQL.Clear;
      SQL.Add('delete from sys_empresa ');
      SQL.Add(' where emp_codigo = ' + FormatFloat('000000', ClntDtStMasteremp_codigo.Value));
      ExecSQL(True);
      SQL.Text := sSql;
    end;
end;

procedure TFrmEmpresaPesq.btnNovoClick(Sender: TObject);
begin
  FrmEmpresa := TFrmEmpresa.Create(Application);
  with FrmEmpresa do
  begin
    ClntDtStMaster.Append;
    ShowModal;
    Free;
  end;
end;

procedure TFrmEmpresaPesq.btnEditarClick(Sender: TObject);
begin
  FrmEmpresa := TFrmEmpresa.Create(Application);
  with FrmEmpresa do
  begin
    ShowModal;
    Free;
  end;
end;

end.
