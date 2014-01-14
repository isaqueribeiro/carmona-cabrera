unit ULerDBF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, Mask, rxToolEdit, Grids, DBGrids, DB,
  VKDBFDataSet;

type
  TfrmLerDBF = class(TForm)
    DirectoryEdit: TDirectoryEdit;
    FileListBox: TFileListBox;
    VKDBFNTX: TVKDBFNTX;
    DataSource: TDataSource;
    DBGrid1: TDBGrid;
    Arquivo: TLabel;
    procedure FileListBoxClick(Sender: TObject);
    procedure DirectoryEditChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLerDBF: TfrmLerDBF;

implementation

{$R *.dfm}

procedure TfrmLerDBF.FileListBoxClick(Sender: TObject);
begin
  Arquivo.Caption := FileListBox.Directory + '\' + FileListBox.Items.Strings[FileListBox.ItemIndex];

  if FileExists(Arquivo.Caption) then
  begin
    DataSource.DataSet.Close;

    VKDBFNTX.DBFFileName := Arquivo.Caption;
    VKDBFNTX.Open;
  end;
end;

procedure TfrmLerDBF.DirectoryEditChange(Sender: TObject);
begin
  if DirectoryExists(DirectoryEdit.Text) then
  begin
    FileListBox.Directory := DirectoryEdit.Text + '\';
    FileListBox.Update;
  end;
end;

end.
