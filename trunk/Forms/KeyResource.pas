unit KeyResource;

interface

uses
  SysUtils, Classes, cxStyles, ImgList, Controls, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin,
  dxSkinSilver, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxLookAndFeels, DB, FIBDataSet,
  pFIBDataSet, frxRich, frxCross, frxChBox, frxGradient, frxClass,
  frxExportPDF;

type
  TUsuario = record
    Codigo : Integer;
    Login  : String;
    Nome   : String;
    Senha  : String;
    Nivel  : Integer;
  end;

  TTipoObjeto = (toFormulario, toProcesso, toRelatorio);

  TDtmResource = class(TDataModule)
    ImgLstSml: TImageList;
    cxStlRpstr: TcxStyleRepository;
    cxStlLinhaImpar: TcxStyle;
    cxStlLinhaPar: TcxStyle;
    LookAndFeelController: TcxLookAndFeelController;
    ImgLstLrg: TImageList;
    ImgNavigator: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmResource: TDtmResource;
  gUsuario   : TUsuario;

const
  STATUS_AJUSTE_ESTOQUE_ABERTO    = 0;
  STATUS_AJUSTE_ESTOQUE_ENCERRADO = 1;
  STATUS_AJUSTE_ESTOQUE_CANCELADO = 2;

  function DelphiIsRunning : Boolean;
  
implementation

//uses KeyData;

function DelphiIsRunning : Boolean;
begin
  // Verifica se o programa rodou a partir do IDE do Delphi7:
  Result := DebugHook <> 0;
end;

{$R *.dfm}

end.
