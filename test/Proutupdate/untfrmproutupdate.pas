unit untfrmproutupdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, IdBaseComponent,
  IdComponent, IdTCPServer, IdFTPServer, IdTCPConnection, IdTCPClient,
  IdFTP,untthreadupdate, Gauges, IdUDPBase, IdUDPClient, IdTrivialFTP,dateutils;

type
  Tfrmproutupdate = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    ftpupdate: TIdFTP;
    lblcontador: TLabel;
    Memo1: TMemo;
    Gauge1: TGauge;
    StatusBar1: TStatusBar;
    lblstatus: TLabel;
    bconfigurar: TButton;
    batualizar: TButton;
    bfechar: TButton;
    procedure bfecharClick(Sender: TObject);
    procedure batualizarClick(Sender: TObject);
procedure ftpupdateWork(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure ftpupdateWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ftpupdateStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure ftpupdateWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure IdTCPClient1Connected(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bconfigurarClick(Sender: TObject);

  private
     STime: TDateTime;
    { Private declarations }
  public
   BytesToTransfer:longword;
   { Public declarations }
  end;

(*
    bconfigurar: TBmsXPButton;
    batualizar: TBmsXPButton;
    bfechar: TBmsXPButton;

*)
var
  frmproutupdate: Tfrmproutupdate;
  threadftp: threadupdate;
  AverageSpeed: Double = 0;

implementation

uses untfrmconfigurar;


{$R *.dfm}

procedure Tfrmproutupdate.bfecharClick(Sender: TObject);
begin
 if not ftpupdate.Connected then
 begin
    close;
 end
 else
 begin
  ftpupdate.Disconnect;
  close;
 end;
end;

procedure Tfrmproutupdate.batualizarClick(Sender: TObject);
begin
 if not ftpupdate.Connected then
 begin
   threadftp:=threadupdate.Create(true);
   threadftp.Resume;
 end
 else
  showmessage('Conectado no FTP');
end;

procedure Tfrmproutupdate.ftpupdateWork(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
var  contador,kbTotal, kbTransmitidos, kbFaltantes, Tamanho: Integer;
     media: real;
     S: String;
     TotalTime: TDateTime;
     H, M, Sec, MS: Word;
     DLTime: Double;
begin
  kbTotal:=BytesToTransfer div 1024;
  TotalTime :=  Now - STime;
  DecodeTime(TotalTime, H, M, Sec, MS);
  Sec := Sec + M * 60 + H * 3600;
  DLTime := Sec + MS / 1000;
  //kbTotal := Tamanho div 1024;
  KbTransmitidos := AWorkCount div 1024;
  kbFaltantes :=kbTotal - kbTransmitidos;
// Application.ProcessMessages;
  lblcontador.Caption := 'Transferidos: '+ formatfloat('##,###,##0', kbTransmitidos ) +                    ' Kb de ' + formatfloat('##,###,##0', kbTotal) + ' Kb';
//  ProgressBar1.Position:=Aworkcount;
  media:=(100/BytesToTransfer)*AWorkCount;
  if DLTime > 0 then
  begin
   // Sec := Trunc(((BytesToTransfer - AWorkCount) / 1024) / AverageSpeed);
    AverageSpeed := {(AverageSpeed + }(AWorkCount / 1024) / DLTime{) / 2};
    S := Format('%2d:%2d:%2d', [Sec div 3600, (Sec div 60) mod 60, Sec mod 60]);
    S := 'Tempo de download ' + S;
 //   lblstatus.caption:=s;
  end;
//  else S := '';
  S := 'Taxa de Transferencia: '+FormatFloat('0.00 KB/s', AverageSpeed) + '; ' + S;
  lblstatus.caption:=s;
  Application.ProcessMessages;
  contador:=trunc(media);
  gauge1.Progress:=(contador);

end;

procedure Tfrmproutupdate.ftpupdateWorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
  STime := Now;
//  progressbar1.Min:=0;
 // progressbar1.Max:=BytesToTransfer;
  AverageSpeed:=0;
end;

procedure Tfrmproutupdate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 threadftp.Free;
end;

procedure Tfrmproutupdate.ftpupdateStatus(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: String);
begin
 case aStatus of
   hsResolving : statusbar1.Panels[0].text:='Resolvendo..';
   hsConnecting : statusbar1.Panels[0].text:='Conectando..';
   hsConnected : statusbar1.Panels[0].text:='Conectado ao Servidor FTP! Aguarde..';
   hsDisconnecting : statusbar1.Panels[0].text:='Desconectando..';
   hsDisconnected : begin
                        statusbar1.Panels[0].text:='Desconectado!';
                        gauge1.Progress:=100;
                    end;
   ftpTransfer : statusbar1.Panels[0].text:='Transferindo..';
   ftpReady : statusbar1.Panels[0].text:='Lendo...';
   ftpAborted : statusbar1.Panels[0].text:='Abortado!';
   else
     statusbar1.Panels[0].text:= AStatusText;
  end;//fim do case
end;

procedure Tfrmproutupdate.ftpupdateWorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
  case AWorkMode of
  wmRead : lblstatus.Caption:='Download!!';
  wmWrite:  lblstatus.Caption:='Upload!!';
  end;
//  lblcontador.Caption := 'Transferidos: '+ formatfloat('##,###,##0', kbTransmitidos ) +                    ' Kb de ' + formatfloat('##,###,##0', kbTotal) + ' Kb';
//  ProgressBar1.Position := ProgressBar1.Max;
    lblcontador.Caption := 'Transferidos: '+ formatfloat('##,###,##0',BytesToTransfer div 1024) + ' Kb';
end;

procedure Tfrmproutupdate.IdTCPClient1Connected(Sender: TObject);
begin
 showmessage('conectado');
end;

procedure Tfrmproutupdate.FormShow(Sender: TObject);
begin
  BytesToTransfer:=0;
end;

procedure Tfrmproutupdate.bconfigurarClick(Sender: TObject);
begin
 frmconfigurar:=tfrmconfigurar.create(self);
 frmconfigurar.showmodal;
 frmconfigurar.free;
end;

end.
