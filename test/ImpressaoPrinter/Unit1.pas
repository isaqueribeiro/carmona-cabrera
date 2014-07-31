unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Printers;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure ImprimirComCanvas_Spooler(Memo: TStrings);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo1.Lines.LoadFromFile('C:\Users\Isaque\Documents\_Temp\CUPOM.TXT');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ImprimirComCanvas_Spooler(Memo1.Lines);
end;

procedure TForm1.ImprimirComCanvas_Spooler(Memo: TStrings);
const
  cEspacoLinha = 5;
  cMargemSuperior = 50;
  cMargemEsquerda = 30;
var
  AlturaLinha, Y, I: integer;
begin

  Printer.BeginDoc;

  try
    { Configurar Fonte da Impressora }

    Printer.Canvas.Font.Name := 'Courier New'; //'Arial Narrow';
    Printer.Canvas.Font.Size := 8;

    AlturaLinha := Printer.Canvas.TextHeight('Tg');

    Y := cMargemSuperior;
    for I := 0 to Memo.Count - 1 do begin

      if I = 0 then
      begin
        Printer.Canvas.Font.Style := [fsBold];
        Printer.Canvas.Font.Size  := 8;
      end
      else
      begin
        Printer.Canvas.Font.Style := [];
        Printer.Canvas.Font.Size  := 8;
      end;

      if Y > Printer.PageHeight then begin
        Printer.NewPage;
        Y := cMargemSuperior;
      end;

      Printer.Canvas.TextOut(cMargemEsquerda, Y, Memo[I]);

      Y := Y + AlturaLinha + cEspacoLinha;
    end;
    
  finally
    Printer.EndDoc;
  end;

end;

end.
