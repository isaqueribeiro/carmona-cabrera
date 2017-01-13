unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExcelXP, OleServer, StdCtrls;

type
  TForm1 = class(TForm)
    XLBook: TExcelWorkbook;
    Button1: TButton;
    XLApp: TExcelApplication;
    XLSheet: TExcelOLEObject;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  sArquivo : String;
  I,
  iLinha   ,
  iColuna  ,
  LCID     : Integer;

  MyXLWorkbook  ,
  MyXLWorksheet : OleVariant;
  sValor : String;
const
  COLUNA_QTDE  = 12; // Coluna L
  COLUNA_VALOR = 17; // Coluna Q
  COLUNA_TOTAL = 21; // Coluna U
begin
  sArquivo := 'C:\Users\Isaque\Documents\_Temp\Cotacao 0001.xls';
  LCID     := GetUserDefaultLCID;

  XLApp.Connect;

  XLApp.Visible[LCID]       := False; //True;
  XLApp.DisplayAlerts[LCID] := False; //True;

  MyXLWorkbook := XLApp.Workbooks._Open(
    sArquivo,
    EmptyParam, //UpdateLinks: OleVariant
    EmptyParam, //ReadOnly: OleVariant
    EmptyParam, //Format: OleVariant
    EmptyParam, //Password: OleVariant
    EmptyParam, //WriteResPassword: OleVariant
    EmptyParam, //IgnoreReadOnlyRecommended: OleVariant
    EmptyParam, //Orign: OleVariant
    EmptyParam, //Delimiter: OleVariant
    EmptyParam, //Editable: OleVariant
    EmptyParam, //Notify: OleVariant
    EmptyParam, //Converter: OleVariant
    EmptyParam, //AddToMru: OleVariant
    LCID);


  MyXLWorksheet := MyXLWorkbook.Worksheets.Item['Plan1'];
  MyXLWorksheet.Activate;

  MyXLWorksheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
  iLinha  := XLApp.ActiveCell.Row;
  iColuna := XLApp.ActiveCell.Column;

  for I := 1 to iLinha do
  begin
    sValor := Trim(MyXLWorksheet.Cells[I, COLUNA_QTDE]); // Coluna L "Qtde."

    if sValor = EmptyStr then
      Continue;

    if (Copy(sValor, 1, 1) = '''') then
      sValor := StringReplace(sValor, '''', '', [rfReplaceAll]);

    if StrToCurrDef(sValor, 0) > 0 then
    begin
      MyXLWorksheet.Cells[I, COLUNA_QTDE]  := sValor;
      MyXLWorksheet.Cells[I, COLUNA_VALOR] := 0.0;
      MyXLWorksheet.Cells[I, COLUNA_TOTAL] := '=L' + IntToStr(I) + '*Q' + IntToStr(I);
    end;
  end;

  MyXLWorkbook.Worksheets.Item['Plan1'].Range['A11'].Select;

  MyXLWorkbook.Save;

  XLApp.DisplayAlerts[LCID] := True;

  XLBook.Disconnect;
  XLApp.Quit;
  XLApp.Disconnect;

  ShowMessage( 'Planilha modificada com sucesso!' + #13 + sArquivo );
end;

end.
