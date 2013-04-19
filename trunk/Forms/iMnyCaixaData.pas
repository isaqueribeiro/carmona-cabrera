unit iMnyCaixaData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit,
  cxLabel, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, FMTBcd, DB,
  SqlExpr, DBClient, cxGroupBox, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, Provider,
  ExtCtrls, cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TFrmCaixaData = class(TForm)
    QryMaster: TSQLQuery;
    QryMastercax_num: TIntegerField;
    QryMastercax_data: TDateField;
    QryMastercax_hora: TTimeField;
    QryMastercax_usuario: TStringField;
    ClntDtStMaster: TClientDataSet;
    ClntDtStMastercax_num: TIntegerField;
    ClntDtStMastercax_data: TDateField;
    ClntDtStMastercax_hora: TTimeField;
    ClntDtStMastercax_usuario: TStringField;
    GrpBxData: TcxGroupBox;
    DtEdtData: TcxDateEdit;
    btnPesquisar: TcxButton;
    DbGrd: TcxGrid;
    DbGridDBTblVw: TcxGridDBTableView;
    DbGridLvl: TcxGridLevel;
    Label1: TLabel;
    Shape1: TShape;
    DtStPvdMaster: TDataSetProvider;
    QryMasterusr_nome: TStringField;
    QryMastercax_status: TStringField;
    ClntDtStMasterusr_nome: TStringField;
    ClntDtStMastercax_status: TStringField;
    DtSMaster: TDataSource;
    DbGridDBTblVwcax_num: TcxGridDBColumn;
    DbGridDBTblVwcax_data: TcxGridDBColumn;
    DbGridDBTblVwcax_hora: TcxGridDBColumn;
    DbGridDBTblVwusr_nome: TcxGridDBColumn;
    DbGridDBTblVwcax_status: TcxGridDBColumn;
    btnCarregar: TcxButton;
    QryMasteruni_nome: TStringField;
    ClntDtStMasteruni_nome: TStringField;
    DbGridDBTblVwColumn1uni_nome: TcxGridDBColumn;
    btnNovo: TcxButton;
    btnFechar: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnCarregarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCaixaData: TFrmCaixaData;

implementation

uses KeyResource, KeyLogin, KeyMain, iMnyCaixa;

{$R *.dfm}

procedure TFrmCaixaData.FormCreate(Sender: TObject);
begin
  DtEdtData.Date := Date;
end;

procedure TFrmCaixaData.btnPesquisarClick(Sender: TObject);
begin
  with QryMaster do
  begin
    ClntDtStMaster.Close;
    Close;
    ParamByName('usuario').AsString := '%'; //FrmMain.USR_Nome;
    ParamByName('data').AsDate := DtEdtData.Date;
    Open;
    ClntDtStMaster.Open;
    if QryMaster.IsEmpty then btnCarregar.Caption := '&Abrir Caixa'
    else btnCarregar.Caption := '&Carregar Caixa';

  end;
end;

procedure TFrmCaixaData.btnCarregarClick(Sender: TObject);
begin
{  if FrmMain.USR_Nome <> ClntDtStMasterusr_nome.Value then
    begin
      FrmCaixa.iClose := 2;
    end
  else
    begin
      FrmCaixa.iClose := 1;
    end; }

  Close;
end;

procedure TFrmCaixaData.btnNovoClick(Sender: TObject);
begin
  QryMaster.Close;
  ClntDtStMaster.Close;
  Close;
end;

procedure TFrmCaixaData.btnFecharClick(Sender: TObject);
begin
  FrmCaixa.iClose := 1;
  Close;
end;

end.
