unit UPerfilAcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFrmPerfilAcesso = class(TForm)
    QryPerfil: TFDQuery;
    PgcControle: TPageControl;
    TbsPerfil: TTabSheet;
    DtsPerfil: TDataSource;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    DBNavigator1: TDBNavigator;
    PnlFinal: TPanel;
    ButtonClose: TButton;
    UpdPerfil: TFDUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryPerfilNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    FConn : TFDConnection;
  public
    { Public declarations }
  end;

var
  FrmPerfilAcesso: TFrmPerfilAcesso;

implementation

{$R *.dfm}

uses
  UServerMain, UFuncoes;

procedure TFrmPerfilAcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPerfilAcesso.FormCreate(Sender: TObject);
begin
  try
    QryPerfil.Open;
  except
    On E : Exception do
      Application.MessageBox(PChar('Erro ao testar abrir tabela.' + #13#13 + E.Message), 'Erro', MB_ICONERROR);
  end;
end;

procedure TFrmPerfilAcesso.QryPerfilNewRecord(DataSet: TDataSet);
begin
  with QryPerfil do
  begin
    FieldByName('id_perfil').AsString  := GetGuidID(TFDConnection(Connection));
    FieldByName('sn_perfil').AsInteger := 1;
  end;
end;

initialization
  Formularios.RegisterForm('FrmPerfilAcesso', TFrmPerfilAcesso);

end.
