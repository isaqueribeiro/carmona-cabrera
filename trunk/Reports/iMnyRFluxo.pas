unit iMnyRFluxo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxGraphics, cxTextEdit, cxLabel, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxControls, cxContainer, cxEdit, cxGroupBox, ExtCtrls, Menus, StdCtrls,
  cxButtons, dxSkinscxPCPainter, cxPC, DB, FIBDataSet, pFIBDataSet,
  cxStyles, cxSchedulerStorage, cxSchedulerCustomControls,
  cxSchedulerDateNavigator, cxDateNavigator, ActnList, frxClass, frxDBSet,
  frxChart, cxCalendar, cxCheckBox, cxSpinEdit, cxTimeEdit, FMTBcd, SqlExpr,
  DBClient, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid;

type
  TFrmRFluxo = class(TForm)
    PgCtrlLogin: TcxPageControl;
    TbShtPrincipal: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    PnlMain: TPanel;
    btnImprimir: TcxButton;
    btnFechar: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    EdtDtIni: TcxDateEdit;
    EdtDtFin: TcxDateEdit;
    FrRMain: TfrxReport;
    QryDDiaCon: TSQLQuery;
    ClntDtStFluxo: TClientDataSet;
    DbGrd: TcxGrid;
    DbGridDBTblVw: TcxGridDBTableView;
    DbGridLvl: TcxGridLevel;
    DtSFluxo: TDataSource;
    Shape2: TShape;
    Label2: TLabel;
    Shape3: TShape;
    Label3: TLabel;
    Shape4: TShape;
    Label4: TLabel;
    Shape5: TShape;
    LblDados: TLabel;
    FrDtStFluxo: TfrxDBDataset;
    ClntDtStFluxoDtStData: TDateField;
    ClntDtStFluxoDtStDDiaCon: TBCDField;
    ClntDtStFluxoDtStDDiaPrev: TBCDField;
    ClntDtStFluxoDtStDProCon: TBCDField;
    ClntDtStFluxoDtStDProPrev: TBCDField;
    ClntDtStFluxoDtStDAtrCon: TBCDField;
    ClntDtStFluxoDtStDAtrPrev: TBCDField;
    ClntDtStFluxoDtStDTotCon: TBCDField;
    ClntDtStFluxoDtStDTotPrev: TBCDField;
    ClntDtStFluxoDtStDTotTot: TBCDField;
    ClntDtStFluxoDtStDValAcu: TBCDField;
    ClntDtStFluxoDtStRVal: TBCDField;
    ClntDtStFluxoDtStRValAcu: TBCDField;
    ClntDtStFluxoDtStFluxo: TBCDField;
    DbGridDBTblVwDtStData: TcxGridDBColumn;
    DbGridDBTblVwDtStDDiaCon: TcxGridDBColumn;
    DbGridDBTblVwDtStDDiaPrev: TcxGridDBColumn;
    DbGridDBTblVwDtStDProCon: TcxGridDBColumn;
    DbGridDBTblVwDtStDProPrev: TcxGridDBColumn;
    DbGridDBTblVwDtStDAtrCon: TcxGridDBColumn;
    DbGridDBTblVwDtStDAtrPrev: TcxGridDBColumn;
    DbGridDBTblVwDtStDTotCon: TcxGridDBColumn;
    DbGridDBTblVwDtStDTotPrev: TcxGridDBColumn;
    DbGridDBTblVwDtStDTotTot: TcxGridDBColumn;
    DbGridDBTblVwDtStDValAcu: TcxGridDBColumn;
    DbGridDBTblVwDtStRVal: TcxGridDBColumn;
    DbGridDBTblVwDtStRValAcu: TcxGridDBColumn;
    DbGridDBTblVwDtStFluxo: TcxGridDBColumn;
    Shape7: TShape;
    Label6: TLabel;
    Shape8: TShape;
    Label7: TLabel;
    Shape9: TShape;
    Label8: TLabel;
    Shape10: TShape;
    Label9: TLabel;
    Label10: TLabel;
    Shape11: TShape;
    Shape12: TShape;
    Label11: TLabel;
    Shape13: TShape;
    Label12: TLabel;
    Label13: TLabel;
    Shape14: TShape;
    QryDDiaConmov_valor: TFMTBCDField;
    QryDDiaPrev: TSQLQuery;
    QryDDiaPrevmov_valor: TFMTBCDField;
    QryDProCon: TSQLQuery;
    QryDProPrev: TSQLQuery;
    QryDProConmov_valor: TFMTBCDField;
    QryDProPrevmov_valor: TFMTBCDField;
    QryDAtrPrev: TSQLQuery;
    QryDAtrPrevmov_valor: TFMTBCDField;
    QryDAtrCon: TSQLQuery;
    QryDAtrConmov_valor: TFMTBCDField;
    QryReceita: TSQLQuery;
    QryReceitamov_valor: TFMTBCDField;
    EdtSaldo: TEdit;
    LblSaldo: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FrRMainGetValue(const VarName: String; var Value: Variant);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    dDataIni, dDataFim :TDate;
  end;

var
  FrmRFluxo: TFrmRFluxo;

implementation

uses KeyLogin, KeyMain;

{$R *.dfm}

procedure TFrmRFluxo.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRFluxo.FormShow(Sender: TObject);
begin
  EdtDtIni.Date := Date;
  EdtDtFin.Date := Date;
  with ClntDtStFluxo do
  begin
    Close;
    Open;
    while not Eof do
    begin
      Delete;
    end;
  end;
end;

procedure TFrmRFluxo.FrRMainGetValue(const VarName: String;
  var Value: Variant);
begin
  If VarName = 'sUsuario' Then Value := FrmMain.USR_Nome;
  If VarName = 'sData' Then Value    := FormatDateTime('dd/mm/yyyy', Date);
  If VarName = 'sHora' Then Value    := FormatDateTime('hh:mm:ss', Time);
  If VarName = 'sData1' Then Value   := FormatDateTime('dd/mm/yyyy', dDataIni);
  If VarName = 'sData2' Then Value   := FormatDateTime('dd/mm/yyyy', dDataFim);
end;

procedure TFrmRFluxo.btnImprimirClick(Sender: TObject);
Var
  dDataCorr, dDataSaldo :TDate;
  cDesTotCon, cDesTotPre, cDesTotTot, cDesTotAcu :Currency;
  cRec, cRecTot :Currency;
  cFluxo :Currency;
  sPri :String;
begin
  //*** Calculando Saldo
  dDataSaldo := EdtDtIni.Date - 1;
  ClntDtStFluxo.Open;
  sPri := 'S';

  ClntDtStFluxo.Append;
  ClntDtStFluxoDtStData.Value := dDataSaldo;
  ClntDtStFluxoDtStFluxo.Value := StrToCurr(EdtSaldo.Text);
  ClntDTStFluxo.Post; 

  dDataCorr := EdtDtIni.Date;
  cDesTotCon  := 0;
  cDesTotPre  := 0;
  cDesTotTot  := 0;
  cDesTotAcu  := 0;

  cRec := 0;
  cRecTot := 0;

  //*** Laço de Data
  while dDataCorr <= EdtDtFin.Date do
  begin

    ClntDtStFluxo.Append;
    ClntDtStFluxoDtStData.Value := dDataCorr;
    //*** Despesas
    //*** Do Dia/Consolidada
    with QryDDiaCon do
    begin
      Close;
      Params.ParamByName('data1').AsDate := dDataCorr;
      Open;
      ClntDtStFluxoDtStDDiaCon.Value := QryDDiaConmov_valor.AsCurrency;
    end;
    //*** Do Dia/Previsão
    with QryDDiaPrev do
    begin
      Close;
      Params.ParamByName('data1').AsDate := dDataCorr;
      Open;
      ClntDtStFluxoDtStDDiaPrev.Value := QryDDiaPrevmov_valor.AsCurrency;
    end;

    //*** Do Prorrogada/Consolidada
    with QryDProCon do
    begin
      Close;
      Params.ParamByName('data1').AsDate := dDataCorr;
      Open;
      ClntDtStFluxoDtStDProCon.Value := QryDProConmov_valor.AsCurrency;
    end;
    //*** Do Prorrogada/Previsão
    with QryDProPrev do
    begin
      Close;
      Params.ParamByName('data1').AsDate := dDataCorr;
      Open;
      ClntDtStFluxoDtStDProPrev.Value := QryDProPrevmov_valor.AsCurrency;
    end;

    //*** Do Atraso/Consolidada
    with QryDAtrCon do
    begin
      Close;
      Params.ParamByName('data1').AsDate := dDataCorr;
      Open;
      ClntDtStFluxoDtStDAtrCon.Value := QryDAtrConmov_valor.AsCurrency;
    end;
    //*** Do Atraso/Previsão
    with QryDAtrPrev do
    begin
      Close;
      Params.ParamByName('data1').AsDate := dDataCorr;
      Open;
      ClntDtStFluxoDtStDAtrPrev.Value := QryDAtrPrevmov_valor.AsCurrency;
    end;

    //*** Receitas
    //*** Dia
    with QryReceita do
    begin
      Close;
      Params.ParamByName('data1').AsDate := dDataCorr;
      Open;
      ClntDtStFluxoDtStRVal.Value := QryReceitamov_valor.AsCurrency;
    end;

    cDesTotCon := QryDDiaConmov_valor.AsCurrency + QryDProConmov_valor.AsCurrency + QryDAtrConmov_valor.AsCurrency;
    cDesTotPre := QryDDiaPrevmov_valor.AsCurrency + QryDProPrevmov_valor.AsCurrency + QryDAtrPrevmov_valor.AsCurrency;
    cDesTotTot := cDesTotCon + cDesTotPre;
    cDesTotAcu := cDesTotAcu + cDesTotTot;

     if sPri = 'S' then
      begin
        cRec := QryReceitamov_valor.AsCurrency + StrToCurr(EdtSaldo.Text);
        sPri := 'N';
      end
    else
      cRec := QryReceitamov_valor.AsCurrency;
      
    cRecTot := cRecTot + cRec;

    ClntDtStFluxoDtStDTotCon.Value  := cDesTotCon;
    ClntDtStFluxoDtStDTotPrev.Value := cDesTotPre;
    ClntDtStFluxoDtStDTotTot.Value  := cDesTotTot;
    ClntDtStFluxoDtStDValAcu.Value  := ClntDtStFluxoDtStDValAcu.Value + cDesTotAcu;

    ClntDtStFluxoDtStRVal.Value := cRec;
    ClntDtStFluxoDtStRValAcu.Value := cRecTot;

    cFluxo := cRecTot - ClntDtStFluxoDtStDValAcu.Value;

    ClntDtStFluxoDtStFluxo.Value := cFluxo;

    ClntDtStFluxo.Post;
    Application.ProcessMessages;
    dDataCorr := dDataCorr + 1;
  end;
end;

end.
