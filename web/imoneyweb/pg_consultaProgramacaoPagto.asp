<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="recursos/p_conexaobanco.asp" -->
<!--#include file="recursos/scripts.asp" -->
<!--#include file="recursos/p_verificaLogin.asp" -->
<!--#include file="recursos/p_funcoesasp.asp" -->
<%

if session("dDtIni")="" then session("dDtIni")= formatdatetime(now,2)
if session("dDtFim")="" then session("dDtFim")= formatdatetime(now,2)

sNomedaPagina="Programações de Pagamentos"

'String de conexão para o banco de dados do Microsoft Access

strCon = session("conexao") 

'Número total de registros a serem exibidos por página
Const RegPorPag = 50

'Número de páginas a ser exibido no índice de paginação
VarPagMax = 50

'Cor da linha selecionada na tabela de registros
cor_linha_selecionada = "#EBEBB8"

'Nome da página de consulta
pagina_consulta = "pg_consultaProgramacaoPagto.asp"

'Nome da página de detalhes da consulta
pagina_consulta_detalhe = "pg_consultaProgramacaoPagtoDetalhe.asp"

'Nome da página de Inserção
pagina_insercao = "pg_inserirProgramacaoPagto.asp"

'Nome da página de login
pagina_login = "df_login.asp"

'*******************************************************************

%>

<HTML>
<HEAD>
<TITLE>Consultar Programações de Pagamentos</TITLE>
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
<style type="text/css">
<!--
.style1 {color: #FFFFFF}
-->
</style>
</HEAD>
<BODY class="texto_pagina" onLoad="init()">
<div id="loading" style="position:absolute; width:451px; text-align:center; top:231px; left: 456px;">
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
     <td width="11%" background="back2.gif"><a class="LinskMenuPagina" href="pg_inserirProgramacaoPagto.asp?ope=novo">Nova Programa&ccedil;&atilde;o</a></td>
     <td width="2%" background="back2.gif">&nbsp;</td>
     <td width="41%" background="back2.gif">&nbsp;</td>
     <td width="35%" background="back2.gif">&nbsp;</td>
  </tr>
</table>
<hr size=1 color=gainsboro>
<table width="697" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="697"><form name="form1" method="post" action="p_filtroProgramacaoPagtoResp.asp" class="form">
      <table width="519" border="0" cellpadding="0" cellspacing="0" class="Borda_tabela">
        <tr> 
          <td height="24" colspan="6" background="back3.gif" class="texto_pagina"><div align="center" class="titulo_campos style1"><strong>Filtro de Registros:</strong></div></td>
          </tr>
        <tr>
          <td colspan="6"  height="3" class="texto_pagina"></td>
          </tr>
        <tr>
          <td width="59" class="texto_pagina">Dt inicio</td>
          <td width="144"><label>
            <input name="txtDtIni" type="text" id="txtDtIni" size="15" maxlength="10" class="campos_formulario" onBlur="verifica_data(this)" onKeyPress="desabilita_cor(this)" OnKeyUp="this.value=mascara_data(this.value)" value="<%=session("dDtIni")%>">
          </label></td>
          <td width="47" class="texto_pagina">Dt Fim</td>
          <td width="98"><input name="txtDtfim" type="text" id="txtDtfim" size="15" maxlength="10" class="campos_formulario" onBlur="verifica_data(this)" onKeyPress="desabilita_cor(this)" OnKeyUp="this.value=mascara_data(this.value)" value="<%=session("dDtFim")%>"></td>
          <td width="99"><label>
            <input name="chkPendente" type="checkbox" id="chkPendente" value="1" checked>
            <span class="texto_pagina">Pendentes</span></label></td>
          <td width="70" rowspan="2"><label>
            <div align="center">
              <input name="button" type="image" class="botao_enviar" id="button" title="Pesquisar" value="Pesquisar" src="imagens/pesqpeq.png" alt="Pesquisar">
               &nbsp;<a href="p_filtroProgramacaoPagtoResp.asp?acao=limpar"><img src="imagens/iconLimpar.png" width="16" title="Limpar pesquisa" height="16" border="0"></a></div>

          </label></td>
        </tr>
        <tr>
          <td class="texto_pagina">&nbsp;</td>
          <td></td>
          <td class="texto_pagina">&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          </tr>
        <%if trim(session("gS_nmCriterio"))<>"" then %>
        <tr>
          <td colspan="6" class="texto_pagina">Crit&eacute;rio de Busca:<br>
                <strong><%=trim(session("gS_nmCriterio"))%></strong></td>
          </tr>
        <%end if%>
      </table>
        </form>
    </td>
  </tr>
</table>
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
    
	  If indice <> "" Then strQ_delete = " Select * from mny_pagto_lista where " & indice

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

  if trim(session("gS_CriterioProgramacao")) = "" then 
    sComplemento= "pg.pgt_status = 0"
  else 
    sComplemento = session("gS_CriterioProgramacao")
  end if

  strQ = " Select "
  strQ = strQ & "     pg.pgt_codigo "
  strQ = strQ & "   , pg.pgt_data "
  strQ = strQ & "   , pg.pgt_obs "
  strQ = strQ & "   , sum( case when m.mov_tipo = 0 then mi.mov_valor_pagar else 0 end ) as total_apagar "
  strQ = strQ & "   , sum( case when m.mov_tipo = 1 then mi.mov_valor_pagar else 0 end ) as total_areceber "
  strQ = strQ & "   , pg.pgt_status "
  strQ = strQ & "   , Case pg.pgt_status "
  strQ = strQ & "       when 0 then 'Aberto/Pendente' "
  strQ = strQ & "       when 1 then 'Encerrado' "
  strQ = strQ & "       when 2 then 'Cancelado' "
  strQ = strQ & "     end as pgt_status_desc "
  strQ = strQ & "   , pg.pgt_usuario "
  strQ = strQ & " from mny_pagto_lista pg "
  strQ = strQ & "   inner join mny_pagto_lista_item i on (i.pgt_codigo = pg.pgt_codigo) "
  strQ = strQ & "   inner join mny_movimento_item mi on (mi.mov_codigo = i.mov_codigo and mi.mov_item = i.mov_item) "
  strQ = strQ & "   inner join mny_movimento m on (m.mov_codigo = mi.mov_codigo) "
  strQ = strQ & " where " & sComplemento
  strQ = strQ & " group by "
  strQ = strQ & "     pg.pgt_codigo "
  strQ = strQ & "   , pg.pgt_data "
  strQ = strQ & "   , pg.pgt_obs "
  strQ = strQ & "   , pg.pgt_status "
  strQ = strQ & "   , pg.pgt_usuario "
  strQ = strQ & " order by "
  strQ = strQ & "     pg.pgt_data "

  'response.Write(strQ)

  'strQ = "SELECT * FROM mny_movimento"

  'If Trim(Request.QueryString("Ordem")) <> "" Then
  '  strQ = strQ & " ORDER BY " & Request.QueryString("Ordem")
  'End If

  objRS.Open strQ, objCon, , , &H0001
  objRS.PageSize = RegPorPag

  Set objRS_indice = Server.CreateObject("ADODB.Recordset")
  objRS_indice.CursorLocation = 2
  objRS_indice.CursorType     = 0
  objRS_indice.LockType       = 2
  strQ_indice = "Select * from mny_pagto_lista where 1 <> 1"
  objRS_indice.Open strQ_indice, objCon, , , &H0001

   'response.Write(strQ)

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
<%if true = false then %>
<B>Consultar Registros</B>
<BR>Visualize os registros da tabela abaixo:<BR>
<%end if%>
<%
If Not(objRS.EOF) Then
	objRS.AbsolutePage = PagAtual
TotPag = objRS.PageCount
%>
Foram encontrados <%= objRS.RecordCount%> registros<BR>
<%
  ' Totalizando resultado
  s_Sql = " Select "
  s_Sql = s_Sql & "     sum(mi.mov_valor_pagar) as mov_total_pagar "
  s_Sql = s_Sql & "   , m.mov_tipo "
  s_Sql = s_Sql & " from mny_pagto_lista pg "
  s_Sql = s_Sql & "   inner join mny_pagto_lista_item i on (i.pgt_codigo = pg.pgt_codigo) "
  s_Sql = s_Sql & "   inner join mny_movimento_item mi on (mi.mov_codigo = i.mov_codigo and mi.mov_item = i.mov_item) "
  s_Sql = s_Sql & "   inner join mny_movimento m on (m.mov_codigo = mi.mov_codigo) "
  s_Sql = s_Sql & " where " & sComplemento
  s_Sql = s_Sql & " group by "
  s_Sql = s_Sql & "     m.mov_tipo "
  set rsTot = conexao.execute(s_Sql)
  while not rsTot.eof
    if rsTot("mov_tipo") = "0" then sValAPagar   = "Total a Pagar R$: " & formatnumber(rsTot("mov_total_pagar"),2)
    if rsTot("mov_tipo") = "1" then sValAReceber = "Total a Receber R$: " & formatnumber(rsTot("mov_total_pagar"),2)
    rsTot.movenext
  wend

  if sValAPagar   <> "" then  response.Write("<strong>" & sValAPagar & "</strong><br>")
  if sValAReceber <> "" then  response.Write("<strong>" & sValAReceber & "</strong><br>")
  ' Fim totalização
%>
<br>
<TABLE width="101%" border=0 cellpadding=2 cellspacing=1 class=tabela_registros>
  <TR class=titulos_registros>
<%
  If (Session("admin") <> "" and Session("ip_admin") = Request.ServerVariables("REMOTE_ADDR")) Then
    Response.Write "<TD align=""center"" style=""background-color: crimson; color: white"" width=""1%"" nowrap><b>Editar</b></TD>"
  End IF

  If Right(Request.QueryString("Ordem"), 3) = "asc" Then
    Ordem = "desc"
  Else
    Ordem = "asc"
  End IF
%>

  <TD width="6%" valign=top nowrap style="cursor: hand" onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=pgt_codigo+<%=Ordem%>', '_self')">
<%
  If Left(Request.QueryString("Ordem"), 10) = "pgt_codigo" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If
%>
    <b>C&oacute;digo</b></TD>
  <TD width="6%" valign=top nowrap style="cursor: hand" onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=pgt_data+<%=Ordem%>', '_self')">
<%
  If Left(Request.QueryString("Ordem"), 10) = "pgt_data" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If
%>
  <b>Data</b></TD>
  <TD width="50%" valign=top nowrap style="cursor: hand" onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=pgt_obs+<%=Ordem%>', '_self')">
<%
  If Left(Request.QueryString("Ordem"), 12) = "pgt_obs" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If
%>
    <b>Observa&ccedil;&otilde;es</b></TD>
  <TD width="8%" valign=top nowrap style="cursor: hand" ><div align="right"><b>Valor A Receber</b></div></TD>
  <TD width="8%" valign=top nowrap style="cursor: hand" ><div align="right"><b>Valor A Pagar</b></div></TD>
  <TD width="12%" valign=top nowrap style="cursor: hand" onClick="window.open('<%=Request.ServerVariables("SCRIPT_NAME")%>?Ordem=pgt_status_desc+<%=Ordem%>', '_self')">
<%
  If Left(Request.QueryString("Ordem"), 12) = "pgt_status_desc" Then : Response.Write "<img src=""imagens\ordem_" & Ordem & ".gif"" width=9 height=10>&nbsp;" : End If
%>
    <b>Status</b></TD>
  <TD width="10%" valign=top nowrap style="cursor: hand" ><strong>Usu&aacute;rio</strong></TD>
  </TR>

<%
For Cont = 1 to objRS.PageSize
%>

  <TR class=exibe_registros onMouseOver="this.style.backgroundColor='<%=cor_linha_selecionada%>';" onMouseOut="this.style.backgroundColor='';">

<%
If Session("admin") <> "" And Session("ip_admin") = Request.ServerVariables("REMOTE_ADDR") Then
  Response.Write "<FORM name=""form_edit_" & Cont & """ action=""" & pagina_alteracao & """ method=post>"
  Response.Write "<TD  align=""center"" nowrap style=""background-color: gainsboro""  nowrap>&nbsp;"
  'If indice <> "" Then Response.Write "<input type=""hidden"" name=""indice"" value=""" & indice & "=" & objRS.Fields.Item(indice).Value & """>"
  'Response.Write "<INPUT type=hidden name=recordno value=""" & (objRS.AbsolutePosition) & """>"
  'Response.Write "<INPUT type=hidden name=strQ value=""" & strQ & """>"
  'Response.Write "<INPUT type=image src=""imagens\edit.gif"" alt=""Alterar Registro"" name=alterar value=alterar>"
   'response.Write("<a href='pg_operacoesAceite.asp?ope=edita&idlan=" & objRS("mov_codigo") & "'><img title='Editar Lançamento' src='imagens\edit.gif' width='16' height='16' border='0'></a>")

  If Session("admin") <> "" And Session("ip_admin") = Request.ServerVariables("REMOTE_ADDR") Then
  'Response.Write "&nbsp;<IMG src=""imagens\delete.gif"" alt=""Excluir Registro"" name=delete border=0 style=""cursor:hand"" OnClick=""confirm_delete('form_edit_" & Cont & "')"">"
  'Response.Write "&nbsp;<a href='pg_operacoesAceiteItem.asp?ope=excluir&idlan=" & objRS("mov_codigo") & "&idItem=" & objRS("mov_item") & "'>Excluir</a>"
  End If
  Response.Write "&nbsp;</TD>"
  Response.Write "</FORM>"
End If
'strQ = "SELECT M.*,i.* ta.tip_nome as aceite,p.pes_nome_fantasia as fantasia,p.pes_razao_social,SI.sit_nome as sitItem FROM mny_movimento M,mny_movimento_item i, "
%>
	
    <TD><%response.Write("<a class='LinskSelacaoRegistroAzul' href='pg_operacoesProgramacaoPagto.asp?ope=listar&idlan=" & objRS("pgt_codigo") & "'>" & FormataNumero(objRS("pgt_codigo"),6) & " </a>")%></TD>
    <TD><%response.Write(objRS.Fields.Item("pgt_data").Value)%></TD>
    <TD><%=(objRS.Fields.Item("pgt_obs").Value)%></TD>
    <TD><div align="right"><%response.Write(formatNumber((objRS.Fields.Item("total_areceber").Value),2))%></div></TD>
    <TD><div align="right">
      <%response.Write(formatNumber((objRS.Fields.Item("total_apagar").Value),2))%>
    </div></TD>
    <TD><%=(objRS.Fields.Item("pgt_status_desc").Value)%></TD>
    <TD><%=(objRS.Fields.Item("pgt_usuario").Value)%></TD>
  </TR>

<%
  objRS.MoveNext
  If objRS.Eof then Exit For
Next
Set Cont = Nothing
%>

<TR>
  <TD colspan="21"><%LinksNavegacao()%></TD>
</TR>
</TABLE>

<%
  objRS.Close
  Set objRS = Nothing
Else
%>

<%
  if (trim(session("gS_CriterioMovimento")) = "") then
%>
	<BR><B>Informe critérios de pesquisa e clique em "Pesquisar"</B><BR><BR>
<%
  else 
%>
<BR><B>Nenhum registro foi encontrado</B><BR><BR>
<%
  end if

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
