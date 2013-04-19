unit iMnyEmpresa;

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
  cxImage;

type
  TFrmEmpresa = class(TForm)
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
    DbEdtFTP: TcxDBTextEdit;
    cxLabel11: TcxLabel;
    DbEdtSite: TcxDBTextEdit;
    cxLabel12: TcxLabel;
    DbEdtEmail: TcxDBTextEdit;
    DBEdtImagem: TcxLabel;
    DbImgLogo: TcxDBImage;
    DbLkpCmbBxAceite: TcxDBImageComboBox;
    cxLabel13: TcxLabel;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEmpresa: TFrmEmpresa;

implementation

uses KeyLogin, KeyMain, KeyResource, iMnyEmpresaPesq;

{$R *.dfm}

procedure TFrmEmpresa.btnNovoClick(Sender: TObject);
begin
  FrmEmpresaPesq.ClntDtStMaster.Append;
end;

procedure TFrmEmpresa.btnEditarClick(Sender: TObject);
begin
  FrmEmpresaPesq.ClntDtStMaster.Post;
end;

procedure TFrmEmpresa.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.
