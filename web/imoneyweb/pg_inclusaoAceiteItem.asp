<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="recursos/p_conexaobanco.asp" -->
<!--#include file="recursos/p_verificaLogin.asp" -->
<!--#include file="recursos/p_funcoesasp.asp" -->
<!--#include file="recursos/scripts.asp" -->


<%


sNomedaPagina="Lançamento de Ítens"

strCon = session("conexao")

'Nome da página de consulta
pagina_consulta = "pg_consultaAceiteItem.asp"

'Nome da página de alteração
pagina_alteracao = "pg_alteracaoAceiteItem.asp"

'Nome da página de inclusão
pagina_inclusao = "pg_inclusaoAceiteItem.asp"

'Nome da página de login
pagina_login = "df_login.asp"

'*******************************************************************

If Session("admin") <> "" And Session("ip_admin") = Request.ServerVariables("REMOTE_ADDR") Then
%>

<HTML>
<HEAD>
<TITLE>Incluir Registro</TITLE>
<link href="css/estiloSis.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
body {
	margin-top: 0px;
}
-->
</style>
</HEAD>

<BODY class=texto_pagina>
<hr size=1 color=gainsboro><br>

<%
If Not IsEmpty(Request.Form) Then
  Set objCon = Server.CreateObject("ADODB.Connection")
  objCon.Open strCon

  campo_duplicado = false
  campo_msg = ""

  If campo_duplicado = false Then
    Set objRS= Server.CreateObject("ADODB.Recordset")
    objRS.CursorLocation = 3
    objRS.CursorType = 0
    objRS.LockType = 3
    strQ = "SELECT * FROM mny_movimento_item Where 1 <> 1"
    objRS.Open strQ, objCon, , , &H0001
    objRS.Addnew()
    If objRS.Fields("mov_codigo").properties("IsAutoIncrement") = False Then
      objRS("mov_codigo") = Trim(Request.Form("mov_codigo"))
    End If
    If objRS.Fields("mov_item").properties("IsAutoIncrement") = False Then
      objRS("mov_item") = Trim(Request.Form("mov_item"))
    End If
    If objRS.Fields("mov_data_prev").properties("IsAutoIncrement") = False Then
      objRS("mov_data_prev") = Trim(Request.Form("mov_data_prev"))
    End If
    If objRS.Fields("mov_data_vencto").properties("IsAutoIncrement") = False Then
      objRS("mov_data_vencto") = Trim(Request.Form("mov_data_vencto"))
    End If
    If objRS.Fields("fpg_codigo").properties("IsAutoIncrement") = False Then
      objRS("fpg_codigo") = Trim(Request.Form("fpg_codigo"))
    End If
    If objRS.Fields("tip_doc_codigo").properties("IsAutoIncrement") = False Then
      objRS("tip_doc_codigo") = Trim(Request.Form("tip_doc_codigo"))
    End If
    If objRS.Fields("mov_status").properties("IsAutoIncrement") = False Then
      objRS("mov_status") = Trim(Request.Form("mov_status"))
    End If
    If objRS.Fields("mov_valor").properties("IsAutoIncrement") = False Then
      objRS("mov_valor") = Trim(Replace(Request.Form("mov_valor"), "R$",""))
    End If
    If objRS.Fields("mov_juros").properties("IsAutoIncrement") = False Then
      objRS("mov_juros") = Trim(Replace(Request.Form("mov_juros"), "R$",""))
    End If
    If objRS.Fields("mov_desconto").properties("IsAutoIncrement") = False Then
      objRS("mov_desconto") = Trim(Replace(Request.Form("mov_desconto"), "R$",""))
    End If
    If objRS.Fields("mov_retencao").properties("IsAutoIncrement") = False Then
      objRS("mov_retencao") = Trim(Replace(Request.Form("mov_retencao"), "R$",""))
    End If
    If objRS.Fields("mov_valor_pagar").properties("IsAutoIncrement") = False Then
      objRS("mov_valor_pagar") = Trim(Replace(Request.Form("mov_valor_pagar"), "R$",""))
    End If
    objRS.Update
    objRS.Close
    Set objRS = Nothing
%>

<BR><B>Registro salvo</B><BR>O registro foi cadastrado 
com sucesso.<BR><BR>

<%
  Else
%>

    <BR><B>Atenção!</B><BR><BR>
    O campo <%=campo_msg%> <i>"<%=valor_msg%>"</i> não pode ser salvo, pois já está cadastrado na tabela.
    <BR><A href="javascript:history.go(-1)">Clique aqui</a> para voltar ao cadastro</A><BR><BR>

<%
  End If

  objCon.Close
  Set objCon = Nothing
Else
  Set objCon = Server.CreateObject("ADODB.Connection")
  objCon.Open strCon

  Set objRS= Server.CreateObject("ADODB.Recordset")
  objRS.CursorLocation = 2
  objRS.CursorType = 0
  objRS.LockType = 3
  strQ = "SELECT * FROM mny_movimento_item Where 1 <> 1"
  objRS.Open strQ, objCon, , , &H0001
%>

<B>Incluir um novo registro</B><BR>Preencha corretamente 
os dados abaixo:<BR>
<form name="form_incluir" method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>" onSubmit="return verifica_form(this);">
<TABLE border=0 cellpadding=2 cellspacing=1 class=tabela_formulario>
  <TR class=titulo_campos><TD>Ident. do Lançamento Princ.<br>
<%If objRS.Fields("mov_codigo").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=350" type="text" name="mov_codigo" maxlength="255" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Ident. do Lanc. Item<br>
<%If objRS.Fields("mov_item").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=350" type="text" name="mov_item" maxlength="255" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Data Previsão<br>
<%If objRS.Fields("mov_data_prev").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=250" type="text" name="mov_data_prev" maxlength="11" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" OnKeyUp="this.value=mascara_data(this.value)" onBlur="verifica_data(this)"  class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Data Vencto<br>
<%If objRS.Fields("mov_data_vencto").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=250" type="text" name="mov_data_vencto" maxlength="11" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" OnKeyUp="this.value=mascara_data(this.value)" onBlur="verifica_data(this)"  class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Forma Pgto<BR>
    <SELECT style="width=350" name="fpg_codigo" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
      <OPTION value=""></OPTION>

<%
  Set objRS2 = Server.CreateObject("ADODB.Recordset")
  objRS2.CursorLocation = 3
  objRS2.CursorType = 3
  objRS2.LockType = 1
  strQ = "SELECT fpg_codigo FROM mny_forma_pagto ORDER BY fpg_codigo ASC"
  objRS2.Open strQ, objCon, , , &H0001
  If Not objRS2.EOF Then
    While Not objRS2.EOF
	  If Trim(objRS2.Fields.Item("fpg_codigo").Value) <> "" Then
	    Response.Write "      <OPTION value='" & (objRS2.Fields.Item("fpg_codigo").Value) & "'>" & (objRS2.Fields.Item("fpg_codigo").Value) & "</OPTION>"
	  End If
      objRS2.MoveNext
    Wend
  End If
  Response.Write("ok")
%>

    </SELECT>
  </TD></TR>
  <TR class=titulo_campos><TD>Tipo Doc.<BR>
    <SELECT style="width=350" name="tip_doc_codigo" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
      <OPTION value=""></OPTION>

<%
  Set objRS2 = Server.CreateObject("ADODB.Recordset")
  objRS2.CursorLocation = 3
  objRS2.CursorType = 3
  objRS2.LockType = 1
  strQ = "SELECT tip_codigo FROM mny_tipo_documento ORDER BY tip_codigo ASC"
  objRS2.Open strQ, objCon, , , &H0001
  If Not objRS2.EOF Then
    While Not objRS2.EOF
	  If Trim(objRS2.Fields.Item("tip_codigo").Value) <> "" Then
	    Response.Write "      <OPTION value='" & (objRS2.Fields.Item("tip_codigo").Value) & "'>" & (objRS2.Fields.Item("tip_codigo").Value) & "</OPTION>"
	  End If
      objRS2.MoveNext
    Wend
  End If
  Response.Write("ok")
%>

    </SELECT>
  </TD></TR>
  <TR class=titulo_campos><TD>Status<BR>
    <SELECT style="width=350" name="mov_status" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
      <OPTION value=""></OPTION>

<%
  Set objRS2 = Server.CreateObject("ADODB.Recordset")
  objRS2.CursorLocation = 3
  objRS2.CursorType = 3
  objRS2.LockType = 1
  strQ = "SELECT sit_codigo FROM sys_situacao ORDER BY sit_codigo ASC"
  objRS2.Open strQ, objCon, , , &H0001
  If Not objRS2.EOF Then
    While Not objRS2.EOF
	  If Trim(objRS2.Fields.Item("sit_codigo").Value) <> "" Then
	    Response.Write "      <OPTION value='" & (objRS2.Fields.Item("sit_codigo").Value) & "'>" & (objRS2.Fields.Item("sit_codigo").Value) & "</OPTION>"
	  End If
      objRS2.MoveNext
    Wend
  End If
  Response.Write("ok")
%>

    </SELECT>
  </TD></TR>
  <TR class=titulo_campos><TD>Valor <br>
<%If objRS.Fields("mov_valor").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=150" type="text" name="mov_valor" maxlength="12" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Vl Juros<br>
<%If objRS.Fields("mov_juros").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=150" type="text" name="mov_juros" maxlength="12" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Vl. Desconto<br>
<%If objRS.Fields("mov_desconto").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=150" type="text" name="mov_desconto" maxlength="12" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Vl. Retenção<br>
<%If objRS.Fields("mov_retencao").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=150" type="text" name="mov_retencao" maxlength="12" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Vl. Pago<br>
<%If objRS.Fields("mov_valor_pagar").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=150" type="text" name="mov_valor_pagar" maxlength="12" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
</TABLE>
<input type="submit" name="submit" value="Enviar" class=botao_enviar>
</form>

<%
  objCon.Close
  Set objCon = Nothing
End If
%>

</BODY>
</HTML>

<%
Else
  Response.Write "<B>Acesso negado...</B> somente o administrador do site tem acesso a esta página."
  Response.Write "<BR><a href=""" & pagina_login & """ class=""texto_pagina"">Clique aqui</a> para efetuar login no sitema"
End If
%>
