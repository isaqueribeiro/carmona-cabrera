unit iMnyContaPRDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FMTBcd, DBClient, Provider, SqlExpr,
  StdCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ExtCtrls, cxPC, cxButtonEdit, Menus, cxLookAndFeelPainters, cxButtons,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdFTP, ShellApi;

type
  TFrmContaPRDoc = class(TForm)
    PgCtrlMain: TcxPageControl;
    TbShtPrincipal: TcxTabSheet;
    Shape2: TShape;
    DbGrd: TcxGrid;
    DbGridDBTblVw: TcxGridDBTableView;
    DbGridLvl: TcxGridLevel;
    LblDados: TLabel;
    QryDoc: TSQLQuery;
    QryDocmov_codigo: TIntegerField;
    QryDocdoc_seq: TSmallintField;
    QryDocdoc_path: TStringField;
    DtStPrvdr: TDataSetProvider;
    ClntDtStMaster: TClientDataSet;
    ClntDtStMastermov_codigo: TIntegerField;
    ClntDtStMasterdoc_seq: TSmallintField;
    ClntDtStMasterdoc_path: TStringField;
    DtSMaster: TDataSource;
    DbGridDBTblVwdoc_seq: TcxGridDBColumn;
    DbGridDBTblVwdoc_origem: TcxGridDBColumn;
    QryDocdoc_nome: TStringField;
    ClntDtStMasterdoc_nome: TStringField;
    DbGridDBTblVwdoc_nome: TcxGridDBColumn;
    QryMax: TSQLQuery;
    QryMaxseq: TBCDField;
    QryTransaction: TSQLQuery;
    OpnDlgOrigem: TOpenDialog;
    QryDocdoc_origem: TStringField;
    ClntDtStMasterdoc_origem: TStringField;
    btnDocumento: TcxButton;
    IdFTP1: TIdFTP;
    btnDocumentos: TcxButton;
    procedure ClntDtStMasterNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ClntDtStMasterBeforePost(DataSet: TDataSet);
    procedure DbGridDBTblVwdoc_origemPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnDocumentoClick(Sender: TObject);
    procedure ClntDtStMasterBeforeDelete(DataSet: TDataSet);
    procedure btnDocumentosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmContaPRDoc: TFrmContaPRDoc;

implementation

uses KeyLogin, KeyMain, KeyObjeto, iMnyContaPR;

{$R *.dfm}

procedure TFrmContaPRDoc.ClntDtStMasterNewRecord(DataSet: TDataSet);
begin
  with QryMax do
  begin
    Close;
    QryMax.Params.ParamByName('mov_codigo').AsInteger := FrmContaPR.ClntDtStMastermov_codigo.Value;
    Open;
    ClntDtStMasterdoc_seq.Value := StrToInt(CurrToStr(QryMaxseq.Value)) + 1;
  end;
  ClntDtStMastermov_codigo.Value := FrmContaPR.ClntDtStMastermov_codigo.Value;
end;

procedure TFrmContaPRDoc.FormShow(Sender: TObject);
begin
  ClntDtStMaster.Open;
end;

procedure TFrmContaPRDoc.Button1Click(Sender: TObject);
begin
  ClntDtStMaster.Append;
end;

procedure TFrmContaPRDoc.ClntDtStMasterBeforePost(DataSet: TDataSet);
begin
  FrmLogin.GR_Refresh;
  FrmContaPR.CPR_Refresh;
  //*** Update
  if ClntDtStMaster.State in[dsEdit] then
    begin
      with QryTransaction do
      begin
        SQL.Clear;
        SQL.Add('update mny_movimento_doc a set');

        SQL.Add('    a.doc_path = '   + QuotedStr(ClntDtStMasterdoc_path.Value));
        SQL.Add('   ,a.doc_origem = ' + QuotedStr(ClntDtStMasterdoc_origem.Value));
        SQL.Add('   ,a.doc_nome = '   + QuotedStr(ClntDtStMasterdoc_nome.Value));

        SQL.Add('   where a.mov_codigo = ' + FormatFloat('000000', ClntDtStMastermov_codigo.Value));
        SQL.Add('   and a.doc_seq = '      + FormatFloat('000', ClntDtStMasterdoc_seq.Value));

        if Not Application.MessageBox('Deseja Realmente Alterar os Dados?', 'Confirmação', MB_OKCANCEL+MB_ICONQUESTION) = ID_OK then Exit;
        ExecSQL(True);
      end;
    end;

  //*** Insert
  if ClntDtStMaster.State in[dsInsert] then
    begin
      with QryTransaction do
      begin
        SQL.Clear;

        SQL.Add('insert into mny_movimento_doc');
        SQL.Add(' (mov_codigo, doc_seq, doc_path, doc_origem, doc_nome) ');
        SQL.Add(' values ( ' );

        SQL.Add(FormatFloat('000000', ClntDtStMastermov_codigo.Value) + ', ');
        SQL.Add(FormatFloat('000', ClntDtStMasterdoc_seq.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterdoc_path.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterdoc_origem.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMasterdoc_nome.Value)) ;
        SQL.Add(')');
        ExecSQL(True);
        Application.MessageBox('Dados Incluídos Com Sucesso !!!', 'Confirmação', MB_OK);
      end;
    end;
end;

procedure TFrmContaPRDoc.DbGridDBTblVwdoc_origemPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if OpnDlgOrigem.Execute then
    ClntDtStMasterdoc_origem.Value := OpnDlgOrigem.FileName;
end;

procedure TFrmContaPRDoc.btnDocumentoClick(Sender: TObject);
Var
  sNovo, sString :String;
  F: TextFile;
  SR: TSearchRec;
  I: Integer;
begin

  //*** Excluindo Todos Os Arquivos
  I := FindFirst('C:\Sistemas\iMoney\DOC\*.*', faAnyFile, SR);
  while I = 0 do begin
    if (SR.Attr and faDirectory) <> faDirectory then
      if not DeleteFile('C:\Sistemas\iMoney\DOC\' + SR.Name) then
        ShowMessage('Não consegui excluir C:\Sistemas\iMoney\DOC\' + SR.Name);
    I := FindNext(SR);
  end;

  // Deleteando Arquivo Script;
  DeleteFile('docs.txt');
  AssignFile(f,'C:\Sistemas\iMoney\Docs.txt');
  Rewrite(f);
  Writeln(f,'tkce');
  Writeln(f,'grokka');
  Writeln(f,'cd web');
  Writeln(f,'cd docs');

  with ClntDtStMaster do
  begin
    First;
    while Not Eof do
    begin
      sNovo := FormatFloat('000000', ClntDtStMastermov_codigo.Value) + '-' + FormatFloat('000', ClntDtStMasterdoc_seq.Value);
      sNovo := 'C:\Sistemas\iMoney\DOC\' + sNovo + '.pdf';
      CopyFile(pChar(ClntDtStMasterdoc_origem.Value), pChar(sNovo), True);

      sString := 'send ' +  sNovo;
      Writeln(f,pChar(sString));

      Next;
    end;

    Writeln(f,'quit');
    Closefile(f);
    ShellExecute(0,nil,'C:\Sistemas\iMoney\EnvioDocs.lnk' ,nil, nil, SW_SHOWNORMAL);
    Application.MessageBox('Dados Enviados Com Sucesso !!!', 'Confirmação', MB_OK+MB_ICONINFORMATION);
    
    First;
    while Not Eof do
    begin
      ClntDtStMaster.Edit;
      ClntDtStMasterdoc_origem.Value := 'pdfArquivo';
      ClntDtStMaster.Post;
      Next;
    end;
  end;
end;

procedure TFrmContaPRDoc.ClntDtStMasterBeforeDelete(DataSet: TDataSet);
begin
  FrmLogin.GR_Refresh;
  FrmContaPR.CPR_Refresh;
  with QryTransaction do
    begin
      SQL.Clear;
      SQL.Add('delete from mny_movimento_doc ');
      SQL.Add(' where mov_codigo = ' + CurrToStr(ClntDtStMastermov_codigo.Value));
      SQL.Add(' and doc_seq = ' + CurrToStr(ClntDtStMasterdoc_seq.Value));
      ExecSQL(True);
    end;
end;

procedure TFrmContaPRDoc.btnDocumentosClick(Sender: TObject);
Var
  sPath :String;
begin
  sPath := 'www.tkce.com.br/docs/' + FormatFloat('000000', ClntDtStMastermov_codigo.Value) + '-' + FormatFloat('000', ClntDtStMasterdoc_seq.Value) + '.pdf';
  ShellExecute(Handle,'open',PAnsiChar(sPath),nil,nil,SW_SHOWNORMAL);
end;

end.
