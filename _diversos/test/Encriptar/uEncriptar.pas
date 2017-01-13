unit uEncriptar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fencrypt, StdCtrls;

type
  TfrmEncriptar = class(TForm)
    edConta: TEdit;
    edSenha: TEdit;
    edSmtp: TEdit;
    btnEncriptar: TButton;
    edContaEncript: TEdit;
    edSenhaEncript: TEdit;
    edSmtpEncript: TEdit;
    procedure btnEncriptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEncriptar: TfrmEncriptar;

implementation

{$R *.dfm}

procedure TfrmEncriptar.btnEncriptarClick(Sender: TObject);
begin
  edContaEncript.Text := kEncrypt(edConta.Text, '1403197724102009');
  edSenhaEncript.Text := kEncrypt(edSenha.Text, '1403197724102009');
  edSmtpEncript.Text  := kEncrypt(edSmtp.Text, '1403197724102009');
end;

end.
