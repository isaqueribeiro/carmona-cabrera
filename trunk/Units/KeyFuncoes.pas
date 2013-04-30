unit KeyFuncoes;

interface

uses
  Windows, Forms, Dialogs, SysUtils, Classes;

type
  TTypeButtonConfirm = (tbYesNo, tbOkCancel, tbYesNoCancel);
    
  procedure ShowMessageInformation(const sMensagem : String; const sTitulo : String = 'Informação');
  procedure ShowMessageWarning(const sMensagem : String; const sTitulo : String = 'Alerta');
  procedure ShowMessageError(const sMensagem : String; const sTitulo : String = 'Erro');
  procedure ShowMessageStop(const sMensagem : String; const sTitulo : String = 'Pare!');

  function ShowMessageConfirm(const sMensagem : String; const sTitulo : String = 'Confirmação';
    const TypeButtonConfirm : TTypeButtonConfirm = tbYesNo) : Boolean;

  function GetFileNameINI : String;

implementation

procedure ShowMessageInformation(const sMensagem : String; const sTitulo : String = 'Informação');
begin
  Application.MessageBox(PChar(sMensagem), PChar(sTitulo), MB_ICONINFORMATION);
end;

procedure ShowMessageWarning(const sMensagem : String; const sTitulo : String = 'Alerta');
begin
  Application.MessageBox(PChar(sMensagem), PChar(sTitulo), MB_ICONWARNING);
end;

procedure ShowMessageError(const sMensagem : String; const sTitulo : String = 'Erro');
begin
  Application.MessageBox(PChar(sMensagem), PChar(sTitulo), MB_ICONERROR);
end;

procedure ShowMessageStop(const sMensagem : String; const sTitulo : String = 'Pare!');
begin
  Application.MessageBox(PChar(sMensagem), PChar(sTitulo), MB_ICONSTOP);
end;

function ShowMessageConfirm(const sMensagem : String; const sTitulo : String = 'Confirmação';
  const TypeButtonConfirm : TTypeButtonConfirm = tbYesNo) : Boolean;
var
  iBotao : Integer;
begin
  Case TypeButtonConfirm of
    tbYesNo:
      iBotao := MB_YESNO;
    tbOkCancel:
      iBotao := MB_OKCANCEL;
    tbYesNoCancel:
      iBotao := MB_YESNOCANCEL;
    else
      iBotao := MB_YESNO;
  end;

  Result := (Application.MessageBox(PChar(sMensagem), PChar(sTitulo), iBotao + MB_ICONQUESTION) = ID_YES);
end;

function GetFileNameINI : String;
var
  sFile : String;
begin
  sFile := ExtractFilePath(ParamStr(0) + 'Conexao.ini');

  if not FileExists(sFile) then
    sFile := ChangeFileExt(ParamStr(0), '.ini');

  Result := sFile;
end;


end.
