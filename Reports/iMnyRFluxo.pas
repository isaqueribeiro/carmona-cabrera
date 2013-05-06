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
    ImgR: TImage;
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
    QrySaldo: TSQLQuery;
    QrySaldocax_saldo: TFMTBCDField;
    QryDebito: TSQLQuery;
    QryDebitomov_val: TFMTBCDField;
    QryCredito: TSQLQuery;
    QryCreditomov_val: TFMTBCDField;
    ClntDtStFluxo: TClientDataSet;
    ClntDtStFluxoFlxData: TDateField;
    ClntDtStFluxoFlxDebito: TCurrencyField;
    ClntDtStFluxoFlxDebAcum: TCurrencyField;
    ClntDtStFluxoFlxReceita: TCurrencyField;
    ClntDtStFluxoFlxRecAcum: TCurrencyField;
    ClntDtStFluxoFlxFluxo: TCurrencyField;
    DbGrd: TcxGrid;
    DbGridDBTblVw: TcxGridDBTableView;
    DbGridLvl: TcxGridLevel;
    DtSFluxo: TDataSource;
    DbGridDBTblVwFlxData: TcxGridDBColumn;
    DbGridDBTblVwFlxDebito: TcxGridDBColumn;
    DbGridDBTblVwFlxDebAcum: TcxGridDBColumn;
    DbGridDBTblVwFlxReceita: TcxGridDBColumn;
    DbGridDBTblVwFlxRecAcum: TcxGridDBColumn;
    DbGridDBTblVwFlxFluxo: TcxGridDBColumn;
    Shape2: TShape;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Shape3: TShape;
    Label3: TLabel;
    Shape4: TShape;
    Label4: TLabel;
    Shape5: TShape;
    LblDados: TLabel;
    Label5: TLabel;
    Shape6: TShape;
    FrDtStFluxo: TfrxDBDataset;
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
var
  dDataOpe :TDate;
  dData1, dData2: TDate;
  iData :Integer;
  cDespValor, cDespAcum, cRecValor, cRecAcum, cFluxo :Currency;
  cDespAnt, cRecAnt :Currency ;
begin

   iData := 0;
   dDataIni := EdtDtIni.Date;
   dDataFim := EdtDtFin.Date;
   dDataOpe := EdtDtIni.Date -1;

   //*** Definindo Saldo Inicial
   while iData < 1 do
   begin
     with QrySaldo do
       begin
         Close;
         Params.ParamByName('data').AsDate := dDataOpe;
         Open;
       end;
       if CurrToStr(QrySaldocax_saldo.AsCurrency) = '0' then
         begin
           iData := 0;
           dDataOpe := dDataOpe - 1;
         end
       else
         begin
           iData := 1;
         end;
     end;

   with ClntDtStFluxo do
     begin
       Close;
       Open;
       Append;
       ClntDtStFluxoFlxData.Value    := dDataOpe;
       ClntDtStFluxoFlxDebito.Value  := 0;
       ClntDtStFluxoFlxDebAcum.Value := 0;
       ClntDtStFluxoFlxReceita.Value := QrySaldocax_saldo.AsCurrency;
       ClntDtStFluxoFlxRecAcum.Value := QrySaldocax_saldo.AsCurrency;
       ClntDtStFluxoFlxFluxo.Value   := QrySaldocax_saldo.AsCurrency;
       Post;
       Application.ProcessMessages;
     end;

   cDespValor := 0;
   cDespAcum := 0;
   cRecValor := 0;
   cRecAcum := QrySaldocax_saldo.AsCurrency;
   cFluxo  := 0;
   cDespAnt := 0;
   cRecAnt  := 0;

   //*** Recuperando Todos os Débitos/Créditos da Data
   while dDataIni <= dDataFim do
   begin
     cDespValor := 0;
     cRecValor := 0;
     cFluxo  := 0;
     //*** Débito na Data
     QryDebito.Close;
     QryDebito.Params.ParamByName('data1').AsDate := dDataIni;
     QryDebito.Open;

     //*** Crédito na Data
     QryCredito.Close;
     QryCredito.Params.ParamByName('data1').AsDate := dDataIni;
     QryCredito.Open;

     cDespAnt   := cDespAcum;
     cDespValor := QryDebitomov_val.AsCurrency;
     cDespAcum  := cDespAnt + cDespValor;

     cRecAnt   := cRecAcum;
     cRecValor := QryCreditomov_val.AsCurrency;
     cRecAcum  := cRecAnt + cRecValor;

     with ClntDtStFluxo do
     begin
       Close;
       Open;
       Append;
       ClntDtStFluxoFlxData.Value    := dDataIni;
       ClntDtStFluxoFlxDebito.Value  := cDespValor;
       ClntDtStFluxoFlxDebAcum.Value := cDespAcum;
       ClntDtStFluxoFlxReceita.Value := cRecValor;
       ClntDtStFluxoFlxRecAcum.Value := cRecAcum;
       ClntDtStFluxoFlxFluxo.Value   := cRecAcum - cDespAcum;
       Post;
       Application.ProcessMessages;
     end;
     dDataIni  := dDataIni + 1;
   end;

   Application.MessageBox('Fluxo de Caixa Gerado Com Sucesso !!!', 'Confirmação', MB_OK+MB_ICONINFORMATION);

   if FrRMain.PrepareReport then FrRMain.ShowPreparedReport;

end;

end.
