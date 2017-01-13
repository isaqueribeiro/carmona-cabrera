unit UPerfilAcessoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.DBCtrls, Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmPerfilAcessoCadastro = class(TForm)
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
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function CadastroPerfil(const AOnwer : TComponent) : Boolean;

implementation

{$R *.dfm}

uses
  UServerMain, UFuncoes, UPerfilAcesso;

function CadastroPerfil(const AOnwer : TComponent) : Boolean;
var
  AForm : TFrmPerfilAcessoCadastro;
begin
  AForm := TFrmPerfilAcessoCadastro.Create(AOnwer);
  try
    Result := (AForm.ShowModal = mrOk);
  finally
    AForm.Free;
  end;
end;

procedure TFrmPerfilAcessoCadastro.BtnSalvarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmPerfilAcessoCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
