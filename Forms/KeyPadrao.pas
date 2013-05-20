unit KeyPadrao;

interface

uses
  KeyResource,
  KeyFuncoes,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, DB, SqlExpr, FMTBcd, DBClient, Provider, SqlConst;
  
type
  TFrmPadrao = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FSelecionarRegistro : Boolean;
    FErroLoop : Integer;
    FComponenteLogin : TComponent;
    FConexaoDB : TSQLConnection;
    FTransacaoDB: TTransactionDesc;
    FTipoObjetoAcesso: TTipoObjeto;
    FTabela         ,
    FCampoChave     ,
    FCampoDescricao ,
    FCampoOrdenacao : String;
    function GetNomeObjetoAcesso : String;
  public
    { Public declarations }
    property SelecionarRegistro : Boolean read FSelecionarRegistro write FSelecionarRegistro;
    property ComponenteLogin : TComponent read FComponenteLogin write FComponenteLogin;
    property ConexaoDB : TSQLConnection read FConexaoDB write FConexaoDB;
    property TipoObjetoAcesso : TTipoObjeto read FTipoObjetoAcesso write FTipoObjetoAcesso;
    property NomeObjetoAcesso : String read GetNomeObjetoAcesso;
    property NomeTabela : String read FTabela write FTabela;
    property CampoChave : String read FCampoChave write FCampoChave;
    property CampoDescricao : String read FCampoDescricao write FCampoDescricao;
    property CampoOrdenacao : String read FCampoOrdenacao write FCampoOrdenacao;

    constructor CreateTable(const AOnwer : TComponent; const Login : TComponent = nil; const Conexao : TSQLConnection = nil); 
    constructor CreateSelection(const AOnwer : TComponent; const Login : TComponent = nil; const Conexao : TSQLConnection = nil; const Selecao : Boolean = FALSE);
    procedure RefreshDB;

    function RegistroSelecionado : Boolean;
    function InTransaction : Boolean;
    function StartTransaction : Boolean;
    function CommitTransaction : Boolean;
    function RollbackTransaction : Boolean;
    function MaxCod(sTabela, sCampo, sWhereSQL : String) : Integer; 
    function MaxCod_Currency(sTabela, sCampo, sWhereSQL : String) : Currency;
    function MaxCodDetail(const DataSet : TClientDataSet; sCampo : String; const bLoop : Boolean = FALSE) : Integer;
    function GetValorDB(sTabela, sCampo, sWhereSQL : String) : Variant;
    function ExecutarInsertTable(DataSet: TDataSet; const sTabela : String; const AutoStartTransaction : Boolean = TRUE) : Boolean;
    function ExecutarUpdateTable(DataSet: TDataSet; const sTabela : String; const AutoStartTransaction : Boolean = TRUE) : Boolean;
    function ExecutarDeleteTable(DataSet: TDataSet; const sTabela : String; const AutoStartTransaction : Boolean = TRUE) : Boolean;
    function ExecutarInsertUpdateTable(DataSet: TDataSet; const sTabela : String; const AutoStartTransaction : Boolean = TRUE) : Boolean;
    function ExecutarScriptSQL(const ScriptSQL : TStringList; const AutoStartTransaction : Boolean = TRUE) : Boolean;
  end;

var
  FrmPadrao: TFrmPadrao;

implementation

{$R *.dfm}

const
  ERRO_LOOP = 2;

{ TFrmPadrao }

function TFrmPadrao.GetNomeObjetoAcesso: String;
begin
  Result := Self.Name;
end;

procedure TFrmPadrao.FormCreate(Sender: TObject);
begin
  SelecionarRegistro := False;
  
  ComponenteLogin  := nil;
  ConexaoDB        := nil;
  TipoObjetoAcesso := toFormulario;

  NomeTabela := EmptyStr;
  CampoChave := EmptyStr;
  CampoDescricao := EmptyStr;
  CampoOrdenacao := EmptyStr;

  FErroLoop := 0;
end;

procedure TFrmPadrao.RefreshDB;
begin
  if Assigned(ConexaoDB) then
  begin
    ConexaoDB.Connected := False;
    ConexaoDB.Connected := True;
  end;
end;

constructor TFrmPadrao.CreateTable(const AOnwer, Login: TComponent; const Conexao : TSQLConnection);
begin
  inherited Create(AOnwer);
  Self.ComponenteLogin := Login;
  Self.ConexaoDB       := Conexao;
  Self.RefreshDB;
end;

constructor TFrmPadrao.CreateSelection(const AOnwer : TComponent; const Login : TComponent; const Conexao : TSQLConnection;
  const Selecao : Boolean);
begin
  inherited Create(AOnwer);
  Self.ComponenteLogin := Login;
  Self.ConexaoDB       := Conexao;
  Self.RefreshDB;
  
  Self.SelecionarRegistro := Selecao;
end;

function TFrmPadrao.RegistroSelecionado: Boolean;
begin
  Result := SelecionarRegistro and (ModalResult = mrOk);
end;

function TFrmPadrao.InTransaction : Boolean;
begin
  Result := ConexaoDB.InTransaction;
end;

function TFrmPadrao.StartTransaction: Boolean;
var
  STransIsolationKey : string;
  ILevel : TTransIsolationLevel;
begin
  try
    ILevel             := xilReadCommitted;
    STransIsolationKey := Format(TRANSISOLATION_KEY, [ConexaoDB.DriverName]);

    if ConexaoDB.Params.Values[STransIsolationKey] <> EmptyStr then
    begin
      if LowerCase(ConexaoDB.Params.Values[STransIsolationKey]) = SRepeatRead then
        ILevel := xilRepeatableRead
      else
      if LowerCase(ConexaoDB.Params.Values[STransIsolationKey]) = SDirtyRead then
        ILevel := xilDirtyRead
      else
        ILevel := xilReadCommitted;
    end;

    FillChar(FTransacaoDB, Sizeof(FTransacaoDB), 0);
    FTransacaoDB.TransactionID  := 1;
    FTransacaoDB.IsolationLevel := ILevel;
    ConexaoDB.StartTransaction(FTransacaoDB);

    Result := True;
  except
    Result := False;
  end;
end;

function TFrmPadrao.CommitTransaction: Boolean;
begin
  try
    if InTransaction then
      ConexaoDB.Commit(FTransacaoDB);
    Result := True;
  except
    Result := False;
  end;
end;

function TFrmPadrao.RollbackTransaction: Boolean;
begin
  try
    if InTransaction then
      ConexaoDB.Rollback(FTransacaoDB);
    Result := True;  
  except
    Result := False;
  end;
end;

function TFrmPadrao.MaxCod(sTabela, sCampo, sWhereSQL: String): Integer;
var
  qry : TSQLQuery;
  dsp : TDataSetProvider;
  cds : TClientDataSet;
begin
  sTabela   := Trim( AnsiLowerCase(sTabela) );
  sCampo    := Trim( AnsiLowerCase(sCampo) );
  sWhereSQL := Trim( AnsiLowerCase(sWhereSQL) );

  if sWhereSQL <> EmptyStr then
    sWhereSQL := Trim('where ' + sWhereSQL);

  qry := TSQLQuery.Create(nil);
  dsp := TDataSetProvider.Create(nil);
  cds := TClientDataSet.Create(nil);

  Screen.Cursor := crSQLWait;
  try
    qry.SQLConnection := ConexaoDB;
    qry.SQL.Text := 'Select max(' + sCampo + ') as ID from ' + sTabela + ' ' + sWhereSQL;

    dsp.DataSet := qry;
    cds.SetProvider(dsp);

    cds.Open;

    Result := cds.Fields[0].AsInteger + 1;
  finally
    Screen.Cursor := crDefault;
    qry.Free;
    dsp.Free;
    cds.Free;
  end;
end;

function TFrmPadrao.MaxCod_Currency(sTabela, sCampo, sWhereSQL: String): Currency;
var
  qry : TSQLQuery;
  dsp : TDataSetProvider;
  cds : TClientDataSet;
begin
  sTabela   := Trim( AnsiLowerCase(sTabela) );
  sCampo    := Trim( AnsiLowerCase(sCampo) );
  sWhereSQL := Trim( AnsiLowerCase(sWhereSQL) );

  if sWhereSQL <> EmptyStr then
    sWhereSQL := Trim('where ' + sWhereSQL);

  qry := TSQLQuery.Create(nil);
  dsp := TDataSetProvider.Create(nil);
  cds := TClientDataSet.Create(nil);

  Screen.Cursor := crSQLWait;
  try
    qry.SQLConnection := ConexaoDB;
    qry.SQL.Text := 'Select max(' + sCampo + ') as ID from ' + sTabela + ' ' + sWhereSQL;

    dsp.DataSet := qry;
    cds.SetProvider(dsp);

    cds.Open;

    Result := cds.Fields[0].AsCurrency + 1;
  finally
    Screen.Cursor := crDefault;
    qry.Free;
    dsp.Free;
    cds.Free;
  end;
end;

function TFrmPadrao.MaxCodDetail(const DataSet : TClientDataSet; sCampo : String;
  const bLoop : Boolean = FALSE) : Integer;
var
  iReturn : Integer;
begin
  iReturn := DataSet.RecordCount + 1;
  if bLoop then
    while DataSet.Locate(scampo, iReturn, []) do
      Inc(iReturn);
  Result := iReturn;
end;

function TFrmPadrao.GetValorDB(sTabela, sCampo, sWhereSQL : String) : Variant;
var
  qry : TSQLQuery;
  dsp : TDataSetProvider;
  cds : TClientDataSet;
begin

  sTabela   := Trim( AnsiLowerCase(sTabela) );
  sCampo    := Trim( AnsiLowerCase(sCampo) );
  sWhereSQL := Trim( AnsiLowerCase(sWhereSQL) );

  if sWhereSQL <> EmptyStr then
    sWhereSQL := Trim('where ' + sWhereSQL);

  qry := TSQLQuery.Create(nil);
  dsp := TDataSetProvider.Create(nil);
  cds := TClientDataSet.Create(nil);

  Screen.Cursor := crSQLWait;
  try
    qry.SQLConnection := ConexaoDB;
    qry.SQL.Text := 'Select ' + sCampo + ' from ' + sTabela + ' ' + sWhereSQL;

    dsp.DataSet := qry;
    cds.SetProvider(dsp);

    cds.Open;

    Result := cds.Fields[0].Value;
  finally
    Screen.Cursor := crDefault;
    qry.Free;
    dsp.Free;
    cds.Free;
  end;
end;

function TFrmPadrao.ExecutarInsertTable(DataSet: TDataSet;
  const sTabela: String; const AutoStartTransaction : Boolean = TRUE): Boolean;
var
  I : Integer;
  sInsert ,
  sValues ,
  sUpdate : String;

  pFlags : TProviderFlags;
  SQL    : TStringList;
  tpField: TField;
begin
  sInsert := EmptyStr;
  sValues := EmptyStr;
  sUpdate := EmptyStr;

  Result := False;

  if ( FErroLoop > ERRO_LOOP ) then
    FErroLoop := 0;

  Screen.Cursor := crSQLWait;

  for I := 0 to (DataSet.FieldCount - 1) do
  begin

    tpField := DataSet.Fields[I];
    pFlags  := tpField.ProviderFlags;

    if pfHidden in pFlags then
      Continue;

    if ((pfInKey in pFlags) or (pfInUpdate in pFlags)) and (tpField.FieldKind = fkData) then
    begin

      if (Length(sInsert) > 0) then
        sInsert := sInsert + ', ';

      sInsert := sInsert + AnsiLowerCase(tpField.FieldName);

      if (Length(sValues) > 0) then
        sValues := sValues + ', ';

      if tpField.IsNull then
        sValues := sValues + 'NULL'
      else
      if tpField.DataType in [ftSmallint, ftWord, ftInteger, ftLargeint] then
        sValues := sValues + tpField.AsString
      else
      if tpField.DataType in [ftFloat, ftCurrency, ftBCD, ftFMTBcd] then
        sValues := sValues + StringReplace(FormatFloat('################0.######', tpField.AsCurrency), ',', '.', [rfReplaceAll])
      else
      if tpField.DataType in [ftString, ftGuid, ftMemo] then
        sValues := sValues + QuotedStr(tpField.AsString)
      else
      if tpField.DataType in [ftDate] then
        sValues := sValues + QuotedStr(GetDateToSGDB(tpField.Value))
      else
      if tpField.DataType in [ftDateTime] then
        sValues := sValues + QuotedStr(GetDateTimeToSGDB(tpField.Value))
      else
        sValues := sValues + ':' + AnsiLowerCase(tpField.FieldName);

    end;  // if

  end;  // for I

  SQL := TStringList.Create;
  try
    try
      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('Insert Into ' + sTabela);
      SQL.Add('(' + sInsert + ')');
      SQL.Add('values');
      SQL.Add('(' + sValues + ')');
      SQL.EndUpdate;

      if AutoStartTransaction then
        StartTransaction;

      ConexaoDB.ExecuteDirect( SQL.Text );

      if AutoStartTransaction then
        CommitTransaction;

      Result := True;

      FErroLoop := 0;
    except
      On E : Exception do
      begin
        Inc(FErroLoop);

        if AutoStartTransaction then
          RollbackTransaction;

        ShowMessageError(E.Message + #13#13 +
          'Erro na função "ExecutarInsertTable()" ao tentar executar o seguinte script:' + #13#13 +
          SQL.Text, 'Erro de Inserção');
      end;
    end;
  finally
    Screen.Cursor := crDefault;
    SQL.Free;

    if ( (FErroLoop > 0) and (FErroLoop < ERRO_LOOP) ) then
    begin
      RefreshDB;
      ExecutarInsertTable(DataSet, sTabela, AutoStartTransaction);
    end;
  end;
end;

function TFrmPadrao.ExecutarUpdateTable(DataSet: TDataSet;
  const sTabela: String; const AutoStartTransaction: Boolean): Boolean;
var
  I : Integer;
  s,
  sField ,
  sUpdate,
  sWhereSQL : String;

  pFlags : TProviderFlags;
  SQL    : TStringList;
  tpField: TField;
begin
  s := EmptyStr;
  sField  := EmptyStr;
  sUpdate := EmptyStr;
  sWhereSQL := EmptyStr;

  Result := False;

  if ( FErroLoop > ERRO_LOOP ) then
    FErroLoop := 0;

  Screen.Cursor := crSQLWait;

  for I := 0 to (DataSet.FieldCount - 1) do
  begin

    tpField := DataSet.Fields[I];
    pFlags  := tpField.ProviderFlags;
    sField  := AnsiLowerCase(tpField.FieldName);

    if (not (pfHidden in pFlags)) and (not (tpField is TDataSetField)) and (tpField.FieldKind = fkData) then
    begin

      if (pfInKey in pFlags) then
      begin

        if tpField.DataType in [ftSmallint, ftWord, ftInteger, ftLargeint] then
          s := tpField.AsString
        else
        if tpField.DataType in [ftFloat, ftCurrency, ftBCD, ftFMTBcd] then
          s := StringReplace(FormatFloat('################0.######', tpField.AsCurrency), ',', '.', [rfReplaceAll])
        else
        if tpField.DataType in [ftString, ftGuid] then
          s := QuotedStr(tpField.AsString)
        else
        if tpField.DataType in [ftDate] then
          s := QuotedStr(GetDateToSGDB(tpField.Value))
        else
        if tpField.DataType in [ftDateTime] then
          s := QuotedStr(GetDateTimeToSGDB(tpField.Value))
        else
          s := ':' + sField;

        if Length(sWhereSQL) > 0 then
          sWhereSQL := sWhereSQL + ' and ';

        sWhereSQL := sWhereSQL + '(' + sField + ' = ' + s + ')';

      end
      else
      if (pfInUpdate in pFlags) then
      begin

        if tpField.IsNull then
          s := 'NULL'
        else
        if tpField.DataType in [ftSmallint, ftWord, ftInteger, ftLargeint] then
          s := tpField.AsString
        else
        if tpField.DataType in [ftFloat, ftCurrency, ftBCD, ftFMTBcd] then
          s := StringReplace(FormatFloat('################0.######', tpField.AsCurrency), ',', '.', [rfReplaceAll])
        else
        if tpField.DataType in [ftString, ftGuid, ftMemo] then
          s := QuotedStr(tpField.AsString)
        else
        if tpField.DataType in [ftDate] then
          s := QuotedStr(GetDateToSGDB(tpField.Value))
        else
        if tpField.DataType in [ftDateTime] then
          s := QuotedStr(GetDateTimeToSGDB(tpField.Value))
        else
          s := ':' + sField;

        if Length(sUpdate) > 0 then
          sUpdate := sUpdate + ', ';

        sUpdate := sUpdate + sField + ' = ' + s;

      end;

    end;  // if

  end;  // for I

  SQL := TStringList.Create;
  try
    try
      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('Update ' + sTabela + ' set');
      SQL.Add(sUpdate);
      SQL.Add('where ' + sWhereSQL);
      SQL.EndUpdate;

      if AutoStartTransaction then
        StartTransaction;

      ConexaoDB.ExecuteDirect( SQL.Text );

      if AutoStartTransaction then
        CommitTransaction;

      Result := True;

      FErroLoop := 0;
    except
      On E : Exception do
      begin
        Inc(FErroLoop);

        if AutoStartTransaction then
          RollbackTransaction;

        ShowMessageError(E.Message + #13#13 +
          'Erro na função "ExecutarUpdateTable()" ao tentar executar o seguinte script:' + #13#13 +
          SQL.Text, 'Erro de Atualização');
      end;
    end;
  finally
    Screen.Cursor := crDefault;
    SQL.Free;

    if ( (FErroLoop > 0) and (FErroLoop < ERRO_LOOP) ) then
    begin
      RefreshDB;
      ExecutarUpdateTable(DataSet, sTabela, AutoStartTransaction);
    end;
  end;
end;

function TFrmPadrao.ExecutarDeleteTable(DataSet: TDataSet;
  const sTabela: String; const AutoStartTransaction: Boolean): Boolean;
var
  I : Integer;
  s,
  sFieldName,
  sWhereSQL : String;

  pFlags : TProviderFlags;
  SQL    : TStringList;
  tpField: TField;
begin
  sFieldName := EmptyStr;
  sWhereSQL  := EmptyStr;

  Result := False;

  if ( FErroLoop > ERRO_LOOP ) then
    FErroLoop := 0;

  Screen.Cursor := crSQLWait;

  for I := 0 to (DataSet.FieldCount - 1) do
  begin

    tpField    := DataSet.Fields[I];
    sFieldName := DataSet.Fields[I].FieldName;
    pFlags     := DataSet.Fields[I].ProviderFlags;

    if (pfInKey in pFlags) and (tpField.FieldKind = fkData) then
    begin
      if tpField.DataType in [ftSmallint, ftWord, ftInteger, ftLargeint] then
        s := tpField.AsString
      else
      if tpField.DataType in [ftFloat, ftCurrency, ftBCD, ftFMTBcd] then
        s := StringReplace(FormatFloat('################0.######', tpField.AsCurrency), ',', '.', [rfReplaceAll])
      else
      if tpField.DataType in [ftString, ftGuid] then
        s := QuotedStr(tpField.AsString)
      else
      if tpField.DataType in [ftDate] then
        s := QuotedStr(GetDateToSGDB(tpField.Value))
      else
      if tpField.DataType in [ftDateTime] then
        s := QuotedStr(GetDateTimeToSGDB(tpField.Value))
      else
        s := ':' + sFieldName;

      if (Length(sWhereSQL) > 0) then
        sWhereSQL := sWhereSQL + ' and ';

      sWhereSQL := sWhereSQL + sFieldName + ' = ' + s;
    end;  // if

  end;  // for I

  SQL := TStringList.Create;
  try
    try
      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('Delete from ' + sTabela);
      SQL.Add('where ' + sWhereSQL);
      SQL.EndUpdate;

      if AutoStartTransaction then
        StartTransaction;

      ConexaoDB.ExecuteDirect( SQL.Text );

      if AutoStartTransaction then
        CommitTransaction;

      Result := True;

      FErroLoop := 0;
    except
      On E : Exception do
      begin
        Inc(FErroLoop);

        if AutoStartTransaction then
          RollbackTransaction;

        ShowMessageError(E.Message + #13#13 +
          'Erro na função "ExecutarDeleteTable()" ao tentar executar o seguinte script:' + #13#13 +
          SQL.Text, 'Erro de Exclusão');
      end;
    end;
  finally
    Screen.Cursor := crDefault;
    SQL.Free;

    if ( (FErroLoop > 0) and (FErroLoop < ERRO_LOOP) ) then
    begin
      RefreshDB;
      ExecutarDeleteTable(DataSet, sTabela, AutoStartTransaction);
    end;  
  end;
end;

function TFrmPadrao.ExecutarInsertUpdateTable(DataSet: TDataSet;
  const sTabela: String; const AutoStartTransaction: Boolean): Boolean;
var
  I : Integer;
  s,
  sFieldName,
  sWhereSQL : String;

  pFlags  : TProviderFlags;
  SQL     : TStringList;
  tpField : TField;
  bExiste : Boolean;
begin
  sFieldName := EmptyStr;
  sWhereSQL  := EmptyStr;

  Result := False;

  if ( FErroLoop > ERRO_LOOP ) then
    FErroLoop := 0;

  Screen.Cursor := crSQLWait;

  for I := 0 to (DataSet.FieldCount - 1) do
  begin

    tpField    := DataSet.Fields[I];
    sFieldName := DataSet.Fields[I].FieldName;
    pFlags     := DataSet.Fields[I].ProviderFlags;

    if (pfInKey in pFlags) and (tpField.FieldKind = fkData) then
    begin
      if tpField.DataType in [ftSmallint, ftWord, ftInteger, ftLargeint] then
        s := tpField.AsString
      else
      if tpField.DataType in [ftFloat, ftCurrency, ftBCD, ftFMTBcd] then
        s := StringReplace(FormatFloat('################0.######', tpField.AsCurrency), ',', '.', [rfReplaceAll])
      else
      if tpField.DataType in [ftString, ftGuid, ftMemo] then
        s := QuotedStr(tpField.AsString)
      else
      if tpField.DataType in [ftDate] then
        s := QuotedStr(GetDateToSGDB(tpField.Value))
      else
      if tpField.DataType in [ftDateTime] then
        s := QuotedStr(GetDateTimeToSGDB(tpField.Value))
      else
        s := ':' + sFieldName;

      if (Length(sWhereSQL) > 0) then
        sWhereSQL := sWhereSQL + ' and ';

      sWhereSQL := sWhereSQL + sFieldName + ' = ' + s;
    end;  // if

  end;  // for I

  SQL := TStringList.Create;
  try
    try
      bExiste := (not VarIsNull(GetValorDB(sTabela, '*', sWhereSQL)));

      if not bExiste then
        Result := ExecutarInsertTable(DataSet, sTabela, AutoStartTransaction)
      else
        Result := ExecutarUpdateTable(DataSet, sTabela, AutoStartTransaction);

      FErroLoop := 0;
    except
      On E : Exception do
      begin
        Inc(FErroLoop);

        if AutoStartTransaction then
          RollbackTransaction;

        ShowMessageError(E.Message + #13#13 +
          'Erro na função "ExecutarInsertUpdateTable()" ao tentar executar o seguinte script:' + #13#13 +
          SQL.Text, 'Erro de Inclusão/Exclusão');
      end;
    end;
  finally
    Screen.Cursor := crDefault;
    SQL.Free;

    if ( (FErroLoop > 0) and (FErroLoop < ERRO_LOOP) ) then
    begin
      RefreshDB;
      ExecutarInsertUpdateTable(DataSet, sTabela, AutoStartTransaction);
    end;
  end;
end;

function TFrmPadrao.ExecutarScriptSQL(const ScriptSQL: TStringList;
  const AutoStartTransaction: Boolean): Boolean;
begin
  try
    try
      if AutoStartTransaction then
        StartTransaction;

      ConexaoDB.ExecuteDirect( ScriptSQL.Text );

      if AutoStartTransaction then
        CommitTransaction;

      Result := True;

      FErroLoop := 0;
    except
      On E : Exception do
      begin
        Inc(FErroLoop);

        if AutoStartTransaction then
          RollbackTransaction;

        ShowMessageError(E.Message + #13#13 +
          'Erro na função "ExecutarScriptSQL()" ao tentar executar o seguinte script:' + #13#13 +
          ScriptSQL.Text, 'Erro de Inserção');
      end;
    end;
  finally
    Screen.Cursor := crDefault;

    if ( (FErroLoop > 0) and (FErroLoop < ERRO_LOOP) ) then
    begin
      RefreshDB;
      ExecutarScriptSQL(ScriptSQL, AutoStartTransaction);
    end;
  end;
end;

end.
