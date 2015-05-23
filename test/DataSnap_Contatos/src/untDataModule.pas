unit untDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.DS,
  FireDAC.Phys.DSDef, Data.DB, FireDAC.Comp.Client, IPPeerClient,
  FireDAC.Phys.TDBXBase, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TdmDataModule = class(TDataModule)
    conn: TFDConnection;
    FDPhysDSDriverLink: TFDPhysDSDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    ssmServerMethods: TFDStoredProc;
    ssmContatosDados: TFDStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDataModule: TdmDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
