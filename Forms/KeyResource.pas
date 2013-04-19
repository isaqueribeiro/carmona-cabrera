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
  pFIBDataSet;

type
  TDtmResource = class(TDataModule)
    ImgLstSml: TImageList;
    cxStlRpstr: TcxStyleRepository;
    cxStlLinhaImpar: TcxStyle;
    cxStlLinhaPar: TcxStyle;
    LookAndFeelController: TcxLookAndFeelController;
    ImgLstLrg: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmResource: TDtmResource;

implementation

//uses KeyData;

{$R *.dfm}

end.
