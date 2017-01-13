unit UFuncoesFormulario;

interface

uses
  System.Classes, Vcl.Forms, Vcl.Controls,
  UObserverInterface;

type
  TFormularios = class
  private

  public
    class function EstaAberto(sForm: String): Boolean;
    class function ShowModalForm(const AOnwer : TComponent; NomeForm: String): Boolean;
    class function ShowModalFormObserver(const AOnwer : TComponent; NomeForm: String; Observador : IObserver): Boolean;
    class procedure ShowForm(const AOnwer : TComponent; NomeForm: String);
    class procedure RegisterForm(const aFormName: string; aFormClass: TComponentClass);
    class procedure FecharTodosForm;
end;

var
  FForm: TForm;

implementation

uses
  UFormFactoryU, TypInfo;

class function TFormularios.EstaAberto(sForm: String): Boolean;
var
  I: Integer;
begin
  // Verificar se já foi Chamada
  Result := True;
  for I := Screen.FormCount - 1 downto 0 do
    if Screen.Forms[i].name  = sForm then
    begin
      Result := False;
      Exit;
    end;
end;

class procedure TFormularios.FecharTodosForm;
var
  I : Integer;
  FForm: TForm;
begin
  // Fecha todos os formulários Abertos
  for I := Screen.FormCount - 1 downto 0 do
    if Screen.Forms[i].Name <> 'frmPrincipal' then
      if Assigned(Screen.Forms[i]) then
      begin
         FForm := Screen.Forms[i];
         FForm.Close;
      end;
end;

class procedure TFormularios.RegisterForm(const aFormName: string;
  aFormClass: TComponentClass);
begin
  _FormFactory.RegisterForm(aFormName, aFormClass);
end;

class procedure TFormularios.ShowForm(const AOnwer : TComponent; NomeForm: String);
begin
  if TFormularios.EstaAberto(NomeForm) then
    FForm := _FormFactory.CreateForm(AOnwer, NomeForm);
  FForm.Show;
end;

class function TFormularios.ShowModalForm(const AOnwer: TComponent;
  NomeForm: String): Boolean;
begin
  try
    if TFormularios.EstaAberto(NomeForm) then
      FForm := _FormFactory.CreateForm(AOnwer, NomeForm);
    try
      Result := (FForm.ShowModal = mrOk);
    except
      FForm  := _FormFactory.CreateForm(AOnwer, NomeForm);
      Result := (FForm.ShowModal = mrOk);
    end;
  finally
    FForm.Free;
  end;
end;

class function TFormularios.ShowModalFormObserver(const AOnwer: TComponent;
  NomeForm: String; Observador: IObserver): Boolean;
begin
  try
    if TFormularios.EstaAberto(NomeForm) then
      FForm := _FormFactory.CreateForm(AOnwer, NomeForm);

    // Adicionando o "Observador" no formulário "Observado"  
    IObservable(FForm as IObservable).addObserver(Observador);

    Result := (FForm.ShowModal = mrOk);
  finally
    FForm.Free;
  end;
end;

end.

