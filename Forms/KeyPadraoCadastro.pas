unit KeyPadraoCadastro;

interface

uses
  KeyFuncoes,
  KeyResource,
  KeyRequiredFields,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadrao, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, StdCtrls, cxButtons, ExtCtrls, cxControls, dxSkinsCore,
  dxSkinscxPCPainter, cxPC, cxContainer, cxEdit, cxGroupBox, FMTBcd, DB,
  DBClient, Provider, SqlExpr;

type
  TFrmPadraoCadastro = class(TFrmPadrao)
    PnlMain: TPanel;
    BvlFechar: TBevel;
    btnFechar: TcxButton;
    BtnNovo: TcxButton;
    BtnCancelar: TcxButton;
    BtnSalvar: TcxButton;
    BvlMain: TBevel;
    PnlTabela: TPanel;
    PgCtrlMain: TcxPageControl;
    TbsPrincipal: TcxTabSheet;
    GrpDadosNominais: TcxGroupBox;
    QryMaster: TSQLQuery;
    DspMaster: TDataSetProvider;
    CdsMaster: TClientDataSet;
    DtsMaster: TDataSource;
    BtnEditar: TcxButton;
    BtnExcluir: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CdsMasterBeforeDelete(DataSet: TDataSet);
    procedure CdsMasterBeforePost(DataSet: TDataSet);
    procedure DtsMasterStateChange(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FAbrirTabela : Boolean;
    FSQL_Master : TStringList;
    FAutoInsert,
    FAutoEdit  : Boolean;
    FRegistroInserido,
    FRegistroEditado : Boolean;
  public
    { Public declarations }
    property AbrirTabela : Boolean read FAbrirTabela write FAbrirTabela;
    property SQL_Master : TStringList read FSQL_Master write FSQL_Master;
    property AutoInsert : Boolean read FAutoInsert write FAutoInsert;
    property AutoEdit   : Boolean read FAutoEdit write FAutoEdit;
    property RegistroInserido : Boolean read FRegistroInserido;
    property RegistroEditado : Boolean read FRegistroEditado;

    procedure SetParametrosPesquisa(const vParams : Array of Variant);
    procedure VisualizarConsulta; virtual; abstract;

    function ExecutarPesquisa : Boolean; virtual; abstract;
    function ExecutarInsercao : Boolean; virtual; abstract;
    function ExecutarAlteracao : Boolean; virtual; abstract;
  end;

var
  FrmPadraoCadastro: TFrmPadraoCadastro;

implementation

{$R *.dfm}

procedure TFrmPadraoCadastro.FormShow(Sender: TObject);
begin
  inherited;
  if ( Assigned(ConexaoDB) and (QryMaster.SQLConnection = nil) ) then
    QryMaster.SQLConnection := ConexaoDB;

  if AbrirTabela then
    ExecutarPesquisa;
end;

procedure TFrmPadraoCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  FSQL_Master := TStringList.Create;
  FSQL_Master.AddStrings( QryMaster.SQL );

  PgCtrlMain.ActivePage := TbsPrincipal;
  AbrirTabela := False;

  FAutoInsert := False;
  FAutoEdit   := False;
  FRegistroInserido := False;
  FRegistroEditado  := False;
end;

procedure TFrmPadraoCadastro.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmPadraoCadastro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  Case Key of
    // Inserir
    VK_INSERT:
      begin
        if ( BtnNovo.Visible and BtnNovo.Enabled ) then
          BtnNovo.Click;

        if ( (PgCtrlMain.ActivePage = TbsPrincipal) and GrpDadosNominais.Visible and GrpDadosNominais.Enabled ) then
          GrpDadosNominais.SetFocus;
      end;

    // Editar
    VK_F2:
      begin
        if not CdsMaster.IsEmpty then
          if ( BtnEditar.Visible and BtnEditar.Enabled ) then
            BtnEditar.Click;

        if ( (PgCtrlMain.ActivePage = TbsPrincipal) and GrpDadosNominais.Visible and GrpDadosNominais.Enabled ) then
          GrpDadosNominais.SetFocus;
      end;

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
      end;

    // Cancelar edição
    VK_ESCAPE:
      begin
        if CdsMaster.State in [dsEdit, dsInsert] then
        begin
          if CdsMaster.Modified then
          begin
            if ShowMessageConfirm('Deseja cancelar a edição do registtro?', 'Edição') then
              CdsMaster.Cancel;
          end
          else
            CdsMaster.Cancel;    
        end
        else
        if (PgCtrlMain.ActivePage <> TbsPrincipal) then
          PgCtrlMain.ActivePage := TbsPrincipal;
      end;
  end;

end;

procedure TFrmPadraoCadastro.CdsMasterBeforeDelete(DataSet: TDataSet);
begin
  if ShowMessageConfirm('Confirma a exclusão do registro selecionado?', 'Excluir') then
    if ExecutarDeleteTable(DataSet, NomeTabela) then
      Exit
    else
      Abort
  else
    Abort;
end;

procedure TFrmPadraoCadastro.CdsMasterBeforePost(DataSet: TDataSet);
begin
  if ExistRequiredFields(Self, CdsMaster, Self.Caption) then
    Abort;
    
  if CdsMaster.State = dsInsert then
  begin
    FRegistroInserido := ExecutarInsertTable(DataSet, NomeTabela);
    if RegistroInserido then
      Exit
    else
      Abort;
  end;

  if CdsMaster.State = dsEdit then
  begin
    FRegistroEditado := ExecutarUpdateTable(DataSet, NomeTabela);
    if RegistroEditado then
      Exit
    else
      Abort;
  end;
end;

procedure TFrmPadraoCadastro.DtsMasterStateChange(Sender: TObject);
begin
  BtnNovo.Enabled     := ( not (CdsMaster.State in [dsEdit, dsInsert]) and CdsMaster.Active );
  BtnEditar.Enabled   := ( not (CdsMaster.State in [dsEdit, dsInsert]) and (not CdsMaster.IsEmpty) );
  BtnExcluir.Enabled  := ( not (CdsMaster.State in [dsEdit, dsInsert]) and (not CdsMaster.IsEmpty) );
  BtnCancelar.Enabled := ( CdsMaster.State in [dsEdit, dsInsert] );
  BtnSalvar.Enabled   := ( CdsMaster.State in [dsEdit, dsInsert] );
  btnFechar.Enabled   := ( not (CdsMaster.State in [dsEdit, dsInsert]) );
end;

procedure TFrmPadraoCadastro.BtnNovoClick(Sender: TObject);
begin
  CdsMaster.Append;
end;

procedure TFrmPadraoCadastro.BtnEditarClick(Sender: TObject);
begin
  if not CdsMaster.FieldByName(CampoChave).IsNull then
    CdsMaster.Edit;
end;

procedure TFrmPadraoCadastro.BtnExcluirClick(Sender: TObject);
begin
  if not CdsMaster.FieldByName(CampoChave).IsNull then
    CdsMaster.Delete;
end;

procedure TFrmPadraoCadastro.BtnCancelarClick(Sender: TObject);
begin
  if CdsMaster.Modified then
  begin
    if ShowMessageConfirm('Deseja cancelar a edição do registtro?', 'Edição') then
      CdsMaster.Cancel;
  end
  else
    CdsMaster.Cancel;
end;

procedure TFrmPadraoCadastro.BtnSalvarClick(Sender: TObject);
begin
  if ShowMessageConfirm('Deseja salvar a edição do registtro?', 'Salvar') then
    CdsMaster.Post;
end;

procedure TFrmPadraoCadastro.SetParametrosPesquisa(const vParams: Array of Variant);
var
  I : Integer;
begin
  with CdsMaster do
  begin
    for I := Low(vParams) to High(vParams) do
    begin
      if Params.Count > I then
        Params[I].Value := vParams[I];
    end;
  end;
end;

procedure TFrmPadraoCadastro.FormActivate(Sender: TObject);
begin
  if AutoInsert then
    if ( BtnNovo.Visible and BtnNovo.Enabled ) then
    begin
      BtnNovo.Click;
      Exit;
    end;

  if AutoEdit then
    if ( BtnEditar.Visible and BtnEditar.Enabled ) then
    begin
      BtnEditar.Click;
      Exit;
    end;
end;

end.
