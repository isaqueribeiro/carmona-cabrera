unit KeyPadraoImprimir;

interface

uses
  KeyFuncoes,
  KeyResource,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadrao, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxControls, cxContainer, cxEdit, dxSkinsCore, cxLabel, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxGroupBox, ExtCtrls,
  StdCtrls, cxButtons, dxGDIPlusClasses, frxClass, frxDBSet, FMTBcd,
  DBClient, Provider, DB, SqlExpr;

type
  TFrmPadraoImprimir = class(TFrmPadrao)
    PnlBotoes: TPanel;
    btnFechar: TcxButton;
    BtnNovo: TcxButton;
    PnlBanner: TPanel;
    PnlControle: TPanel;
    GrpBxOpcaoImpressao: TcxGroupBox;
    edModo: TcxImageComboBox;
    lblModo: TcxLabel;
    GrpBxBanner: TcxGroupBox;
    ImgBanner: TImage;
    lblNomeSistema: TcxLabel;
    lblVersaoSistema: TcxLabel;
    BvlFiltrar: TBevel;
    GrpBxRelatorio: TcxGroupBox;
    GrpBxFiltrar: TcxGroupBox;
    BvlRelatorio: TBevel;
    QryEmpresa: TSQLQuery;
    DspEmpresa: TDataSetProvider;
    CdsEmpresa: TClientDataSet;
    FrDBEmpresa: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure CdsEmpresaBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FReport : TfrxReport;
    procedure ConfirmarClick(const cFastReport : TfrxReport);
  public
    { Public declarations }
    property Report : TfrxReport read FReport write FReport;
  end;

var
  FrmPadraoImprimir: TFrmPadraoImprimir;

implementation

{$R *.dfm}

procedure TFrmPadraoImprimir.FormCreate(Sender: TObject);
begin
  inherited;
  FReport := TfrxReport.Create(Self);

  lblNomeSistema.Caption   := SystemName;
  lblVersaoSistema.Caption := SystemVersion;
end;

procedure TFrmPadraoImprimir.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPadraoImprimir.ConfirmarClick(const cFastReport: TfrxReport);
begin
  if ( edModo.EditValue = 0 ) then
    cFastReport.ShowReport
  else
  if ( edModo.EditValue = 1 ) then
    cFastReport.Print;
end;

procedure TFrmPadraoImprimir.BtnNovoClick(Sender: TObject);
begin
  ConfirmarClick( FReport );
end;

procedure TFrmPadraoImprimir.CdsEmpresaBeforeOpen(DataSet: TDataSet);
begin
  CdsEmpresa.Params.ParamByName('emp_codigo').AsInteger := 0;
end;

end.
