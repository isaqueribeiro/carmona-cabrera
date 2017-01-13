unit UUsuario;

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
  TFrmUsuario = class(TForm)
    QryUsuario: TFDQuery;
    PgcControle: TPageControl;
    TbsPerfil: TTabSheet;
    DtsUsuario: TDataSource;
    dbgTabela: TDBGrid;
    GroupBox1: TGroupBox;
    DBNavigator: TDBNavigator;
    PnlFinal: TPanel;
    ButtonClose: TButton;
    UpdUsuario: TFDUpdateSQL;
    EdtBusca: TEdit;
    LblBusca: TLabel;
    BtnPesquisar: TButton;
    QryPerfil: TFDQuery;
    DtsPerfil: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryUsuarioNewRecord(DataSet: TDataSet);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure dbgTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure DBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
    procedure dbgTabelaTitleClick(Column: TColumn);
  private
    { Private declarations }
    FConn : TFDConnection;
  public
    { Public declarations }
  end;

var
  FrmUsuario: TFrmUsuario;

implementation

{$R *.dfm}

uses
  UServerMain, UFuncoes, UUsuarioCadastro;

procedure TFrmUsuario.BtnPesquisarClick(Sender: TObject);
begin
  with QryUsuario do
  begin
    if not Active then
      Open;

    if LocateEx('nm_login like ' + QuotedStr(EdtBusca.Text + '%'), [lxoPartialKey, lxoCaseInsensitive]) then
      dbgTabela.SetFocus;
  end;
end;

procedure TFrmUsuario.dbgTabelaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['a'..'z', 'A'..'Z', #32]) then
  begin
    EdtBusca.Text := Trim(Key);
    EdtBusca.SetFocus;
    EdtBusca.SelStart := Length(EdtBusca.Text);
  end;
end;

procedure TFrmUsuario.dbgTabelaTitleClick(Column: TColumn);
begin
  if QryUsuario.Active then
    QryUsuario.IndexFieldNames := Column.FieldName;
end;

procedure TFrmUsuario.DBNavigatorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  Case Button of
    nbFirst: ;
    nbPrior: ;
    nbNext: ;
    nbLast: ;

    nbInsert, nbEdit:
      if CadastroUsuario(Self) then
      begin
        QryUsuario.Post;
        QryUsuario.Refresh;
      end
      else
        QryUsuario.Cancel;

    nbDelete: ;
    nbPost: ;
    nbCancel: ;
    nbRefresh: ;
    nbApplyUpdates: ;
    nbCancelUpdates: ;
  end;
end;

procedure TFrmUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmUsuario.FormCreate(Sender: TObject);
begin
  try
    QryUsuario.Open;
    QryPerfil.Open;
  except
    On E : Exception do
      Application.MessageBox(PChar('Erro ao testar abrir tabela.' + #13#13 + E.Message), 'Erro', MB_ICONERROR);
  end;
end;

procedure TFrmUsuario.QryUsuarioNewRecord(DataSet: TDataSet);
begin
  with QryUsuario do
  begin
    FieldByName('id_usuario').AsString  := GetGuidID(TFDConnection(Connection));
    FieldByName('sn_ativo').AsInteger         := 1;
    FieldByName('sn_alterar_senha').AsInteger := 1;
  end;
end;

initialization
  Formularios.RegisterForm('FrmUsuario', TFrmUsuario);

end.
