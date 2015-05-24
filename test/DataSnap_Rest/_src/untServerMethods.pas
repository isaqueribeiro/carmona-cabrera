unit untServerMethods;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase, FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

type
{$METHODINFO ON}
  TdmServerMethods = class(TDataModule)
    connBanco: TFDConnection;
    qryUsuario: TFDQuery;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    updUsuario: TFDUpdateSQL;
    fbTrans: TFDTransaction;
    fdGUIxWaitCursor: TFDGUIxWaitCursor;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function GetUsuario(aLogin : String) : TDataSet;
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils;

procedure TdmServerMethods.DataModuleCreate(Sender: TObject);
begin
  connBanco.Open;
end;

procedure TdmServerMethods.DataModuleDestroy(Sender: TObject);
begin
  connBanco.Close;
end;

function TdmServerMethods.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TdmServerMethods.GetUsuario(aLogin: String): TDataSet;
begin
  with qryUsuario do
  begin
    Close;
    ParamByName('login').AsString := aLogin;
    Open;
  end;

  Result := qryUsuario;
end;

function TdmServerMethods.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

