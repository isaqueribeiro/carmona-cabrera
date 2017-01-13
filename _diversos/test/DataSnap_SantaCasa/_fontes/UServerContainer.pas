unit UServerContainer;

interface

uses System.SysUtils, System.Classes,
  Datasnap.DSServer, Datasnap.DSCommonServer,
  Datasnap.DSClientMetadata, Datasnap.DSHTTPServiceProxyDispatcher,
  Datasnap.DSProxyJavaAndroid, Datasnap.DSProxyJavaBlackBerry,
  Datasnap.DSProxyObjectiveCiOS, Datasnap.DSProxyCsharpSilverlight,
  Datasnap.DSProxyFreePascal_iOS,
  Datasnap.DSAuth;

type
  TServerContainer = class(TDataModule)
    DSServer: TDSServer;
    DSAuthenticationManager: TDSAuthenticationManager;
    DSServerClass: TDSServerClass;
    procedure DSServerClassGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSAuthenticationManagerUserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);
    procedure DSAuthenticationManagerUserAuthorize(Sender: TObject;
      AuthorizeEventObject: TDSAuthorizeEventObject; var valid: Boolean);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

function DSServer: TDSServer;
function DSAuthenticationManager: TDSAuthenticationManager;

implementation


{$R *.dfm}

uses
  Winapi.Windows, Datasnap.DSSession, UServerMethods, UFuncoes, UConstantes;

var
  FModule   : TComponent;
  FDSServer : TDSServer;
  FDSAuthenticationManager: TDSAuthenticationManager;

function DSServer: TDSServer;
begin
  Result := FDSServer;
end;

function DSAuthenticationManager: TDSAuthenticationManager;
begin
  Result := FDSAuthenticationManager;
end;

constructor TServerContainer.Create(AOwner: TComponent);
begin
  inherited;
  FDSServer := DSServer;
  FDSAuthenticationManager := DSAuthenticationManager;
end;

destructor TServerContainer.Destroy;
begin
  inherited;
  FDSServer := nil;
  FDSAuthenticationManager := nil;
end;

procedure TServerContainer.DSServerClassGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := UServerMethods.TServerMethods;
end;

procedure TServerContainer.DSAuthenticationManagerUserAuthenticate(
  Sender: TObject; const Protocol, Context, User, Password: string;
  var valid: Boolean; UserRoles: TStrings);
var
  Secao : TDSSession;
  sPwd  : String;
begin
  sPwd  := EncriptSenha(KEY_PASSWORD, EmptyStr);
  valid := (Trim(User) <> EmptyStr) and (sPwd = Password);

  if valid then
  begin
    Secao := TDSSessionManager.GetThreadSession;
    Secao.PutData('username', User);
    UserRoles.Add('standart');

    if (Trim(User) = USER_ADMIN) then
      UserRoles.Add(USER_ADMIN);
  end;
end;


procedure TServerContainer.DSAuthenticationManagerUserAuthorize(Sender: TObject;
  AuthorizeEventObject: TDSAuthorizeEventObject; var valid: Boolean);
var
  Secao : TDSSession;
begin
  Secao := TDSSessionManager.GetThreadSession;
  valid := (AuthorizeEventObject.UserName = Secao.GetData('username'));
end;

initialization
  FModule := TServerContainer.Create(nil);
finalization
  FModule.Free;
end.

