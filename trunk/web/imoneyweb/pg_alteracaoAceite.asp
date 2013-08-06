<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="recursos/p_conexaobanco.asp" -->
<!--#include file="recursos/p_verificaLogin.asp" -->
<!--#include file="recursos/p_funcoesasp.asp" -->
<!--#include file="recursos/scripts.asp" -->


<%

if request.QueryString("aviso")="ok" then 
	response.Write("<script language='JavaScript'>alert('Dados  gravados com sucesso!');</script>")
end if


sNomedaPagina="Edição de Lançamentos"

strCon = session("conexao")

'Nome da página de consulta
pagina_consulta = "pg_consultaAceite.asp"

'Nome da página de alteração
pagina_alteracao = "pg_alteracaoAceite.asp"

'Nome da página de inclusão
pagina_inclusao = "pg_inclusaoAceite.asp"

'Nome da página de login
pagina_login = "df_login.asp"

'*******************************************************************


If Session("admin") <> "" And Session("ip_admin") = Request.ServerVariables("REMOTE_ADDR") Then
%>

<HTML>
<HEAD>
<TITLE>Alterar Aceites</TITLE>
<link href="css/estiloSis.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
body {
	margin-top: 0px;
}
-->
</style></HEAD>
<BODY class="texto_pagina" onLoad="init()">
<div id="loading" style="position:absolute; width:451px; text-align:center; top:300px; left: 288px;">
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
<span class="titulo_pagina"><br>
<%=(sNomedaPagina)%></span> <br>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="2%" height="30" background="back2.gif"><div align="center"><img src="icones/voltar.gif" width="16" height="16"></div></td>
    <td width="5%" background="back2.gif">&nbsp;<a class="LinskMenuPagina" href="<%=pagina_consulta%>">Voltar</a></td>
    <td width="3%" background="back2.gif"><div align="right"></div></td>
    <td width="10%" background="back2.gif">&nbsp;</td>
    <td width="2%" background="back2.gif"><div align="center"></div></td>
    <td width="43%" background="back2.gif">&nbsp;</td>
    <td width="35%" background="back2.gif">&nbsp;</td>
  </tr>
</table>
<hr size=1 color=gainsboro>

<div align="center">
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
  If indice <> "" Then strQ = " SELECT * FROM mny_movimento WHERE " & indice

  objRS.Open strQ, objCon, , , &H0001
  If indice = "" Then objRS.Move Request.Form("recordno") - 1

  If objRS.Fields("mov_codigo").properties("IsAutoIncrement") = False Then
    objRS("mov_codigo") = Trim(Request.Form("mov_codigo"))
  End If
  If objRS.Fields("tip_ace_codigo").properties("IsAutoIncrement") = False Then
    objRS("tip_ace_codigo") = Trim(Request.Form("tip_ace_codigo"))
  End If
  If objRS.Fields("pes_codigo").properties("IsAutoIncrement") = False Then
    objRS("pes_codigo") = Trim(Request.Form("pes_codigo"))
  End If
  If objRS.Fields("mov_data_emissao").properties("IsAutoIncrement") = False Then
    objRS("mov_data_emissao") = Trim(Request.Form("mov_data_emissao"))
  End If
  If objRS.Fields("mov_contrato").properties("IsAutoIncrement") = False Then
    objRS("mov_contrato") = Trim(Request.Form("mov_contrato"))
  End If
  If objRS.Fields("mov_obs").properties("IsAutoIncrement") = False Then
    objRS("mov_obs") = Trim(Request.Form("mov_obs"))
  End If
  If objRS.Fields("com_codigo").properties("IsAutoIncrement") = False Then
    objRS("com_codigo") = Trim(Request.Form("com_codigo"))
  End If
  If objRS.Fields("sit_codigo").properties("IsAutoIncrement") = False Then
    objRS("sit_codigo") = Trim(Request.Form("sit_codigo"))
  End If
  If objRS.Fields("cus_codigo").properties("IsAutoIncrement") = False Then
    objRS("cus_codigo") = Trim(Request.Form("cus_codigo"))
  End If
  If objRS.Fields("neg_codigo").properties("IsAutoIncrement") = False Then
    objRS("neg_codigo") = Trim(Request.Form("neg_codigo"))
  End If
  If objRS.Fields("uni_codigo").properties("IsAutoIncrement") = False Then
    objRS("uni_codigo") = Trim(Request.Form("uni_codigo"))
  End If
  If objRS.Fields("cen_codigo").properties("IsAutoIncrement") = False Then
    objRS("cen_codigo") = Trim(Request.Form("cen_codigo"))
  End If
  If objRS.Fields("con_codigo").properties("IsAutoIncrement") = False Then
    objRS("con_codigo") = Trim(Request.Form("con_codigo"))
  End If
  If objRS.Fields("set_codigo").properties("IsAutoIncrement") = False Then
    objRS("set_codigo") = Trim(Request.Form("set_codigo"))
  End If
  If objRS.Fields("mov_tipo").properties("IsAutoIncrement") = False Then
    objRS("mov_tipo") = Trim(Request.Form("mov_tipo"))
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
 
  <%response.Redirect("pg_alteracaoAceite.asp?aviso=ok&idlanc=" & session("idLancamento"))%><BR>
  <BR>
  
  <%
Else
 sSelecao=false
  If Not IsEmpty(Request.Form("recordno")) Then
  	  sSelecao=true
	  strQ = Request.Form("strQ")
	  indice = Trim(Request.Form("indice"))
	  If indice <> "" Then strQ = " SELECT * FROM mny_movimento WHERE " & indice
	  
	  SET RS = conexao.execute(strQ)
	  if not rs.eof then 
	  	session("idLancamento") = RS("mov_codigo")
	  end if
  else
  	IF REQUEST.QueryString("idlanc") <>"" then 
  		  sSelecao=true
		  strQ = "SELECT * FROM mny_movimento"
		  indice = " mov_codigo=" & Trim(REQUEST.QueryString("idlanc"))
		  If indice <> "" Then strQ = " SELECT * FROM mny_movimento WHERE " & indice
	ELSE
		sSelecao=FALSE
	end if
  end if
  'response.Write(sSelecao)
  
  if sSelecao=true then 


'  If Not IsEmpty(Request.Form("recordno")) Then
    Set objCon = Server.CreateObject("ADODB.Connection")
    objCon.Open strCon

    Set objRS = Server.CreateObject("ADODB.Recordset")
    objRS.CursorLocation = 2
    objRS.CursorType = 0
    objRS.LockType = 3


  'strQ = Request.Form("strQ")
  'indice = Trim(Request.Form("indice"))
  'If indice <> "" Then strQ = " SELECT * FROM mny_movimento WHERE " & indice

    objRS.Open strQ, objCon, , , &H0001
  If indice = "" Then objRS.Move Request.Form("recordno") - 1
%>
  
  <B>Alterar dados do Registro</B><BR>
  Altere os dados 
  necessários abaixo:<BR>
</div>


<%
    If indice = "" Then
      resp=""
    End If
  End If
End If
%>
<table width="780" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="363" valign="top" background="imagens/fdoQuadro/fdoGrande.jpg"><table width="780" border="0" cellspacing="0" cellpadding="0">
      <tr >
        <td colspan="2" height="2" ></td>
        <td width="325"></td>
      </tr>
      <tr>
        <td width="13" height="37">&nbsp;</td>
        <td width="442" class="texto_pagina"><strong>&nbsp;&nbsp;Lan&ccedil;amento</strong></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="321" colspan="3" valign="top"><form class="form" name="form_incluir" method="post" action="<%="pg_alteracaoAceite.asp?idlanc=" & session("idLancamento")%>" onSubmit="return verifica_form(this);">
          <INPUT type=hidden name=recordno value="<%=Request.Form("recordno")%>">
          <INPUT type=hidden name=strQ value="<%=Request.Form("strQ")%>">
          <INPUT type="hidden" name="indice" value="<%=indice%>">
          <TABLE border=0 align="center" cellpadding=1 cellspacing=1 class=tabela_formulario>
            <TR class=titulo_campos>
              <TD width="125">Cod. Lan&ccedil;amento<br></TD>
              <TD colspan="3"><%If objRS.Fields("mov_codigo").properties("IsAutoIncrement") = False Then%>
                  <INPUT style="width=350" type="text" name="mov_codigo" maxlength="255" value="<%=(objRS.Fields.Item("mov_codigo").Value)%>" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
                  <%
Else
  Response.Write "<B>" & (objRS.Fields.Item("mov_codigo").Value) & "</B>"
End If
%></TD>
            </TR>
            <TR class=titulo_campos>
              <TD>Tipo de Aceite<BR></TD>
              <TD colspan="3"><SELECT style="width=350" name="tip_ace_codigo" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
                  <OPTION value=""></OPTION>
                  <%
  Set objRS2 = Server.CreateObject("ADODB.Recordset")
  objRS2.CursorLocation = 3
  objRS2.CursorType = 3
  objRS2.LockType = 1

  strQ = "SELECT tip_codigo,tip_nome FROM mny_tipo_aceite ORDER BY tip_nome ASC"
  objRS2.Open strQ, objCon, , , &H0001
  If Not objRS2.EOF Then
    While Not objRS2.EOF
	  If Trim(objRS2.Fields.Item("tip_codigo").Value) <> "" Then
	    Response.Write "      <OPTION value='" & (objRS2.Fields.Item("tip_codigo").Value) & "'"
	    If Lcase(objRS2.Fields.Item("tip_codigo").Value) = Lcase(objRS.Fields.Item("tip_ace_codigo").Value) then
	      Response.Write "selected"
	    End If
	    Response.Write ">" & (objRS2.Fields.Item("tip_nome").Value) & "</OPTION>"
	  End If
      objRS2.MoveNext
    Wend
  End If
  Response.Write("ok")
%>
              </SELECT></TD>
            </TR>
            <TR class=titulo_campos>
              <TD>Pessoa<BR></TD>
              <TD colspan="3"><SELECT style="width=350" name="pes_codigo" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
                  <OPTION value=""></OPTION>
                  <%
  Set objRS2 = Server.CreateObject("ADODB.Recordset")
  objRS2.CursorLocation = 3
  objRS2.CursorType = 3
  objRS2.LockType = 1

  strQ = "SELECT pes_codigo,pes_nome_fantasia FROM mny_pessoa ORDER BY pes_nome_fantasia ASC"
  objRS2.Open strQ, objCon, , , &H0001
  If Not objRS2.EOF Then
    While Not objRS2.EOF
	  If Trim(objRS2.Fields.Item("pes_codigo").Value) <> "" Then
	    Response.Write "      <OPTION value='" & (objRS2.Fields.Item("pes_codigo").Value) & "'"
	    If Lcase(objRS2.Fields.Item("pes_codigo").Value) = Lcase(objRS.Fields.Item("pes_codigo").Value) then
	      Response.Write "selected"
	    End If
	    Response.Write ">" & (objRS2.Fields.Item("pes_nome_fantasia").Value) & "</OPTION>"
	  End If
      objRS2.MoveNext
    Wend
  End If
  Response.Write("ok")
%>
              </SELECT></TD>
            </TR>
            <TR class=titulo_campos>
              <TD>Data_emissao</TD>
              <TD width="199"><%If objRS.Fields("mov_data_emissao").properties("IsAutoIncrement") = False Then%>
                  <INPUT style="width=150" type="text" name="mov_data_emissao" maxlength="11" value="<%=(objRS.Fields.Item("mov_data_emissao").Value)%>" onKeyPress="desabilita_cor(this)"  df_verificar="sim" OnKeyUp="this.value=mascara_data(this.value)" onBlur="verifica_data(this)"  class=campos_formulario>
                  <%
Else
  Response.Write "<B>" & (objRS.Fields.Item("mov_data_emissao").Value) & "</B>"
End If
%></TD>
              <TD width="110">&nbsp;</TD>
              <TD width="295">Tipo:
              <%if objRS("mov_tipo")="0" THEN sSelect1="SELECTED"
   	   			if objRS("mov_tipo")="1" THEN sSelect2="SELECTED"
	  %>
      <SELECT style="width=350" name="mov_tipo" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
        <option value="0" <%=sSelect1%>>Pagar</option>
        <option value="1" <%=sSelect2%>>Receber</option>
      </SELECT>
              </TD>
            </TR>
            <TR class=titulo_campos>
              <TD>Nr. Contrato<br></TD>
              <TD><%If objRS.Fields("mov_contrato").properties("IsAutoIncrement") = False Then%>
                  <INPUT style="width=250" type="text" name="mov_contrato" maxlength="50" value="<%=(objRS.Fields.Item("mov_contrato").Value)%>" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
                  <%
Else
  Response.Write "<B>" & (objRS.Fields.Item("mov_contrato").Value) & "</B>"
End If
%></TD>
              <TD>Historico</TD>
              <TD><%If objRS.Fields("mov_obs").properties("IsAutoIncrement") = False Then%>
                  <INPUT name="mov_obs" type="text" class=campos_formulario style="width=250" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("mov_obs").Value)%>" size="40" maxlength="255"  df_verificar="nao">
                  <%
Else
  Response.Write "<B>" & (objRS.Fields.Item("mov_obs").Value) & "</B>"
End If
%></TD>
            </TR>
            <TR class=titulo_campos>
              <TD>Compet&ecirc;ncia<BR></TD>
              <TD><SELECT style="width=250" name="com_codigo" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
                  <OPTION value=""></OPTION>
                  <%
  Set objRS2 = Server.CreateObject("ADODB.Recordset")
  objRS2.CursorLocation = 3
  objRS2.CursorType = 3
  objRS2.LockType = 1

  strQ = "SELECT com_codigo,com_nome FROM sys_competencia ORDER BY com_nome ASC"
  objRS2.Open strQ, objCon, , , &H0001
  If Not objRS2.EOF Then
    While Not objRS2.EOF
	  If Trim(objRS2.Fields.Item("com_codigo").Value) <> "" Then
	    Response.Write "      <OPTION value='" & (objRS2.Fields.Item("com_codigo").Value) & "'"
	    If Lcase(objRS2.Fields.Item("com_codigo").Value) = Lcase(objRS.Fields.Item("com_codigo").Value) then
	      Response.Write "selected"
	    End If
	    Response.Write ">" & (objRS2.Fields.Item("com_nome").Value) & "</OPTION>"
	  End If
      objRS2.MoveNext
    Wend
  End If
  Response.Write("ok")
%>
              </SELECT></TD>
              <TD>Situa&ccedil;&atilde;o</TD>
              <TD><SELECT style="width=250" name="sit_codigo" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
                  <OPTION value=""></OPTION>
                  <%
  Set objRS2 = Server.CreateObject("ADODB.Recordset")
  objRS2.CursorLocation = 3
  objRS2.CursorType = 3
  objRS2.LockType = 1

  strQ = "SELECT sit_codigo,sit_nome FROM sys_situacao ORDER BY sit_nome ASC"
  objRS2.Open strQ, objCon, , , &H0001
  If Not objRS2.EOF Then
    While Not objRS2.EOF
	  If Trim(objRS2.Fields.Item("sit_codigo").Value) <> "" Then
	    Response.Write "      <OPTION value='" & (objRS2.Fields.Item("sit_codigo").Value) & "'"
	    If Lcase(objRS2.Fields.Item("sit_codigo").Value) = Lcase(objRS.Fields.Item("sit_codigo").Value) then
	      Response.Write "selected"
	    End If
	    Response.Write ">" & (objRS2.Fields.Item("sit_nome").Value) & "</OPTION>"
	  End If
      objRS2.MoveNext
    Wend
  End If
  Response.Write("ok")
%>
              </SELECT></TD>
            </TR>
            <TR class=titulo_campos>
              <TD>Tipo de Custo<BR></TD>
              <TD><SELECT style="width=250" name="cus_codigo" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
                  <OPTION value=""></OPTION>
                  <%
  Set objRS2 = Server.CreateObject("ADODB.Recordset")
  objRS2.CursorLocation = 3
  objRS2.CursorType = 3
  objRS2.LockType = 1

  strQ = "SELECT cus_codigo,cus_nome FROM mny_custo ORDER BY cus_nome ASC"
  objRS2.Open strQ, objCon, , , &H0001
  If Not objRS2.EOF Then
    While Not objRS2.EOF
	  If Trim(objRS2.Fields.Item("cus_codigo").Value) <> "" Then
	    Response.Write "      <OPTION value='" & (objRS2.Fields.Item("cus_codigo").Value) & "'"
	    If Lcase(objRS2.Fields.Item("cus_codigo").Value) = Lcase(objRS.Fields.Item("cus_codigo").Value) then
	      Response.Write "selected"
	    End If
	    Response.Write ">" & (objRS2.Fields.Item("cus_nome").Value) & "</OPTION>"
	  End If
      objRS2.MoveNext
    Wend
  End If
  Response.Write("ok")
%>
              </SELECT></TD>
              <TD>C. de Negocio</TD>
              <TD><SELECT style="width=250" name="neg_codigo" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
                  <OPTION value=""></OPTION>
                  <%
  Set objRS2 = Server.CreateObject("ADODB.Recordset")
  objRS2.CursorLocation = 3
  objRS2.CursorType = 3
  objRS2.LockType = 1

  strQ = "SELECT neg_codigo,neg_nome FROM mny_centro_negocio ORDER BY neg_nome ASC"
  objRS2.Open strQ, objCon, , , &H0001
  If Not objRS2.EOF Then
    While Not objRS2.EOF
	  If Trim(objRS2.Fields.Item("neg_codigo").Value) <> "" Then
	    Response.Write "      <OPTION value='" & (objRS2.Fields.Item("neg_codigo").Value) & "'"
	    If Lcase(objRS2.Fields.Item("neg_codigo").Value) = Lcase(objRS.Fields.Item("neg_codigo").Value) then
	      Response.Write "selected"
	    End If
	    Response.Write ">" & (objRS2.Fields.Item("neg_nome").Value) & "</OPTION>"
	  End If
      objRS2.MoveNext
    Wend
  End If
  Response.Write("ok")
%>
              </SELECT></TD>
            </TR>
            <TR class=titulo_campos>
              <TD>Unid. de Negocio<BR></TD>
              <TD><SELECT style="width=250" name="uni_codigo" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
                  <OPTION value=""></OPTION>
                  <%
  Set objRS2 = Server.CreateObject("ADODB.Recordset")
  objRS2.CursorLocation = 3
  objRS2.CursorType = 3
  objRS2.LockType = 1

  strQ = "SELECT uni_codigo,uni_nome FROM mny_unidade ORDER BY uni_nome ASC"
  objRS2.Open strQ, objCon, , , &H0001
  If Not objRS2.EOF Then
    While Not objRS2.EOF
	  If Trim(objRS2.Fields.Item("uni_codigo").Value) <> "" Then
	    Response.Write "      <OPTION value='" & (objRS2.Fields.Item("uni_codigo").Value) & "'"
	    If Lcase(objRS2.Fields.Item("uni_codigo").Value) = Lcase(objRS.Fields.Item("uni_codigo").Value) then
	      Response.Write "selected"
	    End If
	    Response.Write ">" & (objRS2.Fields.Item("uni_nome").Value) & "</OPTION>"
	  End If
      objRS2.MoveNext
    Wend
  End If
  Response.Write("ok")
%>
              </SELECT></TD>
              <TD>C. de Custo</TD>
              <TD><SELECT style="width=250" name="cen_codigo" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
                  <OPTION value=""></OPTION>
                  <%
  Set objRS2 = Server.CreateObject("ADODB.Recordset")
  objRS2.CursorLocation = 3
  objRS2.CursorType = 3
  objRS2.LockType = 1

  strQ = "SELECT cen_codigo,cen_nome FROM mny_centro_custo ORDER BY cen_nome ASC"
  objRS2.Open strQ, objCon, , , &H0001
  If Not objRS2.EOF Then
    While Not objRS2.EOF
	  If Trim(objRS2.Fields.Item("cen_codigo").Value) <> "" Then
	    Response.Write "      <OPTION value='" & (objRS2.Fields.Item("cen_codigo").Value) & "'"
	    If Lcase(objRS2.Fields.Item("cen_codigo").Value) = Lcase(objRS.Fields.Item("cen_codigo").Value) then
	      Response.Write "selected"
	    End If
	    Response.Write ">" & (objRS2.Fields.Item("cen_nome").Value) & "</OPTION>"
	  End If
      objRS2.MoveNext
    Wend
  End If
  Response.Write("ok")
%>
              </SELECT></TD>
            </TR>
            <TR class=titulo_campos>
              <TD>Conta<BR></TD>
              <TD><SELECT style="width=250" name="con_codigo" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
                  <OPTION value=""></OPTION>
                  <%
  Set objRS2 = Server.CreateObject("ADODB.Recordset")
  objRS2.CursorLocation = 3
  objRS2.CursorType = 3
  objRS2.LockType = 1

  strQ = "SELECT con_codigo,con_nome FROM mny_conta ORDER BY con_nome ASC"
  objRS2.Open strQ, objCon, , , &H0001
  If Not objRS2.EOF Then
    While Not objRS2.EOF
	  If Trim(objRS2.Fields.Item("con_codigo").Value) <> "" Then
	    Response.Write "      <OPTION value='" & (objRS2.Fields.Item("con_codigo").Value) & "'"
	    If Lcase(objRS2.Fields.Item("con_codigo").Value) = Lcase(objRS.Fields.Item("con_codigo").Value) then
	      Response.Write "selected"
	    End If
	    Response.Write ">" & (objRS2.Fields.Item("con_nome").Value) & "</OPTION>"
	  End If
      objRS2.MoveNext
    Wend
  End If
  Response.Write("ok")
%>
              </SELECT></TD>
              <TD>Setor</TD>
              <TD><SELECT style="width=250" name="set_codigo" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
                  <OPTION value=""></OPTION>
                  <%
  Set objRS2 = Server.CreateObject("ADODB.Recordset")
  objRS2.CursorLocation = 3
  objRS2.CursorType = 3
  objRS2.LockType = 1

  strQ = "SELECT set_codigo,set_nome FROM mny_setor ORDER BY set_nome ASC"
  objRS2.Open strQ, objCon, , , &H0001
  If Not objRS2.EOF Then
    While Not objRS2.EOF
	  If Trim(objRS2.Fields.Item("set_codigo").Value) <> "" Then
	    Response.Write "      <OPTION value='" & (objRS2.Fields.Item("set_codigo").Value) & "'"
	    If Lcase(objRS2.Fields.Item("set_codigo").Value) = Lcase(objRS.Fields.Item("set_codigo").Value) then
	      Response.Write "selected"
	    End If
	    Response.Write ">" & (objRS2.Fields.Item("set_nome").Value) & "</OPTION>"
	  End If
      objRS2.MoveNext
    Wend
  End If
  Response.Write("ok")
%>
              </SELECT>
              </TD>
            </TR>
          </TABLE>
          
          <div align="center">
            <input type="submit" name="salvar" value="     Gravar    " class="botao_enviar">
          </div>
        </form></td>
        </tr>
    </table></td>
  </tr>
</table>
<span class="titulo_pagina"> Lan&ccedil;amentos Vinculados</span><br>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="4%" height="26" background="back2.gif"><div align="center"><img src="icones/add.gif" width="16" height="16"></div></td>
    <td width="20%" background="back2.gif"><a class="LinskMenuPagina" href="pg_operacoesAceiteItem.asp?ope=novo">Novo Lan&ccedil;amento Item</a></td>
    <td width="2%" background="back2.gif">&nbsp;</td>
    <td width="37%" background="back2.gif">&nbsp;</td>
    <td width="37%" background="back2.gif">&nbsp;</td>
  </tr>
</table>
<br>
<table width="700" border="0" align="center" cellpadding="3" cellspacing="0" class="Borda_tabela">
  <tr bgcolor="#999999" class="texto_pagina">
    <td width="16">&nbsp;</td>
    <td width="56">Cod.Lanc.</td>
    <td width="121"><div align="center">Venc.</div></td>
    <td width="63"><div align="center">Prev.</div></td>
    <td width="56"><div align="right">Valor</div></td>
    <td width="45"><div align="right">Juros</div></td>
    <td width="41"><div align="right">Desc.</div></td>
    <td width="59"><div align="right">Valor a Pg</div></td>
    <td width="64"><div align="center">F.Pgto</div></td>
    <td width="63"><div align="center">T.Doc</div></td>
    <td width="48"><div align="center">Status</div></td>
  </tr>
  <%
  s_sql = " select * from mny_movimento_item i,mny_forma_pagto f,mny_tipo_documento d,sys_situacao  s "
  s_sql = s_sql  & " where i.fpg_codigo = f.fpg_codigo and i.tip_doc_codigo= d.tip_codigo and i.mov_status=s.sit_codigo"
  s_sql = s_sql  & " and mov_codigo=" & session("idLancamento")
 ' response.Write(s_sql)
  set rsLista = conexao.execute (s_sql)
  while not rslista.eof %>
  <tr class="texto_pagina">
    <td><div align="center"><img src="icones/seta0001.gif" width="16" height="16"></div></td>
    <td height="32"><div align="center"><strong><a class="LinskSelacaoRegistro" title="Editar registro" href="pg_operacoesAceiteItem.asp?ope=edita&idItem=<%=rslista("mov_item")%>"><%=formataNumero(rslista("mov_item"),6)%></a></strong></div></td>
        <td><div align="center"><%=rsLista("mov_data_vencto")%></div></td>
        <td><div align="center"><%=rsLista("mov_data_prev")%></div></td>
        <td><div align="right"><%=formatNumber(rsLista("mov_valor"),2)%></div></td>
        <td><div align="right"><%=formatNumber(rsLista("mov_juros"),2)%></div></td>
        <td><div align="right"><%=formatNumber(rsLista("mov_desconto"),2)%></div></td>
        <td><div align="right"><%=formatNumber(rsLista("mov_valor_pagar"),2)%></div></td>
        <td><div align="center"><%=rsLista("fpg_nome")%></div></td>
        <td><div align="center"><%=rsLista("tip_nome")%></div></td>
        <td><div align="center"><%=rsLista("sit_nome")%></div></td>
      </tr>
    <%rsLista.movenext
	wend%>
</table>
<br>
<br/>
</BODY>
</HTML>

<%
Else
  Response.Write "<B>Acesso negado...</B> somente o administrador do site tem acesso a esta página."
  
End If
%>
