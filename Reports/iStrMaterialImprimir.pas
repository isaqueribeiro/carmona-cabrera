unit iStrMaterialImprimir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadraoImprimir, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, cxContainer, cxEdit,
  dxSkinsCore, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox,
  ExtCtrls, cxLabel, dxGDIPlusClasses, cxGroupBox, StdCtrls, cxButtons,
  cxRadioGroup, FMTBcd, frxClass, frxDBSet, DBClient, Provider, DB, SqlExpr;

type
  TFrmMaterialImprimir = class(TFrmPadraoImprimir)
    RdbMaterialLista: TcxRadioButton;
    QryMaterialLista: TSQLQuery;
    DspMaterialLista: TDataSetProvider;
    CdsMaterialLista: TClientDataSet;
    FrDBMaterialLista: TfrxDBDataset;
    FrMaterialLista: TfrxReport;
    procedure BtnNovoClick(Sender: TObject);
    procedure FrMaterialListaGetValue(const VarName: String;
      var Value: Variant);
  private
    { Private declarations }
    function CarregarDados : Boolean;
  public
    { Public declarations }
  end;

var
  FrmMaterialImprimir: TFrmMaterialImprimir;

implementation

uses
  KeyFuncoes
  {$IFDEF IMONEY}
  , KeyMain
  , KeyLogin
  {$ENDIF}
  {$IFDEF ISTORE}
  , iStrMain
  , iStrLogin
  {$ENDIF}
  , KeyResource
  , KeyPadrao;

{$R *.dfm}

procedure TFrmMaterialImprimir.BtnNovoClick(Sender: TObject);
begin
  if CarregarDados then
    inherited;
end;

function TFrmMaterialImprimir.CarregarDados: Boolean;
var
  bReturn : Boolean;
begin
  bReturn := False;

  if RdbMaterialLista.Checked then
  begin
    Report := FrMaterialLista;

    RefreshDB;
    
    CdsMaterialLista.Close;
    CdsMaterialLista.Open;

    bReturn := not CdsMaterialLista.IsEmpty;

    if not bReturn then
      ShowMessageInformation('Sem dados para visualizar/imprimir o relatório selecionado!', RdbMaterialLista.Caption);
  end;

  Result := bReturn;
end;

procedure TFrmMaterialImprimir.FrMaterialListaGetValue(
  const VarName: String; var Value: Variant);
begin
  if ( VarName = 'gUsuario' ) then
    Value := gUsuario.Nome;

  if ( VarName = 'gSistema' ) then
    Value := lblNomeSistema.Caption;

  if ( VarName = 'gVersao' ) then
    Value := lblVersaoSistema.Caption;
end;

end.
