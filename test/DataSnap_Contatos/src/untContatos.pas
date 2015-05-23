unit untContatos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfrmContatos = class(TForm)
    dtsContatos: TDataSource;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    DBText2: TDBText;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    edtBuscar: TEdit;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContatos: TfrmContatos;

implementation

{$R *.dfm}

uses
  untDM;

procedure TfrmContatos.Button1Click(Sender: TObject);
begin
  if DM.ApplyContatos then
    ShowMessage('Registro salvo com sucesso');
end;

procedure TfrmContatos.Button2Click(Sender: TObject);
begin
  if ( Trim(edtBuscar.Text) <> EmptyStr ) then
  begin
    if not DM.SearchContatos( Trim(edtBuscar.Text) ) then
      ShowMessage('Busca sem resultados');
  end;
end;

procedure TfrmContatos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtsContatos.DataSet.Close;
end;

procedure TfrmContatos.FormShow(Sender: TObject);
begin
  dtsContatos.DataSet.Open;
end;

end.
