program Server;

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  untServer in 'src\untServer.pas' {frmServer},
  untServerMethods in 'src\untServerMethods.pas' {dmServerMethods: TDataModule},
  untServerContainer in 'src\untServerContainer.pas' {dmServerContainer: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmServer, frmServer);
  Application.CreateForm(TdmServerContainer, dmServerContainer);
  Application.Run;
end.

