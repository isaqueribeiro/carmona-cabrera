<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="recursos/p_conexaobanco.asp" -->
<!--#include file="recursos/p_verificaLogin.asp" -->
<!--#include file="recursos/p_funcoesasp.asp" -->
<!--#include file="recursos/scripts.asp" -->


<%



if request.QueryString("aviso")="ok" then 
	response.Write("<script language='JavaScript'>alert('Dados  gravados com sucesso!');</script>")
end if




sNomedaPagina="Edição de Contas Bancárias"

strCon = session("conexao")

'Nome da página de consulta
pagina_consulta = "pg_consultaCtaBancaria.asp"

'Nome da página de alteração
pagina_alteracao = "pg_alteracaoCtaBancaria.asp"

'Nome da página de inclusão
pagina_inclusao = "pg_inclusaoCtaBancaria.asp"

'Nome da página de login
pagina_login = "df_login.asp"

'*******************************************************************


If Session("admin") <> "" And Session("ip_admin") = Request.ServerVariables("REMOTE_ADDR") Then
%>

<HTML>
<HEAD>
<TITLE>Alterar Registro</TITLE>
<link href="css/estiloSis.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

</HEAD>
<BODY class="texto_pagina" onLoad="init()">
<div id="loading" style="position:absolute; width:451px; text-align:center; top:321px; left: 358px;">
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
     
     
     <td width="2%" height="26" background="back2.gif"><div align="center">
       <div align="center"><img src="icones/voltar.gif" width="16" height="16"></div>
     </div></td>
     <td width="7%" background="back2.gif">&nbsp;<a class="LinskMenuPagina" href="<%=pagina_consulta%>">Voltar</a></td>
     <td width="2%" background="back2.gif"><img src="icones/add.gif" width="16" height="16"></td>
     <td width="52%" background="back2.gif"><a class="LinskMenuPagina" href="pg_operacoesAceite.asp?ope=novo">Nova Conta</a></td>
     <td width="37%" background="back2.gif">&nbsp;</td>
  </tr>
</table>
<hr size=1 color=gainsboro>
<div align="center"><br>
  <%
If Not IsEmpty(Request.Form("salvar")) Then
  Set objCon = Server.CreateObject("ADODB.Connection")
  objCon.Open strCon
  Set objRS = Server.CreateObject("ADODB.Recordset")
  objRS.CursorLocation = 3
  objRS.CursorType = 0
  objRS.LockType = 3

  strQ = Request.Form("strQ")
  indice = Trim(Request.Form("indice"))
  If indice <> "" Then strQ = " SELECT * FROM mny_conta_corrente WHERE " & indice

  objRS.Open strQ, objCon, , , &H0001
  If indice = "" Then objRS.Move Request.Form("recordno") - 1

  If objRS.Fields("ccr_codigo").properties("IsAutoIncrement") = False Then
    objRS("ccr_codigo") = Trim(Request.Form("ccr_codigo"))
  End If
  If objRS.Fields("ban_codigo").properties("IsAutoIncrement") = False Then
    objRS("ban_codigo") = Trim(Request.Form("ban_codigo"))
  End If
  If objRS.Fields("ccr_agencia").properties("IsAutoIncrement") = False Then
    objRS("ccr_agencia") = Trim(Request.Form("ccr_agencia"))
  End If
  If objRS.Fields("ccr_agencia_dv").properties("IsAutoIncrement") = False Then
    objRS("ccr_agencia_dv") = Trim(Request.Form("ccr_agencia_dv"))
  End If
  If objRS.Fields("ccr_conta").properties("IsAutoIncrement") = False Then
    objRS("ccr_conta") = Trim(Request.Form("ccr_conta"))
  End If
  If objRS.Fields("ccr_conta_dv").properties("IsAutoIncrement") = False Then
    objRS("ccr_conta_dv") = Trim(Request.Form("ccr_conta_dv"))
  End If
  On Error Resume Next
  objRS.UpdateBatch
  objRS.Close
  Set objRS = Nothing
  objCon.Close
  Set objCon = Nothing
%>

  <BR>
  <B>Registro alterado</B><BR>
  O registro foi alterado 
com sucesso.
	<%response.Redirect(pagina_alteracao & "?aviso=ok&idlanc=" & session("idCtaBancaria"))%>
<BR>
<BR>

<%
Else
  
  sSelecao=false
  If Not IsEmpty(Request.Form("recordno")) Then
  	  sSelecao=true
	  strQ = Request.Form("strQ")
	  indice = Trim(Request.Form("indice"))
	  If indice <> "" Then strQ = " SELECT * FROM mny_conta_corrente WHERE " & indice
	  
	  SET RS = conexao.execute(strQ)
	  if not rs.eof then 
	  	session("idCtaBancaria") = RS("ccr_codigo")
	  end if
  else
  	IF REQUEST.QueryString("idlanc") <>"" then 
  		  sSelecao=true
		  strQ = "SELECT * FROM mny_conta_corrente"
		  indice = " ccr_codigo=" & Trim(REQUEST.QueryString("idlanc"))
		  If indice <> "" Then strQ = " SELECT * FROM mny_conta_corrente WHERE " & indice
	ELSE
		sSelecao=FALSE
	end if
  end if
  'response.Write(sSelecao)
  
  if sSelecao=true then 
  
  
  
 ' If Not IsEmpty(Request.Form("recordno")) Then
    Set objCon = Server.CreateObject("ADODB.Connection")
    objCon.Open strCon

    Set objRS = Server.CreateObject("ADODB.Recordset")
    objRS.CursorLocation = 2
    objRS.CursorType = 0
    objRS.LockType = 3


 ' strQ = Request.Form("strQ")
 ' indice = Trim(Request.Form("indice"))
 ' If indice <> "" Then strQ = " SELECT * FROM mny_conta_corrente WHERE " & indice

    objRS.Open strQ, objCon, , , &H0001
  If indice = "" Then objRS.Move Request.Form("recordno") - 1
%>

<B>Alterar dados do Registro</B><BR>
Altere os dados 
necessários abaixo:<BR>
</div>


<%
    'If indice = "" Then
      
    'End If
  End If
End If
%>

<br>
<table width="780" border="0" align="center" cellpadding="0" cellspacing="0" background="imagens/fdoQuadro/fdoMedio.jpg">
  <tr >
    <td colspan="2" height="2" ></td>
    <td width="325"></td>
  </tr>
  <tr>
    <td width="13" height="37">&nbsp;</td>
    <td width="442" class="texto_pagina"><strong> &nbsp;Cadastro de Conta</strong></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="268" colspan="3" valign="top">
    <br><br>
    <form name="form_incluir" method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>" onSubmit="return verifica_form(this);">
<INPUT type=hidden name=recordno value="<%=Request.Form("recordno")%>">
<INPUT type=hidden name=strQ value="<%=Request.Form("strQ")%>">
<INPUT type="hidden" name="indice" value="<%=indice%>">
<TABLE border=0 align="center" cellpadding=2 cellspacing=1 class="tabela_formulario">
  <TR class=titulo_campos><TD width="213">Código:<br>
<%If objRS.Fields("ccr_codigo").properties("IsAutoIncrement") = False Then%>
<INPUT name="ccr_codigo" type="text" class=campos_formulario style="width=100" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("ccr_codigo").Value)%>" size="20" maxlength="255"  df_verificar="sim">
<%
Else
  Response.Write "<B>" & (objRS.Fields.Item("ccr_codigo").Value) & "</B>"
End If
%>
  </TD>
    <TD width="526">Banco:<BR>
      <SELECT style="width=350" name="ban_codigo" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
        <OPTION value=""></OPTION>
        <%
  Set objRS2 = Server.CreateObject("ADODB.Recordset")
  objRS2.CursorLocation = 3
  objRS2.CursorType = 3
  objRS2.LockType = 1

  strQ = "SELECT * FROM sys_banco ORDER BY bco_nome ASC"
  objRS2.Open strQ, objCon, , , &H0001
  If Not objRS2.EOF Then
    While Not objRS2.EOF
	  If Trim(objRS2.Fields.Item("bco_codigo").Value) <> "" Then
	    Response.Write "      <OPTION value='" & (objRS2.Fields.Item("bco_codigo").Value) & "'"
	    If Lcase(objRS2.Fields.Item("bco_codigo").Value) = Lcase(objRS.Fields.Item("ban_codigo").Value) then
	      Response.Write "selected"
	    End If
	    Response.Write ">" & (objRS2.Fields.Item("bco_nome").Value) & "</OPTION>"
	  End If
      objRS2.MoveNext
    Wend
  End If
  Response.Write("ok")
%>
      </SELECT></TD>
  </TR>
  <TR class=titulo_campos><TD>Nr Agência:<br>
<%If objRS.Fields("ccr_agencia").properties("IsAutoIncrement") = False Then%>
<INPUT name="ccr_agencia" type="text" class=campos_formulario style="width=150" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("ccr_agencia").Value)%>" size="25" maxlength="255"  df_verificar="sim">
<%
Else
  Response.Write "<B>" & (objRS.Fields.Item("ccr_agencia").Value) & "</B>"
End If
%>
  </TD>
    <TD>Digito Ag&ecirc;ncia:<br>
      <%If objRS.Fields("ccr_agencia_dv").properties("IsAutoIncrement") = False Then%>
      <INPUT name="ccr_agencia_dv" type="text" class=campos_formulario style="width=50" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("ccr_agencia_dv").Value)%>" size="10" maxlength="3"  df_verificar="sim">
      <%
Else
  Response.Write "<B>" & (objRS.Fields.Item("ccr_agencia_dv").Value) & "</B>"
End If
%></TD>
  </TR>
  <TR class=titulo_campos><TD>Nr. Conta:<br>
<%If objRS.Fields("ccr_conta").properties("IsAutoIncrement") = False Then%>
<INPUT name="ccr_conta" type="text" class=campos_formulario style="width=150" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("ccr_conta").Value)%>" size="25" maxlength="20"  df_verificar="sim">
<%
Else
  Response.Write "<B>" & (objRS.Fields.Item("ccr_conta").Value) & "</B>"
End If
%>
  </TD>
    <TD>D&iacute;gito Conta:<br>
      <%If objRS.Fields("ccr_conta_dv").properties("IsAutoIncrement") = False Then%>
      <INPUT name="ccr_conta_dv" type="text" class=campos_formulario style="width=50" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("ccr_conta_dv").Value)%>" size="10" maxlength="3"  df_verificar="sim">
      <%
Else
  Response.Write "<B>" & (objRS.Fields.Item("ccr_conta_dv").Value) & "</B>"
End If
%></TD>
  </TR>
</TABLE>
<div align="center">
<%if session("gI_NivelUsu") >= 1 then %>
  <input type="submit" name="salvar" value="Gravar" class=botao_enviar>
<%else
	response.Write("Usuário sem permissão para edição de dados!")
end if%>
</div>
</form></td>
  </tr>
</table>
</BODY>
</HTML>

<%
Else
  'Response.Write "<B>Acesso negado...</B> somente o administrador do site tem acesso a esta página."
  'Response.Write "<BR><a href=""" & pagina_login & """ class=""texto_pagina"">Clique aqui</a> para efetuar login no sitema"
End If
%>
