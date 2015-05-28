unit UUsuarioCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.DBCtrls, Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmUsuarioCadastro = class(TForm)
    PnlFinal: TPanel;
    BtnCancelar: TButton;
    BtnSalvar: TButton;
    PgcControle: TPageControl;
    TbsPerfil: TTabSheet;
    GroupBox1: TGroupBox;
    lblID: TLabel;
    dbeID: TDBEdit;
    lblDescricao: TLabel;
    dbeDescricao: TDBEdit;
    dbcAtivo: TDBCheckBox;
    lblSenha: TLabel;
    dbeSenha: TDBEdit;
    lblNomeCompleto: TLabel;
    dbeNomeCompleto: TDBEdit;
    dbcAlterarSenha: TDBCheckBox;
    lblPerfil: TLabel;
    dblPerfil: TDBLookupComboBox;
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function CadastroUsuario(const AOnwer : TComponent) : Boolean;

implementation

{$R *.dfm}

uses
  UServerMain, UFuncoes, UUsuario, UConstantes;

function CadastroUsuario(const AOnwer : TComponent) : Boolean;
var
  AForm : TFrmUsuarioCadastro;
begin
  AForm := TFrmUsuarioCadastro.Create(AOnwer);
  try
    Result := (AForm.ShowModal = mrOk);
  finally
    AForm.Free;
  end;
end;

procedure TFrmUsuarioCadastro.BtnSalvarClick(Sender: TObject);
begin
  with dbeID.DataSource.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if not IsEncriptSenha(dbeSenha.Field.AsString, KEY_PASSWORD) then
        dbeSenha.Field.AsString := EncriptSenha(dbeSenha.Field.AsString, KEY_PASSWORD);
  end;

  ModalResult := mrOk;
end;

procedure TFrmUsuarioCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
