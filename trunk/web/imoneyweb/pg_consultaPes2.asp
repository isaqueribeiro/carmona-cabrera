<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<%


sNomedaPagina="Cadastro de Pessoas"

'String de conexão para o banco de dados do Microsoft Access

strCon = session("conexao") 

'Número total de registros a serem exibidos por página
Const RegPorPag = 15

'Número de páginas a ser exibido no índice de paginação
VarPagMax = 10

'Cor da linha selecionada na tabela de registros
cor_linha_selecionada = "gainsboro"

'Nome da página de consulta
pagina_consulta = "pg_consultaPes2.asp"

'Nome da página de alteração
pagina_alteracao = "pg_alteracaoPes.asp"

'Nome da página de inclusão
pagina_inclusao = "pg_inclusaoPes.asp"

'Nome da página de login
pagina_login = "df_login.asp"

'*******************************************************************

%>

<HTML>
<HEAD>
<TITLE>Consultar Registros</TITLE>
<link href="css/estiloSis.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
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
<BODY class="texto_pagina" onLoad="init()">
<div id="loading" style="position:absolute; width:451px; text-align:center; top:300px; left: 122px;">
<img src="imagens/loading2.gif" border=0> </div>
<script>
 var ld=(document.all);
  var ns4=document.layers;
 var ns6=document.getElementById&&!document.all;
 var ie4=document.all;
  if (ns4)
 	ld=document.loading;
 else if (ns6)
 	ld=document.getElementById("loading").style;
 else if (ie4)
 	ld=document.all.loading.style;
  function init()
 {
 if(ns4){ld.visibility="hidden";}
 else if (ns6||ie4) ld.display="none";
 }
 </script>



<span class="titulo_pagina"><img src="icones/ic_doc1.gif" width="16" height="16">&nbsp;<%=(sNomedaPagina)%></span>
<hr size=1 color=gainsboro>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr>
     
     
     <td width="2%" height="26" background="back2.gif"><div align="center"><img src="icones/add.gif" width="16" height="16"></div></td>
     <td width="11%" background="back2.gif"><a class="LinskMenuPagina" href="pg_operacoesPessoas.asp?ope=novo">Novo Cadastro</a></td>
     <td width="2%" background="back2.gif">&nbsp;</td>
     <td width="41%" background="back2.gif">&nbsp;</td>
     <td width="35%" background="back2.gif">&nbsp;</td>
  </tr>
</table>
<hr size=1 color=gainsboro>
<br>
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
    If indice <> "" Then strQ_delete = " SELECT * FROM mny_pessoa WHERE " & indice

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
strQ = "SELECT * FROM mny_pessoa"

If Trim(Request("string_busca")) <> "" Then
  If Trim(Request("campo_busca")) <> "" Then
    strQ = strQ & " Where " & Trim(Request("campo_busca")) & " LIKE '%" & Trim(Request("string_busca")) & "%'"
  Else
    strQ = strQ & " Where 1 <> 1"
    strQ = strQ & " Or pes_codigo LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or tip_codigo LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or pes_documento LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or pes_razao_social LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or pes_nome_fantasia LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or pes_insc_municipal LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or pes_insc_estadual LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or pes_end_logra LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or pes_end_uf LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or pes_end_cidade LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or pes_end_bairro LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or pes_end_cep LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or pes_contato LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or pes_fones LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or pes_obs LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or pes_email LIKE '%" & Trim(Request("string_busca")) & "%'"
    strQ = strQ & " Or ccr_codigo LIKE '%" & Trim(Request("string_busca")) & "%'"
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
strQ_indice = "SELECT * FROM mny_pessoa WHERE 1 <> 1"
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
Pesquisar por 
  <INPUT type=text name=string_busca value="<%=Request("string_busca")%>" class=texto_pagina> em
<SELECT name=campo_busca class=texto_pagina>
  <OPTION value="" selected>Registros</OPTION>
  <OPTION value="pes_codigo" <% If Trim(Request("campo_busca")) = Trim("pes_codigo") Then : Response.Write "selected" : End If %>>Codigo:</OPTION>
  <OPTION value="tip_codigo" <% If Trim(Request("campo_busca")) = Trim("tip_codigo") Then : Response.Write "selected" : End If %>>Tipo:</OPTION>
  <OPTION value="pes_documento" <% If Trim(Request("campo_busca")) = Trim("pes_documento") Then : Response.Write "selected" : End If %>>CPF/CNPJ:</OPTION>
  <OPTION value="pes_razao_social" <% If Trim(Request("campo_busca")) = Trim("pes_razao_social") Then : Response.Write "selected" : End If %>>Razão:</OPTION>
  <OPTION value="pes_nome_fantasia" <% If Trim(Request("campo_busca")) = Trim("pes_nome_fantasia") Then : Response.Write "selected" : End If %>>Nome:</OPTION>
  <OPTION value="pes_insc_municipal" <% If Trim(Request("campo_busca")) = Trim("pes_insc_municipal") Then : Response.Write "selected" : End If %>>Insc. Municipal:</OPTION>
  <OPTION value="pes_insc_estadual" <% If Trim(Request("campo_busca")) = Trim("pes_insc_estadual") Then : Response.Write "selected" : End If %>>Insc.Estadual:</OPTION>
  <OPTION value="pes_end_logra" <% If Trim(Request("campo_busca")) = Trim("pes_end_logra") Then : Response.Write "selected" : End If %>>Endereço:</OPTION>
  <OPTION value="pes_end_uf" <% If Trim(Request("campo_busca")) = Trim("pes_end_uf") Then : Response.Write "selected" : End If %>>UF:</OPTION>
  <OPTION value="pes_end_cidade" <% If Trim(Request("campo_busca")) = Trim("pes_end_cidade") Then : Response.Write "selected" : End If %>>Cidade:</OPTION>
  <OPTION value="pes_end_bairro" <% If Trim(Request("campo_busca")) = Trim("pes_end_bairro") Then : Response.Write "selected" : End If %>>Bairro:</OPTION>
  <OPTION value="pes_end_cep" <% If Trim(Request("campo_busca")) = Trim("pes_end_cep") Then : Response.Write "selected" : End If %>>CEP:</OPTION>
  <OPTION value="pes_contato" <% If Trim(Request("campo_busca")) = Trim("pes_contato") Then : Response.Write "selected" : End If %>>Contato:</OPTION>
  <OPTION value="pes_fones" <% If Trim(Request("campo_busca")) = Trim("pes_fones") Then : Response.Write "selected" : End If %>>Fone:</OPTION>
  <OPTION value="pes_obs" <% If Trim(Request("campo_busca")) = Trim("pes_obs") Then : Response.Write "selected" : End If %>>Obs:</OPTION>
  <OPTION value="pes_email" <% If Trim(Request("campo_busca")) = Trim("pes_email") Then : Response.Write "selected" : End If %>>Email:</OPTION>
  <OPTION value="ccr_codigo" <% If Trim(Request("campo_busca")) = Trim("ccr_codigo") Then : Response.Write "selected" : End If %>>Conta Corrente:</OPTION>
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

  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=pes_codigo+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 10) = "pes_codigo" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Codigo:</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=tip_codigo+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 10) = "tip_codigo" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Tipo:</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=pes_documento+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 13) = "pes_documento" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>CPF/CNPJ:</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=pes_razao_social+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 16) = "pes_razao_social" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Razão:</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=pes_nome_fantasia+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 17) = "pes_nome_fantasia" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Nome:</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=pes_insc_municipal+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 18) = "pes_insc_municipal" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Insc. Municipal:</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=pes_insc_estadual+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 17) = "pes_insc_estadual" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Insc.Estadual:</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=pes_end_logra+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 13) = "pes_end_logra" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Endereço:</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=pes_end_uf+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 10) = "pes_end_uf" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>UF:</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=pes_end_cidade+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 14) = "pes_end_cidade" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Cidade:</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=pes_end_bairro+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 14) = "pes_end_bairro" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Bairro:</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=pes_end_cep+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 11) = "pes_end_cep" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>CEP:</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=pes_contato+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 11) = "pes_contato" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Contato:</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=pes_fones+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 9) = "pes_fones" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Fone:</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=pes_obs+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 7) = "pes_obs" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Obs:</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=pes_email+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 9) = "pes_email" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Email:</b></TD>
  <TD style="cursor: hand" valign=top nowrap onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=ccr_codigo+<%=Ordem%>', '_self')"><%If Left(Request.QueryString("Ordem"), 10) = "ccr_codigo" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If%><b>Conta Corrente:</b></TD>
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
  'Response.Write "<INPUT type=hidden name=recordno value=""" & (objRS.AbsolutePosition) & """>"
  'Response.Write "<INPUT type=hidden name=strQ value=""" & strQ & """>"
  'Response.Write "<INPUT type=image src=""imagens\edit.gif"" alt=""Alterar Registro"" name=alterar value=alterar>"
  If Session("admin") <> "" And Session("ip_admin") = Request.ServerVariables("REMOTE_ADDR") Then
  'Response.Write "&nbsp;<IMG src=""imagens\delete.gif"" alt=""Excluir Registro"" name=delete border=0 style=""cursor:hand"" OnClick=""confirm_delete('form_edit_" & Cont & "')"">"
  	 ' Response.Write "&nbsp;<a class='LinskSelacaoRegistro' href='pg_operacoesPessoas.asp?ope=excluir&idlan=" & objRS("pes_codigo") & "'>Excluir</a>"
  End If
  Response.Write "&nbsp;</TD>"
  Response.Write "</FORM>"
End If
%>


    <TD><%response.Write("<a class='LinskSelacaoRegistroAzul' href='pg_operacoesPessoas.asp?ope=edita&idlan=" & objRS("pes_codigo") & "'>Editar</a>")%></TD>
    <TD><%=(objRS.Fields.Item("tip_codigo").Value)%></TD>
    <TD><%=(objRS.Fields.Item("pes_documento").Value)%></TD>
    <TD><%=(objRS.Fields.Item("pes_razao_social").Value)%></TD>
    <TD><%=(objRS.Fields.Item("pes_nome_fantasia").Value)%></TD>
    <TD><%=(objRS.Fields.Item("pes_insc_municipal").Value)%></TD>
    <TD><%=(objRS.Fields.Item("pes_insc_estadual").Value)%></TD>
    <TD><%=(objRS.Fields.Item("pes_end_logra").Value)%></TD>
    <TD><%=(objRS.Fields.Item("pes_end_uf").Value)%></TD>
    <TD><%=(objRS.Fields.Item("pes_end_cidade").Value)%></TD>
    <TD><%=(objRS.Fields.Item("pes_end_bairro").Value)%></TD>
    <TD><%=(objRS.Fields.Item("pes_end_cep").Value)%></TD>
    <TD><%=(objRS.Fields.Item("pes_contato").Value)%></TD>
    <TD><%=(objRS.Fields.Item("pes_fones").Value)%></TD>
    <TD><%=(objRS.Fields.Item("pes_obs").Value)%></TD>
    <TD><%=(objRS.Fields.Item("pes_email").Value)%></TD>
    <TD><%=(objRS.Fields.Item("ccr_codigo").Value)%></TD>
  </TR>

<%
  objRS.MoveNext
  If objRS.Eof then Exit For
Next
Set Cont = Nothing
%>

<TR>
  <TD colspan="20"><%LinksNavegacao()%></TD>
</TR>

</TABLE>

<%
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
