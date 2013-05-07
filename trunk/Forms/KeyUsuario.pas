unit KeyUsuario;

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
  cxLookAndFeels;

type
  TFrmUsuario = class(TForm)
    PgCtrlMain: TcxPageControl;
    TbShtPrincipal: TcxTabSheet;
    PnlMain: TPanel;
    btnFechar: TcxButton;
    DbEdtCodigo: TcxDBTextEdit;
    DbEdtNome: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    DbCmbBxNivel: TcxDBImageComboBox;
    DbCmbBxStatus: TcxDBImageComboBox;
    btnEditar: TcxButton;
    btnNovo: TcxButton;
    DbEdtSenha: TcxDBTextEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUsuario: TFrmUsuario;

implementation

uses
  {$IFDEF IMONEY}
    KeyMain
  , KeyLogin
  {$ENDIF}
  {$IFDEF ISTORE}
    iStrMain
  , iStrLogin
  {$ENDIF}
  , KeyUsuarioPesq
  , KeyResource;

{$R *.dfm}

procedure TFrmUsuario.btnNovoClick(Sender: TObject);
begin
  FrmUsuarioPesq.ClntDtStMaster.Append;
end;

procedure TFrmUsuario.btnEditarClick(Sender: TObject);
begin
  FrmUsuarioPesq.ClntDtStMaster.Post;
end;

procedure TFrmUsuario.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.
