unit UServerMethods;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Comp.Client, Data.DB, FireDAC.Stan.StorageJSON,
  FireDAC.Stan.StorageBin, FireDAC.Phys.TDBXDef, FireDAC.Phys.TDBXBase,
  FireDAC.Phys.TDBX, IPPeerClient, FireDAC.Phys.DSDef, FireDAC.Phys.DS;

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
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PutData(aData : String);

    function GetData : String;
    function EchoString(Value: string): string;
    [TRoleAuth('admin')]
    function ReverseString(Value: string): string;
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses
  System.StrUtils, Datasnap.DSSession;

procedure TServerMethods.DataModuleCreate(Sender: TObject);
begin
  SantaCasaConn.Open;
end;

function TServerMethods.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods.GetData: String;
var
  Secao : TDSSession;
begin
  Secao  := TDSSessionManager.GetThreadSession;
  Result := Secao.GetData('data');
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

