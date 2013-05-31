program iStore;

uses
  Forms,
  IniFiles,
  Controls,
  SysUtils,
  iStrMain in 'Forms\iStrMain.pas' {FrmMain},
  KeyResource in 'Forms\KeyResource.pas' {DtmResource: TDataModule},
  KeySplash in 'Forms\KeySplash.pas' {FrmSplash},
  iStrLogin in 'Forms\iStrLogin.pas' {FrmLogin},
  KeyPermissao in 'Forms\KeyPermissao.pas' {FrmPermissao},
  KeyUsuario in 'Forms\KeyUsuario.pas' {FrmUsuario},
  KeyUsuarioPesq in 'Forms\KeyUsuarioPesq.pas' {FrmUsuarioPesq},
  KeyFuncoes in 'Units\KeyFuncoes.pas',
  iStrSplash in 'Forms\iStrSplash.pas' {FrmStrSplash},
  KeyVersion in 'Units\KeyVersion.pas',
  KeyObservable in 'Units\KeyObservable.pas',
  KeyPadrao in 'Forms\KeyPadrao.pas' {FrmPadrao},
  KeyPadraoTabela in 'Forms\KeyPadraoTabela.pas' {FrmPadraoTabela},
  KeyPadraoTabelaFormularioCadastro in 'Forms\KeyPadraoTabelaFormularioCadastro.pas' {FrmPadraoTabelaFormularioCadastro},
  KeyPadraoTabelaCadastro in 'Forms\KeyPadraoTabelaCadastro.pas' {FrmPadraoTabelaCadastro},
  KeyPadraoCadastro in 'Forms\KeyPadraoCadastro.pas' {FrmPadraoCadastro},
  KeyPadraoImprimir in 'Forms\KeyPadraoImprimir.pas' {FrmPadraoImprimir},
  KeyObjeto in 'Forms\KeyObjeto.pas' {FrmObjeto},
  KeySetor in 'Forms\KeySetor.pas' {FrmSetor},
  KeyRequiredFields in 'Forms\KeyRequiredFields.pas' {FrmRequiredFields},
  iStrMaterialTipo in 'Forms\iStrMaterialTipo.pas' {FrmMaterialTipo},
  iStrMaterialGrupo in 'Forms\iStrMaterialGrupo.pas' {FrmMaterialGrupo},
  iStrUnidadeMedida in 'Forms\iStrUnidadeMedida.pas' {FrmUnidadeMedida},
  iStrMaterialDescricao in 'Forms\iStrMaterialDescricao.pas' {FrmMaterialDescricao},
  iStrMaterialApresentacao in 'Forms\iStrMaterialApresentacao.pas' {FrmMaterialApresentacao},
  iStrMaterialPesquisa in 'Forms\iStrMaterialPesquisa.pas' {FrmMaterialPesquisa},
  iStrMaterialCadastro in 'Forms\iStrMaterialCadastro.pas' {FrmMaterialCadastro},
  iStrMaterialImprimir in 'Reports\iStrMaterialImprimir.pas' {FrmMaterialImprimir},
  KeyUnidadeNegocio in 'Forms\KeyUnidadeNegocio.pas' {FrmUnidadeNegocio};

{$R *.res}

Var
  Ini :TIniFile;
begin
  Application.Initialize;
  Application.Title := 'iStore - Sistema de Controle de Estoque';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TDtmResource, DtmResource);
  Application.CreateForm(TFrmStrSplash, FrmStrSplash);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Ini := TIniFile.Create( GetFileNameINI );
  IF Ini.ReadString('DIVERSOS', 'SPLASH', '') = 'S' Then
    Begin
      FrmStrSplash := TFrmStrSplash.Create(Application);
      FrmStrSplash.ShowModal;
    End;
  If (FrmLogin.ShowModal = mrOK) Then
    Application.Run
  Else
    Application.Terminate;
end.
