unit UServerMethods;

interface

uses System.SysUtils, System.Classes, System.Json, UConstantes, IniFiles,
  Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter,
  Data.FireDACJSONReflect,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Comp.Client, Data.DB, FireDAC.Stan.StorageJSON,
  FireDAC.Stan.StorageBin, FireDAC.Phys.TDBXDef, FireDAC.Phys.TDBXBase,
  FireDAC.Phys.TDBX, IPPeerClient, FireDAC.Phys.DSDef, FireDAC.Phys.DS,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
{$METHODINFO ON}
  TServerMethods = class(TDataModule)
    SantaCasaConn: TFDConnection;
    SantaCasaConnTrans: TFDTransaction;
    SantaCasaCursor: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink;
    FDStanStorageJSONLink: TFDStanStorageJSONLink;
    FDStanStorageBinLink: TFDStanStorageBinLink;
    FDPhysTDBXDriverLink: TFDPhysTDBXDriverLink;
    FDPhysDSDriverLink: TFDPhysDSDriverLink;
    qryBusca: TFDQuery;
    qryPerfil: TFDQuery;
    updPerfil: TFDUpdateSQL;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FArquivoConexao : TIniFile;
    procedure COnfigurarConexaoDB;
  public
    { Public declarations }
    [TRoleAuth(USER_ADMIN)]
    procedure PutData(aData : String);

    function EchoString(Value: string): string;
    function ReverseString(Value: String): String;
    function EncriptString(Value: String): String;
    function IsConnectedDB : Boolean;
    [TRoleAuth(USER_ADMIN)]
    function GetData : String;
    function GetPerfilJSON : TFDJSONDataSets;
    function GetPerfilDataSet : TDataSet;
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses
  System.StrUtils, Datasnap.DSSession, UFuncoes;

procedure TServerMethods.ConfigurarConexaoDB;
begin
  with SantaCasaConn, FArquivoConexao do
  begin
    if Connected then
      Exit;

    Params.Values['server']    := ReadString(INI_CONEXAO_DB, INI_CONEXAO_DB_SERVIDOR, '');
    Params.Values['port']      := ReadString(INI_CONEXAO_DB, INI_CONEXAO_DB_PORTA,    '');
    Params.Values['database']  := ReadString(INI_CONEXAO_DB, INI_CONEXAO_DB_BASE,     '');
    Params.Values['user_name'] := ReadString(INI_CONEXAO_DB, INI_CONEXAO_DB_USUARIO,  USER_NAME);
    Params.Values['password']  := DecriptarSenha(ReadString(INI_CONEXAO_DB, INI_CONEXAO_DB_SENHA, ''), KEY_PASSWORD);
  end;
end;

procedure TServerMethods.DataModuleCreate(Sender: TObject);
begin
  FArquivoConexao := TIniFile.Create(ExtractFilePath(ParamStr(0)) + INI_ARQUIVO);
end;

function TServerMethods.GetPerfilDataSet: TDataSet;
begin
  ConfigurarConexaoDB;

  qryPerfil.Open;
  Result := TDataSet(qryPerfil);
end;

function TServerMethods.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods.EncriptString(Value: String): String;
begin
  Result := EncriptSenha(Value, KEY_PASSWORD);
end;

function TServerMethods.GetData: String;
var
  Secao : TDSSession;
begin
  Secao  := TDSSessionManager.GetThreadSession;
  Result := Secao.GetData('data');
end;

function TServerMethods.GetPerfilJSON: TFDJSONDataSets;
var
  sSQL : TStringList;
begin
  sSQL   := TStringList.Create;
  Result := TFDJSONDataSets.Create;
  try
    ConfigurarConexaoDB;

    sSQL.BeginUpdate;
    sSQL.Create;
    sSQL.Add('Select *');
    sSQL.Add('from ' + table_perfil);
    sSQL.Add('order by ds_perfil');
    sSQL.EndUpdate;

    qryBusca.Close;
    qryBusca.SQL.Clear;
    qryBusca.SQL.AddStrings( sSQL );

    TFDJSONDataSetsWriter.ListAdd(Result, qryBusca);
  finally
    sSQL.Free;
  end;
end;

function TServerMethods.IsConnectedDB: Boolean;
begin
  Result := SantaCasaConn.Connected;
end;

procedure TServerMethods.PutData(aData: String);
var
  Secao : TDSSession;
begin
  Secao := TDSSessionManager.GetThreadSession;
  Secao.PutData('data', aData);
end;

function TServerMethods.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

