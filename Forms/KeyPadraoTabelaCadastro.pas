unit KeyPadraoTabelaCadastro;

interface

uses
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
  TFrmPadraoTabelaCadastro = class(TFrmPadraoTabela)
    BtnNovo: TcxButton;
    BtnEditar: TcxButton;
    BtnExcluir: TcxButton;
    BvlFechar: TBevel;
    procedure DtsMasterStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure DbgTabelaDBDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    function PermitirExcluirRegistro : Boolean; virtual; abstract;
  end;

var
  FrmPadraoTabelaCadastro: TFrmPadraoTabelaCadastro;

implementation

{$R *.dfm}

procedure TFrmPadraoTabelaCadastro.DtsMasterStateChange(Sender: TObject);
begin
  inherited;
  BtnNovo.Enabled     := ( not (CdsMaster.State in [dsEdit, dsInsert]) and CdsMaster.Active );
  BtnEditar.Enabled   := ( not (CdsMaster.State in [dsEdit, dsInsert]) and (not CdsMaster.IsEmpty) );
  BtnExcluir.Enabled  := ( not (CdsMaster.State in [dsEdit, dsInsert]) and (not CdsMaster.IsEmpty) );
end;

procedure TFrmPadraoTabelaCadastro.FormShow(Sender: TObject);
begin
  inherited;
  DtsMasterStateChange( DtsMaster );
end;

procedure TFrmPadraoTabelaCadastro.BtnExcluirClick(Sender: TObject);
begin
  if not CdsMaster.FieldByName(CampoChave).IsNull then
    if PermitirExcluirRegistro then
      CdsMaster.Delete;
end;

procedure TFrmPadraoTabelaCadastro.DbgTabelaDBDblClick(Sender: TObject);
begin
  if not BtnSelecionar.Visible then
  begin
    if BtnEditar.Visible and BtnEditar.Enabled then
      BtnEditar.Click; 
  end
  else
    inherited;
end;

procedure TFrmPadraoTabelaCadastro.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  Case Key of
    // Inserir
    VK_INSERT:
      begin
        if BtnNovo.Visible and BtnNovo.Enabled then
          BtnNovo.Click;
      end;

    // Editar
    VK_F2:
      begin
        if BtnEditar.Visible and BtnEditar.Enabled then
          BtnEditar.Click;
      end;

    // Posicionar para pesquisa
    VK_F3:
      if ( (PgCtrlMain.ActivePage = TbsPrincipal) and EdtPesquisa.Visible and EdtPesquisa.Enabled ) then
        EdtPesquisa.SetFocus;

    // Fechar formulário
    VK_F4:
      if ( Shift = [ssCtrl] ) then
        btnFechar.Click;

    // Atualizar pesquisa
    VK_F5:
      if CdsMaster.Active then
      begin
        CdsMaster.Close;
        CdsMaster.Open;
      end
      else
      if ( (PgCtrlMain.ActivePage = TbsPrincipal) and BtnPesquisar.Visible and BtnPesquisar.Enabled ) then
        BtnPesquisar.Click;

    // Voltar para guia principal
    VK_ESCAPE:
      begin
        if (PgCtrlMain.ActivePage <> TbsPrincipal) then
          PgCtrlMain.ActivePage := TbsPrincipal;
      end;
  end;

end;

end.
