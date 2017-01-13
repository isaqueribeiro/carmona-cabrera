program ServerContatos;

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  untMainServer in 'src\untMainServer.pas' {Form1},
  untSM in 'src\untSM.pas' {SM: TDSServerModule},
  untSC in 'src\untSC.pas' {SC: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TSC, SC);
  Application.Run;
end.

