unit iMnyCaixaEnc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxDBLookupComboBox, cxContainer,
  cxLabel, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  FMTBcd, SqlExpr, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  frxClass, frxDBSet, DBClient, Provider, cxImageComboBox;

type
  TFrmCaixaEnc = class(TForm)
    DbGrd: TcxGrid;
    DbGridDBTblVw: TcxGridDBTableView;
    DbGridDBTblVwccr_codigo: TcxGridDBColumn;
    DbGridDBTblVwcax_saldo: TcxGridDBColumn;
    DbGridLvl: TcxGridLevel;
    cxLabel1: TcxLabel;
    QryRCaixaItem: TSQLQuery;
    btnImprimir: TcxButton;
    FrMaster: TfrxReport;
    FrDtStRCaixaItem: TfrxDBDataset;
    QryContaDesc: TSQLQuery;
    QryContaDescccr_codigo: TSmallintField;
    QryContaDescccr_nome: TStringField;
    QryRCaixaItemcax_desc: TStringField;
    QryRCaixaItemcax_item: TBCDField;
    QryRCaixaItemcax_dce: TStringField;
    QryRCaixaItemcax_historico: TStringField;
    QryRCaixaItemcax_credito: TFMTBCDField;
    QryRCaixaItemcax_debito: TFMTBCDField;
    QryRCaixaItemcax_estorno: TFMTBCDField;
    QryRCaixaItemcax_valor: TFMTBCDField;
    DtStPrvdrMaster: TDataSetProvider;
    CltDtStMaster: TClientDataSet;
    CltDtStMastercax_desc: TStringField;
    CltDtStMastercax_item: TBCDField;
    CltDtStMastercax_dce: TStringField;
    CltDtStMastercax_historico: TStringField;
    CltDtStMastercax_credito: TFMTBCDField;
    CltDtStMastercax_debito: TFMTBCDField;
    CltDtStMastercax_estorno: TFMTBCDField;
    CltDtStMastercax_valor: TFMTBCDField;
    QryRCaixaItemcax_transf: TFMTBCDField;
    CltDtStMastercax_transf: TFMTBCDField;
    DbGridDBTblVwcax_tipo: TcxGridDBColumn;
    QryResumo: TSQLQuery;
    QryResumocax_tipo: TStringField;
    QryResumocax_desc: TStringField;
    QryResumosumacax_saldo: TFMTBCDField;
    QryRCaixaItemcax_favorecido: TStringField;
    CltDtStMastercax_favorecido: TStringField;
    QrySaldo: TSQLQuery;
    btnEncerra: TcxButton;
    procedure btnImprimirClick(Sender: TObject);
    procedure FrMasterGetValue(const VarName: String; var Value: Variant);
    procedure btnEncerraClick(Sender: TObject);
  private
    { Private declarations }
    cSaldo, cCredito, cDebito, cEstorno, cSaldoFinal, cTransf :Currency;
    sTipo :String;
    cTotSaldo, cTotTransf, cTotCredito, cTotDebito, cTotEstorno :Currency;
  public
    { Public declarations }
  end;

var
  FrmCaixaEnc: TFrmCaixaEnc;

implementation

uses iMnyCaixa, KeyLogin, KeyMain;

{$R *.dfm}

procedure TFrmCaixaEnc.btnImprimirClick(Sender: TObject);
begin
  with QryContaDesc do
  begin
    Close;
    Params.ParamByName('ccr_codigo').AsInteger := FrmCaixa.ClntDtStCaixaContaccr_codigo.Value;
    Open;
  end;

  with QryRCaixaItem do
  begin
    Close;
    Params.ParamByName('cax_num').AsInteger := FrmCaixa.ClntDtStCaixaContacax_num.Value;
    Params.ParamByName('ccr_codigo').AsInteger := FrmCaixa.ClntDtStCaixaContaccr_codigo.Value;
    Open;

    First;
    cSaldo := FrmCaixa.ClntDtStCaixaContacax_saldo.AsCurrency;
    cCredito := 0;
    cDebito := 0;
    cSaldoFinal := 0;

    QryRCaixaItem.First;
    while Not Eof do
    begin
      if QryRCaixaItemcax_dce.Value = 'C' then
        begin
          cCredito := cCredito + QryRCaixaItemcax_credito.AsCurrency;
        end;
      if QryRCaixaItemcax_dce.Value = 'D' then
        begin
          cDebito := cDebito + QryRCaixaItemcax_debito.AsCurrency;
        end;
      if QryRCaixaItemcax_dce.Value = 'E' then
        begin
          cEstorno := cEstorno + QryRCaixaItemcax_estorno.AsCurrency;
        end;
      if QryRCaixaItemcax_dce.Value = 'T' then
        begin
          cTransf := cTransf + QryRCaixaItemcax_transf.AsCurrency;
        end;

      Next;
    end;
    cSaldoFinal := cSaldo + cTransf + cCredito - cDebito + cEstorno;
    cDebito := cDebito * (-1);

  end;

  with QryResumo do
  begin
    Close;
    ParamByName('cax_num').AsInteger := FrmCaixa.ClntDtStCaixaContacax_num.Value;
    Open;
    First;
    while not Eof do
    begin
      if QryResumocax_tipo.Value = 'S' then cTotSaldo   := QryResumosumacax_saldo.AsCurrency;
      if QryResumocax_tipo.Value = 'T' then cTotTransf  := QryResumosumacax_saldo.AsCurrency;
      if QryResumocax_tipo.Value = 'C' then cTotCredito := QryResumosumacax_saldo.AsCurrency;
      if QryResumocax_tipo.Value = 'D' then cTotDebito  := QryResumosumacax_saldo.AsCurrency;
      if QryResumocax_tipo.Value = 'E' then cTotEstorno := QryResumosumacax_saldo.AsCurrency;
      Next;
    end;
  end;

  cTotSaldo := cTotSaldo + cTotTransf;
  cTotSaldo := cTotSaldo - cTotDebito;
  cTotDebito := cTotDebito * (-1);

  with QrySaldo do
  begin
    QrySaldo.Close;
    QrySaldo.SQL.Clear;
    QrySaldo.SQL.Add('update mny_caixa a set');

    QrySaldo.SQL.Add('   a.cax_credito  =  '  + StringReplace(FormatFloat('######00.00', cTotCredito),',','.',[rfReplaceAll]) );
    QrySaldo.SQL.Add('   ,a.cax_debito   =  '  + StringReplace(FormatFloat('######00.00', cTotDebito),',','.',[rfReplaceAll]) );
    QrySaldo.SQL.Add('   ,a.cax_estorno  =  '  + StringReplace(FormatFloat('######00.00', cTotEstorno),',','.',[rfReplaceAll]) );
    QrySaldo.SQL.Add('   ,a.cax_transf   =  '  + StringReplace(FormatFloat('######00.00', cTotTransf),',','.',[rfReplaceAll]) );
    QrySaldo.SQL.Add('   ,a.cax_saldo    =  '  + StringReplace(FormatFloat('######00.00', cTotSaldo),',','.',[rfReplaceAll]) );

    QrySaldo.SQL.Add('   where a.cax_num = '   + FormatFloat('000000', FrmCaixa.ClntDtStMastercax_num.Value));
    QrySaldo.ExecSQL(True);
    Application.MessageBox('Saldos Gerados Com Sucesso !!!', 'Confirmação', MB_OK+MB_ICONINFORMATION);
  end;

  if FrMaster.PrepareReport then FrMaster.ShowPreparedReport;

end;

procedure TFrmCaixaEnc.FrMasterGetValue(const VarName: String;
  var Value: Variant);
begin

  sTipo := DbGridDBTblVw.Items[2].EditValue;

  if VarName = 'sUsuario'    then Value := FrmMain.USR_Nome;
  if VarName = 'sData'       then Value := FormatDateTime('dd/mm/yyyy', Date);
  if VarName = 'sHora'       then Value := FormatDateTime('hh:mm:ss', Time);
  if VarName = 'sUnidade'    then Value := FrmCaixa.DbLkpCmbBxUNegocio.EditText;

  if Varname = 'sTipo' then
    begin
      if sTipo = 'P'         then Value := 'PAGADORA';
      if sTipo = 'R'         then Value := 'RECEBEDORA';
    end;

  if VarName = 'sSaldo'      then Value      := FormatFloat('#,###,##0.00', cSaldo);
  if VarName = 'sCredito'    then Value    := FormatFloat('#,###,##0.00', cCredito);
  if VarName = 'sDebito'     then Value     := FormatFloat('#,###,##0.00', cDebito);
  if VarName = 'sSaldoFinal' then Value := FormatFloat('#,###,##0.00', cSaldoFinal);

  if VarName = 'cTotSaldo'   then Value := FormatFloat('#,###,##0.00', cTotSaldo);
  if VarName = 'cTotDebito'  then Value := FormatFloat('#,###,##0.00', cTotDebito);

  if VarName = 'sConta'      then Value := QryContaDescccr_nome.Value;
  if VarName = 'dDataCaixa'  then Value := FrmCaixa.ClntDtStMastercax_data.Value;

end;

procedure TFrmCaixaEnc.btnEncerraClick(Sender: TObject);
Var
  sSQL : String;
begin
  if Application.MessageBox('Deseja Realmente Encerrar Esse Caixa?', 'Atenção', MB_OKCANCEL+MB_ICONWARNING) <> ID_OK then
    Abort;

  with FrmCaixa do
  begin
    //Update;
    with QryTransaction do
    begin
      sSql := SQL.Text;
      SQL.Clear;
      SQL.Add('update mny_caixa a set');

      SQL.Add('   a.cax_status = 1 ');

      SQL.Add('   where a.cax_num = ' + CurrToStr(ClntDtStMastercax_num.Value));
      
      Application.MessageBox('Caixa Atualizado Com Sucesso?', 'Confirmação', MB_OKCANCEL+MB_ICONQUESTION);
      ExecSQL(True);
      SQL.Text := sSql;
    end;
  end;

end;

end.
