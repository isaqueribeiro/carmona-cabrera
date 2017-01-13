unit untSM;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter,
  Data.DBXFirebird, Data.DB, Data.SqlExpr, Data.FMTBcd, Datasnap.Provider;

type
  TSM = class(TDSServerModule)
    SQLConnection: TSQLConnection;
    dtsContatos: TSQLDataSet;
    dspContatos: TDataSetProvider;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    function GenerateID(aSequence : String) : Integer;
    function GetDateServer : TDateTime;
  end;

implementation


{$R *.dfm}


uses System.StrUtils;

procedure TSM.DSServerModuleCreate(Sender: TObject);
begin
  SQLConnection.Open;
end;

procedure TSM.DSServerModuleDestroy(Sender: TObject);
begin
  SQLConnection.Close;
end;

function TSM.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TSM.GenerateID(aSequence: String): Integer;
var
  Qry: TSQLQuery;
begin
  try
    Qry:= TSQLQuery.Create(Self);
    Qry.SQLConnection:= SQLConnection;
    Qry.SQL.Add('SELECT NEXT VALUE FOR ' + aSequence + ' from RDB$DATABASE');
    Qry.Open;

    Result:= Qry.Fields[0].AsInteger;
  finally
    FreeAndNil(Qry);
  end;
end;

function TSM.GetDateServer: TDateTime;
begin
  Result := Now;
end;

function TSM.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

