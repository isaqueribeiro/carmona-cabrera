unit iMnySetorPesq;

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
  TFrmSetorPesq = class(TForm)
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
    QryMasterset_codigo: TSmallintField;
    QryMasterset_nome: TStringField;
    QryMasterset_gerente: TStringField;
    QryMasterset_inc: TStringField;
    QryMasterset_alt: TStringField;
    ClntDtStMasterset_codigo: TSmallintField;
    ClntDtStMasterset_nome: TStringField;
    ClntDtStMasterset_gerente: TStringField;
    ClntDtStMasterset_inc: TStringField;
    ClntDtStMasterset_alt: TStringField;
    DbGridDBTblVwset_codigo: TcxGridDBColumn;
    DbGridDBTblVwset_nome: TcxGridDBColumn;
    DbGridDBTblVwset_gerente: TcxGridDBColumn;
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
    procedure ClntDtStMasterAfterPost(DataSet: TDataSet);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FrmSetorPesq: TFrmSetorPesq;

implementation

uses KeyResource, KeyMain, KeyLogin, KeyUsuario;

{$R *.dfm}

procedure TFrmSetorPesq.FormShow(Sender: TObject);
begin
  ClntDtStMaster.Close;
  QryMaster.Close;
  QryMaster.Params.ParamByName('nome').AsString := '%';
  QryMaster.Open;
  ClntDtStMaster.Open;
  EdtPesquisar.SetFocus;
end;

procedure TFrmSetorPesq.ActnIncExecute(Sender: TObject);
begin
  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMasterset_inc.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmSetorPesq.ActnAltExecute(Sender: TObject);
begin
  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMasterset_alt.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmSetorPesq.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSetorPesq.ClntDtStMasterNewRecord(DataSet: TDataSet);
begin
  FrmLogin.GR_Refresh;
  with QryMax do
  begin
    Close;
    Open;
    ClntDtStMasterset_codigo.Value := StrToInt(CurrToStr(QryMaxseq.Value)) + 1;
    ClntDtStMasterset_inc.Value    := FormatDateTime('dd/mm/yyyy', Date) +
                                      FormatDateTime('hh:mm:ss', Time) +
                                      FrmMain.USR_Nome;
  end;
end;

procedure TFrmSetorPesq.ClntDtStMasterBeforePost(DataSet: TDataSet);
var
  sSql: String;
begin
   FrmLogin.GR_Refresh;
   //Update;
   if ClntDtStMaster.State in[dsEdit] then
    begin
      ClntDtStMasterset_alt.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                     FormatDateTime('hh:mm:ss', Time) +
                                     FrmMain.USR_Nome;
      with QryTransaction do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('update mny_setor a set');
        SQL.Add('   a.set_nome = '      + QuotedStr(ClntDtStMasterset_nome.Value));
        SQL.Add('  ,a.set_gerente = '   + QuotedStr(ClntDtStMasterset_gerente.Value));
        SQL.Add('  ,a.set_alt  = '      + QuotedStr(ClntDtStMasterset_alt.Value));
        SQL.Add('   where a.set_codigo = ' + FormatFloat('000000', ClntDtStMasterset_codigo.Value));
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
      ClntDtStMasterset_inc.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                     FormatDateTime('hh:mm:ss', Time) +
                                     FrmMain.USR_Nome;
      with QryTransaction do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('insert into mny_setor');
        SQL.Add(' (set_codigo, set_nome, set_gerente, set_inc, set_alt) ');
        SQL.Add(' values ( ' );
        SQL.Add(FormatFloat('000000', ClntDtStMasterset_codigo.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterset_nome.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterset_gerente.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterset_inc.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterset_alt.Value));
        SQL.Add(')');
//        sSql := SQl.Text;
//        ShowMessage(pchar(ssql));
        ExecSQL(True);
        SQL.Text := sSql;
        Application.MessageBox('Dados Incluídos Com Sucesso !!!', 'Confirmação', MB_OK);
      end;
    end;
end;

procedure TFrmSetorPesq.btnPesquisarClick(Sender: TObject);
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

procedure TFrmSetorPesq.ClntDtStMasterBeforeDelete(DataSet: TDataSet);
var
  sSQL :String;
begin
  FrmLogin.GR_Refresh;
  with QryTransaction do
    begin
      sSql := SQL.Text;
      SQL.Clear;
      SQL.Add('delete from mny_setor ');
      SQL.Add(' where set_codigo = ' + FormatFloat('000000', ClntDtStMasterset_codigo.Value));
      ExecSQL(True);
      SQL.Text := sSql;
    end;
end;

procedure TFrmSetorPesq.btnNovoClick(Sender: TObject);
begin
  ClntDtStMaster.Append;
end;

procedure TFrmSetorPesq.btnEditarClick(Sender: TObject);
begin
  ClntDtStMaster.Post;
end;

procedure TFrmSetorPesq.ClntDtStMasterAfterPost(DataSet: TDataSet);
var
  SQL : TStringList;
begin
  SQL := TStringList.Create;
  try
    SQL.BeginUpdate;
    SQL.Add('Insert Into str_material_setor (mat_codigo, mat_setor, mat_setor_requisita)');
    SQL.Add('Select');
    SQL.Add('    m.mat_codigo');
    SQL.Add('  , ' + ClntDtStMasterset_codigo.AsString + ' as mat_setor ');
    SQL.Add('  , 1 as mat_setor_requisita');
    SQL.Add('from str_material m');
    SQL.Add('  left join str_material_setor ms on (ms.mat_codigo = m.mat_codigo and ms.mat_setor = ' + ClntDtStMasterset_codigo.AsString + ')');
    SQL.Add('where ms.mat_codigo is null');
    SQL.Add('  and ms.mat_setor  is null');
    SQL.EndUpdate;

    FrmLogin.conWebMaster.ExecuteDirect( SQL.Text );
  finally
    SQL.Free;
  end;
end;

end.
