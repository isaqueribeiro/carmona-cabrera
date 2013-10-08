program Encriptar;

uses
  Forms,
  uEncriptar in 'uEncriptar.pas' {frmEncriptar};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmEncriptar, frmEncriptar);
  Application.Run;
end.
