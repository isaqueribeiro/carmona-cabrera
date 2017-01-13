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
    dbgTabela: TDBGrid;
    GroupBox1: TGroupBox;
    DBNavigator: TDBNavigator;
    PnlFinal: TPanel;
    ButtonClose: TButton;
    UpdPerfil: TFDUpdateSQL;
    EdtBusca: TEdit;
    LblBusca: TLabel;
    BtnPesquisar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryPerfilNewRecord(DataSet: TDataSet);
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
  FrmPerfilAcesso: TFrmPerfilAcesso;

implementation

{$R *.dfm}

uses
  UServerMain, UFuncoes, UPerfilAcessoCadastro;

procedure TFrmPerfilAcesso.BtnPesquisarClick(Sender: TObject);
begin
  with QryPerfil do
  begin
    if not Active then
      Open;

    if LocateEx('ds_perfil like ' + QuotedStr(EdtBusca.Text + '%'), [lxoPartialKey, lxoCaseInsensitive]) then
      dbgTabela.SetFocus;
  end;
end;

procedure TFrmPerfilAcesso.dbgTabelaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['a'..'z', 'A'..'Z', #32]) then
  begin
    EdtBusca.Text := Trim(Key);
    EdtBusca.SetFocus;
    EdtBusca.SelStart := Length(EdtBusca.Text);
  end;
end;

procedure TFrmPerfilAcesso.dbgTabelaTitleClick(Column: TColumn);
begin
  if QryPerfil.Active then
    QryPerfil.IndexFieldNames := Column.FieldName;
end;

procedure TFrmPerfilAcesso.DBNavigatorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  Case Button of
    nbFirst: ;
    nbPrior: ;
    nbNext: ;
    nbLast: ;

    nbInsert, nbEdit:
      if CadastroPerfil(Self) then
        QryPerfil.Post
      else
        QryPerfil.Cancel;

    nbDelete: ;
    nbPost: ;
    nbCancel: ;
    nbRefresh: ;
    nbApplyUpdates: ;
    nbCancelUpdates: ;
  end;
end;

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
