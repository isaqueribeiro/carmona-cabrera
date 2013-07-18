unit iMnyPessoa;

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
  cxImage, FMTBcd, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DB,
  SqlExpr, cxLookAndFeels;

type
  TFrmPessoa = class(TForm)
    PgCtrlMain: TcxPageControl;
    TbShtPrincipal: TcxTabSheet;
    PnlMain: TPanel;
    btnFechar: TcxButton;
    DbEdtCodigo: TcxDBTextEdit;
    DbEdtRazao: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    btnEditar: TcxButton;
    btnNovo: TcxButton;
    DbEdFantasia: TcxDBTextEdit;
    DbEdtCNPJ: TcxDBTextEdit;
    DbEdtEnd: TcxDBTextEdit;
    cxLabel6: TcxLabel;
    DbEdtCidade: TcxDBTextEdit;
    DbEdtBairro: TcxDBTextEdit;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    DbEdtCEP: TcxDBTextEdit;
    cxLabel9: TcxLabel;
    DbEdtUF: TcxDBTextEdit;
    cxLabel10: TcxLabel;
    DbEdtContato: TcxDBTextEdit;
    cxLabel11: TcxLabel;
    DbEdtFones: TcxDBTextEdit;
    cxLabel12: TcxLabel;
    DbEdtObs: TcxDBTextEdit;
    DBEdtImagem: TcxLabel;
    QryTipo: TSQLQuery;
    QryTipotip_codigo: TSmallintField;
    QryTipotip_nome: TStringField;
    DtSTipo: TDataSource;
    LkpCmbBxTipo: TcxDBLookupComboBox;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    DbEdtMun: TcxDBTextEdit;
    cxLabel15: TcxLabel;
    DbEdtEst: TcxDBTextEdit;
    DbEdtEmail: TcxDBTextEdit;
    QryConta: TSQLQuery;
    DtSConta: TDataSource;
    QryContaccr_codigo: TSmallintField;
    QryContaccr_nome: TStringField;
    LkpCmbBxConta: TcxDBLookupComboBox;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    DbImgCmbBxStatus: TcxDBImageComboBox;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPessoa: TFrmPessoa;

implementation

uses KeyLogin, KeyMain, KeyResource, iMnyPessoaPesq;

{$R *.dfm}

procedure TFrmPessoa.btnNovoClick(Sender: TObject);
begin
  FrmPessoaPesq.ClntDtStMaster.Append;
end;

procedure TFrmPessoa.btnEditarClick(Sender: TObject);
begin
  FrmPessoaPesq.ClntDtStMaster.Post;
end;

procedure TFrmPessoa.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPessoa.FormShow(Sender: TObject);
begin
  QryTipo.Open;
  QryConta.Open;
end;

end.
