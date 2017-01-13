unit uLerXmlClienteDataSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, Grids, DBGrids, ExtCtrls;

type
  TFrmLerXmlClienteDataSet = class(TForm)
    GroupBox1: TGroupBox;
    edNomeArquivo: TEdit;
    lblNomeArquivo: TLabel;
    btnSelecionar: TButton;
    btnCarregar: TButton;
    opdArquivo: TOpenDialog;
    Bevel1: TBevel;
    GroupBox2: TGroupBox;
    Bevel2: TBevel;
    GroupBox3: TGroupBox;
    dbgLicenca: TDBGrid;
    dbgEmpresa: TDBGrid;
    cdsLicenca: TClientDataSet;
    dtsLicenca: TDataSource;
    cdsEmpresa: TClientDataSet;
    dtsEmpresa: TDataSource;
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnCarregarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLerXmlClienteDataSet: TFrmLerXmlClienteDataSet;

implementation

{$R *.dfm}

procedure TFrmLerXmlClienteDataSet.btnSelecionarClick(Sender: TObject);
begin
  if opdArquivo.Execute then
    edNomeArquivo.Text := opdArquivo.FileName;
end;

procedure TFrmLerXmlClienteDataSet.btnCarregarClick(Sender: TObject);
begin
  if cdsLicenca.Active then
    cdsLicenca.Close;

  if cdsEmpresa.Active then
    cdsEmpresa.Close;

  cdsLicenca.LoadFromFile( edNomeArquivo.Text );
  cdsEmpresa.LoadFromFile( ChangeFileExt(edNomeArquivo.Text, '.empresa.xml') );
end;

end.
