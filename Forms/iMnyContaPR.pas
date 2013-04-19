unit iMnyContaPR;

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
  dxSkinscxPCPainter, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ExtCtrls, cxPC, cxControls, cxGraphics, cxMaskEdit, cxDropDownEdit,
  cxImageComboBox, cxDBEdit, cxLabel, cxContainer, cxEdit, cxTextEdit,
  cxImage, FMTBcd, DB, SqlExpr, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCalendar, Provider, DBClient, cxGroupBox, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid;

type
  TFrmContaPR = class(TForm)
    PgCtrlMain: TcxPageControl;
    TbShtPrincipal: TcxTabSheet;
    PnlMain: TPanel;
    btnFechar: TcxButton;
    btnEditar: TcxButton;
    btnNovo: TcxButton;
    QryTipoAceite: TSQLQuery;
    DtSTipoAceite: TDataSource;
    QryMaster: TSQLQuery;
    ClntDtStMaster: TClientDataSet;
    DtStPvdMaster: TDataSetProvider;
    DtSMaster: TDataSource;
    QryMax: TSQLQuery;
    QryMastercen_codigo: TSmallintField;
    QryMastercom_codigo: TSmallintField;
    QryMastercon_codigo: TSmallintField;
    QryMastercus_codigo: TSmallintField;
    QryMasterneg_codigo: TSmallintField;
    QryMasterpes_codigo: TIntegerField;
    QryMasterset_codigo: TSmallintField;
    QryMastersit_codigo: TSmallintField;
    QryMasteruni_codigo: TSmallintField;
    QryMastermov_data_emissao: TDateField;
    QryMastermov_data_inclusao: TDateField;
    QryMastermov_obs: TStringField;
    QryMastermov_inc: TStringField;
    QryMastermov_alt: TStringField;
    ClntDtStMastercen_codigo: TSmallintField;
    ClntDtStMastercom_codigo: TSmallintField;
    ClntDtStMastercon_codigo: TSmallintField;
    ClntDtStMastercus_codigo: TSmallintField;
    ClntDtStMasterneg_codigo: TSmallintField;
    ClntDtStMasterpes_codigo: TIntegerField;
    ClntDtStMasterset_codigo: TSmallintField;
    ClntDtStMasteruni_codigo: TSmallintField;
    ClntDtStMastermov_data_emissao: TDateField;
    ClntDtStMastermov_data_inclusao: TDateField;
    ClntDtStMastermov_obs: TStringField;
    ClntDtStMastermov_inc: TStringField;
    ClntDtStMastermov_alt: TStringField;
    QryMastermov_contrato: TStringField;
    QryMastertip_ace_codigo: TSmallintField;
    QryPessoa: TSQLQuery;
    DtSPessoa: TDataSource;
    QryPessoapes_codigo: TIntegerField;
    QryPessoapes_nome_fantasia: TStringField;
    ClntDtStMastermov_contrato: TStringField;
    ClntDtStMastertip_ace_codigo: TSmallintField;
    QryComp: TSQLQuery;
    DtSComp: TDataSource;
    QryCompcom_codigo: TSmallintField;
    QryCompcom_nome: TStringField;
    QrySituacao: TSQLQuery;
    DtSSituacao: TDataSource;
    QrySituacaosit_codigo: TSmallintField;
    QrySituacaosit_nome: TStringField;
    QryCentro: TSQLQuery;
    DtSCentro: TDataSource;
    QryConta: TSQLQuery;
    DtSConta: TDataSource;
    QryTCusto: TSQLQuery;
    DtSTCusto: TDataSource;
    QryUnidade: TSQLQuery;
    DtSUnidade: TDataSource;
    QryCNegocio: TSQLQuery;
    DtSCNegocio: TDataSource;
    QrySetor: TSQLQuery;
    DtSSetor: TDataSource;
    QryTCustocus_codigo: TSmallintField;
    QryTCustocus_nome: TStringField;
    QryCNegocioneg_codigo: TSmallintField;
    QryCNegocioneg_nome: TStringField;
    QryUnidadeuni_codigo: TSmallintField;
    QryUnidadeuni_nome: TStringField;
    QryCentrocen_codigo: TSmallintField;
    QryCentrocen_nome: TStringField;
    QrySetorset_codigo: TSmallintField;
    QrySetorset_nome: TStringField;
    QryContacon_codigo: TSmallintField;
    QryContacon_nome: TStringField;
    GrpMain: TcxGroupBox;
    cxLabel1: TcxLabel;
    DbEdtCodigo: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    DbLkpCmbBxAceite: TcxDBLookupComboBox;
    cxLabel4: TcxLabel;
    LkpCmbBxPessoa: TcxDBLookupComboBox;
    btnPessoa: TcxButton;
    cxLabel5: TcxLabel;
    DbEdtEmissao: TcxDBDateEdit;
    cxLabel6: TcxLabel;
    DbEdtContrato: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    DbEdtObs: TcxDBTextEdit;
    cxLabel7: TcxLabel;
    DbLkpCmbBxComp: TcxDBLookupComboBox;
    cxLabel14: TcxLabel;
    LkpCmbBxSituacao: TcxDBLookupComboBox;
    GrpApro: TcxGroupBox;
    btnTCusto: TcxButton;
    DbLkpCmbBxTCusto: TcxDBLookupComboBox;
    cxLabel10: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel9: TcxLabel;
    DbLkpCmbBxConta: TcxDBLookupComboBox;
    DbLkpCmbBxSetor: TcxDBLookupComboBox;
    DbLkpCmbBxCCusto: TcxDBLookupComboBox;
    DbLkpCmbBxUNegocio: TcxDBLookupComboBox;
    DbLkpCmbBxCNegocio: TcxDBLookupComboBox;
    btnCNegocio: TcxButton;
    btnUnidade: TcxButton;
    btnCentro: TcxButton;
    btnSetor: TcxButton;
    btnConta: TcxButton;
    btnComp: TcxButton;
    QryTransaction: TSQLQuery;
    QryItem: TSQLQuery;
    QryItemmov_item: TSmallintField;
    QryItemmov_data_prev: TDateField;
    QryItemmov_data_vencto: TDateField;
    QryItemfpg_codigo: TSmallintField;
    QryItemtip_doc_codigo: TSmallintField;
    QryItemmov_valor: TFMTBCDField;
    QryItemmov_juros: TFMTBCDField;
    QryItemmov_desconto: TFMTBCDField;
    QryItemmov_valor_pagar: TFMTBCDField;
    ClntDtStItem: TClientDataSet;
    DtStPvdItem: TDataSetProvider;
    ClntDtStItemmov_item: TSmallintField;
    ClntDtStItemmov_data_prev: TDateField;
    ClntDtStItemmov_data_vencto: TDateField;
    ClntDtStItemfpg_codigo: TSmallintField;
    ClntDtStItemtip_doc_codigo: TSmallintField;
    ClntDtStItemmov_valor: TFMTBCDField;
    ClntDtStItemmov_juros: TFMTBCDField;
    ClntDtStItemmov_desconto: TFMTBCDField;
    ClntDtStItemmov_valor_pagar: TFMTBCDField;
    DbGrd: TcxGrid;
    DbGridDBTblVw: TcxGridDBTableView;
    DbGridLvl: TcxGridLevel;
    DtSItem: TDataSource;
    DbGridDBTblVwmov_item: TcxGridDBColumn;
    DbGridDBTblVwmov_data_prev: TcxGridDBColumn;
    DbGridDBTblVwmov_data_vencto: TcxGridDBColumn;
    DbGridDBTblVwfpg_codigo: TcxGridDBColumn;
    DbGridDBTblVwtip_doc_codigo: TcxGridDBColumn;
    DbGridDBTblVwmov_valor: TcxGridDBColumn;
    DbGridDBTblVwmov_juros: TcxGridDBColumn;
    DbGridDBTblVwmov_desconto: TcxGridDBColumn;
    DbGridDBTblVwmov_valor_pagar: TcxGridDBColumn;
    QryMastermov_codigo: TIntegerField;
    ClntDtStMastermov_codigo: TIntegerField;
    QryMaxseq: TBCDField;
    QryMaxItem: TSQLQuery;
    QryTrnItem: TSQLQuery;
    QryMaxItemseq: TBCDField;
    QryItemmov_codigo: TIntegerField;
    ClntDtStItemmov_codigo: TIntegerField;
    QryForma: TSQLQuery;
    DtSForma: TDataSource;
    QryFormafpg_codigo: TSmallintField;
    QryFormafpg_nome: TStringField;
    QryTipoDoc: TSQLQuery;
    DtSTipoDoc: TDataSource;
    QryTipoDoctip_codigo: TSmallintField;
    QryTipoDoctip_nome: TStringField;
    btnExcluir: TcxButton;
    QryItemmov_retencao: TFMTBCDField;
    ClntDtStItemmov_retencao: TFMTBCDField;
    DbGridDBTblVwmov_retencao: TcxGridDBColumn;
    ClntDtStMastersit_codigo: TSmallintField;
    btnSomar: TcxButton;
    cxLabel15: TcxLabel;
    DbEdtDocumento: TcxDBTextEdit;
    QryMastermov_documento: TStringField;
    ClntDtStMastermov_documento: TStringField;
    QryItemmov_data_inclusao: TDateField;
    ClntDtStItemmov_data_inclusao: TDateField;
    cxLabel16: TcxLabel;
    DbImgCmbBxPrevisao: TcxDBImageComboBox;
    QryMastermov_previsao: TSmallintField;
    ClntDtStMastermov_previsao: TSmallintField;
    QryMastermov_tipo: TSmallintField;
    ClntDtStMastermov_tipo: TSmallintField;
    cxLabel17: TcxLabel;
    cxDBImageComboBox1: TcxDBImageComboBox;
    cxLabel18: TcxLabel;
    QryMastermov_parcelas: TSmallintField;
    ClntDtStMastermov_parcelas: TSmallintField;
    EdtParcelas: TcxDBTextEdit;
    GrpBxParcelas: TcxGroupBox;
    btnParcelas: TcxButton;
    cxLabel19: TcxLabel;
    EdtData: TcxDateEdit;
    EdtValor: TcxTextEdit;
    LblValor: TcxLabel;
    btnDocumento: TcxButton;
    QryDoc: TSQLQuery;
    QryDocmov_codigo: TIntegerField;
    QryDocmov_data_emissao: TDateField;
    QryDocmov_documento: TStringField;
    QryItemmov_parcela: TSmallintField;
    ClntDtStItemmov_parcela: TSmallintField;
    DbGridDBTblVwmov_parcela: TcxGridDBColumn;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnPessoaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTCustoClick(Sender: TObject);
    procedure btnCNegocioClick(Sender: TObject);
    procedure btnUnidadeClick(Sender: TObject);
    procedure btnCentroClick(Sender: TObject);
    procedure btnSetorClick(Sender: TObject);
    procedure btnContaClick(Sender: TObject);
    procedure btnCompClick(Sender: TObject);
    procedure ClntDtStMasterBeforePost(DataSet: TDataSet);
    procedure ClntDtStItemBeforePost(DataSet: TDataSet);
    procedure ClntDtStMasterNewRecord(DataSet: TDataSet);
    procedure ClntDtStItemNewRecord(DataSet: TDataSet);
    procedure ClntDtStMasterBeforeDelete(DataSet: TDataSet);
    procedure ClntDtStItemBeforeDelete(DataSet: TDataSet);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSomarClick(Sender: TObject);
    procedure ClntDtStItemmov_valorValidate(Sender: TField);
    procedure ClntDtStItemmov_jurosValidate(Sender: TField);
    procedure ClntDtStItemmov_descontoValidate(Sender: TField);
    procedure ClntDtStItemmov_retencaoValidate(Sender: TField);
    procedure ClntDtStMasterAfterPost(DataSet: TDataSet);
    procedure ClntDtStMasterAfterDelete(DataSet: TDataSet);
    procedure btnParcelasClick(Sender: TObject);
    procedure btnDocumentoClick(Sender: TObject);
    procedure ClntDtStMastermov_documentoChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    sMessage :String;
    sPago: String;
    iMes, iDia, iAno :Integer;
    procedure CPR_Refresh;
  end;

var
  FrmContaPR: TFrmContaPR;

implementation

uses KeyLogin, KeyMain, KeyResource, iMnyEmpresaPesq, iMnyPessoaPesq,
  iMnyCompetencia, iMnyCustoPesq, iMnyNegocioPesq, iMnyUnidadePesq,
  iMnyCentroPesq, iMnySetorPesq, iMnyContaPesq, iMnyContaPRPesq,
  iMnyContaPRDoc;

{$R *.dfm}

procedure TFrmContaPR.btnNovoClick(Sender: TObject);
begin
 ClntDtStMaster.Append;
end;

procedure TFrmContaPR.btnEditarClick(Sender: TObject);
begin
  ClntDtStMaster.Post;
end;

procedure TFrmContaPR.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmContaPR.btnPessoaClick(Sender: TObject);
begin
  FrmPessoaPesq := TFrmPessoaPesq.Create(Application);
  with FrmPessoaPesq do
  begin
    ShowModal;
    Free;
    QryPessoa.Close;
    QryPessoa.Open;
  end;
end;

procedure TFrmContaPR.FormShow(Sender: TObject);
begin
  QryTipoAceite.Open;
  QryPessoa.Open;
  QryComp.Open;
  QrySituacao.Open;
  QryCentro.Open;
  QryTCusto.Open;
  QryCNegocio.Open;
  QryUnidade.Open;
  QrySetor.Open;
  QryConta.Open;
  QryTipoDoc.Open;
  QryForma.Open;

  //*** Controle de Usuário
  if FrmMain.USR_Nivel = 0 then // Usuário
    begin
      btnExcluir.Enabled := False;
    end

end;

procedure TFrmContaPR.btnTCustoClick(Sender: TObject);
begin
  FrmCustoPesq := TFrmCustoPesq.Create(Application);
  with FrmCustoPesq do
  begin
    ShowModal;
    Free;
    QryTCusto.Close;
    QryTCusto.Open;
  end;
end;

procedure TFrmContaPR.btnCNegocioClick(Sender: TObject);
begin
  FrmNegocioPesq := TFrmNegocioPesq.Create(Application);
  with FrmNegocioPesq do
  begin
    ShowModal;
    Free;
    QryCNegocio.Close;
    QryCNegocio.Open;
  end;
end;

procedure TFrmContaPR.btnUnidadeClick(Sender: TObject);
begin
  FrmUnidadePesq := TFrmUnidadePesq.Create(Application);
  with FrmUnidadePesq do
  begin
    ShowModal;
    Free;
    QryUnidade.Close;
    QryUnidade.Open;
  end;
end;

procedure TFrmContaPR.btnCentroClick(Sender: TObject);
begin
  FrmCentroPesq := TFrmCentroPesq.Create(Application);
  with FrmCentroPesq do
  begin
    ShowModal;
    Free;
    QryCentro.Close;
    QryCentro.Open;
  end;
end;

procedure TFrmContaPR.btnSetorClick(Sender: TObject);
begin
  FrmSetorPesq := TFrmSetorPesq.Create(Application);
  with FrmSetorPesq do
  begin
    ShowModal;
    Free;
    QrySetor.Close;
    QrySetor.Open;
  end;
end;

procedure TFrmContaPR.btnContaClick(Sender: TObject);
begin
  FrmContaPesq := TFrmContaPesq.Create(Application);
  with FrmContaPesq do
  begin
    ShowModal;
    Free;
    QryConta.Close;
    QryConta.Open;
  end;
end;

procedure TFrmContaPR.btnCompClick(Sender: TObject);
begin
  FrmCompetencia := TFrmCompetencia.Create(Application);
  with FrmCompetencia do
  begin
    ShowModal;
    Free;
    QryComp.Close;
    QryComp.Open;
  end;  

end;

procedure TFrmContaPR.ClntDtStMasterBeforePost(DataSet: TDataSet);
var
 sSql :String;
begin
   if sPago = 'S' then
     begin
       Application.MessageBox('Movimento Já Pago', 'Erro', MB_OK+MB_ICONINFORMATION);
       Abort;
     end;

   FrmLogin.GR_Refresh;
   CPR_Refresh;
   //Update;
   if ClntDtStMaster.State in[dsEdit] then
    begin
      ClntDtStMastermov_alt.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                     FormatDateTime('hh:mm:ss', Time) +
                                     FrmMain.USR_Nome;
      with QryTransaction do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('update mny_movimento a set');

        SQL.Add('   a.cen_codigo = '  + FormatFloat('000', ClntDtStMastercen_codigo.Value));
        SQL.Add('   ,a.com_codigo = ' + FormatFloat('000', ClntDtStMastercom_codigo.Value));
        SQL.Add('   ,a.con_codigo = ' + FormatFloat('000', ClntDtStMastercon_codigo.Value));
        SQL.Add('   ,a.cus_codigo = ' + FormatFloat('000', ClntDtStMastercus_codigo.Value));
        SQL.Add('   ,a.neg_codigo = ' + FormatFloat('000', ClntDtStMasterneg_codigo.Value));
        SQL.Add('   ,a.pes_codigo = ' + FormatFloat('000000', ClntDtStMasterpes_codigo.Value));
        SQL.Add('   ,a.set_codigo = ' + FormatFloat('000', ClntDtStMasterset_codigo.Value));
        SQL.Add('   ,a.sit_codigo = ' + FormatFloat('000', ClntDtStMastersit_codigo.Value));
        SQL.Add('   ,a.uni_codigo = ' + FormatFloat('000', ClntDtStMasteruni_codigo.Value));
        SQL.Add('   ,a.mov_previsao = ' + FormatFloat('0', ClntDtStMastermov_previsao.Value));
        SQL.Add('   ,a.mov_tipo = ' + FormatFloat('0', ClntDtStMastermov_tipo.Value));
        SQL.Add('   ,a.mov_parcelas = ' + FormatFloat('0', ClntDtStMastermov_parcelas.Value));
        SQL.Add('   ,a.mov_data_emissao = '  + QuotedStr(FormatDateTime('yyyy-mm-dd', ClntDtStMastermov_data_emissao.Value)));
        SQL.Add('   ,a.mov_data_inclusao = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', ClntDtStMastermov_data_emissao.Value)));
        SQL.Add('   ,a.mov_obs = '           + QuotedStr(ClntDtStMastermov_obs.Value));
        SQL.Add('   ,a.mov_inc = '           + QuotedStr(ClntDtStMastermov_inc.Value));
        SQL.Add('   ,a.mov_alt = '           + QuotedStr(ClntDtStMastermov_alt.Value));
        SQL.Add('   ,a.mov_contrato = '      + QuotedStr(ClntDtStMastermov_contrato.Value));
        SQL.Add('   ,a.tip_ace_codigo = '    + FormatFloat('000', ClntDtStMastertip_ace_codigo.Value));
        SQL.Add('   ,a.mov_documento = '     + QuotedStr(ClntDtStMastermov_documento.Value));

        SQL.Add('   where a.mov_codigo = ' + CurrToStr(ClntDtStMastermov_codigo.Value));
        if Not Application.MessageBox('Deseja Realmente Alterar os Dados?', 'Confirmação', MB_OKCANCEL+MB_ICONQUESTION) = ID_OK then Exit;
        ExecSQL(True);
        SQL.Text := sSql;
      end;
    end;

  //Insert
  if ClntDtStMaster.State in[dsInsert] then
    begin
      with QryMax do
      begin
        Close;
        Open;
        ClntDtStMastermov_codigo.Value := StrToInt(CurrToStr(QryMaxseq.Value));
      End;
      ClntDtStMastermov_inc.Value    := FormatDateTime('dd/mm/yyyy', Date) +
                                      FormatDateTime('hh:mm:ss', Time) +
                                      FrmMain.USR_Nome;
      ClntDtStMastermov_inc.Value := FormatDateTime('dd/mm/yyyy', Date) +
                                     FormatDateTime('hh:mm:ss', Time) +
                                     FrmMain.USR_Nome;
      with QryTransaction do
      begin
        sSql := SQL.Text;
        SQL.Clear;

        SQL.Add('insert into mny_movimento');
        SQL.Add(' (mov_codigo, cen_codigo, com_codigo, con_codigo, cus_codigo, neg_codigo,  ');
        SQL.Add('  pes_codigo, set_codigo, sit_codigo, uni_codigo, mov_previsao, mov_tipo, mov_parcelas, mov_data_emissao, mov_data_inclusao, ');
        SQL.Add('  mov_obs, mov_inc, mov_alt, mov_contrato, tip_ace_codigo, mov_documento) ');
        SQL.Add(' values ( ' );

        SQL.Add(FormatFloat('000000', ClntDtStMastermov_codigo.Value) + ', ');
        SQL.Add(FormatFloat('000', ClntDtStMastercen_codigo.Value) + ', ');
        SQL.Add(FormatFloat('000', ClntDtStMastercom_codigo.Value) + ', ');
        SQL.Add(FormatFloat('000', ClntDtStMastercon_codigo.Value) + ', ');
        SQL.Add(FormatFloat('000', ClntDtStMastercus_codigo.Value) + ', ');
        SQL.Add(FormatFloat('000', ClntDtStMasterneg_codigo.Value) + ', ');
        SQL.Add(FormatFloat('000000', ClntDtStMasterpes_codigo.Value) + ', ');
        SQL.Add(FormatFloat('000', ClntDtStMasterset_codigo.Value) + ', ');
        SQL.Add(FormatFloat('000', ClntDtStMastersit_codigo.Value) + ', ');
        SQL.Add(FormatFloat('000', ClntDtStMasteruni_codigo.Value) + ', ');
        SQL.Add(FormatFloat('0', ClntDtStMastermov_previsao.Value) + ', ');
        SQL.Add(FormatFloat('0', ClntDtStMastermov_tipo.Value) + ', ');
        SQL.Add(FormatFloat('000', ClntDtStMastermov_parcelas.Value) + ', ');

        SQL.Add(QuotedStr(FormatDateTime('yyyy-mm-dd', ClntDtStMastermov_data_emissao.Value)) + ', ');
        SQL.Add(QuotedStr(FormatDateTime('yyyy-mm-dd', ClntDtStMastermov_data_emissao.Value)) + ', ');
        SQL.Add(QuotedStr(ClntDtStMastermov_obs.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMastermov_inc.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMastermov_alt.Value) + ', ') ;
        SQL.Add(QuotedStr(ClntDtStMastermov_contrato.Value) + ', ');

        SQL.Add(FormatFloat('000', ClntDtStMastertip_ace_codigo.Value) + ', ');
        SQL.Add(QuotedStr(ClntDtStMastermov_documento.Value) );

        SQL.Add(')');
        ExecSQL(True);
        SQL.Text := sSql;
        Application.MessageBox('Dados Incluídos Com Sucesso !!!', 'Confirmação', MB_OK);
      end;
    end;
end;

procedure TFrmContaPR.ClntDtStItemBeforePost(DataSet: TDataSet);
var
 sSql :String;
 cValor :Real;
begin
   if sPago = 'S' then
     begin
       Application.MessageBox('Movimento Já Pago', 'Erro', MB_OK+MB_ICONINFORMATION);
       Abort;
     end;

   FrmLogin.GR_Refresh;
   CPR_Refresh;
   //Update;
   if ClntDtStItem.State in[dsEdit] then
    begin

      with QryTrnItem do
      begin
        sSql := SQL.Text;
        SQL.Clear;
        SQL.Add('update mny_movimento_item a set');

        SQL.Add('    a.mov_data_prev = '   + QuotedStr(FormatDateTime('yyyy-mm-dd', ClntDtStItemmov_data_prev.Value)));
        SQL.Add('   ,a.mov_data_vencto = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', ClntDtStItemmov_data_vencto.Value)));
        SQL.Add('   ,a.fpg_codigo =  '     + FormatFloat('000', ClntDtStItemfpg_codigo.Value));
        SQL.Add('   ,a.tip_doc_codigo   = '  + FormatFloat('000', ClntDtStItemtip_doc_codigo.Value));
        SQL.Add('   ,a.mov_parcela      = '  + FormatFloat('000', ClntDtStItemmov_parcela.Value));
        SQL.Add('   ,a.mov_valor        = '  + StringReplace(FormatFloat('######00.00', ClntDtStItem.FieldByName('mov_valor').AsCurrency),',','.',[rfReplaceAll]));
        SQL.Add('   ,a.mov_juros        = '  + StringReplace(FormatFloat('######00.00', ClntDtStItem.FieldByName('mov_juros').AsCurrency),',','.',[rfReplaceAll]));
        SQL.Add('   ,a.mov_desconto     = '  + StringReplace(FormatFloat('######00.00', ClntDtStItem.FieldByName('mov_desconto').AsCurrency),',','.',[rfReplaceAll]));
        SQL.Add('   ,a.mov_valor_pagar  = '  + StringReplace(FormatFloat('######00.00', ClntDtStItem.FieldByName('mov_valor_pagar').AsCurrency),',','.',[rfReplaceAll]));
        SQL.Add('   ,a.mov_retencao  = '     + StringReplace(FormatFloat('######00.00', ClntDtStItem.FieldByName('mov_retencao').AsCurrency),',','.',[rfReplaceAll]));
        //*** Falta Valores
        SQL.Add('   where a.mov_codigo = ' + CurrToStr(ClntDtStItemmov_codigo.Value));
        SQL.Add('   and a.mov_item = '   + CurrToStr(ClntDtStItemmov_item.Value));
        if Not Application.MessageBox('Deseja Realmente Alterar os Dados?', 'Confirmação', MB_OKCANCEL+MB_ICONQUESTION) = ID_OK then Exit;
        sSql := SQl.Text;
        ExecSQL(True);
        SQL.Text := sSql;
      end;
    end;

  //Insert
  if ClntDtStItem.State in[dsInsert] then
    begin
      with QryTransaction do
      begin
        sSql := SQL.Text;
        SQL.Clear;

        SQL.Add('insert into mny_movimento_item');
        SQL.Add('  (mov_codigo, mov_item, mov_data_prev, mov_data_vencto, fpg_codigo,  ');
        SQL.Add('   tip_doc_codigo, mov_valor, mov_juros, mov_desconto, mov_valor_pagar, mov_retencao, mov_data_inclusao, mov_parcela ) ');
        SQL.Add(' values ( ' );

        SQL.Add(IntToStr(ClntDtStItemmov_codigo.Value) + ', ');
        SQL.Add(IntToStr(ClntDtStItemmov_item.Value) + ', ');
        SQL.Add(QuotedStr(FormatDateTime('yyyy-mm-dd', ClntDtStItemmov_data_prev.Value)) + ', ');
        SQL.Add(QuotedStr(FormatDateTime('yyyy-mm-dd', ClntDtStItemmov_data_vencto.Value)) + ', ');
        SQL.Add(FormatFloat('000', ClntDtStItemfpg_codigo.Value) + ', ');
        SQL.Add(FormatFloat('000', ClntDtStItemtip_doc_codigo.Value) + ', ');
        SQL.Add(StringReplace(FormatFloat('######00.00', ClntDtStItem.FieldByName('mov_valor').AsCurrency),',','.',[rfReplaceAll]) + ', ');
        SQL.Add(StringReplace(FormatFloat('######00.00', ClntDtStItem.FieldByName('mov_juros').AsCurrency),',','.',[rfReplaceAll]) + ', ');
        SQL.Add(StringReplace(FormatFloat('######00.00', ClntDtStItem.FieldByName('mov_desconto').AsCurrency),',','.',[rfReplaceAll]) + ', ');
        SQL.Add(StringReplace(FormatFloat('######00.00', ClntDtStItem.FieldByName('mov_valor_pagar').AsCurrency),',','.',[rfReplaceAll]) + ', ');
        SQL.Add(StringReplace(FormatFloat('######00.00', ClntDtStItem.FieldByName('mov_retencao').AsCurrency),',','.',[rfReplaceAll]) + ', ');
        SQL.Add(QuotedStr(FormatDateTime('yyyy-mm-dd', ClntDtStItemmov_data_inclusao.Value)) + ', ');
        SQL.Add(FormatFloat('000', ClntDtStItemmov_parcela.Value));
        SQL.Add(')');
        ExecSQL(True);
        Application.MessageBox('Dados Incluídos Com Sucesso !!!', 'Confirmação', MB_OK);
      end;
    end;
end;

procedure TFrmContaPR.ClntDtStMasterNewRecord(DataSet: TDataSet);
begin
  FrmLogin.GR_Refresh;
  CPR_Refresh;
  ClntDtStMastertip_ace_codigo.Value := 1;
  ClntDtStMastersit_codigo.Value := 5;
  ClntDtStMastermov_previsao.Value := 0;
  ClntDtStMastermov_tipo.Value := 0;  
end;

procedure TFrmContaPR.ClntDtStItemNewRecord(DataSet: TDataSet);
begin
  FrmLogin.GR_Refresh;
  CPR_Refresh;  
  ClntDtStItemmov_valor_pagar.Value := StrToBcd('0');
  ClntDtStItemmov_valor.Value := StrToBcd('0');
  ClntDtStItemmov_juros.Value := StrToBcd('0');
  ClntDtStItemmov_desconto.Value := StrToBcd('0');
  ClntDtStItemmov_retencao.Value := StrToBcd('0');
  ClntDtStItemmov_data_inclusao.Value := Date;
  ClntDtStItemfpg_codigo.Value := 1;
  ClntDtStItemtip_doc_codigo.Value := 1;
  with QryMaxItem do
  begin
    Close;
    Params.ParamByName('mov_codigo').AsInteger := ClntDtStMastermov_codigo.Value;
    Open;
    ClntDtStItemmov_codigo.Value := ClntDtStMastermov_codigo.Value;
    ClntDtStItemmov_item.Value := StrToInt(CurrToStr(QryMaxItemseq.Value));
    ClntDtStItemmov_parcela.Value := StrToInt(CurrToStr(QryMaxItemseq.Value));
  end;

end;

procedure TFrmContaPR.ClntDtStMasterBeforeDelete(DataSet: TDataSet);
var
  sSQL :String;
begin
  FrmLogin.GR_Refresh;
  CPR_Refresh;  
  with QryTransaction do
    begin
      sSql := SQL.Text;
      SQL.Clear;
      SQL.Add('delete from mny_movimento ');
      SQL.Add(' where mov_codigo = ' + CurrToStr(ClntDtStMastermov_codigo.Value));
      ExecSQL(True);
      SQL.Text := sSql;
    end;
end;

procedure TFrmContaPR.ClntDtStItemBeforeDelete(DataSet: TDataSet);
var
  sSQL :String;
begin
  //*** Controle de Usuário
  if FrmMain.USR_Nivel = 0 then // Usuário
    begin
      Abort;
    end;

  FrmLogin.GR_Refresh;
  CPR_Refresh;
  with QryTrnItem do
    begin
      sSql := SQL.Text;
      SQL.Clear;
      SQL.Add('delete from mny_movimento_item ');
      SQL.Add(' where mov_codigo = ' + CurrToStr(ClntDtStItemmov_codigo.Value));
      SQL.Add(' and mov_item = ' + CurrToStr(ClntDtStItemmov_item.Value));
      ExecSQL(True);
      SQL.Text := sSql;
    end;
end;

procedure TFrmContaPR.btnExcluirClick(Sender: TObject);
begin
  ClntDtStMaster.Delete;
end;

procedure TFrmContaPR.btnSomarClick(Sender: TObject);
var
  cTotal :Currency;
begin
  cTotal := ( ClntDtStItem.FieldByName('mov_valor').AsCurrency +
              ClntDtStItem.FieldByName('mov_juros').AsCurrency )
            -
            ( ClntDtStItem.FieldByName('mov_desconto').AsCurrency +
              ClntDtStItem.FieldByName('mov_retencao').AsCurrency );
  ClntDtStItemmov_valor_pagar.AsCurrency := cTotal;
end;

procedure TFrmContaPR.ClntDtStItemmov_valorValidate(Sender: TField);
begin
  btnSomarClick(Self);
end;

procedure TFrmContaPR.ClntDtStItemmov_jurosValidate(Sender: TField);
begin
  btnSomarClick(Self);
end;

procedure TFrmContaPR.ClntDtStItemmov_descontoValidate(Sender: TField);
begin
  btnSomarClick(Self);
end;

procedure TFrmContaPR.ClntDtStItemmov_retencaoValidate(Sender: TField);
begin
  btnSomarClick(Self);
end;

procedure TFrmContaPR.CPR_Refresh;
begin
  QryTipoAceite.Close;
  QryTipoAceite.Open;
  QryPessoa.Close;
  QryPessoa.Open;
  QryComp.Close;
  QryComp.Open;
  QrySituacao.Close;
  QrySituacao.Open;
  QryTCusto.Close;
  QryTCusto.Open;
  QryCNegocio.Close;
  QryCNegocio.Open;
  QryCentro.Close;
  QryCentro.Open;
  QryUnidade.Close;
  QryUnidade.Open;
  QryConta.Close;
  QryConta.Open;
  QrySetor.Close;
  QrySetor.Open;
  QryForma.Close;
  QryForma.Open;
  QryTipoDoc.Close;
  QryTipoDoc.Open;
end;

procedure TFrmContaPR.ClntDtStMasterAfterPost(DataSet: TDataSet);
begin
  FrmLogin.GR_Refresh;
  CPR_Refresh;
  with QryItem do
  begin
    Close;
    ClntDtStItem.Close;
    Params.ParamByName('mov_codigo').AsInteger := FrmContaPR.ClntDtStMastermov_codigo.Value;
    Open;
    ClntDtStItem.Open;
  end;
end;

procedure TFrmContaPR.ClntDtStMasterAfterDelete(DataSet: TDataSet);
begin
  FrmLogin.GR_Refresh;
  CPR_Refresh;
  with QryItem do
  begin
    Close;
    ClntDtStItem.Close;
    Params.ParamByName('mov_codigo').AsInteger := FrmContaPR.ClntDtStMastermov_codigo.Value;
    Open;
    ClntDtStItem.Open;
  end;
end;

procedure TFrmContaPR.btnParcelasClick(Sender: TObject);
Var
  iCont, iCont2 :Integer;
  dDataVencto :TDate;
  cDataVencto :String;
  sMes :String;
begin

  iCont2 := ClntDtStMastermov_parcelas.Value;
  iCont := 0;
  iDia := 0;
  iMes := 0;
  iAno := 0;

  iDia := StrToInt(FormatDateTime('dd'  , EdtData.Date));
  iMes := StrToInt(FormatDateTime('mm'  , EdtData.Date));
  iMes := iMes - 1;
  if iMes = 0 then iMes := 12;

  iAno := StrToInt(FormatDateTime('yyyy', EdtData.Date));

  while iCont < iCont2 do
  begin
    with ClntDtStItem do
    begin

      //*** Calculando Data Vencimento
      iMes := iMes + 1;

      if iMes = 13 then
        begin
          iMes := 01;
          iAno := iAno + 1;
        end;
      if (iMes = 02) And (iDia >= 29) then
        begin
          iDia := 28;
        end;

      cDataVencto := FormatFloat('00', iDia) + '/' + FormatFloat('00', iMes) + '/' + FormatFloat('00', iAno);

      Close;
      Open;
      Append;
      ClntDtStItemmov_data_vencto.Value := StrToDate(cDataVencto);
      ClntDtStItemmov_data_prev.Value   := StrToDate(cDataVencto);
      ClntDtStItemmov_valor.Value       := StrToBcd(EdtValor.Text);
      ClntDtStItemmov_valor_pagar.Value := StrToBcd(EdtValor.Text);
      Post;
      iCont := iCont + 1;
    end;
  end;
  Application.MessageBox('Parcelas Geras Com Sucesso !!!', 'Confirmação', MB_OK);

end;

procedure TFrmContaPR.btnDocumentoClick(Sender: TObject);
begin
  FrmContaPRDoc := TFrmContaPRDoc.Create(Application);
  with FrmContaPRDoc do
  begin
    FrmContaPRDoc.ClntDtStMaster.Close;
    QryDoc.Close;
    QryDoc.Params.ParamByName('mov_codigo').AsInteger := FrmContaPR.ClntDtStMastermov_codigo.Value;
    QryDoc.Open;
    ShowModal;
    Free;
  end;
end;

procedure TFrmContaPR.ClntDtStMastermov_documentoChange(Sender: TField);
begin
{ with QryDoc do
  begin
    Close;
    Params.ParamByName('pes_codigo').AsInteger := ClntDtStMasterpes_codigo.Value;
    Params.ParamByName('mov_documento').AsString := ClntDtStMastermov_documento.Value;
    Open;
    if Not IsEmpty then
      begin
        sMessage := 'Documento Já Existente: ' +
                    FormatFloat('000000', QryDocmov_codigo.Value) + ' - ' +
                    FormatDateTime('dd/mm/yyyy', QryDocmov_data_emissao.Value);
        ShowMessage(pChar(sMessage)) ;
      end
  end; }

end;

end.

