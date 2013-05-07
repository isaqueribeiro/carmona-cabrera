unit KeyPadrao;

interface

uses
  KeyResource,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, DB, SqlExpr;

type
  TFrmPadrao = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FComponenteLogin : TComponent;
    FConexaoDB : TSQLConnection;
    FTipoObjetoAcesso: TTipoObjeto;
    FTabela         ,
    FCampoChave     ,
    FCampoDescricao ,
    FCampoOrdenacao : String;
    function GetNomeObjetoAcesso : String;
  public
    { Public declarations }
    property ComponenteLogin : TComponent read FComponenteLogin write FComponenteLogin;
    property ConexaoDB : TSQLConnection read FConexaoDB write FConexaoDB;
    property TipoObjetoAcesso : TTipoObjeto read FTipoObjetoAcesso write FTipoObjetoAcesso;
    property NomeObjetoAcesso : String read GetNomeObjetoAcesso;
    property NomeTabela : String read FTabela write FTabela;
    property CampoChave : String read FCampoChave write FCampoChave;
    property CampoDescricao : String read FCampoDescricao write FCampoDescricao;
    property CampoOrdenacao : String read FCampoOrdenacao write FCampoOrdenacao;

    constructor Create(const AOnwer : TComponent; const Login : TComponent = nil); overload; 
    procedure RefreshDB;
  end;

var
  FrmPadrao: TFrmPadrao;

implementation

{$R *.dfm}

{ TFrmPadrao }

function TFrmPadrao.GetNomeObjetoAcesso: String;
begin
  Result := Self.Name;
end;

procedure TFrmPadrao.FormCreate(Sender: TObject);
begin
  ComponenteLogin  := nil;
  ConexaoDB        := nil;
  TipoObjetoAcesso := toFormulario;
  
  NomeTabela := EmptyStr;
  CampoChave := EmptyStr;
  CampoDescricao := EmptyStr;
  CampoOrdenacao := EmptyStr;
end;

procedure TFrmPadrao.RefreshDB;
var
  db : TComponent;
begin
  if Assigned(ComponenteLogin) then
  begin
    db := ComponenteLogin.FindComponent('conWebMaster');

    if Assigned(db) then
    begin
      ConexaoDB := TSQLConnection(db);

      ConexaoDB.Connected := False;
      ConexaoDB.Connected := True;
    end;
  end;
end;

constructor TFrmPadrao.Create(const AOnwer, Login: TComponent);
begin
  inherited Create(AOnwer);
  Self.ComponenteLogin := Login;
  Self.RefreshDB;
end;

end.
