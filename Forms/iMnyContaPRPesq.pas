unit iMnyContaPRPesq;

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
  FMTBcd, SqlExpr, DBClient, Provider, cxCheckBox, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxLabel, cxMaskEdit, cxCalendar, frxClass,
  frxDBSet, ShellApi, ComObj, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  dxDBTLCl, dxGrClms;

type
  TFrmContaPRPesq = class(TForm)
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
    QrySituacao: TSQLQuery;
    DtSSituacao: TDataSource;
    QryMasterpes_razao_social: TStringField;
    QryMasterpes_nome_fantasia: TStringField;
    QryMastermov_data_inclusao: TDateField;
    QryMastermov_data_vencto: TDateField;
    QryMastermov_pagar: TFMTBCDField;
    ClntDtStMasterpes_razao_social: TStringField;
    ClntDtStMasterpes_nome_fantasia: TStringField;
    ClntDtStMastermov_data_inclusao: TDateField;
    ClntDtStMastermov_data_vencto: TDateField;
    ClntDtStMastermov_pagar: TFMTBCDField;
    EdtDataInicial: TcxDateEdit;
    cxLabel1: TcxLabel;
    EdtDataFinal: TcxDateEdit;
    cxLabel2: TcxLabel;
    DbGridDBTblVwmov_codigo: TcxGridDBColumn;
    DbGridDBTblVwpes_razao_social: TcxGridDBColumn;
    DbGridDBTblVwpes_nome_fantasia: TcxGridDBColumn;
    DbGridDBTblVwmov_data_inclusao: TcxGridDBColumn;
    DbGridDBTblVwmov_data_vencto: TcxGridDBColumn;
    DbGridDBTblVwmov_pagar: TcxGridDBColumn;
    QryMastermov_obs: TStringField;
    QryMastermov_inc: TStringField;
    QryMastermov_alt: TStringField;
    ClntDtStMastermov_obs: TStringField;
    ClntDtStMastermov_inc: TStringField;
    ClntDtStMastermov_alt: TStringField;
    DbGridDBTblVwmov_obs: TcxGridDBColumn;
    QrySituacaosit_codigo: TSmallintField;
    QrySituacaosit_nome: TStringField;
    QryMastermov_codigo: TIntegerField;
    ClntDtStMastermov_codigo: TIntegerField;
    QryRAceite: TSQLQuery;
    QryRAceitemov_data_emissao: TDateField;
    QryRAceitepes_nome_fantasia: TStringField;
    QryRAceitepes_documento: TStringField;
    QryRAceitemov_data_imp: TDateField;
    QryRAceitemov_item: TSmallintField;
    QryRAceitemov_codigo: TIntegerField;
    QryRAceitemov_contrato: TStringField;
    QryRAceitefpg_nome: TStringField;
    QryRAceitetip_nome: TStringField;
    QryRAceitemov_data_prev: TDateField;
    QryRAceitecom_nome: TStringField;
    QryRAceiteccr_agencia: TStringField;
    QryRAceiteccr_agencia_dv: TStringField;
    QryRAceiteccr_conta: TStringField;
    QryRAceiteccr_conta_dv: TStringField;
    QryRAceitebco_sigla: TStringField;
    QryRAceitemov_valor: TFMTBCDField;
    QryRAceitemov_juros: TFMTBCDField;
    QryRAceitemov_desconto: TFMTBCDField;
    QryRAceitemov_valor_pagar: TFMTBCDField;
    QryRAceitecus_nome: TStringField;
    QryRAceiteneg_nome: TStringField;
    QryRAceiteuni_nome: TStringField;
    QryRAceitecen_nome: TStringField;
    QryRAceiteset_nome: TStringField;
    QryRAceitecon_nome: TStringField;
    DtStRAceite: TfrxDBDataset;
    FrRAceite: TfrxReport;
    QryRAceitetip_aceite: TStringField;
    btnAceite: TcxButton;
    QryMastermov_item: TSmallintField;
    ClntDtStMastermov_item: TSmallintField;
    QryRAceitemov_obs: TStringField;
    DbGridDBTblVwmov_item: TcxGridDBColumn;
    QryCount: TSQLQuery;
    QryCounttotal: TFMTBCDField;
    QryMastermov_solicitante: TStringField;
    ClntDtStMastermov_solicitante: TStringField;
    QryMastersit_nome: TStringField;
    ClntDtStMastersit_nome: TStringField;
    DbGridDBTblVwmov_status: TcxGridDBColumn;
    btnOKF: TcxButton;
    btnOKD: TcxButton;
    QryStatus: TSQLQuery;
    btnImprimir: TcxButton;
    FrDtStMaster: TfrxDBDataset;
    FrMaster: TfrxReport;
    QryRAceitemov_documento: TStringField;
    QryMastermov_documento: TStringField;
    ClntDtStMastermov_documento: TStringField;
    ChkBxInclusao: TcxCheckBox;
    QryMasterimprimir: TBCDField;
    btnBloco: TcxButton;
    EdtBloco: TcxTextEdit;
    cxLabel4: TcxLabel;
    btnLimpar: TcxButton;
    QryRAceitemov_retencao: TFMTBCDField;
    EdtFiltro: TcxTextEdit;
    QryMastermov_data_prev: TDateField;
    DbGridDBTblVwmov_data_prev: TcxGridDBColumn;
    ClntDtStMasterimprimir: TBCDField;
    ClntDtStMastermov_data_prev: TDateField;
    QryRAceiteprint_documento: TStringField;
    QryRAceiteprint_ficha: TStringField;
    QryRAceiteprint_parcela: TStringField;
    QryMastermov_tipo: TSmallintField;
    ClntDtStMastermov_tipo: TSmallintField;
    DbGridDBTblVwmov_tipo: TcxGridDBColumn;
    QryMastermov_inclusao: TStringField;
    ClntDtStMastermov_inclusao: TStringField;
    DbGridDBTblVwmov_inclusao: TcxGridDBColumn;
    QryMastercus_nome: TStringField;
    QryMasterneg_nome: TStringField;
    QryMasteruni_nome: TStringField;
    QryMastercen_nome: TStringField;
    QryMastercon_nome: TStringField;
    QryMasterset_nome: TStringField;
    ClntDtStMastercus_nome: TStringField;
    ClntDtStMasterneg_nome: TStringField;
    ClntDtStMasteruni_nome: TStringField;
    ClntDtStMastercen_nome: TStringField;
    ClntDtStMastercon_nome: TStringField;
    ClntDtStMasterset_nome: TStringField;
    DbGridDBTblVwcus_nome: TcxGridDBColumn;
    DbGridDBTblVwneg_nome: TcxGridDBColumn;
    DbGridDBTblVwuni_nome: TcxGridDBColumn;
    DbGridDBTblVwcon_nome: TcxGridDBColumn;
    DbGridDBTblVwset_nome: TcxGridDBColumn;
    DbGridDBTblVwcen_nome: TcxGridDBColumn;
    btnBaixar: TcxButton;
    DbGridDBTblVwmov_documento: TcxGridDBColumn;
    QryMastercax_data: TDateField;
    ClntDtStMastercax_data: TDateField;
    DbGridDBTblVwmov_data_pagto: TcxGridDBColumn;
    QryRAceitemov_data_inclusao: TDateField;
    QryEmp: TSQLQuery;
    QryEmpemp_cnpj: TStringField;
    QryEmpemp_fantasia: TStringField;
    QryEmpemp_aceite: TSmallintField;
    FrRAceite2: TfrxReport;
    btnExcel: TcxButton;
    DbGrdContaPR: TdxDBGrid;
    DbGrdContaPRpes_razao_social: TdxDBGridMaskColumn;
    DbGrdContaPRpes_nome_fantasia: TdxDBGridMaskColumn;
    DbGrdContaPRmov_data_inclusao: TdxDBGridDateColumn;
    DbGrdContaPRmov_data_vencto: TdxDBGridDateColumn;
    DbGrdContaPRmov_pagar: TdxDBGridColumn;
    DbGrdContaPRmov_obs: TdxDBGridMaskColumn;
    DbGrdContaPRmov_codigo: TdxDBGridMaskColumn;
    DbGrdContaPRmov_item: TdxDBGridMaskColumn;
    DbGrdContaPRmov_solicitante: TdxDBGridMaskColumn;
    DbGrdContaPRsit_nome: TdxDBGridMaskColumn;
    DbGrdContaPRmov_documento: TdxDBGridMaskColumn;
    DbGrdContaPRmov_data_prev: TdxDBGridDateColumn;
    DbGrdContaPRmov_tipo: TdxDBGridMaskColumn;
    DbGrdContaPRmov_inclusao: TdxDBGridMaskColumn;
    DbGrdContaPRcus_nome: TdxDBGridMaskColumn;
    DbGrdContaPRneg_nome: TdxDBGridMaskColumn;
    DbGrdContaPRuni_nome: TdxDBGridMaskColumn;
    DbGrdContaPRcen_nome: TdxDBGridMaskColumn;
    DbGrdContaPRcon_nome: TdxDBGridMaskColumn;
    DbGrdContaPRset_nome: TdxDBGridMaskColumn;
    DbGrdContaPRcax_data: TdxDBGridDateColumn;
    QryRAceitemov_aut_financeiro: TStringField;
    QryRAceitemov_aut_gerencia: TStringField;
    btnDocs: TcxButton;
    PpMnu: TPopupMenu;
    PpMuIncluir: TMenuItem;
    QryMasterPR: TStringField;
    QryMastercax_num: TIntegerField;
    QryMastercax_seq: TSmallintField;
    QryMasterfpg_nome: TStringField;
    QryMastertip_nome: TStringField;
    QryMasterunidade: TStringField;
    ClntDtStMasterPR: TStringField;
    ClntDtStMastercax_num: TIntegerField;
    ClntDtStMastercax_seq: TSmallintField;
    ClntDtStMasterfpg_nome: TStringField;
    ClntDtStMastertip_nome: TStringField;
    ClntDtStMasterunidade: TStringField;
    DbGridDBTblVwcax_num: TcxGridDBColumn;
    DbGridDBTblVwcax_seq: TcxGridDBColumn;
    DbGridDBTblVwforma: TcxGridDBColumn;
    DbGridDBTblVwtipo: TcxGridDBColumn;
    DbGridDBTblVwunidade: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure ActnIncExecute(Sender: TObject);
    procedure ActnAltExecute(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnAceiteClick(Sender: TObject);
    procedure FrRAceiteGetValue(const VarName: String; var Value: Variant);
    procedure btnOKFClick(Sender: TObject);
    procedure btnOKDClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FrMasterGetValue(const VarName: String; var Value: Variant);
    procedure DbGridDBTblVwCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnLimparClick(Sender: TObject);
    procedure btnBlocoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBaixarClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnDocsClick(Sender: TObject);
    procedure PpMuIncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sCaixa :String;
  end;

var
  FrmContaPRPesq: TFrmContaPRPesq;

implementation

uses KeyResource, KeyMain, KeyLogin, KeyUsuario, iMnyPessoa, iMnyContaPR,
  iMnyContaPRDoc, iMnyPagtoListaView;

{$R *.dfm}

procedure TFrmContaPRPesq.FormShow(Sender: TObject);
begin
  ClntDtStMaster.Close;
  QryMaster.Close;
  QryMaster.Params.ParamByName('nome').AsString := '%';
  QryMaster.Open;
  ClntDtStMaster.Open;
  QrySituacao.Open;
  if sCaixa = 'N' then
    begin
      EdtDataInicial.Date := Date;
      EdtDataFinal.Date := Date;
    end;
  EdtPesquisar.SetFocus;

  //*** Controle de Usuário
  if FrmMain.USR_Nivel = 0 then // Usuário
    begin
      btnOKF.Visible := False;
      btnOKD.Visible := False;
    end;

  if FrmMain.USR_Nome = 'GERCINO_FILHO' then btnBaixar.Visible := True;
  
end;

procedure TFrmContaPRPesq.ActnIncExecute(Sender: TObject);
begin
  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMastermov_inc.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmContaPRPesq.ActnAltExecute(Sender: TObject);
begin
  Application.MessageBox(pchar(FrmLogin.GR_Registro(ClntDtStMastermov_alt.Value)),
    'Informação', MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmContaPRPesq.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmContaPRPesq.btnNovoClick(Sender: TObject);
begin
  FrmContaPR := TFrmContaPR.Create(Application);
  FrmLogin.GR_Refresh;
  with FrmContaPR do
  begin
    ClntDtStMaster.Open;
    QryMaster.Open;
    ClntDtStMaster.Append;
    ShowModal;
    Free;
  end;
end;

procedure TFrmContaPRPesq.btnEditarClick(Sender: TObject);
begin
  FrmContaPR := TFrmContaPR.Create(Application);
  if ClntDtStMastersit_nome.Value = 'Pago' then
    FrmContaPR.sPago := 'S'
  else
    FrmContaPR.sPago := 'N';

  FrmLogin.GR_Refresh;
  with FrmContaPR do
  begin
    FrmContaPR.ClntDtStMaster.Close;
    FrmContaPR.QryMaster.Close;
    FrmContaPR.QryMaster.Params.ParamByName('mov_codigo').AsInteger := FrmContaPRPesq.ClntDtStMastermov_codigo.Value;
    FrmContaPR.QryMaster.Open;
    FrmContaPR.ClntDtStMaster.Open;

    FrmContaPR.QryItem.Close;
    FrmContaPR.ClntDtStItem.Close;
    FrmContaPR.QryItem.Params.ParamByName('mov_codigo').AsInteger := FrmContaPR.ClntDtStMastermov_codigo.Value;
    QryItem.Open;
    FrmContaPR.ClntDtStItem.Open;

    ShowModal;
    Free;
  end;
end;

procedure TFrmContaPRPesq.btnAceiteClick(Sender: TObject);
var
  iMovCodigo, iMovItem :Integer;
  sSql :String;
begin
  iMovCodigo :=  ClntDtStMastermov_codigo.Value;
  iMovItem   :=  ClntDtStMastermov_item.Value;
  FrmLogin.GR_Refresh;
  QrySituacao.Close;
  QrySituacao.Open;

  with QryRAceite do
  begin

    sSql := SQL.Text;
    SQL.Add(' where (concat(a.`mov_codigo`, "-", a.`mov_item`) = ');
    SQL.Add(QuotedStr(CurrToStr(ClntDtStMastermov_codigo.Value) + '-' + CurrToStr(ClntDtStMastermov_item.Value)));
    SQL.Add(' )');
    SQL.Add(' order by a.`mov_codigo`, a.`mov_item` ');

    Close;
    //Params.ParamByName('mov_codigo').AsInteger := ClntDtStMastermov_codigo.Value;
    //Params.ParamByName('mov_item').AsInteger   := ClntDtStMastermov_item.Value;
    Open;
    QryEmp.Close;
    QryEmp.Open;

    if QryEmpemp_aceite.Value = 0 then
      begin
       if FrRAceite.PrepareReport Then FrRAceite.ShowPreparedReport;
       SQL.Text := sSql;
       EdtBloco.Text := '';
       EdtFiltro.Text := '';
      end
    else
      begin
        if ClntDtStMastersit_nome.Value <> 'OK Financeiro' then
          begin
            Application.MessageBox('Ainda Não Autorizado Pelo Financeiro !!!', 'Erro', MB_OK);
            SQL.Text := sSql;
            EdtBloco.Text := '';
            EdtFiltro.Text := '';
            //Abort;
          end;
        if FrRAceite.PrepareReport Then FrRAceite.ShowPreparedReport;
      end;   
  end;
end;

procedure TFrmContaPRPesq.FrRAceiteGetValue(const VarName: String;
  var Value: Variant);
begin
  if VarName = 'sUsuario' then Value := FrmMain.USR_Nome;
  if VarName = 'sData' then Value := FormatDateTime('dd/mm/yyyy', Date);
  if VarName = 'sHora' then Value := FormatDateTime('hh:mm:ss', Time);

  if VarName = 'sSolicitante' then Value := ClntDtStMastermov_solicitante.Value;

  if VarName = 'sDocumento' then Value := ClntDtStMastermov_documento.Value + '.' + FormatFloat('000', ClntDtStMastermov_item.Value);
  if VarName = 'sFicha' then Value := FormatFloat('000000', ClntDtStMastermov_codigo.Value) + '.' + FormatFloat('000', ClntDtStMastermov_item.Value);
  if VarName = 'sParcela' then
    begin
      with QryCount do
      begin
        Close;
        Params.ParamByName('mov_codigo').AsInteger := ClntDtStMastermov_codigo.Value;
        Open;
      end;
      Value  := FormatFloat('000', ClntDtStMastermov_item.Value) + '/' + FormatFloat('000', QryCounttotal.AsInteger);
    end
end;

procedure TFrmContaPRPesq.btnOKFClick(Sender: TObject);
Var
  sSql :String;
begin
  FrmLogin.GR_Refresh;
  if Not Application.MessageBox('Deseja Confirmar OK Financeiro ?', 'Confirmação', MB_OKCANCEL+MB_ICONWARNING) = ID_OK then Abort;

  with QryStatus do
    begin
      sSql := SQL.Text;
      SQL.Clear;
      SQL.Add('update mny_movimento_item a set');
      SQL.Add('   a.mov_status = '    + '3,');
      SQL.Add('   a.mov_aut_financeiro = ' + QuotedStr(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' + FrmMain.USR_Nome));
      SQL.Add('   where a.mov_codigo = ' + CurrToStr(ClntDtStMastermov_codigo.Value));
      SQL.Add('   and a.mov_item = '     + CurrToStr(ClntDtStMastermov_item.Value));
      ExecSQL(True);
      SQL.Text := sSql;
      Application.MessageBox('Dados Atualizados Com Sucesso !!!', 'Confirmação', MB_OK);
      btnPesquisarClick(Self);
    end;
end;

procedure TFrmContaPRPesq.btnOKDClick(Sender: TObject);
Var
  sSql :String;
begin
  FrmLogin.GR_Refresh;
  if Not Application.MessageBox('Deseja Confirmar OK Diretoria ?', 'Confirmação', MB_OKCANCEL+MB_ICONWARNING) = ID_OK then Abort;

  with QryStatus do
    begin
      sSql := SQL.Text;
      SQL.Clear;
      SQL.Add('update mny_movimento_item a set');
      SQL.Add('   a.mov_status = '    + '4,');
      SQL.Add('   a.mov_aut_gerencia = ' + QuotedStr(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' + FrmMain.USR_Nome));
      SQL.Add('   where a.mov_codigo = ' + CurrToStr(ClntDtStMastermov_codigo.Value));
      SQL.Add('   and a.mov_item = '     + CurrToStr(ClntDtStMastermov_item.Value));
      ExecSQL(True);
      SQL.Text := sSql;
      Application.MessageBox('Dados Atualizados Com Sucesso !!!', 'Confirmação', MB_OK);
      btnPesquisarClick(Self);      
    end;
end;

procedure TFrmContaPRPesq.btnImprimirClick(Sender: TObject);
begin
  FrmLogin.GR_Refresh;
  QrySituacao.Close;
  QrySituacao.Open;
  btnPesquisarClick(Self);
  if FrMaster.PrepareReport then FrMaster.ShowPreparedReport;
end;

procedure TFrmContaPRPesq.btnPesquisarClick(Sender: TObject);
var
  sSQLOriginal :String;
  sSQL :String;
begin

  sSQL := QryMaster.SQL.Text;
  sSQLOriginal := QryMaster.SQL.Text;
  
  if ChkBxInclusao.Checked then
    begin
      sSQL := StringReplace(sSQL,'`mov_data_prev` between','mov_data_inclusao between',[rfReplaceAll]);
      QryMaster.SQL.Text := sSQL;
    end;

  FrmLogin.GR_Refresh;
  QrySituacao.Close;
  QrySituacao.Open;
  With QryMaster Do
    Begin
      Close;
      Params.ParamByName('nome').AsString := '%' + EdtPesquisar.Text + '%';
      ParamByName('data1').AsDate := EdtDataInicial.Date;
      ParamByName('data2').AsDate := EdtDataFinal.Date;
      Open;
      ClntDtStMaster.Close;
      ClntDtStMaster.Open;
    End;
   QryMaster.SQL.Text := sSQLOriginal;
end;

procedure TFrmContaPRPesq.FrMasterGetValue(const VarName: String;
  var Value: Variant);
begin
  if VarName = 'sUsuario' then Value := FrmMain.USR_Nome;
  if VarName = 'sData' then Value := FormatDateTime('dd/mm/yyyy', Date);
  if VarName = 'sHora' then Value := FormatDateTime('hh:mm:ss', Time);
end;

procedure TFrmContaPRPesq.DbGridDBTblVwCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if EdtBloco.Text = '' then
    Begin
      EdtFiltro.Text := ' where (concat(a.`mov_codigo`, "-", a.`mov_item`) = ' + QuotedStr(CurrToStr(ClntDtStMastermov_codigo.Value) + '-' + CurrToStr(ClntDtStMastermov_item.Value)) + ')';
      EdtBloco.Text := CurrToStr(ClntDtStMastermov_codigo.Value) + '-' + CurrToStr(ClntDtStMastermov_item.Value)
    End
  else
    Begin
      EdtFiltro.Text := EdtFiltro.Text + ' or  (concat(a.`mov_codigo`, "-", a.`mov_item`) = ' + QuotedStr(CurrToStr(ClntDtStMastermov_codigo.Value) + '-' + CurrToStr(ClntDtStMastermov_item.Value)) + ')';
      EdtBloco.Text :=  EdtBloco.Text + ', ' + CurrToStr(ClntDtStMastermov_codigo.Value) + '-' + CurrToStr(ClntDtStMastermov_item.Value);
    End;
end;

procedure TFrmContaPRPesq.btnLimparClick(Sender: TObject);
begin
  EdtBloco.Text := '';
  EdtFiltro.Text := '';
end;

procedure TFrmContaPRPesq.btnBlocoClick(Sender: TObject);
Var
  sSql :String;
begin

  FrmLogin.GR_Refresh;
  QrySituacao.Close;
  QrySituacao.Open;

  with QryRAceite do
  begin

    sSql := SQL.Text;
    SQL.Add(EdtFiltro.Text);
    SQL.Add(' order by a.`mov_codigo`, a.`mov_item` ');

    Close;
    //Params.ParamByName('mov_codigo').AsInteger := ClntDtStMastermov_codigo.Value;
    //Params.ParamByName('mov_item').AsInteger   := ClntDtStMastermov_item.Value;
    Open;
    if FrRAceite.PrepareReport Then FrRAceite.ShowPreparedReport;
    SQL.Text := sSql;
    EdtBloco.Text := '';
    EdtFiltro.Text := '';
  end;

end;

procedure TFrmContaPRPesq.FormCreate(Sender: TObject);
begin
 sCaixa := 'N';
end;

procedure TFrmContaPRPesq.btnBaixarClick(Sender: TObject);
var
  sSQL :String;
begin
  with QryTransaction do
  begin
    sSql := SQL.Text;
    SQL.Clear;
    SQL.Add('update mny_movimento_item a set');
    SQL.Add('    a.mov_status = '   + '6');
    //*** Falta Valores
    SQL.Add('   where a.mov_codigo = ' + CurrToStr(ClntDtStMastermov_codigo.Value));
    SQL.Add('   and a.mov_item = '     + CurrToStr(ClntDtStMastermov_item.Value));
    if Not Application.MessageBox('Deseja Realmente Baixar a Conta?', 'Confirmação', MB_OKCANCEL+MB_ICONQUESTION) = ID_OK then Exit;
    sSql := SQl.Text;
    ExecSQL(True);
    SQL.Text := sSql;
  end;
end;

procedure TFrmContaPRPesq.btnExcelClick(Sender: TObject);
begin
  DeleteFile('C:\Sistemas\iMoney\ContaPR.xls');
  Application.MessageBox('Dados Salvos Com Sucesso!!!', 'Confirmação', MB_OK+MB_ICONINFORMATION);
  DbGrdContaPR.SaveToXLS('C:\Sistemas\iMoney\ContaPR.xls', True);
  ShellExecute(handle,'open',PChar('C:\Sistemas\iMoney\ContaPR.xls'), '','',SW_SHOWNORMAL);
end;

procedure TFrmContaPRPesq.btnDocsClick(Sender: TObject);
begin
  FrmContaPRDoc := TFrmContaPRDoc.Create(Application);
  with FrmContaPRDoc do
  begin
    FrmContaPRDoc.ClntDtStMaster.Close;
    QryDoc.Close;
    QryDoc.Params.ParamByName('mov_codigo').AsInteger := FrmContaPRPesq.ClntDtStMastermov_codigo.Value;
    QryDoc.Open;
    ShowModal;
    Free;
  end;

end;

procedure TFrmContaPRPesq.PpMuIncluirClick(Sender: TObject);
begin
  FrmLogin.GR_Refresh;
  FrmPagtoListaView := TFrmPagtoListaView.Create(Application);
  with FrmPagtoListaView do
  begin
    ShowModal;
    Free;
  end;
end;

end.



