program iStore;

uses
  Forms,
  IniFiles,
  Controls,
  SysUtils,
  KeyMain in 'Forms\KeyMain.pas' {FrmMain},
  KeyResource in 'Forms\KeyResource.pas' {DtmResource: TDataModule},
  KeySplash in 'Forms\KeySplash.pas' {FrmSplash},
  KeyLogin in 'Forms\KeyLogin.pas' {FrmLogin},
  iMnyEmpresaPesq in 'Forms\iMnyEmpresaPesq.pas' {FrmEmpresaPesq},
  KeyPermissao in 'Forms\KeyPermissao.pas' {FrmPermissao},
  iMnyPessoa in 'Forms\iMnyPessoa.pas' {FrmPessoa},
  KeyObjeto in 'Forms\KeyObjeto.pas' {FrmObjeto},
  iMnySituacaoPesq in 'Forms\iMnySituacaoPesq.pas' {FrmSituacaoPesq},
  KeyUsuario in 'Forms\KeyUsuario.pas' {FrmUsuario},
  KeyUsuarioPesq in 'Forms\KeyUsuarioPesq.pas' {FrmUsuarioPesq},
  iMnyTotalizadorPesq in 'Forms\iMnyTotalizadorPesq.pas' {FrmTotalizadorPesq},
  iMnyFormaPesq in 'Forms\iMnyFormaPesq.pas' {FrmFormaPesq},
  iMnyCompetencia in 'Forms\iMnyCompetencia.pas' {FrmCompetencia},
  iMnyCaixa in 'Forms\iMnyCaixa.pas' {FrmCaixa},
  iMnyCorrentePesq in 'Forms\iMnyCorrentePesq.pas' {FrmCorrentePesq},
  iMnySetorPesq in 'Forms\iMnySetorPesq.pas' {FrmSetorPesq},
  iMnyUnidadePesq in 'Forms\iMnyUnidadePesq.pas' {FrmUnidadePesq},
  iMnyCustoPesq in 'Forms\iMnyCustoPesq.pas' {FrmCustoPesq},
  iMnyCentroPesq in 'Forms\iMnyCentroPesq.pas' {FrmCentroPesq},
  iMnyNegocioPesq in 'Forms\iMnyNegocioPesq.pas' {FrmNegocioPesq},
  iMnyTipoAceitePesq in 'Forms\iMnyTipoAceitePesq.pas' {FrmTipoAceitePesq},
  iMnyTipoPesPesq in 'Forms\iMnyTipoPesPesq.pas' {FrmTipoPesPesq},
  iMnyContaPRPesq in 'Forms\iMnyContaPRPesq.pas' {FrmContaPRPesq},
  iMnyTipoDocPesq in 'Forms\iMnyTipoDocPesq.pas' {FrmTipoDocPesq},
  iMnyOrcamentoPesq in 'Forms\iMnyOrcamentoPesq.pas' {FrmOrcamentoPesq},
  iMnyContaPR in 'Forms\iMnyContaPR.pas' {FrmContaPR},
  iMnyPessoaPesq in 'Forms\iMnyPessoaPesq.pas' {FrmPessoaPesq},
  iMnyEmpresa in 'Forms\iMnyEmpresa.pas' {FrmEmpresa},
  iMnyContaPesq in 'Forms\iMnyContaPesq.pas' {FrmContaPesq},
  iMnyCaixaEnc in 'Forms\iMnyCaixaEnc.pas' {FrmCaixaEnc},
  iMnyCaixaData in 'Forms\iMnyCaixaData.pas' {FrmCaixaData},
  iMnyRCaixas in 'Reports\iMnyRCaixas.pas' {FrmRCaixas},
  iMnyContaPRDoc in 'Forms\iMnyContaPRDoc.pas' {FrmContaPRDoc},
  iMnyRFluxo in 'Reports\iMnyRFluxo.pas' {FrmRFluxo},
  KeyFuncoes in 'Units\KeyFuncoes.pas';

{$R *.res}

Var
  Ini :TIniFile;
begin
  Application.Initialize;
  Application.Title := 'iStore - Sistema de Controle de Estoque';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TDtmResource, DtmResource);
  Application.CreateForm(TFrmSplash, FrmSplash);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Ini := TIniFile.Create( GetFileNameINI );
  IF Ini.ReadString('DIVERSOS', 'SPLASH', '') = 'S' Then
    Begin
      FrmSplash := TFrmSplash.Create(Application);
      FrmSplash.ShowModal;
    End;
  If (FrmLogin.ShowModal = mrOK) Then
    Application.Run
  Else
    Application.Terminate;
end.
