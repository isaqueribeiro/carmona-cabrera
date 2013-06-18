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
    GrpDadosNominais: TcxGroupBox;
    BvlFechar: TBevel;
    procedure DtsMasterStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure DbgTabelaDBDblClick(Sender: TObject);
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
  BtnNovo.Enabled     := ( not (CdsMaster.State in [dsEdit, dsInsert]) and CdsMaster.Active );
  BtnEditar.Enabled   := ( not (CdsMaster.State in [dsEdit, dsInsert]) and (not CdsMaster.IsEmpty) );
  BtnExcluir.Enabled  := ( not (CdsMaster.State in [dsEdit, dsInsert]) and (not CdsMaster.IsEmpty) );
  BtnCancelar.Enabled := ( CdsMaster.State in [dsEdit, dsInsert] );
  BtnSalvar.Enabled   := ( CdsMaster.State in [dsEdit, dsInsert] );

  TbsPrincipal.TabVisible  := ( not (CdsMaster.State in [dsEdit, dsInsert]) );
  TbsFormulario.TabVisible := ( CdsMaster.State in [dsEdit, dsInsert] );

  if TbsPrincipal.TabVisible then
    PgCtrlMain.ActivePage := TbsPrincipal
  else
  if TbsFormulario.TabVisible then
    PgCtrlMain.ActivePage := TbsFormulario;
end;

procedure TFrmPadraoTabelaFormularioCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  TbsFormulario.TabVisible := False;
end;

procedure TFrmPadraoTabelaFormularioCadastro.FormShow(Sender: TObject);
begin
  inherited;
  DtsMasterStateChange( DtsMaster );
end;

procedure TFrmPadraoTabelaFormularioCadastro.BtnNovoClick(Sender: TObject);
begin
  CdsMaster.Append;
end;

procedure TFrmPadraoTabelaFormularioCadastro.BtnEditarClick(
  Sender: TObject);
begin
  if not CdsMaster.FieldByName(CampoChave).IsNull then
    CdsMaster.Edit;
end;

procedure TFrmPadraoTabelaFormularioCadastro.BtnExcluirClick(
  Sender: TObject);
begin
  if not CdsMaster.FieldByName(CampoChave).IsNull then
    CdsMaster.Delete;
end;

procedure TFrmPadraoTabelaFormularioCadastro.BtnCancelarClick(
  Sender: TObject);
begin
  if ShowMessageConfirm('Deseja cancelar a edição do registtro?', 'Edição') then
    CdsMaster.Cancel;
end;

procedure TFrmPadraoTabelaFormularioCadastro.BtnSalvarClick(
  Sender: TObject);
begin
  if ShowMessageConfirm('Deseja salvar a edição do registtro?', 'Salvar') then
    CdsMaster.Post;
end;

procedure TFrmPadraoTabelaFormularioCadastro.DbgTabelaDBDblClick(
  Sender: TObject);
begin
  if not BtnSelecionar.Visible then
  begin
    if BtnEditar.Visible and BtnEditar.Enabled then
      BtnEditar.Click;
  end
  else
    inherited;
end;

end.
