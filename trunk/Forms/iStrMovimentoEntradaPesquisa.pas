unit iStrMovimentoEntradaPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KeyPadraoTabelaCadastro, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, dxSkinsCore,
  dxSkinscxPCPainter, cxContainer, cxEdit, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, FMTBcd, Provider,
  DBClient, SqlExpr, StdCtrls, ExtCtrls, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxMaskEdit, cxDropDownEdit, cxImageComboBox,
  cxTextEdit, cxGroupBox, cxPC, cxButtons, cxCalendar;

type
  TFrmMovimentoEntradaPesquisa = class(TFrmPadraoTabelaCadastro)
    edDataInicio: TcxDateEdit;
    edDataFinal: TcxDateEdit;
  private
    { Private declarations }
    procedure InciarDatas;
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
  end;

var
  FrmMovimentoEntradaPesquisa: TFrmMovimentoEntradaPesquisa;

implementation

uses
  KeyFuncoes
  {$IFDEF IMONEY}
  , KeyMain
  , KeyLogin
  {$ENDIF}
  {$IFDEF ISTORE}
  , iStrMain
  , iStrLogin
  {$ENDIF}
  , KeyResource
  , KeyPadrao
  , KeyPadraoTabela;

{$R *.dfm}

{ TFrmMovimentoEntradaPesquisa }

function TFrmMovimentoEntradaPesquisa.ExecutarPesquisa: Boolean;
begin
  RefreshDB;

  CdsMaster.Close;
  QryMaster.SQL.Clear;
  QryMaster.SQL.AddStrings( SQL_Master );
  QryMaster.SQL.Add('where (1 = 1)');

  if not VarIsNullDate(edDataInicio.EditValue) then
    QryMaster.SQL.Add('  and me.ent_data >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', edDataInicio.Date)));

  if not VarIsNullDate(edDataFinal.EditValue) then
    QryMaster.SQL.Add('  and me.ent_data <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', edDataFinal.Date)));

  Case CmbTipoPesquisa.ItemIndex of
    0:
      begin
        if Trim(EdtPesquisa.Text) <> EmptyStr then
          if StrIsInteger( Trim(EdtPesquisa.Text) ) then
            QryMaster.SQL.Add('  and me.ent_codigo = ' + Trim(EdtPesquisa.Text))
          else
            QryMaster.SQL.Add('  and upper(un.uni_nome) like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%'));
      end;

    1:
      begin
        if Trim(EdtPesquisa.Text) <> EmptyStr then
          if StrIsInteger( Trim(EdtPesquisa.Text) ) then
            QryMaster.SQL.Add('  and me.ent_unidade_neg = ' + Trim(EdtPesquisa.Text))
          else
            QryMaster.SQL.Add('  and upper(un.uni_nome) like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%'));
      end;

    2:
      begin
        if Trim(EdtPesquisa.Text) <> EmptyStr then
          if StrIsInteger( Trim(EdtPesquisa.Text) ) then
            QryMaster.SQL.Add('  and me.ent_pessoa = ' + Trim(EdtPesquisa.Text))
          else
            QryMaster.SQL.Add('  and upper(ps.pes_razao_social) like ' + QuotedStr(Trim(EdtPesquisa.Text) + '%'));
      end;

    3:
      QryMaster.SQL.Add('  and me.ent_status = ' + IntToStr(StrToIntDef(Trim(EdtPesquisa.Text), 0)))
  end;

  QryMaster.SQL.Add('order by me.ent_data, me.ent_hora');
  CdsMaster.Open;

  Result := not CdsMaster.IsEmpty;
end;

procedure TFrmMovimentoEntradaPesquisa.InciarDatas;
begin
  if (Trim(edDataInicio.Text) = EmptyStr) or (Trim(edDataInicio.Text) = '30/12/1899') or VarIsNullDate(edDataInicio.EditValue) then
    edDataInicio.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', Date));

  if (Trim(edDataFinal.Text) = EmptyStr) or (Trim(edDataFinal.Text) = '30/12/1899') or VarIsNullDate(edDataFinal.EditValue) then
    edDataFinal.Date  := Date;
end;

end.
