unit KeyPessoaPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadraoTabelaCadastro, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, dxSkinsCore,
  dxSkinscxPCPainter, cxContainer, cxEdit, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, FMTBcd, Provider,
  DBClient, SqlExpr, StdCtrls, ExtCtrls, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxMaskEdit, cxDropDownEdit, cxImageComboBox,
  cxTextEdit, cxGroupBox, cxPC, cxButtons, ImgList;

type
  TFrmPessoaPesquisa = class(TFrmPadraoTabelaCadastro)
    CdsMasterpes_codigo: TIntegerField;
    CdsMasterpes_documento: TStringField;
    CdsMasterpes_razao_social: TStringField;
    CdsMasterpes_nome_fantasia: TStringField;
    CdsMastertip_codigo: TSmallintField;
    CdsMasterpes_insc_estadual: TStringField;
    CdsMasterpes_insc_municipal: TStringField;
    CdsMasterpes_contato: TStringField;
    CdsMasterpes_fones: TStringField;
    CdsMasterpes_status: TSmallintField;
    CdsMastertip_nome: TStringField;
    CdsMasterpes_ult_datamov: TSQLTimeStampField;
    ImgStatus: TImageList;
    DbgTabelaDBpes_codigo: TcxGridDBColumn;
    DbgTabelaDBpes_documento: TcxGridDBColumn;
    DbgTabelaDBpes_razao_social: TcxGridDBColumn;
    DbgTabelaDBpes_fones: TcxGridDBColumn;
    DbgTabelaDBpes_status: TcxGridDBColumn;
    DbgTabelaDBtip_nome: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
    function PermitirExcluirRegistro : Boolean; override;
  end;

var
  FrmPessoaPesquisa: TFrmPessoaPesquisa;

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
  , KeyPadrao
  , KeyPadraoTabela
  , KeyPessoaCadastro;

{$R *.dfm}

{ TFrmPessoaPesquisa }

function TFrmPessoaPesquisa.ExecutarPesquisa: Boolean;
begin
  RefreshDB;

  CdsMaster.Close;
  QryMaster.SQL.Clear;
  QryMaster.SQL.AddStrings( SQL_Master );
  QryMaster.SQL.Add('where (1 = 1)');

  Case CmbTipoPesquisa.ItemIndex of
    0:
      begin
        if Trim(EdtPesquisa.Text) <> EmptyStr then
          if StrIsInteger( Trim(EdtPesquisa.Text) ) then
            QryMaster.SQL.Add('  and p.pes_codigo = ' + Trim(EdtPesquisa.Text))
          else
          if StrIsCPF( Trim(EdtPesquisa.Text) ) then
            QryMaster.SQL.Add('  and p.pes_documento = ' + QuotedStr(StrFormatarCpf(Trim(EdtPesquisa.Text))))
          else
          if StrIsCNPJ( Trim(EdtPesquisa.Text) ) then
            QryMaster.SQL.Add('  and p.pes_documento = ' + QuotedStr(StrFormatarCnpj(Trim(EdtPesquisa.Text))))
          else
          begin
            QryMaster.SQL.Add('  and ((upper(p.pes_razao_social)  like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%') + ')');
            QryMaster.SQL.Add('    or (upper(p.pes_nome_fantasia) like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%') + '))');
          end;
      end;

    1:
      begin
        if Trim(EdtPesquisa.Text) <> EmptyStr then
        begin
          QryMaster.SQL.Add('  and ((upper(p.pes_razao_social)  like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%') + ')');
          QryMaster.SQL.Add('    or (upper(p.pes_nome_fantasia) like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%') + '))');
        end;
      end;

    2:
      begin
        if Trim(EdtPesquisa.Text) <> EmptyStr then
          if StrIsCPF( Trim(EdtPesquisa.Text) ) then
            QryMaster.SQL.Add('  and p.pes_documento = ' + QuotedStr(StrFormatarCpf(Trim(EdtPesquisa.Text))))
          else
          if StrIsCNPJ( Trim(EdtPesquisa.Text) ) then
            QryMaster.SQL.Add('  and p.pes_documento = ' + QuotedStr(StrFormatarCnpj(Trim(EdtPesquisa.Text))));
      end;
  end;

  QryMaster.SQL.Add('order by p.pes_razao_social'); 
  CdsMaster.Open;

  Result := not CdsMaster.IsEmpty;
end;

procedure TFrmPessoaPesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  ComponenteLogin := FrmLogin;
  ConexaoDB       := FrmLogin.conWebMaster;

  NomeTabela     := 'mny_pessoa';
  CampoChave     := 'pes_codigo';
  CampoDescricao := 'pes_razao_social';
  CampoOrdenacao := 'pes_razao_social';

  AbrirTabela := True;
end;

function TFrmPessoaPesquisa.PermitirExcluirRegistro: Boolean;
begin
  Result := CdsMasterpes_ult_datamov.IsNull;

  if not Result then
    ShowMessageWarning('Registro não pode ser excluído por possuir histórico de movimentação!', 'Exclusão');
end;

procedure TFrmPessoaPesquisa.BtnNovoClick(Sender: TObject);
var
  AForm : TFrmPessoaCadastro;
begin
  AForm := TFrmPessoaCadastro.CreateTable(Self, FrmLogin, FrmLogin.conWebMaster);
  try
    AForm.SetParametrosPesquisa([0]);

    if ( AForm.ExecutarInsercao ) then
      CdsMaster.Refresh;
  finally
    AForm.Free;
  end;
end;

procedure TFrmPessoaPesquisa.BtnEditarClick(Sender: TObject);
var
  AForm : TFrmPessoaCadastro;
begin
  PermitirEditar := True;

  AForm := TFrmPessoaCadastro.CreateTable(Self, FrmLogin, FrmLogin.conWebMaster);
  try
    AForm.SetParametrosPesquisa([CdsMasterpes_codigo.AsCurrency]);
    AForm.ExecutarPesquisa;

    if not PermitirEditar then
      AForm.VisualizarConsulta
    else
    if ( AForm.ExecutarAlteracao ) then
      CdsMaster.Refresh;
  finally
    AForm.Free;
  end;
end;

end.
