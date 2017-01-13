unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, FMTBcd, ExtCtrls, DBCtrls, DB, StdCtrls, Mask,
  DBClient, Provider, SqlExpr, ExtDlgs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinMcSkin, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, cxImage, cxDBEdit, IniFiles;

type
  TForm1 = class(TForm)
    conWebMaster: TSQLConnection;
    SQLQuery1: TSQLQuery;
    SQLQuery1emp_codigo: TSmallintField;
    SQLQuery1emp_razao_social: TStringField;
    SQLQuery1emp_fantasia: TStringField;
    SQLQuery1emp_cnpj: TStringField;
    SQLQuery1emp_imagem: TBlobField;
    SQLQuery1emp_end_logra: TStringField;
    SQLQuery1emp_end_bairro: TStringField;
    SQLQuery1emp_end_cidade: TStringField;
    SQLQuery1emp_end_cep: TStringField;
    SQLQuery1emp_end_uf: TStringField;
    SQLQuery1emp_end_fone: TStringField;
    SQLQuery1emp_site: TStringField;
    SQLQuery1emp_ftp: TStringField;
    SQLQuery1emp_email: TStringField;
    SQLQuery1emp_inc: TStringField;
    SQLQuery1emp_alt: TStringField;
    SQLQuery1emp_custos: TStringField;
    SQLQuery1emp_financeiro: TStringField;
    SQLQuery1emp_diretor: TStringField;
    SQLQuery1emp_aceite: TSmallintField;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1emp_codigo: TSmallintField;
    ClientDataSet1emp_razao_social: TStringField;
    ClientDataSet1emp_fantasia: TStringField;
    ClientDataSet1emp_cnpj: TStringField;
    ClientDataSet1emp_imagem: TBlobField;
    ClientDataSet1emp_end_logra: TStringField;
    ClientDataSet1emp_end_bairro: TStringField;
    ClientDataSet1emp_end_cidade: TStringField;
    ClientDataSet1emp_end_cep: TStringField;
    ClientDataSet1emp_end_uf: TStringField;
    ClientDataSet1emp_end_fone: TStringField;
    ClientDataSet1emp_site: TStringField;
    ClientDataSet1emp_ftp: TStringField;
    ClientDataSet1emp_email: TStringField;
    ClientDataSet1emp_inc: TStringField;
    ClientDataSet1emp_alt: TStringField;
    ClientDataSet1emp_custos: TStringField;
    ClientDataSet1emp_financeiro: TStringField;
    ClientDataSet1emp_diretor: TStringField;
    ClientDataSet1emp_aceite: TSmallintField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBNavigator1: TDBNavigator;
    cxDBImage1: TcxDBImage;
    procedure FormCreate(Sender: TObject);
    procedure ClientDataSet1AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  ini : TIniFile;
begin
  conWebMaster.Connected := False;

  ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Conexao.ini');

  With conWebMaster do
    Begin
      Connected := False;

      Params.Clear;
      Params.Add('DriverName=MySQL50');
      Params.Add('HostName='  + ini.ReadString('ACESSO', 'SERVIDOR', ''));
      Params.Add('Database='  + ini.ReadString('ACESSO', 'BANCO', ''));
      Params.Add('User_Name=' + ini.ReadString('ACESSO', 'UserNet', ''));
      Params.Add('Password='  + ini.ReadString('ACESSO', 'PassNet', ''));
      Params.Add('Port='  + '3308');

      Params.Add('BlobSize=-1');
      Params.Add('ErrorResourceFile=');
      Params.Add('LocaleCode=0000');

      Connected := True;
    End;

  ClientDataSet1.Open;
end;

procedure TForm1.ClientDataSet1AfterPost(DataSet: TDataSet);
begin
  ClientDataSet1.ApplyUpdates(0);
end;

end.
