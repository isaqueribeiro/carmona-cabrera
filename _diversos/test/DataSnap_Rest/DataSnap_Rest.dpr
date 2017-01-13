program DataSnap_Rest;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  untMain in '_src\untMain.pas' {frmMain},
  untServerMethods in '_src\untServerMethods.pas' {dmServerMethods: TDataModule},
  untServerContainer in '_src\untServerContainer.pas' {dmServerContainer: TDataModule},
  untWebModule in '_src\untWebModule.pas' {dmWebModule: TWebModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
