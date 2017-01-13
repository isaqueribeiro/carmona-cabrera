unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fsuporte, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxMaskEdit, cxTextEdit, cxDropDownEdit,
  cxImageComboBox, StdCtrls, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxDBEdit, TypInfo;

type
  TForm1 = class(TForm)
    cxImageComboBox1: TcxImageComboBox;
    cxComboBox1: TcxComboBox;
    Button1: TButton;
    cxLookupComboBox1: TcxLookupComboBox;
    cxTextEdit1: TcxTextEdit;
    cxMaskEdit1: TcxMaskEdit;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    cxDBImageComboBox1: TcxDBImageComboBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function GetComponentIndex : Integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  PropInfo: PPropInfo;
  SubObject: TObject;
  Result : Boolean;

  AControl: TWinControl;
  Teste : TcxCustomEdit;
begin

  if ( Key = VK_RETURN ) then
  begin
(* BELEZA!!!
    AControl := Screen.ActiveControl;
    if Supports(AControl, IcxInnerEditHelper) or Supports(AControl, IcxContainerInnerControl) then
      Teste := TcxCustomEdit(AControl.Owner)
    else
      if AControl is TcxCustomEdit then
        Teste := TcxCustomEdit(AControl);

    ShowMessage( Teste.Name );
*)
    PropInfo := GetPropInfo(Sender, 'DroppedDown');

    if (PropInfo <> nil) then
    begin
      if PropInfo^.PropType^.Kind = tkEnumeration then
        Result := GetOrdProp(Sender, PropInfo) <> 0;
    end
    else
    begin
      PropInfo := GetPropInfo(Sender, 'Properties');

      if (PropInfo <> nil) then
      begin
        if PropInfo^.PropType^.Kind = tkClass then
        begin
          SubObject := GetObjectProp(Sender, 'Properties');

          if (SubObject <> nil) then
          begin
            PropInfo := GetPropInfo(SubObject, 'DroppedDown');

            if (PropInfo <> nil) then
              if PropInfo^.PropType^.Kind = tkEnumeration then
                Result := GetOrdProp(SubObject, PropInfo) <> 0;
          end;
        end;
      end
    end;

  end;

  kKeyDown(Self, Key, Shift);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if cxComboBox1.DroppedDown then
    ShowMessage( cxComboBox1.Name + #13 + 'Aberto' )
  else
    ShowMessage( cxComboBox1.Name + #13 + 'Fechado' );

  if cxImageComboBox1.DroppedDown then
    ShowMessage( 'Aberto' )
  else
    ShowMessage( 'Fechado' );
end;

function TForm1.GetComponentIndex: Integer;
var
  I : Integer;
begin
  ;
end;

end.
