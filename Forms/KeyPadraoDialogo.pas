unit KeyPadraoDialogo;

interface

uses
  KeyFuncoes,
  KeyResource,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadrao, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, StdCtrls, cxButtons, ExtCtrls, cxControls, cxContainer, cxEdit,
  dxSkinsCore, cxGroupBox;

type
  TFrmPadraoDialogo = class(TFrmPadrao)
    PnlBotoes: TPanel;
    btnCancelar: TcxButton;
    BtnConfirmar: TcxButton;
    PnlControle: TPanel;
    GrpBxControle: TcxGroupBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPadraoDialogo: TFrmPadraoDialogo;

implementation

{$R *.dfm}

end.
