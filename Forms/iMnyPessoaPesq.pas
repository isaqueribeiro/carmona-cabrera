unit iMnyPessoaPesq;

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
  TFrmPessoaPesq = class(TForm)
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
    QryTipo: TSQLQuery;
    DtSTipo: TDataSource;
    QryMasterpes_codigo: TIntegerField;
    QryMastertip_codigo: TSmallintField;
    QryMasterpes_documento: TStringField;
    QryMasterpes_razao_social: TStringField;
    QryMasterpes_nome_fantasia: TStringField;
    QryMasterpes_insc_municipal: TStringField;
    QryMasterpes_insc_estadual: TStringField;
    QryMasterpes_contato: TStringField;
    QryMasterpes_fones: TStringField;
    QryMasterpes_end_logra: TStringField;
    QryMasterpes_end_cidade: TStringField;
    QryMasterpes_end_bairro: TStringField;
    QryMasterpes_end_cep: TStringField;
    QryMasterpes_end_uf: TStringField;
    QryMasterpes_obs: TStringField;
    QryMasterpes_email: TStringField;
    QryMasterccr_codigo: TSmallintField;
    QryMasterpes_inc: TStringField;
    QryMasterpes_alt: TStringField;
    ClntDtStMasterpes_codigo: TIntegerField;
    ClntDtStMastertip_codigo: TSmallintField;
    ClntDtStMasterpes_documento: TStringField;
    ClntDtStMasterpes_razao_social: TStringField;
    ClntDtStMasterpes_nome_fantasia: TStringField;
    ClntDtStMasterpes_insc_municipal: TStringField;
    ClntDtStMasterpes_insc_estadual: TStringField;
    ClntDtStMasterpes_contato: TStringField;
    ClntDtStMasterpes_fones: TStringField;
    ClntDtStMasterpes_end_logra: TStringField;
    ClntDtStMasterpes_end_cidade: TStringField;
    ClntDtStMasterpes_end_bairro: TStringField;
    ClntDtStMasterpes_end_cep: TStringField;
    ClntDtStMasterpes_end_uf: TStringField;
    ClntDtStMasterpes_obs: TStringField;
    ClntDtStMasterpes_email: TStringField;
    ClntDtStMasterccr_codigo: TSmallintField;
    ClntDtStMasterpes_inc: TStringField;
    ClntDtStMasterpes_alt: TStringField;
    DbGridDBTblVwpes_codigo: TcxGridDBColumn;
    DbGridDBTblVwtip_codigo: TcxGridDBColumn;
    DbGridDBTblVwpes_documento: TcxGridDBColumn;
    DbGridDBTblVwpes_nome_fantasia: TcxGridDBColumn;
    QryMasterpes_status: TSmallintField;
    ClntDtStMasterpes_status: TSmallintField;
    DbGridDBTblVwpes_status: TcxGridDBColumn;
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
    procedure ClntDtStMasterpes_nome_fantasiaChange(Sender: TField);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FrmPessoaPesq: TFrmPessoaPesq;

implementation

uses KeyResource, KeyMain, KeyLogin, KeyUsuario, iMnyPessoa;

{$R *.dfm}

procedure TFrmPessoaPesq.FormShow(Sender: TObject);
begin
  ClntDtStMaster.Close;
  QryMaster.Close;
  QryMaster.Params.ParamByName('nome').AsString := '%';
  //QryMaster.Open;
  //ClntDtStMaster.Open;
  QryTipo.Open;
  EdtPesquisar.SetFocus;
end;

procedure TFrmPessoaPesq.ActnIncExecute(Sender: TObject);
begin
  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMasterpes_inc.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmPessoaPesq.ActnAltExecute(Sender: TObject);
begin
  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMasterpes_alt.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmPessoaPesq.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPessoaPesq.ClntDtStMasterNewRecord(DataSet: TDataSet);
begin
  FrmLogin.GR_Refresh;
  FrmPessoa.QryTipo.Close;
  FrmPessoa.QryTipo.Open;
  FrmPessoa.QryConta.Close;
  FrmPessoa.QryConta.Open;
  ClntDtStMasterpes_status.Value := 1;
end;

procedure TFrmPessoaPesq.ClntDtStMasterBeforePost(DataSet: TDataSet);
var
  sSql: String;
begin
   FrmLogin.GR_Refresh;
   FrmPessoa.QryTipo.Close;
   FrmPessoa.QryTipo.Open;
   FrmPessoa.QryConta.Close;
   FrmPessoa.QryConta.Open;
   //Update;
   if ClntDtStMaster.State in[dsEdit] then
    begin
      ClntDtStMasterpes_alt.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                     FormatDateTime('hh:mm:ss', Time) +
                                     FrmMain.USR_Nome;
      with QryTransaction do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('update mny_pessoa a set');
        SQL.Add('   a.tip_codigo = '         + FormatFloat('000', ClntDtStMastertip_codigo.Value));
        SQL.Add('  ,a.pes_documento = '      + QuotedStr(ClntDtStMasterpes_documento.Value));
        SQL.Add('  ,a.pes_razao_social = '   + QuotedStr(ClntDtStMasterpes_razao_social.Value));
        SQL.Add('  ,a.pes_nome_fantasia = '  + QuotedStr(ClntDtStMasterpes_nome_fantasia.Value));
        SQL.Add('  ,a.pes_insc_municipal = ' + QuotedStr(ClntDtStMasterpes_insc_municipal.Value));
        SQL.Add('  ,a.pes_insc_estadual = '  + QuotedStr(ClntDtStMasterpes_insc_estadual.Value));
        SQL.Add('  ,a.pes_contato = '        + QuotedStr(ClntDtStMasterpes_contato.Value));
        SQL.Add('  ,a.pes_fones = '          + QuotedStr(ClntDtStMasterpes_fones.Value));
        SQL.Add('  ,a.pes_end_logra = '      + QuotedStr(ClntDtStMasterpes_end_logra.Value));
        SQL.Add('  ,a.pes_end_cidade = '     + QuotedStr(ClntDtStMasterpes_end_cidade.Value));
        SQL.Add('  ,a.pes_end_bairro = '     + QuotedStr(ClntDtStMasterpes_end_bairro.Value));
        SQL.Add('  ,a.pes_end_cep = '        + QuotedStr(ClntDtStMasterpes_end_cep.Value));
        SQL.Add('  ,a.pes_end_uf = '         + QuotedStr(ClntDtStMasterpes_end_uf.Value));
        SQL.Add('  ,a.pes_obs = '            + QuotedStr(ClntDtStMasterpes_obs.Value));
        SQL.Add('  ,a.pes_email = '          + QuotedStr(ClntDtStMasterpes_email.Value));
        SQL.Add('  ,a.ccr_codigo = '         + FormatFloat('000', ClntDtStMasterccr_codigo.Value));
        SQL.Add('  ,a.pes_alt  = '           + QuotedStr(ClntDtStMasterpes_alt.Value));
        SQL.Add('  ,a.pes_status  = '        + FormatFloat('000', ClntDtStMasterpes_status.Value));
        SQL.Add('   where a.pes_codigo = '   + FormatFloat('000000', ClntDtStMasterpes_codigo.Value));
        if Not Application.MessageBox('Deseja Realmente Alterar os Dados?', 'Confirmação', MB_OKCANCEL+MB_ICONQUESTION) = ID_OK then Exit;
        ExecSQL(True);
        SQL.Text := sSql;
      end;
    end;

  // Insert
  if ClntDtStMaster.State in[dsInsert] then
    begin
    with QryMax do
      begin
       Close;
       Open;
       ClntDtStMasterpes_codigo.Value := StrToInt(CurrToStr(QryMaxseq.Value)) + 1;
      end;
      
      ClntDtStMasterpes_inc.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                     FormatDateTime('hh:mm:ss', Time) +
                                     FrmMain.USR_Nome;
      with QryTransaction do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('insert into mny_pessoa');
        SQL.Add(' (pes_codigo, tip_codigo, pes_documento, pes_razao_social, pes_nome_fantasia,  ');
        SQL.Add(' pes_insc_municipal, pes_insc_estadual, pes_contato, pes_fones, pes_end_logra,  ');
        SQL.Add(' pes_end_cidade, pes_end_bairro, pes_end_cep, pes_end_uf, pes_obs, pes_email, ');
        SQL.Add(' ccr_codigo, pes_inc, pes_alt, pes_status) ');
        SQL.Add(' values ( ' );
        SQL.Add(FormatFloat('000000', ClntDtStMasterpes_codigo.Value) + ', ');
        SQL.Add(FormatFloat('000', ClntDtStMastertip_codigo.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterpes_documento.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterpes_razao_social.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterpes_nome_fantasia.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterpes_insc_municipal.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterpes_insc_estadual.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterpes_contato.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterpes_fones.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterpes_end_logra.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterpes_end_cidade.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterpes_end_bairro.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterpes_end_cep.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterpes_end_uf.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterpes_obs.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterpes_email.Value) + ', ');
        SQL.Add(FormatFloat('000', ClntDtStMasterccr_codigo.Value) + ', ');        
        SQL.Add(QuotedStr(ClntDtStMasterpes_inc.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterpes_alt.Value) + ', ');
        SQL.Add(FormatFloat('000', ClntDtStMasterpes_status.Value));
        SQL.Add(')');
//        sSql := SQl.Text;
//        ShowMessage(pchar(ssql));
        ExecSQL(True);
        SQL.Text := sSql;
        Application.MessageBox('Dados Incluídos Com Sucesso !!!', 'Confirmação', MB_OK);
      end;
    end;
end;

procedure TFrmPessoaPesq.btnPesquisarClick(Sender: TObject);
begin
  With QryMaster Do
    Begin
      Close;
      Params.ParamByName('nome').AsString := '%' + EdtPesquisar.Text + '%';
      Open;
      ClntDtStMaster.Close;
      ClntDtStMaster.Open;
    End;
end;

procedure TFrmPessoaPesq.ClntDtStMasterBeforeDelete(DataSet: TDataSet);
var
  sSQL :String;
begin
  FrmLogin.GR_Refresh;
  FrmPessoa.QryTipo.Close;
  FrmPessoa.QryTipo.Open;
  FrmPessoa.QryConta.Close;
  FrmPessoa.QryConta.Open;
  with QryTransaction do
    begin
      sSql := SQL.Text;
      SQL.Clear;
      SQL.Add('delete from mny_pessoa ');
      SQL.Add(' where pes_codigo = ' + FormatFloat('000000', ClntDtStMasterpes_codigo.Value));
      ExecSQL(True);
      SQL.Text := sSql;
    end;
end;

procedure TFrmPessoaPesq.btnNovoClick(Sender: TObject);
begin
  FrmPessoa := TFrmPessoa.Create(Application);
  QryMaster.Open;
  ClntDtStMaster.Open;
  FrmLogin.GR_Refresh;
  with FrmPessoa do
  begin
    ClntDtStMaster.Append;
    ShowModal;
    Free;
  end;
end;

procedure TFrmPessoaPesq.btnEditarClick(Sender: TObject);
begin
  FrmLogin.GR_Refresh;
  QryMaster.Open;
  ClntDtStMaster.Open;  
  FrmPessoa := TFrmPessoa.Create(Application);
  with FrmPessoa do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TFrmPessoaPesq.ClntDtStMasterpes_nome_fantasiaChange(
  Sender: TField);
begin
  if ClntDtStMaster.State in[dsInsert] then
    begin
      ClntDtStMasterpes_razao_social.Value := ClntDtStMasterpes_nome_fantasia.Value;
    end;

end;

end.

