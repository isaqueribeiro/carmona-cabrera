unit iStrMaterialCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadraoCadastro, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, dxSkinsCore,
  dxSkinscxPCPainter, cxContainer, cxEdit, FMTBcd, DB, DBClient, Provider,
  SqlExpr, cxGroupBox, cxPC, StdCtrls, cxButtons, ExtCtrls, cxTextEdit,
  cxDBEdit, cxLabel, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxMemo, cxImageComboBox;

type
  TFrmMaterialCadastro = class(TFrmPadraoCadastro)
    lblCodigo: TcxLabel;
    dbCodigo: TcxDBTextEdit;
    lblTipo: TcxLabel;
    cxLabel1: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    dbTipo: TcxDBLookupComboBox;
    cxLabel2: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    cxDBTextEdit3: TcxDBMemo;
    lblSituacao: TcxLabel;
    dbSituacao: TcxDBImageComboBox;
    cxLabel4: TcxLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    Bevel1: TBevel;
    GrpDadosAdcionais: TcxGroupBox;
    cxLabel5: TcxLabel;
    cxDBTextEdit5: TcxDBTextEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMaterialCadastro: TFrmMaterialCadastro;

implementation

uses
  KeyFuncoes
  {$IFDEF IMONEY}
  , KeyMain
  , KeyLogin
  {$ENDIF}
  {$IFDEF ISTORE}
  , iStrMain
  , iStrLogin
  {$ENDIF}
  , KeyResource
  , KeyPadrao;

{$R *.dfm}

end.
