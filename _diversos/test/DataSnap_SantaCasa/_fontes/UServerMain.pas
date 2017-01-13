unit UServerMain;

interface

uses
  UFuncoesFormulario, Winapi.Messages, System.SysUtils, System.Variants, IniFiles,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Clipbrd,
  Vcl.AppEvnts, Vcl.StdCtrls, IdHTTPWebBrokerBridge, Web.HTTPApp, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, Data.DB,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.UI;

type
  TFrmServerMain = class(TForm)
    ButtonStart: TButton;
    ButtonStop: TButton;
    EdtPortaServico: TEdit;
    LblPortaServico: TLabel;
    appEvents: TApplicationEvents;
    ButtonOpenBrowser: TButton;
    Panel1: TPanel;
    GrpBxConfiguracaoDB: TGroupBox;
    LblServidor: TLabel;
    EdtServidor: TEdit;
    LblBase: TLabel;
    EdtBase: TEdit;
    LblUsuario: TLabel;
    EdtUsuario: TEdit;
    LblSenha: TLabel;
    EdtSenha: TEdit;
    BtnTestarConexao: TButton;
    LblPorta: TLabel;
    EdtPorta: TEdit;
    BtnSalvarConexaoDB: TButton;
    GrpBxAcesso: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    SantaCasaCursor: TFDGUIxWaitCursor;
    SantaCasaConnection: TFDConnection;
    SantaCasaTransaction: TFDTransaction;
    procedure FormCreate(Sender: TObject);
    procedure appEventsIdle(Sender: TObject; var Done: Boolean);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure ButtonOpenBrowserClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnTestarConexaoClick(Sender: TObject);
    procedure BtnSalvarConexaoDBClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FServer : TIdHTTPWebBrokerBridge;
    FArquivoConexao : TIniFile;
    procedure StartServer;
    procedure LoadSettings;
    procedure SaveSettings;
    procedure Conectar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmServerMain: TFrmServerMain;
  Formularios   : TFormularios;

implementation

{$R *.dfm}

uses
  WinApi.Windows, Winapi.ShellApi, Datasnap.DSSession,
  UConstantes, UFuncoes;

procedure TFrmServerMain.appEventsIdle(Sender: TObject; var Done: Boolean);
begin
  ButtonStart.Enabled     := not FServer.Active;
  ButtonStop.Enabled      := FServer.Active;
  EdtPortaServico.Enabled := not FServer.Active;
end;

procedure TFrmServerMain.BtnSalvarConexaoDBClick(Sender: TObject);
begin
  if ( Application.MessageBox('Deseja salvar as configurações de conexão?', 'Confirmar', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = ID_YES ) then
    SaveSettings;
end;

procedure TFrmServerMain.BtnTestarConexaoClick(Sender: TObject);
begin
  try
    with SantaCasaConnection do
    begin
      if SantaCasaConnection.Connected then
        SantaCasaConnection.Connected := False;

      Params.Values['server']    := Trim(EdtServidor.Text);
      Params.Values['port']      := Trim(EdtPorta.Text);
      Params.Values['database']  := Trim(EdtBase.Text);
      Params.Values['user_name'] := Trim(EdtUsuario.Text);
      Params.Values['password']  := Trim(EdtSenha.Text);

      Connected := True;

      if Connected then
        Application.MessageBox('Conexão executada com sucesso', 'Informação', MB_ICONINFORMATION);

      Connected := False;
    end;
  except
    On E : Exception do
      Application.MessageBox(PChar('Erro ao testar a conexão com o servidor/base.' + #13#13 + E.Message), 'Erro', MB_ICONERROR);
  end;
end;

procedure TFrmServerMain.Button1Click(Sender: TObject);
begin
  Conectar;
  Formularios.ShowModalForm(Self, 'FrmPerfilAcesso');

  if SantaCasaConnection.Connected then
    SantaCasaConnection.Connected := False;
end;

procedure TFrmServerMain.Button2Click(Sender: TObject);
begin
  Conectar;
  Formularios.ShowModalForm(Self, 'FrmUsuario');

  if SantaCasaConnection.Connected then
    SantaCasaConnection.Connected := False;
end;

procedure TFrmServerMain.ButtonOpenBrowserClick(Sender: TObject);
var
  LURL ,
  sPwd : String;
begin
  sPwd := EncriptSenha(KEY_PASSWORD, EmptyStr);
  Clipboard.AsText := sPwd;

  StartServer;
  LURL := Format('http://localhost:%s', [EdtPortaServico.Text]);
  ShellExecute(0, nil, PChar(LURL), nil, nil, SW_SHOWNOACTIVATE);
end;

procedure TFrmServerMain.ButtonStartClick(Sender: TObject);
begin
  if ( StrToIntDef(EdtPortaServico.Text, 0) < 1 ) then
    Application.MessageBox('Favor informar um número de porta válido para o serviço.', 'Alerta', MB_ICONWARNING)
  else
  begin
    SaveSettings;
    StartServer;
  end;
end;

procedure TerminateThreads;
begin
  if TDSSessionManager.Instance <> nil then
    TDSSessionManager.Instance.TerminateAllSessions;
end;

procedure TFrmServerMain.ButtonStopClick(Sender: TObject);
begin
  TerminateThreads;
  FServer.Active := False;
  FServer.Bindings.Clear;
end;

procedure TFrmServerMain.Conectar;
begin
  with SantaCasaConnection do
  begin
    if SantaCasaConnection.Connected then
      SantaCasaConnection.Connected := False;

    Params.Values['server']    := Trim(EdtServidor.Text);
    Params.Values['port']      := Trim(EdtPorta.Text);
    Params.Values['database']  := Trim(EdtBase.Text);
    Params.Values['user_name'] := Trim(EdtUsuario.Text);
    Params.Values['password']  := Trim(EdtSenha.Text);
  end;
end;

procedure TFrmServerMain.FormCreate(Sender: TObject);
begin
  FServer         := TIdHTTPWebBrokerBridge.Create(Self);
  FArquivoConexao := TIniFile.Create(ExtractFilePath(ParamStr(0)) + INI_ARQUIVO);
end;

procedure TFrmServerMain.FormShow(Sender: TObject);
begin
  LoadSettings;
end;

procedure TFrmServerMain.LoadSettings;
begin
  with FArquivoConexao do
  begin
    EdtServidor.Text := ReadString(INI_CONEXAO_DB, INI_CONEXAO_DB_SERVIDOR, Trim(EdtServidor.Text));
    EdtPorta.Text    := ReadString(INI_CONEXAO_DB, INI_CONEXAO_DB_PORTA,    Trim(EdtPorta.Text));
    EdtBase.Text     := ReadString(INI_CONEXAO_DB, INI_CONEXAO_DB_BASE,     Trim(EdtBase.Text));
    EdtUsuario.Text  := ReadString(INI_CONEXAO_DB, INI_CONEXAO_DB_USUARIO,  USER_NAME);
    EdtSenha.Text    := DecriptarSenha(ReadString(INI_CONEXAO_DB, INI_CONEXAO_DB_SENHA, ''), KEY_PASSWORD);
    if Trim(EdtSenha.Text) = EmptyStr then
      EdtSenha.Text := USER_PASSWORD;
  end;
end;

procedure TFrmServerMain.SaveSettings;
begin
  with FArquivoConexao do
  begin
    WriteString(INI_CONEXAO_DB, INI_CONEXAO_DB_SERVIDOR, Trim(EdtServidor.Text));
    WriteString(INI_CONEXAO_DB, INI_CONEXAO_DB_PORTA,    Trim(EdtPorta.Text));
    WriteString(INI_CONEXAO_DB, INI_CONEXAO_DB_BASE,     Trim(EdtBase.Text));
    WriteString(INI_CONEXAO_DB, INI_CONEXAO_DB_USUARIO,  Trim(EdtUsuario.Text));
    WriteString(INI_CONEXAO_DB, INI_CONEXAO_DB_SENHA,    EncriptSenha(Trim(EdtSenha.Text), KEY_PASSWORD));
  end;
  FArquivoConexao.UpdateFile;
end;

procedure TFrmServerMain.StartServer;
begin
  if not FServer.Active then
  begin
    FServer.Bindings.Clear;
    FServer.DefaultPort := StrToInt(EdtPortaServico.Text);
    FServer.Active := True;
  end;
end;

initialization
  Formularios := TFormularios.Create;

end.
