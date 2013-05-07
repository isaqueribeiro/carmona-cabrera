unit KeySplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, IniFiles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin,
  dxSkinSilver, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit,
  cxLabel, dxGDIPlusClasses;

type
  TFrmSplash = class(TForm)
    LblEvento: TLabel;
    TmrSplash: TTimer;
    ImgMain: TImage;
    Shape1: TShape;
    LblTitulo: TLabel;
    LblTituloSombra: TLabel;
    LblDesc: TLabel;
    procedure TmrSplashTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    iContador :Integer;
  public
    { Public declarations }
  end;

var
  FrmSplash: TFrmSplash;

implementation

uses
  KeyFuncoes, KeyVersion;

{$R *.dfm}

procedure TFrmSplash.TmrSplashTimer(Sender: TObject);
begin
  If iContador <= 2 Then
    Begin
      Case iContador Of
        0: LblEvento.Caption := 'Preparando Ambiente Gráfico...';
        1: LblEvento.Caption := 'Preparando Conexão Com Banco de Dados...';
        2: LblEvento.Caption := 'Quase Pronto...';
      End;
      LblEvento.Refresh;
      iContador := iContador + 01;
    End
  Else
    Close;
end;

procedure TFrmSplash.FormShow(Sender: TObject);
Var
  Ini : TIniFile;
  cTempo : Cardinal;
begin
  Ini := TIniFile.Create(GetFileNameINI);

  cTempo := StrToIntDef(Ini.ReadString('DIVERSOS', 'TIMESPLASH', '500'), 500);
  TmrSplash.Interval := cTempo;

  iContador := 0;

end;

procedure TFrmSplash.FormCreate(Sender: TObject);
var
  ver : TInfoVersao;
begin
  ver := TInfoVersao.GetInstance();

  LblTitulo.Caption       := ver.getPropertyValue(ivPRODUCT_NAME);
  LblTituloSombra.Caption := ver.getPropertyValue(ivPRODUCT_NAME);
  LblDesc.Caption         := ver.getPropertyValue(ivFILE_DESCRIPTION);
end;

end.
