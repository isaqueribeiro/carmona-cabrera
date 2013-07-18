unit KeyPessoaCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadraoCadastro, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, dxSkinsCore,
  dxSkinscxPCPainter, cxContainer, cxEdit, FMTBcd, DB, DBClient, Provider,
  SqlExpr, cxGroupBox, cxPC, StdCtrls, cxButtons, ExtCtrls, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxTextEdit, cxDBEdit, cxLabel, cxImageComboBox, ImgList;

type
  TFrmPessoaCadastro = class(TFrmPadraoCadastro)
    lblCodigo: TcxLabel;
    dbCodigo: TcxDBTextEdit;
    lblTipo: TcxLabel;
    dbTipo: TcxDBLookupComboBox;
    lblDocumento: TcxLabel;
    dbDocumento: TcxDBTextEdit;
    lblNome: TcxLabel;
    dbNome: TcxDBTextEdit;
    lblRazaoSocial: TcxLabel;
    dbRazaoSocial: TcxDBTextEdit;
    lblInscMunicipal: TcxLabel;
    dbInscMunicipal: TcxDBTextEdit;
    lblInscEstadual: TcxLabel;
    dbInscEstadual: TcxDBTextEdit;
    GrpDadosEndereco: TcxGroupBox;
    lblLogradouro: TcxLabel;
    dbLogradouro: TcxDBTextEdit;
    lblCidade: TcxLabel;
    lblBairro: TcxLabel;
    dbBairro: TcxDBTextEdit;
    lblCEP: TcxLabel;
    dbCEP: TcxDBTextEdit;
    lblUF: TcxLabel;
    QryPessoaTipo: TSQLQuery;
    DspPessoaTipo: TDataSetProvider;
    CdsPessoaTipo: TClientDataSet;
    DtsPessoaTipo: TDataSource;
    QryUF: TSQLQuery;
    DspUF: TDataSetProvider;
    CdsUF: TClientDataSet;
    DtsUF: TDataSource;
    QryCidade: TSQLQuery;
    DspCidade: TDataSetProvider;
    CdsCidade: TClientDataSet;
    DtsCidade: TDataSource;
    GrpDadosContato: TcxGroupBox;
    lblNomeContato: TcxLabel;
    dbNomeContato: TcxDBTextEdit;
    lblTelefone: TcxLabel;
    dbTelefone: TcxDBTextEdit;
    lblEmail: TcxLabel;
    dbEmail: TcxDBTextEdit;
    GrpDadosOutrasInfo: TcxGroupBox;
    lblContaCorrente: TcxLabel;
    lblStatus: TcxLabel;
    lblObservacoes: TcxLabel;
    dbObservacoes: TcxDBTextEdit;
    dbUF: TcxDBLookupComboBox;
    dbCidade: TcxDBLookupComboBox;
    dbContaCorrente: TcxDBLookupComboBox;
    ImgStatus: TImageList;
    dbStatus: TcxDBImageComboBox;
    QryContaCorrente: TSQLQuery;
    DspContaCorrente: TDataSetProvider;
    CdsContaCorrente: TClientDataSet;
    DtsContaCorrente: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPessoaCadastro: TFrmPessoaCadastro;

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

end.
