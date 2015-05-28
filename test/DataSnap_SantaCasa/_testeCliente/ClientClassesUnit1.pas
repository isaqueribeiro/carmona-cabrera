//
// Created by the DataSnap proxy generator.
// 28/05/2015 15:37:43
//

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TServerMethodsClient = class(TDSAdminRestClient)
  private
    FDataModuleCreateCommand: TDSRestCommand;
    FPutDataCommand: TDSRestCommand;
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FEncriptStringCommand: TDSRestCommand;
    FGetDataCommand: TDSRestCommand;
    FGetPerfilJSONCommand: TDSRestCommand;
    FGetPerfilJSONCommand_Cache: TDSRestCommand;
    FGetPerfilDataSetCommand: TDSRestCommand;
    FGetPerfilDataSetCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DataModuleCreate(Sender: TObject);
    procedure PutData(aData: string);
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function EncriptString(Value: string; const ARequestFilter: string = ''): string;
    function GetData(const ARequestFilter: string = ''): string;
    function GetPerfilJSON(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetPerfilJSON_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetPerfilDataSet(const ARequestFilter: string = ''): TDataSet;
    function GetPerfilDataSet_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TServerMethods_DataModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TServerMethods_PutData: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'aData'; Direction: 1; DBXType: 26; TypeName: 'string')
  );

  TServerMethods_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods_EncriptString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods_GetData: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods_GetPerfilJSON: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_GetPerfilJSON_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_GetPerfilDataSet: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerMethods_GetPerfilDataSet_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

implementation

procedure TServerMethodsClient.DataModuleCreate(Sender: TObject);
begin
  if FDataModuleCreateCommand = nil then
  begin
    FDataModuleCreateCommand := FConnection.CreateCommand;
    FDataModuleCreateCommand.RequestType := 'POST';
    FDataModuleCreateCommand.Text := 'TServerMethods."DataModuleCreate"';
    FDataModuleCreateCommand.Prepare(TServerMethods_DataModuleCreate);
  end;
  if not Assigned(Sender) then
    FDataModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDataModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDataModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDataModuleCreateCommand.Execute;
end;

procedure TServerMethodsClient.PutData(aData: string);
begin
  if FPutDataCommand = nil then
  begin
    FPutDataCommand := FConnection.CreateCommand;
    FPutDataCommand.RequestType := 'GET';
    FPutDataCommand.Text := 'TServerMethods.PutData';
    FPutDataCommand.Prepare(TServerMethods_PutData);
  end;
  FPutDataCommand.Parameters[0].Value.SetWideString(aData);
  FPutDataCommand.Execute;
end;

function TServerMethodsClient.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TServerMethods.EchoString';
    FEchoStringCommand.Prepare(TServerMethods_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethodsClient.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TServerMethods.ReverseString';
    FReverseStringCommand.Prepare(TServerMethods_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethodsClient.EncriptString(Value: string; const ARequestFilter: string): string;
begin
  if FEncriptStringCommand = nil then
  begin
    FEncriptStringCommand := FConnection.CreateCommand;
    FEncriptStringCommand.RequestType := 'GET';
    FEncriptStringCommand.Text := 'TServerMethods.EncriptString';
    FEncriptStringCommand.Prepare(TServerMethods_EncriptString);
  end;
  FEncriptStringCommand.Parameters[0].Value.SetWideString(Value);
  FEncriptStringCommand.Execute(ARequestFilter);
  Result := FEncriptStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethodsClient.GetData(const ARequestFilter: string): string;
begin
  if FGetDataCommand = nil then
  begin
    FGetDataCommand := FConnection.CreateCommand;
    FGetDataCommand.RequestType := 'GET';
    FGetDataCommand.Text := 'TServerMethods.GetData';
    FGetDataCommand.Prepare(TServerMethods_GetData);
  end;
  FGetDataCommand.Execute(ARequestFilter);
  Result := FGetDataCommand.Parameters[0].Value.GetWideString;
end;

function TServerMethodsClient.GetPerfilJSON(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetPerfilJSONCommand = nil then
  begin
    FGetPerfilJSONCommand := FConnection.CreateCommand;
    FGetPerfilJSONCommand.RequestType := 'GET';
    FGetPerfilJSONCommand.Text := 'TServerMethods.GetPerfilJSON';
    FGetPerfilJSONCommand.Prepare(TServerMethods_GetPerfilJSON);
  end;
  FGetPerfilJSONCommand.Execute(ARequestFilter);
  if not FGetPerfilJSONCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetPerfilJSONCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetPerfilJSONCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetPerfilJSONCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.GetPerfilJSON_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetPerfilJSONCommand_Cache = nil then
  begin
    FGetPerfilJSONCommand_Cache := FConnection.CreateCommand;
    FGetPerfilJSONCommand_Cache.RequestType := 'GET';
    FGetPerfilJSONCommand_Cache.Text := 'TServerMethods.GetPerfilJSON';
    FGetPerfilJSONCommand_Cache.Prepare(TServerMethods_GetPerfilJSON_Cache);
  end;
  FGetPerfilJSONCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetPerfilJSONCommand_Cache.Parameters[0].Value.GetString);
end;

function TServerMethodsClient.GetPerfilDataSet(const ARequestFilter: string): TDataSet;
begin
  if FGetPerfilDataSetCommand = nil then
  begin
    FGetPerfilDataSetCommand := FConnection.CreateCommand;
    FGetPerfilDataSetCommand.RequestType := 'GET';
    FGetPerfilDataSetCommand.Text := 'TServerMethods.GetPerfilDataSet';
    FGetPerfilDataSetCommand.Prepare(TServerMethods_GetPerfilDataSet);
  end;
  FGetPerfilDataSetCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FGetPerfilDataSetCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FGetPerfilDataSetCommand.FreeOnExecute(Result);
end;

function TServerMethodsClient.GetPerfilDataSet_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FGetPerfilDataSetCommand_Cache = nil then
  begin
    FGetPerfilDataSetCommand_Cache := FConnection.CreateCommand;
    FGetPerfilDataSetCommand_Cache.RequestType := 'GET';
    FGetPerfilDataSetCommand_Cache.Text := 'TServerMethods.GetPerfilDataSet';
    FGetPerfilDataSetCommand_Cache.Prepare(TServerMethods_GetPerfilDataSet_Cache);
  end;
  FGetPerfilDataSetCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FGetPerfilDataSetCommand_Cache.Parameters[0].Value.GetString);
end;

constructor TServerMethodsClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethodsClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethodsClient.Destroy;
begin
  FDataModuleCreateCommand.DisposeOf;
  FPutDataCommand.DisposeOf;
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FEncriptStringCommand.DisposeOf;
  FGetDataCommand.DisposeOf;
  FGetPerfilJSONCommand.DisposeOf;
  FGetPerfilJSONCommand_Cache.DisposeOf;
  FGetPerfilDataSetCommand.DisposeOf;
  FGetPerfilDataSetCommand_Cache.DisposeOf;
  inherited;
end;

end.

