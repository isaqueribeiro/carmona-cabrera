unit KeyVersion;

interface

  uses Windows, Classes;

type

  TInfoVersao = class(TObject)
  private
    FInfoVersao : TStringList;
    constructor PrivateCreate;
    
    procedure SetCompanyName(const Value : String);

    function GetCompanyName : String;
  public
    constructor Create;

    property CompanyName: string read GetCompanyName write SetCompanyName;

    class function GetInstance : TInfoVersao;
    function getPropertyValue(propName: String): String;
  end;

const
  ivCOMPANY_NAME      = 'CompanyName';
  ivFILE_DESCRIPTION  = 'FileDescription';
  ivFILE_VERSION      = 'FileVersion';
  ivINTERNAL_NAME     = 'InternalName';
  ivLEGAL_COPYRIGHT   = 'LegalCopyright';
  ivLEGAL_TRADEMARKS  = 'LegalTradeMarks';
  ivORIGINAL_FILENAME = 'OriginalFilename';
  ivPRODUCT_NAME      = 'ProductName';
  ivPRODUCT_VERSION   = 'ProductVersion';
  ivCOMMENTS          = 'Comments';
  ivRELEASE_DATE      = 'ReleaseDate';
  ivSYSTEM_ANALISTY   = 'SystemAnalisty';
  ivCONTACTS          = 'Contacts';

implementation

uses SysUtils;

var
  InfoVersao : TInfoVersao;

{ TInfoVersao }

class function TInfoVersao.GetInstance : TInfoVersao;
begin
  if ( InfoVersao = nil ) then
    InfoVersao := TInfoVersao.PrivateCreate;

  Result := InfoVersao;
end;

function TInfoVersao.GetCompanyName: String;
begin
  Result := FInfoVersao.Values[ivCOMPANY_NAME];
end;

function TInfoVersao.getPropertyValue(propName: String): String;
var
  infoSize  : Cardinal;
  buffer    ,
  valorLido : PChar;
  tamanhoValorLido : Cardinal;
  appName : String;
begin

  appName  := ParamStr(0);
  Result   := EmptyStr;
  infoSize := GetFileVersionInfoSize(PAnsiChar(appName), infoSize);

  if ( infoSize > 0 ) then
  begin
    buffer := AllocMem(infoSize);

    try

      GetFileVersionInfo(PChar(appName), 0, infoSize, buffer);

      if VerQueryValue(buffer, PChar('StringFileInfo\041604E4\' + propName), Pointer(valorLido), tamanhoValorLido) then
      begin

       valorLido := PChar(Trim(valorLido));

       if ( Length(valorLido) > 0 ) then
         Result := valorLido;

      end;

    finally
      FreeMem(buffer, infoSize);
    end;

  end;

end;

procedure TInfoVersao.SetCompanyName(const Value: String);
begin
  FInfoVersao.Values[ivCOMPANY_NAME] := Value;
end;

constructor TInfoVersao.PrivateCreate;
begin
  inherited Create;
end;

constructor TInfoVersao.Create;
begin
  raise Exception.Create('Para obter um TInfoVersao invoque o método GetInstance().');
end;

end.
