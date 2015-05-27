unit UFuncoes;

interface

Uses
  Vcl.Forms,
  System.SysUtils,
  Web.WebReq,
  IdCoder,
  IdCoder3to4,
  IdCoderMIME,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, Data.DB,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.UI;

  function EncriptSenha(const aValue, aKey : String) : String;
  function DecriptarSenha(const aValue, aKey : String; const aAlertar : Boolean = FALSE) : String;

  function GetGuidID(const Conn : TFDConnection) : String;

implementation

function EncriptSenha(const aValue, aKey : String) : String;
var
  sKeyChar    ,
  sStrEncode  ,
  sResult     : String;
  iTamanhoStr ,
  iPosicaoKey : Integer;
  IdEncoder   : TIdEncoderMIME;
begin
  IdEncoder := TIdEncoderMIME.Create(nil);
  try
    sKeyChar    := IdEncoder.EncodeString(aKey);
    sStrEncode  := IdEncoder.EncodeString(aValue);
    iTamanhoStr := Length(sStrEncode);

    iPosicaoKey := -1;
    while (iPosicaoKey < 0) do
      iPosicaoKey := Random(iTamanhoStr);

    sResult := Copy(sStrEncode, 1, iPosicaoKey) + sKeyChar + Copy(sStrEncode, iPosicaoKey + 1, iTamanhoStr);

    Result := sResult;
  finally
    IdEncoder.Free;
  end;
end;

function DecriptarSenha(const aValue, aKey : String; const aAlertar : Boolean = FALSE) : String;
var
  sRetorno   ,
  sKeyChar   ,
  sStrEncode : String;
  IdEncoder  : TIdEncoderMIME;
  IdDecoder  : TIdDecoderMIME;
begin
  IdEncoder := TIdEncoderMIME.Create(nil);
  IdDecoder := TIdDecoderMIME.Create(nil);
  try
    sKeyChar   := IdEncoder.EncodeString(aKey);
    sStrEncode := aValue;

    if (Pos(sKeyChar, sStrEncode) = 0)  then
    begin
      if aAlertar then
        raise Exception.Create('Criptografia corrompida!!!')
      else
        sRetorno := EmptyStr;
    end
    else
      sStrEncode := StringReplace(sStrEncode, sKeyChar, EmptyStr, [rfReplaceAll]);

    sRetorno := IdDecoder.DecodeString(sStrEncode);
  finally
    Result := sRetorno;

    IdEncoder.Free;
    IdDecoder.Free;
  end;
end;

function GetGuidID(const Conn : TFDConnection) : String;
var
  qSQL : TFDQuery;
begin
  qSQL := TFDQuery.Create(nil);
  try
    qSQL.Connection := Conn;
    qSQL.SQL.Clear;
    qSQL.SQL.Add('Select id from vw_db');
    qSQL.Open;

    Result := qSQL.FieldByName('id').AsString;
  finally
    qSQL.Free;
  end;
end;

end.
