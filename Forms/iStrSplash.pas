unit iStrSplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeySplash, dxGDIPlusClasses, ExtCtrls, StdCtrls, jpeg;

type
  TFrmStrSplash = class(TFrmSplash)
    ImgIcon: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStrSplash: TFrmStrSplash;

implementation

{$R *.dfm}

end.
