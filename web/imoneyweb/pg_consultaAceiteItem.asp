<% @ LANGUAGE="VBSCRIPT" %>
<%
'*******************************************************************
' Página gerada pelo sistema Dataform 2 - http://www.dataform.com.br
'*******************************************************************
' Altere os valores das variáveis indicadas abaixo se necessário

'String de conexão para o banco de dados do Microsoft Access
strCon = "DBQ=E:\Projetos\charles\imoneyweb\dados\DB_IMONEY.mdb;Driver={Microsoft Access Driver (*.mdb)};"

'Número total de registros a serem exibidos por página
Const RegPorPag = 15

'Número de páginas a ser exibido no índice de paginação
VarPagMax = 10

'Cor da linha selecionada na tabela de registros
cor_linha_selecionada = "gainsboro"

'Nome da página de consulta
pagina_consulta = "pg_consultaAceiteItem.asp"

'Nome da página de alteração
pagina_alteracao = "pg_alteracaoAceiteItem.asp"

'Nome da página de inclusão
pagina_inclusao = "pg_inclusaoAceiteItem.asp"

'Nome da página de login
pagina_login = "df_login.asp"

'*******************************************************************

%>

<HTML>
<HEAD>
<TITLE>Consultar Registros</TITLE>
<meta name="copyright" content="Dataform">
<meta name="keywords" content="dataform, asp dataform, aspdataform, asp-dataform">
<meta name="robots" content="ALL">
<style type="text/css">
<!--
.texto_pagina
{
font-family: Tahoma, Verdana, Arial;
font-size: 11px;
color: dimgray;
}

.tabela_registros
{
width: 100%;
background-color: white;
}

.titulos_registros
{
font-family: Tahoma, Verdana, Arial;
font-size: 11px;
color: white;
background-color: gray;
}

.exibe_registros
{
font-family: Tahoma, Verdana, Arial;
font-size: 11px;
width: 100%;
color: dimgray;
background-color: whitesmoke;
}

.tabela_paginacao
{
font-family: Tahoma, Verdana, Arial;
font-size: 11px;
width: 100%;
color: gray;
border-top: 1px solid gainsboro;
background-color: gainsboro;
}

.links_paginacao
{
color: dimgray;
text-decoration: none;
}

.links_paginacao:hover
{
color: gray;
text-decoration: underline;
}
-->
</style>
<SCRIPT language="JavaScript">
<!--
function abre_foto(width, height, nome) {
  var top; var left;
  top = ( (screen.height/2) - (height/2) )
  left = ( (screen.width/2) - (width/2) )
  window.open('',nome,'width='+width+',height='+height+',scrollbars=yes,toolbar=no,location=no,status=no,menubar=no,resizable=no,left='+left+',top='+top);
}
function confirm_delete(form) {
  if (confirm("Tem certeza que deseja excluir o registro?")) {
	document[form].action = '<%=Request.ServerVariables("SCRIPT_NAME")%>';
	document[form].submit();
  }
}
//-->
</SCRIPT>
</HEAD>
<BODY class=texto_pagina>
Links: <a href="<%=pagina_consulta%>" class="texto_pagina">Página de Consulta</a> | <a href="<%=pagina_inclusao%>" class="texto_pagina">Página de Inclusão<hr size=1 color=gainsboro></a><br>

<%
If Request.QueryString("PagAtual") = "" Then
  PagAtual = 1
  NumPagMax = VarPagMax
Else
  NumPagMax = CInt(Request.QueryString("NumPagMax"))
  PagAtual = CInt(Request.QueryString("PagAtual"))
  Select Case Request.QueryString("Submit")
    Case "Anterior" : PagAtual = PagAtual - 1
    Case "Proxima" : PagAtual = PagAtual + 1
    Case "Menos" : NumPagMax = NumPagMax - VarPagMax
    Case "Mais" : NumPagMax = NumPagMax + VarPagMax
    Case Else : PagAtual = CInt(Request.QueryString("Submit"))
  End Select
  If NumPagMax < PagAtual then
    NumPagMax = NumPagMax + VarPagMax
  End If
  If NumPagMax - (VarPagMax - 1) > PagAtual then
    NumPagMax = NumPagMax - VarPagMax
  End If
End If

Set objCon = Server.CreateObject("ADODB.Connection")
objCon.Open strCon

  If Session("admin") <> "" And Session("ip_admin") = Request.ServerVariables("REMOTE_ADDR") Then
  If Request.Form("recordno") <> "" Then
    Set objRS_delete = Server.CreateObject("ADODB.Recordset")
    objRS_delete.CursorLocation = 3
    objRS_delete.CursorType = 0
    objRS_delete.LockType = 3

    strQ_delete = Request.Form("strQ")
    indice = Trim(Request.Form("indice"))
    If indice <> "" Then strQ_delete = " SELECT * FROM mny_movimento_item WHERE " & indice

    objRS_delete.Open strQ_delete, objCon, , , &H0001
    If indice = "" Then objRS_delete.Move Request.Form("recordno") - 1
    If Not objRS_delete.EOF Then
      objRS_delete.Delete
      objRS_delete.UpdateBatch
    End IF

    objRS_delete.Close
    Set objRS_delete = Nothing
    Set strQ_delete = Nothing
  End If
  End If

Set objRS = Server.CreateObject("ADODB.Recordset")
objRS.CursorLocation = 3
objRS.CursorType = 2
objRS.LockType = 1
objRS.CacheSize = RegPorPag
strQ = "SELECT * FROM mny_movimento_item"

If Trim(Request("string_busca")) <> "" Then
  If Trim(Request("campo_busca")) <> "" Then
    strQ = strQ & " Where " & Trim(Request("campo_busca")) & " LIKE '%" & Trim(Request("string_busca")) & "%'"
  Else
    strQ = strQ & " Where 1 <> 1"
    strQ = strQ & " Or mov_codigo LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or mov_item LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or mov_data_prev LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or mov_data_vencto LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or fpg_codigo LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or tip_doc_codigo LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or mov_status LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or mov_valor LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or mov_juros LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or mov_desconto LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or mov_retencao LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or mov_valor_pagar LIKE '%" & Trim(Request("string_busca")) & "%'"
  End If
End If

If Trim(Request.QueryString("Ordem")) <> "" Then
  strQ = strQ & " ORDER BY " & Request.QueryString("Ordem")
End If
objRS.Open strQ, objCon, , , &H0001
objRS.PageSize = RegPorPag

Set objRS_indice = Server.CreateObject("ADODB.Recordset")
objRS_indice.CursorLocation = 2
objRS_indice.CursorType = 0
objRS_indice.LockType = 2
strQ_indice = "SELECT * FROM mny_movimento_item WHERE 1 <> 1"
objRS_indice.Open strQ_indice, objCon, , , &H0001
indice = ""
For Each item In objRS_indice.Fields
  If item.properties("IsAutoIncrement") = True Then
    indice = item.name
    Exit For
  End If
Next
objRS_indice.Close
Set objRS_indice = Nothing
Set strQ_indice = Nothing

Set objRS.ActiveConnection = Nothing
objCon.Close
Set objCon = Nothing
%>

<B>Consultar Registros</B><BR>Visualize os registros da 
tabela abaixo:<BR>
<FORM name="form_busca" method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>">
Pesquizar por <INPUT type=text name=string_busca value="<%=Request("string_busca")%>" class=texto_pagina> em
<SELECT name=campo_busca class=texto_pagina>
  <OPTION value="" selected>Registros</OPTION>
  <OPTION value="mov_codigo" <% If Trim(Request("campo_busca")) = Trim("mov_codigo") Then : Response.Write "selected" : End If %>>Ident. do Lançamento Princ.</OPTION>
  <OPTION value="mov_item" <% If Trim(Request("campo_busca")) = Trim("mov_item") Then : Response.Write "selected" : End If %>>Ident. do Lanc. Item</OPTION>
  <OPTION value="mov_data_prev" <% If Trim(Request("campo_busca")) = Trim("mov_data_prev") Then : Response.Write "selected" : End If %>>Data Previsão</OPTION>
  <OPTION value="mov_data_vencto" <% If Trim(Request("campo_busca")) = Trim("mov_data_vencto") Then : Response.Write "selected" : End If %>>Data Vencto</OPTION>
  <OPTION value="fpg_codigo" <% If Trim(Request("campo_busca")) = Trim("fpg_codigo") Then : Response.Write "selected" : End If %>>Forma Pgto</OPTION>
  <OPTION value="tip_doc_codigo" <% If Trim(Request("campo_busca")) = Trim("tip_doc_codigo") Then : Response.Write "selected" : End If %>>Tipo Doc.</OPTION>
  <OPTION value="mov_status" <% If Trim(Request("campo_busca")) = Trim("mov_status") Then : Response.Write "selected" : End If %>>Status</OPTION>
  <OPTION value="mov_valor" <% If Trim(Request("campo_busca")) = Trim("mov_valor") Then : Response.Write "selected" : End If %>>Valor </OPTION>
  <OPTION value="mov_juros" <% If Trim(Request("campo_busca")) = Trim("mov_juros") Then : Response.Write "selected" : End If %>>Vl Juros</OPTION>
  <OPTION value="mov_desconto" <% If Trim(Request("campo_busca")) = Trim("mov_desconto") Then : Response.Write "selected" : End If %>>Vl. Desconto</OPTION>
  <OPTION value="mov_retencao" <% If Trim(Request("campo_busca")) = Trim("mov_retencao") Then : Response.Write "selected" : End If %>>Vl. Retenção</OPTION>
  <OPTION value="mov_valor_pagar" <% If Trim(Request("campo_busca")) = Trim("mov_valor_pagar") Then : Response.Write "selected" : End If %>>Vl. Pago</OPTION>
</SELECT>
<INPUT type="submit" name="submit" value="ok" class=texto_pagina style="color: black">
</FORM>

<%
If Not(objRS.EOF) Then
  objRS.AbsolutePage = PagAtual
  TotPag = objRS.PageCount
%>

Foram encontrados <%= objRS.RecordCount%> registros<BR><BR>

<TABLE border=0 cellpadding=2 cellspacing=1 class=tabela_registros>
  <TR class=titulos_registros>

<%
If Session("admin") <> "" And Session("ip_admin") = Request.ServerVariables("REMOTE_ADDR") Then
  Response.Write "<TD align=""center"" style=""background-color: crimson; color: white"" width=""1%"" nowrap><b>Editar</b></TD>"
End IF

If Right(Request.QueryString("Ordem"), 3) = "asc" Then
  Ordem = "desc"
Else
  Ordem = "asc"
End IF
%>

  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=mov_codigo+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 10) = "mov_codigo" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Ident. do Lançamento Princ.</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=mov_item+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 8) = "mov_item" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Ident. do Lanc. Item</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=mov_data_prev+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 13) = "mov_data_prev" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Data Previsão</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=mov_data_vencto+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 15) = "mov_data_vencto" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Data Vencto</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=fpg_codigo+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 10) = "fpg_codigo" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Forma Pgto</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=tip_doc_codigo+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 14) = "tip_doc_codigo" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Tipo Doc.</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=mov_status+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 10) = "mov_status" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Status</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=mov_valor+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 9) = "mov_valor" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Valor </b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=mov_juros+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 9) = "mov_juros" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Vl Juros</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=mov_desconto+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 12) = "mov_desconto" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Vl. Desconto</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=mov_retencao+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 12) = "mov_retencao" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Vl. Retenção</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=mov_valor_pagar+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 15) = "mov_valor_pagar" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Vl. Pago</b></TD>
  </TR>

<%
For Cont = 1 to objRS.PageSize
%>

  <TR class=exibe_registros onMouseOver="this.style.backgroundColor='<%=cor_linha_selecionada%>';" onMouseOut="this.style.backgroundColor='';">

<%
If Session("admin") <> "" And Session("ip_admin") = Request.ServerVariables("REMOTE_ADDR") Then
  Response.Write "<FORM name=""form_edit_" & Cont & """ action=""" & pagina_alteracao & """ method=post>"
  Response.Write "<TD  align=""center"" nowrap style=""background-color: gainsboro""  nowrap>&nbsp;"
  If indice <> "" Then Response.Write "<input type=""hidden"" name=""indice"" value=""" & indice & "=" & objRS.Fields.Item(indice).Value & """>"
  Response.Write "<INPUT type=hidden name=recordno value=""" & (objRS.AbsolutePosition) & """>"
  Response.Write "<INPUT type=hidden name=strQ value=""" & strQ & """>"
  Response.Write "<INPUT type=image src=""imagens\edit.gif"" alt=""Alterar Registro"" name=alterar value=alterar>"
  If Session("admin") <> "" And Session("ip_admin") = Request.ServerVariables("REMOTE_ADDR") Then
  Response.Write "&nbsp;<IMG src=""imagens\delete.gif"" alt=""Excluir Registro"" name=delete border=0 style=""cursor:hand"" OnClick=""confirm_delete('form_edit_" & Cont & "')"">"
  End If
  Response.Write "&nbsp;</TD>"
  Response.Write "</FORM>"
End If
%>

    <TD><%=(objRS.Fields.Item("mov_codigo").Value)%></TD>
    <TD><%=(objRS.Fields.Item("mov_item").Value)%></TD>
    <TD><%=(objRS.Fields.Item("mov_data_prev").Value)%></TD>
    <TD><%=(objRS.Fields.Item("mov_data_vencto").Value)%></TD>
    <TD><%=(objRS.Fields.Item("fpg_codigo").Value)%></TD>
    <TD><%=(objRS.Fields.Item("tip_doc_codigo").Value)%></TD>
    <TD><%=(objRS.Fields.Item("mov_status").Value)%></TD>
    <TD nowrap><%If Trim(objRS.Fields.Item("mov_valor").Value) <> "" Then : Response.Write FormatCurrency(objRS.Fields.Item("mov_valor").Value) : End If%></TD>
    <TD nowrap><%If Trim(objRS.Fields.Item("mov_juros").Value) <> "" Then : Response.Write FormatCurrency(objRS.Fields.Item("mov_juros").Value) : End If%></TD>
    <TD nowrap><%If Trim(objRS.Fields.Item("mov_desconto").Value) <> "" Then : Response.Write FormatCurrency(objRS.Fields.Item("mov_desconto").Value) : End If%></TD>
    <TD nowrap><%If Trim(objRS.Fields.Item("mov_retencao").Value) <> "" Then : Response.Write FormatCurrency(objRS.Fields.Item("mov_retencao").Value) : End If%></TD>
    <TD nowrap><%If Trim(objRS.Fields.Item("mov_valor_pagar").Value) <> "" Then : Response.Write FormatCurrency(objRS.Fields.Item("mov_valor_pagar").Value) : End If%></TD>
  </TR>

<%
  objRS.MoveNext
  If objRS.Eof then Exit For
Next
Set Cont = Nothing
%>

<TR>
  <TD colspan="13"><%LinksNavegacao()%></TD>
</TR>

</TABLE>

<%
  If indice = "" Then
    Response.Write "<BR><B>ATENÇÃO:</B> Crie um campo do tipo <i>AutoIncrement</i> com qualquer nome em sua tabela para evitar erros na alteração dos dados. "
    Response.Write "<a href=""http://www.dataform.com.br/criar_campo_autoincrement.asp"" target=""_blank"">Clique aqui</a> para mais detalhes."
  End If
  objRS.Close
  Set objRS = Nothing
Else
%>

<BR><B>Nenhum registro foi encontrado</B><BR><BR>

<%
End If
%>

</BODY>
</HTML>

<%
Sub LinksNavegacao()
'O código a seguir insere uma tabela com todos os links de navegação das páginas
Response.Write "<TABLE border=0 cellPadding=2 cellSpacing=0 class=tabela_paginacao>"
Response.Write "<TR><TD align=center vAlign=top noWrap colspan=5>"
Response.Write "Página " & PagAtual & " de " & TotPag
Response.Write "</TD></TR><TR><TD width=33% align=right vAlign=top noWrap>"
If PagAtual > 1 Then
  Response.Write "<A href=""" & Request.ServerVariables("SCRIPT_NAME") & "?PagAtual=" &  PagAtual &"&VarPagMax=" & VarPagMax & "&NumPagMax=" & NumPagMax & "&Submit=Anterior&Ordem=" & Request.QueryString("Ordem")& "&string_busca=" & Server.URLEncode(Request("string_busca")) & "&campo_busca=" & Server.URLEncode(Request("campo_busca"))  & """ class=links_paginacao>&lt; Anterior</A>"
End If
Response.Write "</TD><TD width=33% align=middle vAlign=top noWrap>"
If NumPagMax - VarPagMax <> 0 then
  Response.Write "&nbsp;<A href=""" & Request.ServerVariables("SCRIPT_NAME") & "?PagAtual=" & NumPagMax - VarPagMax & "&VarPagMax=" & VarPagMax & "&NumPagMax=" & NumPagMax - VarPagMax & "&Submit=Menos&Ordem=" & Request.QueryString("Ordem") & "&string_busca=" & Server.URLEncode(Request("string_busca")) & "&campo_busca=" & Server.URLEncode(Request("campo_busca")) & """ class=links_paginacao>&lt;&lt;</A>&nbsp;&nbsp;"
End If
for i = NumPagMax - (VarPagMax - 1) to NumPagMax
  If i <= TotPag then
    If i <> CInt(PagAtual) then
      Response.Write "&nbsp;<A href=""" & Request.ServerVariables("SCRIPT_NAME") & "?PagAtual=" & PagAtual & "&VarPagMax=" & VarPagMax & "&NumPagMax=" & NumPagMax & "&Submit=" & i & "&Ordem=" & Request.QueryString("Ordem") & "&string_busca=" & Server.URLEncode(Request("string_busca")) & "&campo_busca=" & Server.URLEncode(Request("campo_busca")) & """ class=links_paginacao>" & i & "</A>&nbsp;"
    Else
      If PagAtual <> TotPag Then
        Response.Write "&nbsp;" & i & "&nbsp;"
      End If
    End If
  End If
Next
If NumPagMax  < TotPag then
  Response.Write "&nbsp;&nbsp;<A href=""" & Request.ServerVariables("SCRIPT_NAME") & "?PagAtual=" & NumPagMax + 1 & "&VarPagMax=" & VarPagMax & "&NumPagMax=" & NumPagMax + VarPagMax & "&Submit=Mais&Ordem=" & Request.QueryString("Ordem") & "&string_busca=" & Server.URLEncode(Request("string_busca")) & "&campo_busca=" & Server.URLEncode(Request("campo_busca")) & """ class=links_paginacao>&gt;&gt;</A>"
End If
Response.Write "</TD><TD width=33% align=left vAlign=top noWrap>"
If PagAtual <> TotPag Then
  Response.Write "&nbsp;&nbsp;<A href=""" & Request.ServerVariables("SCRIPT_NAME") & "?PagAtual=" & PagAtual & "&VarPagMax=" & VarPagMax & "&NumPagMax=" & NumPagMax & "&Submit=Proxima&Ordem=" & Request.QueryString("Ordem") & "&string_busca=" & Server.URLEncode(Request("string_busca")) & "&campo_busca=" & Server.URLEncode(Request("campo_busca")) & """ class=links_paginacao>Proxima &gt;</A>"
End If
Response.Write "</TD></TR></TABLE>"
End Sub
%>
