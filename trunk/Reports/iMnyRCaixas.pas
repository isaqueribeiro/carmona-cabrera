unit iMnyRCaixas;

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
  cxClasses, cxGridCustomView, cxGrid, Provider, dxExEdtr, dxDBGrid,
  dxDBCtrl, dxTL, dxDBTLCl, dxGrClms, dxCntner, ShellApi;

type
  TFrmRCaixas = class(TForm)
    ImgR: TImage;
    PnlMain: TPanel;
    btnImprimir: TcxButton;
    btnFechar: TcxButton;
    FrRMain: TfrxReport;
    QryRCaixas: TSQLQuery;
    Label2: TLabel;
    Shape3: TShape;
    Label3: TLabel;
    Shape4: TShape;
    Label4: TLabel;
    Shape5: TShape;
    FrDtStCaixas: TfrxDBDataset;
    PgCtrlLogin: TcxPageControl;
    TbShtPrincipal: TcxTabSheet;
    Label1: TLabel;
    cxGroupBox2: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    EdtDtIni: TcxDateEdit;
    EdtDtFin: TcxDateEdit;
    QryRCaixascax_data: TDateField;
    QryRCaixascax_num: TIntegerField;
    QryRCaixascax_seq: TSmallintField;
    QryRCaixaspes_nome_fantasia: TStringField;
    QryRCaixascax_historico: TStringField;
    QryRCaixascax_valor: TFMTBCDField;
    DtStPrvdr: TDataSetProvider;
    QryRCaixasprint_parcela: TStringField;
    ClntDtStCaixas: TClientDataSet;
    ClntDtStCaixascax_data: TDateField;
    ClntDtStCaixascax_num: TIntegerField;
    ClntDtStCaixascax_seq: TSmallintField;
    ClntDtStCaixaspes_nome_fantasia: TStringField;
    ClntDtStCaixascax_historico: TStringField;
    ClntDtStCaixascax_valor: TFMTBCDField;
    ClntDtStCaixasprint_parcela: TStringField;
    QryRCaixasmov_documento: TStringField;
    ClntDtStCaixasmov_documento: TStringField;
    DtSRCaixas: TDataSource;
    DbGrdContaPR: TdxDBGrid;
    DbGrdContaPRcax_data: TdxDBGridDateColumn;
    DbGrdContaPRcax_num: TdxDBGridMaskColumn;
    DbGrdContaPRcax_seq: TdxDBGridMaskColumn;
    DbGrdContaPRpes_nome_fantasia: TdxDBGridMaskColumn;
    DbGrdContaPRcax_historico: TdxDBGridMaskColumn;
    DbGrdContaPRcax_valor: TdxDBGridColumn;
    DbGrdContaPRprint_parcela: TdxDBGridMaskColumn;
    DbGrdContaPRmov_documento: TdxDBGridMaskColumn;
    btnExcel: TcxButton;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FrRMainGetValue(const VarName: String; var Value: Variant);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    dDataIni, dDataFim :TDate;
  end;

var
  FrmRCaixas: TFrmRCaixas;

implementation

uses KeyLogin, KeyMain;

{$R *.dfm}

procedure TFrmRCaixas.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRCaixas.FormShow(Sender: TObject);
begin
  EdtDtIni.Date := Date;
  EdtDtFin.Date := Date;
end;

procedure TFrmRCaixas.FrRMainGetValue(const VarName: String;
  var Value: Variant);
begin
  If VarName = 'sUsuario' Then Value := FrmMain.USR_Nome;
  If VarName = 'sData' Then Value    := FormatDateTime('dd/mm/yyyy', Date);
  If VarName = 'sHora' Then Value    := FormatDateTime('hh:mm:ss', Time);
  If VarName = 'sData1' Then Value   := FormatDateTime('dd/mm/yyyy', EdtDtIni.Date);
  If VarName = 'sData2' Then Value   := FormatDateTime('dd/mm/yyyy', EdtDtFin.Date);
end;

procedure TFrmRCaixas.btnImprimirClick(Sender: TObject);
begin
  with QryRCaixas do
  begin
    ClntDtStCaixas.Close;
    Close;
    Params.ParamByName('data1').AsDate := EdtDtIni.Date;
    Params.ParamByName('data2').AsDate := EdtDtFin.Date;
    Open;
    ClntDtStCaixas.Open;
  end;
  if FrRMain.PrepareReport then FrRMain.ShowPreparedReport;

end;

procedure TFrmRCaixas.btnExcelClick(Sender: TObject);
begin
  with QryRCaixas do
  begin
    ClntDtStCaixas.Close;
    Close;
    Params.ParamByName('data1').AsDate := EdtDtIni.Date;
    Params.ParamByName('data2').AsDate := EdtDtFin.Date;
    Open;
    ClntDtStCaixas.Open;
  end;
  DeleteFile('C:\Sistemas\iMoney\Caixas.xls');
  Application.MessageBox('Dados Salvos Com Sucesso!!!', 'Confirmação', MB_OK+MB_ICONINFORMATION);
  DbGrdContaPR.SaveToXLS('C:\Sistemas\iMoney\Caixas.xls', True);
  ShellExecute(handle,'open',PChar('C:\Sistemas\iMoney\Caixas.xls'), '','',SW_SHOWNORMAL); 
end;

end.

