unit iMnyCaixa;

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
  FMTBcd, SqlExpr, DBClient, Provider, cxLabel, cxSpinEdit, cxTimeEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxButtonEdit, cxLookupEdit,
  cxDBLookupEdit;

type
  TFrmCaixa = class(TForm)
    DtSMaster: TDataSource;
    PgCtrlMain: TcxPageControl;
    TbShtPrincipal: TcxTabSheet;
    QryMaster: TSQLQuery;
    DtStPvdMaster: TDataSetProvider;
    ClntDtStMaster: TClientDataSet;
    QryMax: TSQLQuery;
    QryTransaction: TSQLQuery;
    QryMaxseq: TBCDField;
    QryConta: TSQLQuery;
    DtSConta: TDataSource;
    QryMastercax_num: TIntegerField;
    QryMastercax_data: TDateField;
    QryMastercax_hora: TTimeField;
    QryMastercax_usuario: TStringField;
    ClntDtStMastercax_num: TIntegerField;
    ClntDtStMastercax_data: TDateField;
    ClntDtStMastercax_hora: TTimeField;
    ClntDtStMastercax_usuario: TStringField;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    btnNovo: TcxButton;
    PnlMain: TPanel;
    btnFechar: TcxButton;
    btnEditar: TcxButton;
    btnEncerrar: TcxButton;
    cxLabel4: TcxLabel;
    DbEdtUsuario: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    DbEdtCodigo: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    DbEdtData: TcxDBDateEdit;
    DbEdtHora: TcxDBTimeEdit;
    QryCaixaConta: TSQLQuery;
    ClntDtStCaixaConta: TClientDataSet;
    DtStPvdCaixaConta: TDataSetProvider;
    QryCaixaContacax_num: TIntegerField;
    QryCaixaContaccr_codigo: TSmallintField;
    ClntDtStCaixaContacax_num: TIntegerField;
    ClntDtStCaixaContaccr_codigo: TSmallintField;
    DbGrd: TcxGrid;
    DbGridDBTblVw: TcxGridDBTableView;
    DbGridLvl: TcxGridLevel;
    Shape1: TShape;
    Label1: TLabel;
    DtSCaixaConta: TDataSource;
    DbGridDBTblVwccr_codigo: TcxGridDBColumn;
    DbGridDBTblVwcax_saldo: TcxGridDBColumn;
    QryCaixaContacax_saldo: TFMTBCDField;
    ClntDtStCaixaContacax_saldo: TFMTBCDField;
    QryItem: TSQLQuery;
    DtSItem: TDataSource;
    ClntDtStItem: TClientDataSet;
    DtStPvdItem: TDataSetProvider;
    QryItemcax_num: TIntegerField;
    QryItemcax_seq: TSmallintField;
    QryItemcax_dce: TStringField;
    QryItemmov_codigo: TIntegerField;
    QryItemmov_item: TSmallintField;
    QryItemccr_codigo: TSmallintField;
    QryItemcax_favorecido: TStringField;
    QryItemcax_historico: TStringField;
    QryItemcax_valor: TFMTBCDField;
    ClntDtStItemcax_num: TIntegerField;
    ClntDtStItemcax_seq: TSmallintField;
    ClntDtStItemcax_dce: TStringField;
    ClntDtStItemmov_codigo: TIntegerField;
    ClntDtStItemmov_item: TSmallintField;
    ClntDtStItemccr_codigo: TSmallintField;
    ClntDtStItemcax_favorecido: TStringField;
    ClntDtStItemcax_historico: TStringField;
    ClntDtStItemcax_valor: TFMTBCDField;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1cax_seq: TcxGridDBColumn;
    cxGridDBTableView1cax_dce: TcxGridDBColumn;
    cxGridDBTableView1ccr_codigo: TcxGridDBColumn;
    cxGridDBTableView1cax_favorecido: TcxGridDBColumn;
    cxGridDBTableView1cax_historico: TcxGridDBColumn;
    cxGridDBTableView1cax_valor: TcxGridDBColumn;
    QryItemMax: TSQLQuery;
    QryItemMaxseq: TBCDField;
    cxGridDBTableView1mov_codigo: TcxGridDBColumn;
    cxGridDBTableView1mov_item: TcxGridDBColumn;
    QryMov: TSQLQuery;
    QryMovmov_codigo: TIntegerField;
    QryMovmov_item: TSmallintField;
    QryMovpes_razao_social: TStringField;
    QryMovmov_obs: TStringField;
    btnConecta: TcxButton;
    TmrConecta: TTimer;
    cxLabel5: TcxLabel;
    QryUnidade: TSQLQuery;
    QryUnidadeuni_codigo: TSmallintField;
    QryUnidadeuni_nome: TStringField;
    DtSUnidade: TDataSource;
    DbLkpCmbBxUNegocio: TcxDBLookupComboBox;
    QryMastercax_status: TSmallintField;
    QryMasteruni_codigo: TSmallintField;
    ClntDtStMastercax_status: TSmallintField;
    ClntDtStMasteruni_codigo: TSmallintField;
    QryMovmov_valor_pagar: TFMTBCDField;
    QryCaixaContacax_tipo: TStringField;
    ClntDtStCaixaContacax_tipo: TStringField;
    DbGridDBTblVwcax_tipo: TcxGridDBColumn;
    QryContaccr_codigo: TSmallintField;
    QryContaccr_nome: TStringField;
    sp_mny_saldo_dia: TSQLStoredProc;
    QrySaldo: TSQLQuery;
    QryItemcax_imp: TSmallintField;
    ClntDtStItemcax_imp: TSmallintField;
    cxGridDBTableView1cax_imp: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure ClntDtStMasterNewRecord(DataSet: TDataSet);
    procedure ClntDtStMasterBeforePost(DataSet: TDataSet);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure ClntDtStCaixaContaBeforePost(DataSet: TDataSet);
    procedure ClntDtStCaixaContaNewRecord(DataSet: TDataSet);
    procedure ClntDtStItemNewRecord(DataSet: TDataSet);
    procedure cxGridDBTableView1cax_favorecidoPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure ClntDtStItemBeforePost(DataSet: TDataSet);
    procedure btnEncerrarClick(Sender: TObject);
    procedure ClntDtStItemmov_itemValidate(Sender: TField);
    procedure btnConectaClick(Sender: TObject);
    procedure TmrConectaTimer(Sender: TObject);
    procedure ClntDtStItemBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    procedure CAX_Refresh;

  public
    { Public declarations }
    iClose: Integer;
  end;

var
  FrmCaixa: TFrmCaixa;

implementation

uses KeyResource, KeyMain, KeyLogin, KeyUsuario, iMnyContaPRPesq,
  iMnyCaixaEnc, iMnyCaixaData;

{$R *.dfm}

procedure TFrmCaixa.FormShow(Sender: TObject);
Var
  iNumero :Integer;
begin

  QryUnidade.Close;
  QryUnidade.Open;

  iClose := 0;

  FrmCaixaData := TFrmCaixaData.Create(Application);
  with FrmCaixaData do
  begin
    ShowModal;
    iNumero := FrmCaixaData.ClntDtStMastercax_num.Value;
  end;

  if iClose = 1 then // Sair do Caixa
    begin
      Application.MessageBox('Nenhum Caixa Selecionado !!!', 'Visualizar Caixa', MB_OK+MB_ICONINFORMATION);
      Abort;
    end;

  ClntDtStMaster.Close;
  QryMaster.Close;
  QryMaster.Params.ParamByName('numero').AsInteger := iNumero;
  QryMaster.Open;

  if QryMaster.IsEmpty then
    Begin
      Application.MessageBox('Não Existe Caixa Para Essa Data, Favor Abrir Caixa !!!', 'Abertura de Caixa', MB_OK+MB_ICONINFORMATION);
    End;

  ClntDtStMaster.Open;

  QryConta.Open;
  
  //*** Contas
  ClntDtStCaixaConta.Close;
  QryCaixaConta.Close;
  QryCaixaConta.Params.ParamByName('cax_num').AsInteger := ClntDtStMastercax_num.Value;
  QryCaixaConta.Open;
  ClntDtStCaixaConta.Open;

  //*** Pagamentos
  ClntDtStItem.Close;
  QryItem.Close;
  QryItem.Params.ParamByName('cax_num').AsInteger := ClntDtStMastercax_num.Value;
  QryItem.Open;
  ClntDtStItem.Open;
end;

procedure TFrmCaixa.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCaixa.ClntDtStMasterNewRecord(DataSet: TDataSet);
begin
  FrmLogin.GR_Refresh;
  CAX_Refresh;
  with QryMax do
  begin
    Close;
    Open;
    ClntDtStMastercax_num.Value := StrToInt(CurrToStr(QryMaxseq.Value)) + 1;
    ClntDtStMastercax_usuario.Value := FrmMain.USR_Nome;
    ClntDtStMastercax_data.Value := Date;
    ClntDtStMastercax_hora.Value := Time;
    ClntDtStMastercax_status.Value := 0;
    ClntDtStMasteruni_codigo.Value := 1;
  end;
end;

procedure TFrmCaixa.ClntDtStMasterBeforePost(DataSet: TDataSet);
var
  sSql: String;
begin
//   if iClose = 2 then Abort;

   FrmLogin.GR_Refresh;
   CAX_Refresh;
   // Insert
   if ClntDtStMaster.State in[dsInsert] then
     begin
       with QryTransaction do
       begin
         sSql := SQL.Text;
         SQL.Clear;
         SQL.Add('insert into mny_caixa ');
         SQL.Add(' (cax_num, cax_data, cax_hora, cax_usuario, cax_status, uni_codigo) ');
         SQL.Add(' values ( ' );
         SQL.Add(FormatFloat('000000', ClntDtStMastercax_num.Value) + ', ');
         SQL.Add(QuotedStr(FormatDateTime('yyyy-mm-dd', ClntDtStMastercax_data.Value)) + ', ');
         SQL.Add(QuotedStr(FormatDateTime('hh:mm:ss', ClntDtStMastercax_hora.Value)) + ', ');
         SQL.Add(QuotedStr(ClntDtStMastercax_usuario.Value) + ', ');
         SQL.Add(FormatFloat('0', ClntDtStMastercax_status.Value) + ', ');
         SQL.Add(FormatFloat('00', ClntDtStMasteruni_codigo.Value));
         SQL.Add(' )');
         ExecSQL(True);
         SQL.Text := sSql;
         Application.MessageBox('Dados Incluídos Com Sucesso !!!', 'Confirmação', MB_OK);
       end;
     end;

   //Update;
   if ClntDtStMaster.State in[dsEdit] then
    begin
      with QryTransaction do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('update mny_caixa a set');

        SQL.Add('   a.cax_data = '    + QuotedStr(FormatDateTime('yyyy-mm-dd', ClntDtStMastercax_data.Value)) + ', ');
        SQL.Add('   a.cax_hora = '    + QuotedStr(FormatDateTime('hh:mm:ss', ClntDtStMastercax_hora.Value)) + ', ');
        SQL.Add('   a.uni_codigo = '  + FormatFloat('00', ClntDtStMasteruni_codigo.Value));

        SQL.Add('   where a.cax_num = ' + CurrToStr(ClntDtStMastercax_num.Value));
        if Not Application.MessageBox('Deseja Realmente Alterar os Dados?', 'Confirmação', MB_OKCANCEL+MB_ICONQUESTION) = ID_OK then Exit;
        ExecSQL(True);
        SQL.Text := sSql;
      end;
    end;
end;

procedure TFrmCaixa.btnNovoClick(Sender: TObject);
begin
  ClntDtStMaster.Append;
end;

procedure TFrmCaixa.btnEditarClick(Sender: TObject);
begin
  ClntDtStMaster.Post;
end;

procedure TFrmCaixa.ClntDtStCaixaContaBeforePost(DataSet: TDataSet);
var
  sSql :String;
begin
//   if iClose = 2 then Abort;

   FrmLogin.GR_Refresh;
   CAX_Refresh;
   // Insert
   if ClntDtStCaixaConta.State in[dsInsert] then
     begin
       with QryTransaction do
       begin
         sSql := SQL.Text;
         SQL.Clear;
         SQL.Add('insert into mny_caixa_conta ');
         SQL.Add(' (cax_num, ccr_codigo, cax_tipo, cax_saldo) ');
         SQL.Add(' values ( ' );
         SQL.Add(FormatFloat('000000', ClntDtStCaixaContacax_num.Value) + ', ');
         SQL.Add(FormatFloat('000', ClntDtStCaixaContaccr_codigo.Value) + ', ');
         SQL.Add(QuotedStr(ClntDtStCaixaContacax_tipo.Value) + ', ');
         SQL.Add(StringReplace(FormatFloat('######00.00', ClntDtStCaixaConta.FieldByName('cax_saldo').AsCurrency),',','.',[rfReplaceAll]) );
         SQL.Add(' )');
         ExecSQL(True);
         SQL.Text := sSql;
         Application.MessageBox('Dados Incluídos Com Sucesso !!!', 'Confirmação', MB_OK);
       end;
     end;

   //Update;
   if ClntDtStCaixaConta.State in[dsEdit] then
    begin
      with QryTransaction do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('update mny_caixa_conta a set');

        SQL.Add('   a.ccr_codigo = '    + FormatFloat('000', ClntDtStCaixaContaccr_codigo.Value) + ', ');
        SQL.Add('   a.cax_tipo =   '    + QuotedStr(ClntDtStCaixaContacax_tipo.Value) + ', ');
        SQL.Add('   a.cax_saldo = '     + StringReplace(FormatFloat('######00.00', ClntDtStCaixaConta.FieldByName('cax_saldo').AsCurrency),',','.',[rfReplaceAll]));

        SQL.Add('   where a.cax_num = ' + CurrToStr(ClntDtStMastercax_num.Value));
        SQL.Add('   and a.ccr_codigo = ' + FormatFloat('000', ClntDtStCaixaContaccr_codigo.Value));
//        showmessage(pchar(sql.Text));
        if Not Application.MessageBox('Deseja Realmente Alterar os Dados?', 'Confirmação', MB_OKCANCEL+MB_ICONQUESTION) = ID_OK then Exit;
        ExecSQL(True);
        SQL.Text := sSql;
      end;
    end;
end;

procedure TFrmCaixa.ClntDtStCaixaContaNewRecord(DataSet: TDataSet);
begin
  ClntDtStCaixaContacax_num.Value := ClntDtStMastercax_num.Value;
  ClntDtStCaixaContacax_tipo.Value := 'P';
end;

procedure TFrmCaixa.CAX_Refresh;
begin
  QryMaster.Close;
  QryMaster.Open;
  QryCaixaConta.Close;
  QryCaixaConta.Open;
  ClntDtStCaixaConta.Open;
  QryConta.Close;
  QryConta.Open;
  QryUnidade.Close;
  QryUnidade.Open;
end;

procedure TFrmCaixa.ClntDtStItemNewRecord(DataSet: TDataSet);
begin
  FrmLogin.GR_Refresh;
  CAX_Refresh;
  with QryItemMax do
  begin
    Close;
    Params.ParamByName('cax_num').AsInteger := ClntDtStMastercax_num.Value;
    Open;

    ClntDtStItemcax_num.Value := ClntDtStMastercax_num.Value;
    ClntDtStItemcax_seq.Value :=  StrToInt(CurrToStr(QryItemMaxseq.Value)) + 1;
    ClntDtStItemcax_imp.Value :=  StrToInt(CurrToStr(QryItemMaxseq.Value)) + 1;
    ClntDtStItemcax_dce.Value := 'D';
  end;

end;

procedure TFrmCaixa.cxGridDBTableView1cax_favorecidoPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  FrmContaPRPesq := TFrmContaPRPesq.Create(Application);
  with FrmContaPRPesq do
  begin
    sCaixa := 'S';
    FrmContaPRPesq.EdtDataInicial.Date := ClntDtStMastercax_data.Value;
    FrmContaPRPesq.EdtDataFinal.Date := ClntDtStMastercax_data.Value;

    ShowModal;
    CAX_Refresh;

    ClntDtStItemmov_codigo.Value     := FrmContaPRPesq.ClntDtStMastermov_codigo.Value;
    ClntDtStItemmov_item.Value       := FrmContaPRPesq.ClntDtStMastermov_item.Value;
    ClntDtStItemcax_favorecido.Value := FrmContaPRPesq.ClntDtStMasterpes_razao_social.Value;
    ClntDtStItemcax_historico.Value  := FrmContaPRPesq.ClntDtStMastermov_obs.Value;
    ClntDtStItemcax_valor.Value      := FrmContaPRPesq.ClntDtStMastermov_pagar.Value;
    Free;
  end;
end;

procedure TFrmCaixa.ClntDtStItemBeforePost(DataSet: TDataSet);
var
  sSql :String;
begin
   if Application.MessageBox('Desja Realmente Pagar Item ?', 'Confirmação', MB_OKCANCEL+MB_ICONWARNING) <> ID_OK Then
     begin
       ClntDtStItem.Close;
       ClntDtStItem.Open;
       Abort;
     end;

   FrmLogin.GR_Refresh;
   CAX_Refresh;
   // Insert
   if ClntDtStItem.State in[dsInsert] then
     begin
       with QryTransaction do
       begin
         sSql := SQL.Text;
         SQL.Clear;
         SQL.Add('insert into mny_caixa_item ');
         SQL.Add(' (cax_num, cax_seq, cax_imp, mov_codigo, mov_item, cax_dce, ccr_codigo, cax_historico, cax_favorecido, cax_valor) ');
         SQL.Add(' values ( ' );
         SQL.Add(FormatFloat('000000', ClntDtStitemcax_num.Value) + ', ');
         SQL.Add(FormatFloat('000', ClntDtStitemcax_seq.Value) + ', ');
         SQL.Add(FormatFloat('000', ClntDtStItemcax_imp.Value) + ', ');         
         SQL.Add(FormatFloat('000000', ClntDtStItemmov_codigo.Value) + ', ');
         SQL.Add(FormatFloat('000', ClntDtStItemmov_item.Value) + ', ');
         SQL.Add(QuotedStr(ClntDtStItemcax_dce.Value) + ', ');
         SQL.Add(FormatFloat('000', ClntDtStitemccr_codigo.Value) + ', ');
         SQL.Add(QuotedStr(ClntDtStItemcax_historico.Value) + ', ');
         SQL.Add(QuotedStr(ClntDtStItemcax_favorecido.Value) + ', ');
         SQL.Add(StringReplace(FormatFloat('######00.00', ClntDtStitem.FieldByName('cax_valor').AsCurrency),',','.',[rfReplaceAll]) );
         SQL.Add(' )');
         ExecSQL(True);
         SQL.Text := sSql;
         Application.MessageBox('Dados Incluídos Com Sucesso !!!', 'Confirmação', MB_OK);

         //*** Dando Baixa
         sSql := SQL.Text;
         SQL.Clear;
         SQL.Add(' update mny_movimento_item a ');
         SQL.Add(' set a.mov_status = 6 ');
         SQL.Add(' where a.mov_codigo  = ');
         SQL.Add(FormatFloat('000000', ClntDtStItemmov_codigo.Value) + ' and a.mov_item = ');
         SQL.Add(FormatFloat('000', ClntDtStItemmov_item.Value));
         ExecSQL(True);
         SQL.Text := sSql;
         Application.MessageBox('Pagamento Baixado !!!', 'Confirmação', MB_OK);
       end;
     end;

   // Insert
   if (ClntDtStItem.State in[dsEdit]) then
     begin
       Application.MessageBox('Não é Permitido Alteração, Excluia o Registro e Lançe Novamente !!!', 'Erro', MB_OK);
       with QryTransaction do
       begin
         sSql := SQL.Text;
         SQL.Clear;
         SQL.Add(' update mny_caixa_item a');
         SQL.Add(' set a.cax_imp = ' + FormatFloat('000', ClntDtStItemcax_imp.Value));
         SQL.Add(' where a.cax_num = ' + FormatFloat('000000', ClntDtStitemcax_num.Value));
         SQL.Add(' and a.cax_seq = ' + FormatFloat('000', ClntDtStitemcax_seq.Value));
         ExecSQL(True);
         SQL.Text := sSql;
       end;
     end;
end;

procedure TFrmCaixa.btnEncerrarClick(Sender: TObject);
begin
  FrmLogin.Refresh;
  CAX_Refresh;
  FrmCaixaEnc := TFrmCaixaEnc.Create(Application);
  with FrmCaixaEnc do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TFrmCaixa.ClntDtStItemmov_itemValidate(Sender: TField);
begin
  with QryMov do
  begin
    Close;
    Params.ParamByName('mov_codigo').AsInteger := ClntDtStItemmov_codigo.Value;
    Params.ParamByName('mov_item').AsInteger := ClntDtStItemmov_item.Value;
    Open;
    if IsEmpty then
      Application.MessageBox('Pagamento Não Encontrado, Pesquise no Campo Favorecido !!!', 'Erro', MB_OK+MB_ICONINFORMATION)
    Else
      Begin
        ClntDtStItemcax_favorecido.Value := QryMovpes_razao_social.Value;
        ClntDtStItemcax_historico.Value  := QryMovmov_obs.Value;
        ClntDtStItemcax_valor.Value      := QryMovmov_valor_pagar.Value
      End;
  end;

end;

procedure TFrmCaixa.btnConectaClick(Sender: TObject);
begin
  FrmLogin.conWebMaster.Connected := False;
  FrmLogin.conWebMaster.Connected := True;
  
  CAX_Refresh;
end;

procedure TFrmCaixa.TmrConectaTimer(Sender: TObject);
begin
  btnConectaClick(Self);
end;

procedure TFrmCaixa.ClntDtStItemBeforeDelete(DataSet: TDataSet);
Var
  sSql :String;
begin
//  if iClose = 2 then Abort;
  
  FrmLogin.GR_Refresh;
  CAX_Refresh;
  with QryTransaction do
    begin
      sSql := SQL.Text;
      SQL.Clear;
      SQL.Add('delete from mny_caixa_item ');
      SQL.Add(' where cax_num = ' + CurrToStr(ClntDtStItemcax_num.Value));
      SQL.Add(' and cax_seq =      ' + CurrToStr(ClntDtStItemcax_seq.Value));
      ExecSQL(True);
      SQL.Text := sSql;
    end;

  //*** Estornando Baixa
  with QryTransaction do
  begin
    sSql := SQL.Text;
    SQL.Clear;
    SQL.Add(' update mny_movimento_item a ');
    SQL.Add(' set a.mov_status = 5 ');
    SQL.Add(' where a.mov_codigo  = ');
    SQL.Add(FormatFloat('000000', ClntDtStItemmov_codigo.Value) + ' and a.mov_item = ');
    SQL.Add(FormatFloat('000', ClntDtStItemmov_item.Value));
    ExecSQL(True);
    SQL.Text := sSql;
    Application.MessageBox('Pagamento Estornado !!!', 'Confirmação', MB_OK);
  End;
end;

end.
