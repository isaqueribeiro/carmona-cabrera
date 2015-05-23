unit untMainClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXDataSnap, IPPeerClient,
  Data.DBXCommon, Data.DB, Data.SqlExpr, Vcl.Menus;

type
  TfrmMainClient = class(TForm)
    MainMenu1: TMainMenu;
    Manuteno1: TMenuItem;
    Contatos1: TMenuItem;
    procedure Contatos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainClient: TfrmMainClient;

implementation

{$R *.dfm}

uses
  untContatos;

procedure TfrmMainClient.Contatos1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmContatos, frmContatos);
    frmContatos.ShowModal;
  finally
    FreeAndNil(frmContatos);
  end;
end;

end.
