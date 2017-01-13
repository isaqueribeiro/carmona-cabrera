unit untDM;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, IPPeerClient, Vcl.Dialogs,
  Data.DBXCommon, Data.DB, Data.SqlExpr, Datasnap.DBClient, Datasnap.DSConnect,
  Data.FMTBcd;

type
  TDM = class(TDataModule)
    conConnection: TSQLConnection;
    DSProviderConnection: TDSProviderConnection;
    cdsContatos: TClientDataSet;
    cdsContatosID: TIntegerField;
    cdsContatosNOME: TStringField;
    cdsContatosTELEFONE: TStringField;
    cdsContatosDATA_CADASTRO: TDateField;
    ssmMethodServer: TSqlServerMethod;
    procedure cdsContatosNewRecord(DataSet: TDataSet);
    procedure cdsContatosBeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ApplyContatos : Boolean;
    function SearchContatos(aNome : String) : Boolean;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  untSMClient;

{$R *.dfm}

function TDM.ApplyContatos: Boolean;
begin
  try
    Result := (cdsContatos.ApplyUpdates(0) = 0);
  except
    On E : Exception do
      ShowMessage('Erro ao tentar salvar registro.' + #13#13 + E.Message);
  end;
end;

procedure TDM.cdsContatosBeforePost(DataSet: TDataSet);
var
  ClientClass : TSMClient;
begin
  ClientClass := TSMClient.Create(DM.conConnection.DBXConnection);
  try
    cdsContatosDATA_CADASTRO.AsDateTime := ClientClass.GetDateServer;
  finally
    FreeAndNil(ClientClass);
  end;
end;

procedure TDM.cdsContatosNewRecord(DataSet: TDataSet);
begin
  with ssmMethodServer do
  begin
    Params[0].AsString := 'SEQ_CONTATOS_ID';
    ExecuteMethod;
    cdsContatosID.AsInteger := Params[1].AsInteger;
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  conConnection.Open;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  conConnection.Close;
end;

function TDM.SearchContatos(aNome: String): Boolean;
begin
  cdsContatos.Close;
  cdsContatos.ParamByName('nome').AsString := '%' + aNome + '%';
  cdsContatos.Open;

  Result := not cdsContatos.IsEmpty;
end;

end.
