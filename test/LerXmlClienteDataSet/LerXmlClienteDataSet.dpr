program LerXmlClienteDataSet;

uses
  Forms,
  uLerXmlClienteDataSet in 'uLerXmlClienteDataSet.pas' {FrmLerXmlClienteDataSet};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmLerXmlClienteDataSet, FrmLerXmlClienteDataSet);
  Application.Run;
end.
