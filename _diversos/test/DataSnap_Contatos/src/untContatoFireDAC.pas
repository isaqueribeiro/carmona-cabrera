unit untContatoFireDAC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmContatoFireDAC = class(TForm)
    dtsContatosDados: TDataSource;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContatoFireDAC: TfrmContatoFireDAC;

implementation

{$R *.dfm}

uses untDataModule;

procedure TfrmContatoFireDAC.FormShow(Sender: TObject);
begin
  dtsContatosDados.DataSet.Open;
end;

end.
