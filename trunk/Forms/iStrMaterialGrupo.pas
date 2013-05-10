unit iStrMaterialGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadraoTabelaFormularioCadastro, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, dxSkinsCore,
  dxSkinscxPCPainter, cxContainer, cxEdit, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, FMTBcd, Provider,
  DBClient, SqlExpr, StdCtrls, ExtCtrls, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxMaskEdit, cxDropDownEdit, cxImageComboBox,
  cxTextEdit, cxGroupBox, cxPC, cxButtons;

type
  TFrmMaterialGrupo = class(TFrmPadraoTabelaFormularioCadastro)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
  end;

var
  FrmMaterialGrupo: TFrmMaterialGrupo;

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

function TFrmMaterialGrupo.ExecutarPesquisa: Boolean;
begin
  Result := False;
end;

procedure TFrmMaterialGrupo.FormCreate(Sender: TObject);
begin
  inherited;
  ComponenteLogin := FrmLogin;
  ConexaoDB       := FrmLogin.conWebMaster;
  
  NomeTabela     := 'str_material_grupo';
  CampoChave     := 'grp_codigo';
  CampoDescricao := 'grp_descricao';
  CampoOrdenacao := 'grp_descricao';

  AbrirTabela := True;
end;

end.
