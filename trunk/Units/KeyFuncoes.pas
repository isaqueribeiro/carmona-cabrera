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
  function GetTimeToSGDB(const Data : Variant; const Quoted: Boolean = FALSE): string;

  function StrIsInteger(const S : String) : Boolean;
  function StrIsCPF(const Num : string) : Boolean;
  function StrIsCNPJ(const Num : string) : Boolean;

  function StrFormatarCpf(sCpf: String) : String;
  function StrFormatarCnpj(sCnpj: String) : String;

const
  SYS_IMONEY_ID = 1;
  SYS_ISTORE_ID = 2;

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
  iReturn,
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

  iReturn := Application.MessageBox(PChar(sMensagem), PChar(sTitulo), iBotao + MB_ICONQUESTION + MB_DEFBUTTON2);
  Result  := ( (iReturn = ID_YES) or (iReturn = ID_OK));
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

function GetTimeToSGDB(const Data : Variant; const Quoted: Boolean = FALSE) : String;
var
  sFormat : String;
begin

  if VarIsNull(Data) or (Data = EncodeDate(1899, 12, 30)) then
  begin
    Result := 'NULL';
    Exit;
  end;

  sFormat := 'hh:mm:ss'; // Formato MySQL
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

function StrIsCPF(const Num : string) : Boolean;
var
  I, Numero, Resto: Byte ;
  Dv1, Dv2: Byte ;
  Total, Soma: Integer ;
  Valor: string;
begin
  if ( StrToIntDef(Copy(Num, 1, 2), -1) = -1 ) then
  begin
    Result := False;
    Exit;
  end;

  Valor := Num;
  for I := 1 to Length(Valor) do
    if not (Valor[I] in ['0'..'9']) then Delete(Valor, I, 1);
  try
    StrToInt(Copy(Valor, 1, 5));
  except
    Result := True;
    Exit;
  end;
  Result := False;
  if Length(Valor) = 11 then
  begin
    Total := 0 ;
    Soma := 0 ;
    for I := 1 to 9 do
    begin
      try
        Numero := StrToInt (Valor[I]);
      except
        Numero := 0;
      end;
      Total := Total + (Numero * (11 - I)) ;
      Soma := Soma + Numero;
    end;
    Resto := Total mod 11;
    if Resto > 1
      then Dv1 := 11 - Resto
      else Dv1 := 0;
    Total := Total + Soma + 2 * Dv1;
    Resto := Total mod 11;
    if Resto > 1
      then Dv2 := 11 - Resto
      else Dv2 := 0;
    if (IntToStr (Dv1) = Valor[10]) and (IntToStr (Dv2) = Valor[11])
      then Result := True;
  end;
end;

function StrIsCNPJ(const Num : string) : Boolean;
var
  Dig: array [1..14] of Byte;
  I, Resto: Byte;
  Dv1, Dv2: Byte;
  Total1, Total2: Integer;
  Valor: string;
begin
  if ( StrToIntDef(Copy(Num, 1, 2), -1) = -1 ) then
  begin
    Result := False;
    Exit;
  end;

  Valor := Num;

  for I := 1 to Length(Valor) do
    if not (Valor[I] in ['0'..'9']) then
      Delete(Valor, I, 1);

  if ( StrToIntDef(Copy(Valor, 1, 5), 0) = 0 ) then
  begin
    Result := False;
    Exit;
  end;

  try
    StrToInt(Copy(Valor, 1, 5));
  except
    Result := True;
    Exit;
  end;

  Result := False;

  if Length(Valor) = 14 then
  begin
    for I := 1 to 14 do
      try
        Dig[I] := StrToInt (Valor[I]);
      except
        Dig[i] := 0;
      end;

    Total1 := Dig[1]  * 5 + Dig[2]  * 4 + Dig[3]  * 3 +
              Dig[4]  * 2 + Dig[5]  * 9 + Dig[6]  * 8 +
              Dig[7]  * 7 + Dig[8]  * 6 + Dig[9]  * 5 +
              Dig[10] * 4 + Dig[11] * 3 + Dig[12] * 2 ;

    Resto := Total1 mod 11;

    if Resto > 1 then
      Dv1 := 11 - Resto
    else
      Dv1 := 0;

    Total2 := Dig[1]  * 6 + Dig[2]  * 5 + Dig[3]  * 4 +
              Dig[4]  * 3 + Dig[5]  * 2 + Dig[6]  * 9 +
              Dig[7]  * 8 + Dig[8]  * 7 + Dig[9]  * 6 +
              Dig[10] * 5 + Dig[11] * 4 + Dig[12] * 3 + Dv1 * 2 ;

    Resto := Total2 mod 11;

    if Resto > 1 then
      Dv2 := 11 - Resto
    else
      Dv2 := 0;

    if (Dv1 = Dig[13]) and (Dv2 = Dig[14]) then
      Result := True;
  end;

end;

function StrFormatarCpf(sCpf: String): String;
var
  S : String;
begin
  S := Trim(sCpf); // 000.000.000-00

  if ( Copy(S, 4, 1) <> '.' ) then
    S := Copy(S, 1, 3) + '.' + Copy(S, 4, Length(S));

  if ( Copy(S, 8, 1) <> '.' ) then
    S := Copy(S, 1, 7) + '.' + Copy(S, 8, Length(S));

  if ( Copy(S, 12, 1) <> '-' ) then
    S := Copy(S, 1, 11) + '-' + Copy(S, 12, Length(S));

  Result := S;
end;

function StrFormatarCnpj(sCnpj: String): String;
var
  S : String;
begin
  S := Trim(sCnpj);

  if ( Copy(S, 3, 1) <> '.' ) then
    S := Copy(S, 1, 2) + '.' + Copy(S, 3, Length(S));

  if ( Copy(S, 7, 1) <> '.' ) then
    S := Copy(S, 1, 6) + '.' + Copy(S, 7, Length(S));

  if ( Copy(S, 11, 1) <> '/' ) then
    S := Copy(S, 1, 10) + '/' + Copy(S, 11, Length(S));

  if ( Copy(S, 16, 1) <> '-' ) then
    S := Copy(S, 1, 15) + '-' + Copy(S, 16, Length(S));

  Result := S;
end;

end.
