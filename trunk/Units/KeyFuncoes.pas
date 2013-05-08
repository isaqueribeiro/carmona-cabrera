unit KeyFuncoes;

interface

uses
  Windows, Forms, Dialogs, SysUtils, Classes, Variants;

type
  TTypeButtonConfirm = (tbYesNo, tbOkCancel, tbYesNoCancel);
    
  procedure ShowMessageInformation(const sMensagem : String; const sTitulo : String = 'Informação');
  procedure ShowMessageWarning(const sMensagem : String; const sTitulo : String = 'Alerta');
  procedure ShowMessageError(const sMensagem : String; const sTitulo : String = 'Erro');
  procedure ShowMessageStop(const sMensagem : String; const sTitulo : String = 'Pare!');

  function ShowMessageConfirm(const sMensagem : String; const sTitulo : String = 'Confirmação';
    const TypeButtonConfirm : TTypeButtonConfirm = tbYesNo) : Boolean;

  function GetFileNameINI : String;
  function GetDateToSGDB(const Data : Variant; const Quoted: Boolean = FALSE): string;
  function GetDateTimeToSGDB(const Data : Variant; const Quoted: Boolean = FALSE): string;

  function StrIsInteger(const S : String) : Boolean;

const
  SYS_IMONEY_ID = 1;
  SYS_ISTORE_ID = 1;

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

  Result := (Application.MessageBox(PChar(sMensagem), PChar(sTitulo), iBotao + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES);
end;

function GetFileNameINI : String;
var
  sFile : String;
begin
  sFile := ExtractFilePath(ParamStr(0)) + 'Conexao.ini';

  if not FileExists(sFile) then
    sFile := ChangeFileExt(ParamStr(0), '.ini');

  if not FileExists(sFile) then
    ShowMessageWarning('Arquivo de configurações não encontrado!' + #13 + sFile, 'Configurações');
    
  Result := sFile;
end;

function GetDateToSGDB(const Data : Variant; const Quoted: Boolean = FALSE): string;
var
  sFormat : String;
begin

  if VarIsNull(Data) or (Data = EncodeDate(1899, 12, 30)) then
  begin
    Result := 'NULL';
    Exit;
  end;

  sFormat := 'yyyy-mm-dd'; // Formato MySQL
  Result  := FormatDateTime(sFormat, VarToDateTime(Data));

  if Quoted then
    Result := QuotedStr(Result);
end;

function GetDateTimeToSGDB(const Data : Variant; const Quoted: Boolean = FALSE): string;
var
  sFormat : String;
begin

  if VarIsNull(Data) or (Data = EncodeDate(1899, 12, 30)) then
  begin
    Result := 'NULL';
    Exit;
  end;

  sFormat := 'yyyy-mm-dd hh:mm:ss'; // Formato MySQL
  Result  := FormatDateTime(sFormat, VarToDateTime(Data));

  if Quoted then
    Result := QuotedStr(Result);
end;

function StrIsInteger(const S : String) : Boolean;
var
  I : Integer;
begin
  Result := TryStrToInt(S, I);
end;

end.
