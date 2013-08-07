unit KeyMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Math, StdCtrls, Dialogs, Menus, cxLookAndFeelPainters, cxButtons, ExtCtrls, DBCtrls,
  dxSkinsCore, dxSkinsdxBarPainter, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, Winsock,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, dxBar,
  cxClasses, ActnList, cxGraphics, dxSkinsdxStatusBarPainter, cxControls,
  dxStatusBar, cxContainer, cxEdit, cxLabel, jpeg, cxLookAndFeels,
  dxSkinsdxNavBar2Painter, dxNavBarCollns, dxNavBarBase, dxNavBar,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, DBXpress, SqlExpr,
  FMTBcd, DBClient, Provider;

type
  TFrmMain = class(TForm)
    BrMngr: TdxBarManager;
    BrMngrMenu: TdxBar;
    BrMngrEncerrar: TdxBar;
    siEncerrarSistema: TdxBarSubItem;
    bbFinalizar: TdxBarButton;
    bbBloquear: TdxBarButton;
    bbTrocarUsuario: TdxBarButton;
    bbEspaco: TdxBarButton;
    ActnLst: TActionList;
    StsBr: TdxStatusBar;
    TmrDateTime: TTimer;
    TmrBlock: TTimer;
    NavBar: TdxNavBar;
    NbgProcessos: TdxNavBarGroup;
    MnMain: TMainMenu;
    MnCadastros: TMenuItem;
    MnProcessos: TMenuItem;
    MnRelatorios: TMenuItem;
    MnSair: TMenuItem;
    MnEncerrarSistema: TMenuItem;
    bbEmpresa: TdxBarButton;
    bbDepto: TdxBarButton;
    bbObjeto: TdxBarButton;
    bbSistema: TdxBarButton;
    bbRecepcoes: TdxBarButton;
    bbUsuarios: TdxBarButton;
    TmrImagem: TTimer;
    bbBlock: TdxBarButton;
    bbImagem: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    ActnObjeto: TAction;
    bbObjetos: TMenuItem;
    LblSombra: TLabel;
    LblTitulo: TLabel;
    ImgMain: TImage;
    LblDesc: TLabel;
    bbUsuario: TMenuItem;
    ActnUsuario: TAction;
    ActnPermissao: TAction;
    bbEmpresas: TMenuItem;
    ActnEmpresa: TAction;
    bbSituacao: TMenuItem;
    bbTotalizador: TMenuItem;
    ActnTotalizador: TAction;
    ActnOrcamento: TAction;
    bbOrcamento: TMenuItem;
    ActnConta: TAction;
    bbContaContabil: TMenuItem;
    ActnSituacao: TAction;
    bbSeparador: TMenuItem;
    ActnCompetencia: TAction;
    bbCompetencia: TMenuItem;
    ActnSetor: TAction;
    bbSeparador2: TMenuItem;
    bbSetor: TMenuItem;
    bbUnidade: TMenuItem;
    ActnUnidade: TAction;
    ActnTipoCusto: TAction;
    bbTipoCusto: TMenuItem;
    ActnCentroCusto: TAction;
    bbCentroCusto: TMenuItem;
    ActnNegocio: TAction;
    bbNegocio: TMenuItem;
    ActnTipoDoc: TAction;
    bbTipoDoc: TMenuItem;
    ActnTipoPes: TAction;
    bbTipoPes: TMenuItem;
    ActnFormaPagto: TAction;
    bbFormaPagto: TMenuItem;
    ActnContaCorrente: TAction;
    bbCorrente: TMenuItem;
    bbTipoAceite: TMenuItem;
    ActnTipoAceite: TAction;
    bbPessoa: TMenuItem;
    ActnPessoa: TAction;
    bbContaPR: TMenuItem;
    ActnContaPR: TAction;
    bbPermissao: TMenuItem;
    ActnCaixa: TAction;
    bbCaixa: TMenuItem;
    QryQtde: TSQLQuery;
    QryQtdemov_codigo: TIntegerField;
    QryQtdeCOUNT: TFMTBCDField;
    btnAtualiza: TButton;
    QryAtualiza: TSQLQuery;
    QryPagto: TSQLQuery;
    QryPagtomov_codigo: TIntegerField;
    QryPagtomov_item: TSmallintField;
    btnAtualiza2: TButton;
    ActnRFluxo: TAction;
    bbRFluxoCaixa: TMenuItem;
    NvBrAceite: TdxNavBarItem;
    NvBrCaixa: TdxNavBarItem;
    NvBrFornecedor: TdxNavBarItem;
    NvBrContaCorrente: TdxNavBarItem;
    ActnRCaixas: TAction;
    Caixas1: TMenuItem;
    ActnPagtoLista: TAction;
    bbPagtoLista: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbFinalizarClick(Sender: TObject);
    procedure TmrDateTimeTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MnEncerrarSistemaClick(Sender: TObject);
    procedure ActnObjetoExecute(Sender: TObject);
    procedure ActnUsuarioExecute(Sender: TObject);
    procedure ActnPermissaoExecute(Sender: TObject);
    procedure ActnEmpresaExecute(Sender: TObject);
    procedure ActnTotalizadorExecute(Sender: TObject);
    procedure ActnOrcamentoExecute(Sender: TObject);
    procedure ActnContaExecute(Sender: TObject);
    procedure ActnSituacaoExecute(Sender: TObject);
    procedure ActnCompetenciaExecute(Sender: TObject);
    procedure ActnSetorExecute(Sender: TObject);
    procedure ActnUnidadeExecute(Sender: TObject);
    procedure ActnTipoCustoExecute(Sender: TObject);
    procedure ActnCentroCustoExecute(Sender: TObject);
    procedure ActnNegocioExecute(Sender: TObject);
    procedure ActnTipoDocExecute(Sender: TObject);
    procedure ActnTipoPesExecute(Sender: TObject);
    procedure ActnFormaPagtoExecute(Sender: TObject);
    procedure ActnContaCorrenteExecute(Sender: TObject);
    procedure ActnTipoAceiteExecute(Sender: TObject);
    procedure ActnPessoaExecute(Sender: TObject);
    procedure ActnContaPRExecute(Sender: TObject);
    procedure ActnCaixaExecute(Sender: TObject);
    procedure btnAtualizaClick(Sender: TObject);
    procedure btnAtualiza2Click(Sender: TObject);
    procedure ActnRFluxoExecute(Sender: TObject);
    procedure ActnRCaixasExecute(Sender: TObject);
    procedure ActnPagtoListaExecute(Sender: TObject);
  private
    { Private declarations }
    iAcesso :Integer;
  public
    { Public declarations }
    USR_Codigo, USR_Nivel :Integer;
    USR_Nome, sSenha, sServidor, sBanco, sHost, sIP, sGrupo:String;
    sSair :String;
  end;
var
  FrmMain: TFrmMain;

implementation

uses KeyResource, IniFiles, KeyLogin, KeyObjeto, KeyUsuarioPesq,
  KeyUsuario, KeyPermissao, iMnyEmpresaPesq, iMnyEmpresa,
  iMnyTotalizadorPesq, iMnyOrcamentoPesq, iMnyContaPesq, iMnySituacaoPesq,
  iMnyCompetencia, iMnySetorPesq, iMnyUnidadePesq, iMnyCustoPesq,
  iMnyCentroPesq, iMnyNegocioPesq, iMnyTipoDocPesq, iMnyTipoPesPesq,
  iMnyFormaPesq, iMnyCorrentePesq, iMnyTipoAceitePesq, iMnyPessoaPesq,
  iMnyContaPRPesq, iMnyCaixa, iMnyRFluxo, iMnyRCaixas, iMnyPagtoLista;
{$R *.dfm}

{ TFrmMain }

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Deseja Realmente Finalizar Sistema ?',
    'Confirmação', MB_OKCANCEL+MB_ICONQUESTION) = ID_CANCEL then
    Abort;
end;

procedure TFrmMain.bbFinalizarClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja Realmente Finalizar Sistema ?',
    'Confirmação', MB_OKCANCEL+MB_ICONQUESTION) = ID_CANCEL then
    Abort;

  Application.Terminate;
end;

procedure TFrmMain.TmrDateTimeTimer(Sender: TObject);
begin
  StsBr.Panels[3].Text := 'Data: ' + FormatDateTime('dd/mm/yyyy', Date);
  StSBr.Panels[4].Text := 'Hora: ' + FormatDateTime('hh:mm:ss', Time);
end;

procedure TFrmMain.FormShow(Sender: TObject);
Var
  p : PHostEnt;
  s : array[0..128] of char;
  p2 : pchar;
begin
  GetHostName(@s, 128);
  p := GetHostByName(@s);
  p2 := iNet_ntoa(PInAddr(p^.h_addr_list^)^);
  StsBr.Panels[5].Text := 'Máquina e IP: ' + (p^.h_Name) + '.' + p2;
  sHost :=  (p^.h_Name);
  sIP   := p2;

  //*** Controle de Usuários:
  if FrmMain.USR_Nivel = 0 then // Usuário
    begin
      MnCadastros.Enabled  := False;
      MnRelatorios.Enabled := False;
      ActnPessoa.Enabled   := False;
      ActnCaixa.Enabled    := False;
    end;

  //*** Controle de Usuários:
  if FrmMain.USR_Nivel = 1 then // Supervisor
    begin
      MnRelatorios.Enabled := False;
    end;

end;

procedure TFrmMain.MnEncerrarSistemaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMain.ActnObjetoExecute(Sender: TObject);
Var
  iNivel :Integer;
begin
  FrmLogin.GR_Refresh;
  iNivel := FrmLogin.GR_Acesso(USR_Codigo, 'FrmObjeto');
  if (iNivel = 9) And (USR_Nivel <> 2) then Abort;

  FrmObjeto := TFrmObjeto.CreateTable(Self, FrmLogin, FrmLogin.conWebMaster);
  try
    FrmObjeto.ShowModal;
  finally
    FrmObjeto.Free;
  end;
end;

procedure TFrmMain.ActnUsuarioExecute(Sender: TObject);
var
  iNivel :Integer;
begin
  FrmLogin.GR_Refresh;
  iNivel := FrmLogin.GR_Acesso(USR_Codigo, 'FrmUsuario');
  if (iNivel = 9) And (USR_Nivel <> 2) then Abort;

  FrmUsuarioPesq := TFrmUsuarioPesq.Create(Application);
  with FrmUsuarioPesq do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TFrmMain.ActnPermissaoExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;
  iNivel := FrmLogin.GR_Acesso(USR_Codigo, 'FrmPermissao');
  if (iNivel = 9) And (USR_Nivel <> 2) then Abort;

  FrmPermissao := TFrmPermissao.Create(Application);
  with FrmPermissao do
  begin
    ShowModal;
    Free;
  end;  
end;

procedure TFrmMain.ActnEmpresaExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmEmpresaPesq := TFrmEmpresaPesq.Create(Application);
  with FrmEmpresaPesq do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TFrmMain.ActnTotalizadorExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmTotalizadorPesq := TFrmTotalizadorPesq.Create(Application);
  with FrmTotalizadorPesq do
  begin
    ShowModal;
    Free;
  end; 
end;

procedure TFrmMain.ActnOrcamentoExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmOrcamentoPesq := TFrmOrcamentoPesq.Create(Application);
  with FrmOrcamentoPesq do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TFrmMain.ActnContaExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmContaPesq := TFrmContaPesq.Create(Application);
  with FrmContaPesq do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TFrmMain.ActnSituacaoExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmSituacaoPesq := TFrmSituacaoPesq.Create(Application);
  with FrmSituacaoPesq do
  begin
    ShowModal;
    Free;
  end;

end;

procedure TFrmMain.ActnCompetenciaExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmCompetencia := TFrmCompetencia.Create(Application);
  with FrmCompetencia do
  begin
    ShowModal;
    Free;
  end;

end;

procedure TFrmMain.ActnSetorExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmSetorPesq := TFrmSetorPesq.Create(Application);
  with FrmSetorPesq do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TFrmMain.ActnUnidadeExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmUnidadePesq := TFrmUnidadePesq.Create(Application);
  with FrmUnidadePesq do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TFrmMain.ActnTipoCustoExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmCustoPesq := TFrmCustoPesq.Create(Application);
  with FrmCustoPesq do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TFrmMain.ActnCentroCustoExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmCentroPesq := TFrmCentroPesq.Create(Application);
  with FrmCentroPesq do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TFrmMain.ActnNegocioExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmNegocioPesq := TFrmNegocioPesq.Create(Application);
  with FrmNegocioPesq do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TFrmMain.ActnTipoDocExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmTipoDocPesq := TFrmTipoDocPesq.Create(Application);
  with FrmTipoDocPesq do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TFrmMain.ActnTipoPesExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmTipoPesPesq := TFrmTipoPesPesq.Create(Application);
  with FrmTipoPesPesq do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TFrmMain.ActnFormaPagtoExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmFormaPesq := TFrmFormaPesq.Create(Application);
  with FrmFormaPesq do
  begin
    ShowModal;
    Free;
  end;

end;

procedure TFrmMain.ActnContaCorrenteExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmCorrentePesq := TFrmCorrentePesq.Create(Application);
  with FrmCorrentePesq do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TFrmMain.ActnTipoAceiteExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmTipoAceitePesq := TFrmTipoAceitePesq.Create(Application);
  with FrmTipoAceitePesq do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TFrmMain.ActnPessoaExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmPessoaPesq := TFrmPessoaPesq.Create(Application);
  with FrmPessoaPesq do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TFrmMain.ActnContaPRExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmContaPRPesq := TFrmContaPRPesq.Create(Application);
  with FrmContaPRPesq do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TFrmMain.ActnCaixaExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmCaixa := TFrmCaixa.Create(Application);
  with FrmCaixa do
  begin
    ShowModal;
    Free;
  end;

end;

procedure TFrmMain.btnAtualizaClick(Sender: TObject);
var
  iCont :Integer;
begin
  with QryQtde do
  begin
    close;
    open;
    first;
    iCont := 0;
    while not eof do
    begin
      QryAtualiza.Close;
      QryAtualiza.SQL.Clear;
      QryAtualiza.SQL.Add('update mny_movimento a set');

      QryAtualiza.SQL.Add('   a.mov_parcelas =  '    + FormatFloat('000', QryQtdeCOUNT.AsInteger));

      QryAtualiza.SQL.Add('   where a.mov_codigo = '       + FormatFloat('000000', QryQtdemov_codigo.Value));
      QryAtualiza.ExecSQL(True);
      iCont := iCont + 01;
      btnAtualiza.Caption := FormatFloat('000000', QryQtdemov_codigo.Value);
      Application.ProcessMessages;
      Next
    end;
  end;
end;

procedure TFrmMain.btnAtualiza2Click(Sender: TObject);
var
  iCont :Integer;
begin
  with QryPagto do
  begin
    QryAtualiza.ExecSQL(True);
    Close;
    Open;
    First;
    iCont := 0;
    while not eof do
    begin
      QryAtualiza.Close;
      QryAtualiza.SQL.Clear;
      QryAtualiza.SQL.Add('update mny_movimento_item a set');

      QryAtualiza.SQL.Add('   a.mov_status =  6 ' );

      QryAtualiza.SQL.Add('   where a.mov_codigo = '   + FormatFloat('000000', QryPagtomov_codigo.Value));
      QryAtualiza.SQL.Add('   and a.mov_item = '       + FormatFloat('000', QryPagtomov_item.Value));
      QryAtualiza.ExecSQL(True);
      iCont := iCont + 01;
      btnAtualiza2.Caption := FormatFloat('000000', QryPagtomov_codigo.Value);
      Application.ProcessMessages;
      Next
    end;
  end;
end;

procedure TFrmMain.ActnRFluxoExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmRFluxo := TFrmRFluxo.Create(Application);
  with FrmRFluxo do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TFrmMain.ActnRCaixasExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmRCaixas := TFrmRCaixas.Create(Application);
  with FrmRCaixas do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TFrmMain.ActnPagtoListaExecute(Sender: TObject);
Var
  iNivel: Integer;
begin
  FrmLogin.GR_Refresh;

  FrmPagtoLista := TFrmPagtoLista.Create(Application);
  with FrmPagtoLista do
  begin
    ShowModal;
    Free;
  end;
end;
end.
