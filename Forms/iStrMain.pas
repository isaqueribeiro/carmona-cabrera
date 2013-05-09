unit iStrMain;

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
  FMTBcd, DBClient, Provider, dxGDIPlusClasses;

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
    ActnCompetencia: TAction;
    bbCompetencia: TMenuItem;
    ActnSetor: TAction;
    bbSeparador2: TMenuItem;
    bbSetor: TMenuItem;
    bbUnidade: TMenuItem;
    ActnUnidade: TAction;
    ActnTipoCusto: TAction;
    ActnCentroCusto: TAction;
    bbCentroCusto: TMenuItem;
    ActnNegocio: TAction;
    bbNegocio: TMenuItem;
    bbCorrente: TMenuItem;
    bbPermissao: TMenuItem;
    N1: TMenuItem;
    ActnMaterialTipo: TAction;
    mmMaterialTipo: TMenuItem;
    LblVersao: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbFinalizarClick(Sender: TObject);
    procedure TmrDateTimeTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MnEncerrarSistemaClick(Sender: TObject);
    procedure ActnObjetoExecute(Sender: TObject);
    procedure ActnUsuarioExecute(Sender: TObject);
    procedure ActnPermissaoExecute(Sender: TObject);
    procedure ActnMaterialTipoExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    iAcesso :Integer;
  public
    { Public declarations }
    USR_Codigo, USR_Nivel :Integer;
    USR_Nome, sSenha, sServidor, sBanco, sHost, sIP, sGrupo : String;
    sSair :String;
  end;
var
  FrmMain: TFrmMain;

implementation

uses
    IniFiles
  , KeyFuncoes
  , KeyVersion
  , KeyResource
  , KeyObjeto
  , iStrLogin
  , iStrMaterialTipo;

{$R *.dfm}

{ TFrmMain }

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not ShowMessageConfirm('Deseja Realmente Finalizar o Sistema?', 'Confirmação', tbOkCancel) then
    Abort;
end;

procedure TFrmMain.bbFinalizarClick(Sender: TObject);
begin
  if not ShowMessageConfirm('Deseja Realmente Finalizar o Sistema?', 'Confirmação', tbOkCancel) then
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
  p  := GetHostByName(@s);
  p2 := iNet_ntoa(PInAddr(p^.h_addr_list^)^);
  StsBr.Panels[5].Text := 'Máquina e IP: ' + (p^.h_Name) + '.' + p2;
  sHost :=  (p^.h_Name);
  sIP   := p2;

  //*** Controle de Usuários:
  if FrmMain.USR_Nivel = 0 then // Usuário
    begin
      MnCadastros.Enabled  := False;
      MnRelatorios.Enabled := False;
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
begin   {
  FrmLogin.GR_Refresh;
  iNivel := FrmLogin.GR_Acesso(USR_Codigo, 'FrmUsuario');
  if (iNivel = 9) And (USR_Nivel <> 2) then Abort;

  FrmUsuarioPesq := TFrmUsuarioPesq.Create(Application);
  with FrmUsuarioPesq do
  begin
    ShowModal;
    Free;
  end;   }
end;

procedure TFrmMain.ActnPermissaoExecute(Sender: TObject);
Var
  iNivel: Integer;
begin  {
  FrmLogin.GR_Refresh;
  iNivel := FrmLogin.GR_Acesso(USR_Codigo, 'FrmPermissao');
  if (iNivel = 9) And (USR_Nivel <> 2) then Abort;

  FrmPermissao := TFrmPermissao.Create(Application);
  with FrmPermissao do
  begin
    ShowModal;
    Free;
  end;  }
end;

procedure TFrmMain.ActnMaterialTipoExecute(Sender: TObject);
begin
  FrmMaterialTipo := TFrmMaterialTipo.CreateTable(Self, FrmLogin, FrmLogin.conWebMaster);
  try
    FrmMaterialTipo.ShowModal;
  finally
    FrmMaterialTipo.Free;
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  ver : TInfoVersao;
const
  VERSAO = 'Versão %s (Build %s)';
begin
  ver := TInfoVersao.GetInstance;
  LblVersao.Caption := Format(VERSAO, [ver.getPropertyValue(ivPRODUCT_VERSION), ver.getPropertyValue(ivFILE_VERSION)]);
end;

end.
