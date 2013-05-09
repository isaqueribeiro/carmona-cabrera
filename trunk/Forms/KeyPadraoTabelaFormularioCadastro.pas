unit KeyPadraoTabelaFormularioCadastro;

interface

uses
  KeyFuncoes,
  KeyResource,
  KeyPadrao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadraoTabela, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, dxSkinsCore,
  dxSkinscxPCPainter, cxContainer, cxEdit, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, FMTBcd, Provider,
  DBClient, SqlExpr, StdCtrls, ExtCtrls, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxMaskEdit, cxDropDownEdit, cxImageComboBox,
  cxTextEdit, cxGroupBox, cxPC, cxButtons;

type
  TFrmPadraoTabelaFormularioCadastro = class(TFrmPadraoTabela)
    TbsFormulario: TcxTabSheet;
    BtnNovo: TcxButton;
    BtnEditar: TcxButton;
    BtnExcluir: TcxButton;
    BtnCancelar: TcxButton;
    BtnSalvar: TcxButton;
    procedure DtsMasterStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPadraoTabelaFormularioCadastro: TFrmPadraoTabelaFormularioCadastro;

implementation

{$R *.dfm}

procedure TFrmPadraoTabelaFormularioCadastro.DtsMasterStateChange(
  Sender: TObject);
begin
  inherited;
  BtnNovo.Enabled     := ( not (CdsMaster.State in [dsEdit, dsInset]) and CdsMaster.Active );
  BtnEditar.Enabled   := ( not (CdsMaster.State in [dsEdit, dsInset]) and (not CdsMaster.IsEmpty) );
  BtnExcluir.Enabled  := ( not (CdsMaster.State in [dsEdit, dsInset]) and (not CdsMaster.IsEmpty) );
  BtnCancelar.Enabled := ( CdsMaster.State in [dsEdit, dsInset] );
  BtnSalvar.Enabled   := ( CdsMaster.State in [dsEdit, dsInset] );
end;

procedure TFrmPadraoTabelaFormularioCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  TbsFormulario.TabVisible := False;
end;

end.
