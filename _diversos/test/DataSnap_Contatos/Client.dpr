program Client;

uses
  Vcl.Forms,
  untContatoFireDAC in 'src\untContatoFireDAC.pas' {frmContatoFireDAC},
  untDataModule in 'src\untDataModule.pas' {dmDataModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDataModule, dmDataModule);
  Application.CreateForm(TfrmContatoFireDAC, frmContatoFireDAC);
  Application.Run;
end.
