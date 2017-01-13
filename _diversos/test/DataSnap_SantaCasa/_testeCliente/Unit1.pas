unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  Data.FireDACJSONReflect,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Vcl.Grids, Vcl.DBGrids, Data.DB, Vcl.StdCtrls,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin,
  FireDAC.Stan.StorageJSON, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.DS,
  FireDAC.Phys.DSDef, IPPeerClient, FireDAC.Phys.TDBXDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Phys.TDBX, FireDAC.Phys.TDBXBase, Data.DbxDatasnap,
  Data.DBXCommon, Data.DbxHTTPLayer, Data.SqlExpr, FireDAC.DApt, Vcl.ExtCtrls,
  Vcl.DBCtrls, Data.FMTBcd;

type
  TForm1 = class(TForm)
    memPerfil: TFDMemTable;
    Button1: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    Edit1: TEdit;
    Edit2: TEdit;
    Encriptar: TButton;
    FDConnection1: TFDConnection;
    FDPhysDSDriverLink1: TFDPhysDSDriverLink;
    FDPhysTDBXDriverLink1: TFDPhysTDBXDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDTransaction1: TFDTransaction;
    FDStoredProc1: TFDStoredProc;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    Button2: TButton;
    Button3: TButton;
    DBNavigator1: TDBNavigator;
    FDQuery1: TFDQuery;
    SQLQuery1: TSQLQuery;
    SQLStoredProc1: TSQLStoredProc;
    SQLConnection1: TSQLConnection;
    procedure Button1Click(Sender: TObject);
    procedure EncriptarClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses ClientModuleUnit1;

procedure TForm1.Button1Click(Sender: TObject);
var
  jsonDataSet : TFDJSONDataSets;
  commDataSet : TFDDataSet;
begin
  jsonDataSet := ClientModule1.ServerMethodsClient.GetPerfilJSON();
  commDataSet := TFDJSONDataSetsReader.GetListValue(jsonDataSet, 0);

  if memPerfil.Active then
    memPerfil.Close;

  memPerfil.AppendData(commDataSet);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FDStoredProc1.Open();
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  FDStoredProc1.Close;
end;

procedure TForm1.EncriptarClick(Sender: TObject);
begin
  Edit2.Text := ClientModule1.ServerMethodsClient.EncriptString(Edit1.Text);
end;

end.
