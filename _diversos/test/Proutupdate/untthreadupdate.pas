unit untthreadupdate;

interface

uses
  Classes,sysutils, IniFiles;

type
  threadupdate = class(TThread)
  private

    { Private declarations }
  protected
    procedure Execute; override;
  public
    procedure conectar();
    procedure verificaversao();
  end;


implementation

uses untfrmproutupdate;

procedure threadupdate.conectar;
var
  ServerIni: TIniFile;
  passivo, arquivo, diretorio:string ;
begin
  while not terminated do
  begin
   ServerIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'proutupdate.ini');
   passivo := ServerIni.ReadString('CONEXAO','PASSIVO','');
   with frmproutupdate do
   begin
    ftpupdate.Host:=ServerIni.ReadString('CONEXAO','FTP','');
    ftpupdate.Username:=ServerIni.ReadString('CONEXAO','USUARIO','');
    ftpupdate.Password:=ServerIni.ReadString('CONEXAO','PASSWD','');
    arquivo:=ServerIni.ReadString('CONEXAO','ARQUIVO','');
    diretorio:=ServerIni.ReadString('CONEXAO','SALVAR','');
    if passivo='S' then
      ftpupdate.Passive:=true
    else
    ftpupdate.passive:=false;
    ServerIni.Free;
    ftpupdate.Connect();
//    ftpupdate.changedir('www');
    ftpupdate.list(memo1.Lines);
    BytesToTransfer:=ftpupdate.Size(arquivo);
    ftpupdate.get(arquivo,diretorio+'\'+arquivo,true);
    ftpupdate.Disconnect;
    terminate;
   end;
  end;
end;

procedure threadupdate.Execute;
begin
 conectar();
end;

procedure threadupdate.verificaversao;
begin
{
if FormatDateTime('dd/mm/yyyy HH:mm',FileDateToDateTime(FileAge('vnc.exe'))) <>
FormatDateTime('dd/mm/yyyy HH:mm',
frmproutupdate.ftpupdate.DirectoryListing.Items[0].ModifiedDate)
then
 begin
   if Application.MessageBox(Pchar('Existe uma Nova versão do Prout disponível. ' + #13#13 + 'Data da Versão: ' +Data + #13#13 +
   'É recomendado sempre realizar a atualização. Ela possui melhorias a correção de erros. ' + #13#13 + 'Deseja Atualizar?'),'Atualização Automática XXXX', MB_YESNO + MB_ICONQUESTION) = idyes then
   begin
    RenameFile(ExtractFilePath(ParamStr(0)) + 'XXXX.exe',ExtractFilePath(ParamStr(0)) + 'XXXX_OLD.exe');
    idftp1.get(orig,dest,true,false);
    //Seta a data do arquio baixado, para a mesma data do arquivo do FTP para não baixar novamente
    FileSetDate(dest,DateTimeToFileDate(IdFTP1.FileDate(orig)));
    Application.MessageBox('O Sistema foi Atualizado e será reiniciado.','Atualização Concluída',MB_OK + MB_ICONINFORMATION);
    //executa exe atualizado
    WinExec(Pchar(dest),SW_SHOWNORMAL);
   Application.Terminate;
  end;
 end;}
end;

end.
