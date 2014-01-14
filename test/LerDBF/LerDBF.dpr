program LerDBF;

uses
  Forms,
  ULerDBF in 'ULerDBF.pas' {frmLerDBF};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLerDBF, frmLerDBF);
  Application.Run;
end.
