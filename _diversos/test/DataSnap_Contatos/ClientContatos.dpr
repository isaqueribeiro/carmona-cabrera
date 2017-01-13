program ClientContatos;

uses
  Vcl.Forms,
  untMainClient in 'src\untMainClient.pas' {frmMainClient},
  untDM in 'src\untDM.pas' {DM: TDataModule},
  untContatos in 'src\untContatos.pas' {frmContatos},
  untSMClient in 'src\untSMClient.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMainClient, frmMainClient);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
