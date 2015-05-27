program DataSnap_SantaCasa;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  UServerMethods in '_fontes\UServerMethods.pas' {ServerMethods: TDataModule},
  UServerContainer in '_fontes\UServerContainer.pas' {ServerContainer: TDataModule},
  UWebModuleLocal in '_fontes\UWebModuleLocal.pas' {WebModuleLocal: TWebModule},
  UServerMain in '_fontes\UServerMain.pas' {FrmServerMain},
  UConstantes in '_fontes\UConstantes.pas',
  UFormFactoryU in '_fontes\UFormFactoryU.pas',
  UFuncoes in '_fontes\UFuncoes.pas',
  UFuncoesFormulario in '_fontes\UFuncoesFormulario.pas',
  UObserverInterface in '_fontes\UObserverInterface.pas',
  UPerfilAcesso in '_fontes\UPerfilAcesso.pas' {FrmPerfilAcesso};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.Title := 'Servidor DataSnap Santa Casa';
  Application.CreateForm(TFrmServerMain, FrmServerMain);
  Application.Run;
end.
