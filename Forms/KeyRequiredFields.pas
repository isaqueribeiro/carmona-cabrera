unit KeyRequiredFields;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadrao, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinscxPCPainter, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxImageComboBox, Menus, StdCtrls, cxButtons, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, ExtCtrls, cxPC, DBClient;

type
  TFrmRequiredFields = class(TFrmPadrao)
    CdsCampo: TClientDataSet;
    CdsCampoIMAGEM: TIntegerField;
    CdsCampoCAMPO: TStringField;
    DtSrcCampo: TDataSource;
    PgCntrlMain: TcxPageControl;
    TbShtMain: TcxTabSheet;
    Label1: TLabel;
    Bevel1: TBevel;
    ImgIcon: TImage;
    Shape1: TShape;
    LblDescricao: TLabel;
    dbgCmp: TcxGrid;
    dbgCmpTbl: TcxGridDBTableView;
    dbgCmpTblIMAGEM: TcxGridDBColumn;
    dbgCmpTblCAMPO: TcxGridDBColumn;
    dbgCmpLvl: TcxGridLevel;
    BtnFechar: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure Add(const aLabel: string; aImage: Integer);
  public
    { Public declarations }
  end;

  function ExistRequiredFields(const AOnwer : TComponent; const DataSet : TClientDataSet; sTitulo : String) : Boolean;

implementation

uses
  KeyResource;

{$R *.dfm}

function ExistRequiredFields(const AOnwer : TComponent; const DataSet : TClientDataSet; sTitulo : String) : Boolean;
var
  AForm : TFrmRequiredFields;
  I : Integer;
begin
  AForm := TFrmRequiredFields.Create(AOnwer);
  try
    AForm.LblDescricao.Caption := Trim(sTitulo);
    for I := 0 to DataSet.Fields.Count - 1 do
      with DataSet do
      begin
        if Fields[I].Required and Fields[I].IsNull then
        begin
          AForm.Add(Fields[I].DisplayLabel, 1);
        end; 
      end;
      
    AForm.CdsCampo.First;

    if (AForm.CdsCampo.RecordCount > 0) then
    begin
      Result := True;
      AForm.ShowModal;
    end
    else
      Result := False;
  finally
    AForm.Free;
  end;
end;

procedure TFrmRequiredFields.FormCreate(Sender: TObject);
begin
  inherited;
  ImgIcon.Picture.Icon := Application.Icon;
  CdsCampo.CreateDataSet;
end;

procedure TFrmRequiredFields.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CdsCampo.Close;
end;

procedure TFrmRequiredFields.Add(const aLabel: string; aImage: Integer);
begin
  with CdsCampo do
  begin
    Append;
    CdsCampoIMAGEM.Value := aImage;
    CdsCampoCAMPO.Value  := aLabel;
    Post;
  end;
end;

end.
