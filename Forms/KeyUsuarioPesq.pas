unit KeyUsuarioPesq;

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
  TFrmUsuarioPesq = class(TForm)
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
    QryMaxseq: TBCDField;
    QryUpdate: TSQLQuery;
    QryInsert: TSQLQuery;
    QryDelete: TSQLQuery;
    QryMasterusr_codigo: TSmallintField;
    QryMasterusr_nome: TStringField;
    ClntDtStMasterusr_codigo: TSmallintField;
    ClntDtStMasterusr_nome: TStringField;
    DbGridDBTblVwusr_codigo: TcxGridDBColumn;
    DbGridDBTblVwusr_nome: TcxGridDBColumn;
    btnNovo: TcxButton;
    QryMasterusr_nivel: TSmallintField;
    QryMasterusr_senha: TStringField;
    QryMasterusr_inc: TStringField;
    QryMasterusr_alt: TStringField;
    QryMasterusr_status: TSmallintField;
    ClntDtStMasterusr_nivel: TSmallintField;
    ClntDtStMasterusr_senha: TStringField;
    ClntDtStMasterusr_inc: TStringField;
    ClntDtStMasterusr_alt: TStringField;
    ClntDtStMasterusr_status: TSmallintField;
    btnEditar: TcxButton;
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
  FrmUsuarioPesq: TFrmUsuarioPesq;

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
  , KeyUsuario
  , KeyResource;

{$R *.dfm}

procedure TFrmUsuarioPesq.FormShow(Sender: TObject);
begin
  ClntDtStMaster.Close;
  QryMaster.Close;
  QryMaster.Params.ParamByName('nome').AsString := '%';
  QryMaster.Open;
  ClntDtStMaster.Open;
  EdtPesquisar.SetFocus;
end;

procedure TFrmUsuarioPesq.ActnIncExecute(Sender: TObject);
begin
  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMasterusr_inc.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmUsuarioPesq.ActnAltExecute(Sender: TObject);
begin
  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMasterusr_alt.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmUsuarioPesq.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmUsuarioPesq.ClntDtStMasterNewRecord(DataSet: TDataSet);
begin

  FrmLogin.conWebMaster.Connected := False;
  FrmLogin.conWebMaster.Connected := True;

  with QryMax do
  begin
    Close;
    Open;
    ClntDtStMasterusr_codigo.Value := StrToInt(CurrToStr(QryMaxseq.Value)) + 1;
    ClntDtStMasterusr_inc.Value    := FormatDateTime('dd/mm/yyyy', Date) +
                                      FormatDateTime('hh:mm:ss', Time) +
                                      FrmMain.USR_Nome;
  end;
end;

procedure TFrmUsuarioPesq.ClntDtStMasterBeforePost(DataSet: TDataSet);
var
  sSql: String;
begin

  FrmLogin.conWebMaster.Connected := False;
  FrmLogin.conWebMaster.Connected := True;
  
  //Update;
  if ClntDtStMaster.State in[dsEdit] then
   begin
     ClntDtStMasterusr_alt.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                    FormatDateTime('hh:mm:ss', Time) +
                                    FrmMain.USR_Nome;
     with QryUpdate do
     begin
       sSql := SQL.Text;
       SQL.Clear;
       SQL.Add('update sys_usuario a set');
       SQL.Add('   a.usr_nome = '   + QuotedStr(ClntDtStMasterusr_nome.Value));
       SQL.Add('  ,a.usr_nivel = '  + QuotedStr(IntToStr(ClntDtStMasterusr_nivel.Value)));
       SQL.Add('  ,a.usr_status = ' + QuotedStr(IntToStr(ClntDtStMasterusr_status.Value)));
       SQL.Add('  ,a.usr_senha = '  + QuotedStr(ClntDtStMasterusr_senha.Value));
       SQL.Add('  ,a.usr_alt  = '   + QuotedStr(ClntDtStMasterusr_alt.Value));
       SQL.Add('   where a.usr_codigo = ' + FormatFloat('000000', ClntDtStMasterusr_codigo.Value));
       if Not Application.MessageBox('Deseja Realmente Alterar os Dados?', 'Confirmação', MB_OKCANCEL+MB_ICONQUESTION) = ID_OK then Exit;
       ExecSQL(True);
       SQL.Text := sSql;
     end;
   end;

   // Insert
   if ClntDtStMaster.State in[dsInsert] then
    begin
      ClntDtStMasterusr_inc.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                     FormatDateTime('hh:mm:ss', Time) +
                                     FrmMain.USR_Nome;
      with QryInsert do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('insert into sys_usuario');
        SQL.Add(' (usr_codigo, usr_nome, usr_nivel, usr_status, usr_senha, usr_inc, usr_alt) ');
        SQL.Add(' values ( ' );
        SQL.Add(FormatFloat('000000', ClntDtStMasterusr_codigo.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterusr_nome.Value) + ', ');
        SQL.Add(FormatFloat('0', ClntDtStMasterusr_nivel.Value) + ', ');
        SQL.Add(FormatFloat('0', ClntDtStMasterusr_status.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterusr_senha.Value) + ', ');        
        SQL.Add(QuotedStr(ClntDtStMasterusr_inc.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterusr_alt.Value));
        SQL.Add(')');
        ExecSQL(True);
        SQL.Text := sSql;
        Application.MessageBox('Dados Incluídos Com Sucesso !!!', 'Confirmação', MB_OK);
      end;
    end;
end;

procedure TFrmUsuarioPesq.btnPesquisarClick(Sender: TObject);
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

procedure TFrmUsuarioPesq.ClntDtStMasterBeforeDelete(DataSet: TDataSet);
var
  sSQL :String;
begin
  FrmLogin.GR_Refresh;
  with QryDelete do
    begin
      sSql := SQL.Text;
      SQL.Clear;
      SQL.Add('delete from sys_usuario ');
      SQL.Add(' where usr_codigo = ' + FormatFloat('000000', ClntDtStMasterusr_codigo.Value));
      ExecSQL(True);
      SQL.Text := sSql;
    end;
end;

procedure TFrmUsuarioPesq.btnNovoClick(Sender: TObject);
begin   
  FrmLogin.GR_Refresh;
  FrmUsuario := TFrmUsuario.Create(Application);
  with FrmUsuario do
  begin
    ClntDtStMaster.Append;
    ShowModal;
    Free;
  end;
end;

procedure TFrmUsuarioPesq.btnEditarClick(Sender: TObject);
begin
  FrmLogin.GR_Refresh;
  FrmUsuario := TFrmUsuario.Create(Application);
  with FrmUsuario do
  begin
    ShowModal;
    Free;
  end;
end;

end.
