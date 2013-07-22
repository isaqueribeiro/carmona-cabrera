unit iStrMovimentoEntradaApropriar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadraoDialogo, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, cxContainer, cxEdit,
  dxSkinsCore, cxGroupBox, StdCtrls, cxButtons, ExtCtrls, DB, cxTextEdit,
  cxDBEdit, cxLabel, DBClient, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, FMTBcd, Provider, SqlExpr;

type
  TFrmMovimentoEntradaApropriar = class(TFrmPadraoDialogo)
    GrpBxApropriacao: TcxGroupBox;
    DtsMovimento: TDataSource;
    lblCodigo: TcxLabel;
    dbAno: TcxDBTextEdit;
    dbCodigo: TcxDBTextEdit;
    lblFornecedor: TcxLabel;
    dbFornecedor: TcxDBTextEdit;
    lblSituacao: TcxLabel;
    dbSituacao: TcxDBTextEdit;
    lblTipoCusto: TcxLabel;
    dbTipoCusto: TcxDBLookupComboBox;
    lblCentroNegocio: TcxLabel;
    dbCentroNegocio: TcxDBLookupComboBox;
    lblUnidadeNegocio: TcxLabel;
    dbUnidadeNegocio: TcxDBLookupComboBox;
    lblCentroCusto: TcxLabel;
    dbCentroCusto: TcxDBLookupComboBox;
    lblSetor: TcxLabel;
    dbSetor: TcxDBLookupComboBox;
    lblConta: TcxLabel;
    dbConta: TcxDBLookupComboBox;
    QryTipoCusto: TSQLQuery;
    DspTipoCusto: TDataSetProvider;
    CdsTipoCusto: TClientDataSet;
    DtsTipoCusto: TDataSource;
    QryCentroNegocio: TSQLQuery;
    DspCentroNegocio: TDataSetProvider;
    CdsCentroNegocio: TClientDataSet;
    DtsCentroNegocio: TDataSource;
    QryUnidadeNegocio: TSQLQuery;
    DspUnidadeNegocio: TDataSetProvider;
    CdsUnidadeNegocio: TClientDataSet;
    DtsUnidadeNegocio: TDataSource;
    QryCentroCusto: TSQLQuery;
    DspCentroCusto: TDataSetProvider;
    CdsCentroCusto: TClientDataSet;
    DtsCentroCusto: TDataSource;
    QrySetor: TSQLQuery;
    DspSetor: TDataSetProvider;
    CdsSetor: TClientDataSet;
    DtsSetor: TDataSource;
    QryConta: TSQLQuery;
    DspConta: TDataSetProvider;
    CdsConta: TClientDataSet;
    DtsConta: TDataSource;
    QryTipoAceite: TSQLQuery;
    DspTipoAceite: TDataSetProvider;
    CdsTipoAceite: TClientDataSet;
    DtsTipoAceite: TDataSource;
    lblTipoAceite: TcxLabel;
    dbTipoAceite: TcxDBLookupComboBox;
    procedure BtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DtsMovimentoStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMovimentoEntradaApropriar: TFrmMovimentoEntradaApropriar;

implementation

uses
    DateUtils
  , Math  
  , KeyFuncoes
  {$IFDEF IMONEY}
  , KeyMain
  , KeyLogin
  {$ENDIF}
  {$IFDEF ISTORE}
  , iStrMain
  , iStrLogin
  {$ENDIF}
  , KeyResource
  , KeyPadrao
  , KeyRequiredFields
  , iStrMovimentoEntradaCadastro;

{$R *.dfm}

procedure TFrmMovimentoEntradaApropriar.BtnConfirmarClick(Sender: TObject);
begin
  with TClientDataSet(DtsMovimento.DataSet) do
  begin
    FieldByName('ent_aprop_tipo_aceite').Required     := True;
    FieldByName('ent_aprop_tipo_custo').Required      := True;
    FieldByName('ent_aprop_centro_negocio').Required  := True;
    FieldByName('ent_aprop_unidade_negocio').Required := True;
    FieldByName('ent_aprop_centro_custo').Required    := True;
    FieldByName('ent_aprop_setor').Required           := True;
    FieldByName('ent_aprop_conta').Required           := True;

    if ( not ExistRequiredFields(Self, TClientDataSet(DtsMovimento.DataSet), 'Movimento de Entrada - Apropriação') ) then
      ModalResult := mrOk;

    FieldByName('ent_aprop_tipo_aceite').Required     := not True;
    FieldByName('ent_aprop_tipo_custo').Required      := not True;
    FieldByName('ent_aprop_centro_negocio').Required  := not True;
    FieldByName('ent_aprop_unidade_negocio').Required := not True;
    FieldByName('ent_aprop_centro_custo').Required    := not True;
    FieldByName('ent_aprop_setor').Required           := not True;
    FieldByName('ent_aprop_conta').Required           := not True;
  end;
end;

procedure TFrmMovimentoEntradaApropriar.FormCreate(Sender: TObject);
begin
  inherited;
  CdsTipoAceite.Open;
  CdsTipoCusto.Open;
  CdsCentroNegocio.Open;
  CdsUnidadeNegocio.Open;
  CdsCentroCusto.Open;
  CdsSetor.Open;
  CdsConta.Open;
end;

procedure TFrmMovimentoEntradaApropriar.DtsMovimentoStateChange(
  Sender: TObject);
begin
  BtnConfirmar.Enabled := (DtsMovimento.DataSet.State = dsEdit);
end;

procedure TFrmMovimentoEntradaApropriar.FormShow(Sender: TObject);
begin
  inherited;
  DtsMovimentoStateChange( DtsMovimento );
end;

end.
