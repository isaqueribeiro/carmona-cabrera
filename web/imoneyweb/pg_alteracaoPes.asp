<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="recursos/p_conexaobanco.asp" -->
<!--#include file="recursos/p_verificaLogin.asp" -->
<!--#include file="recursos/p_funcoesasp.asp" -->
<!--#include file="recursos/scripts.asp" -->


<%

if request.QueryString("aviso")="ok" then 
	response.Write("<script language='JavaScript'>alert('Dados  gravados com sucesso!');</script>")
end if


sNomedaPagina="Cadastro de Pessoas - Edição"

strCon = session("conexao")

'Nome da página de consulta
pagina_consulta = "pg_consultaPes2.asp"

'Nome da página de alteração
pagina_alteracao = "pg_alteracaoPes.asp"

'Nome da página de inclusão
pagina_inclusao = "pg_inclusaoPes.asp"

'Nome da página de login
pagina_login = "df_login.asp"

'*******************************************************************


If Session("admin") <> "" And Session("ip_admin") = Request.ServerVariables("REMOTE_ADDR") Then
%>

<HTML>
<HEAD>
<script language="JavaScript">
var win = null;
function NovaJanela(pagina,nome,w,h,scroll){
	LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
	TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
	settings = 'height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
	win = window.open(pagina,nome,settings);
}
</script>

<TITLE>Alterar Registro</TITLE>
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
<div id="loading" style="position:absolute; width:354px; text-align:center; top:300px; left: 385px;">
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
  If indice <> "" Then strQ = " SELECT * FROM mny_pessoa WHERE " & indice

  objRS.Open strQ, objCon, , , &H0001
  If indice = "" Then objRS.Move Request.Form("recordno") - 1

  If objRS.Fields("pes_codigo").properties("IsAutoIncrement") = False Then
    objRS("pes_codigo") = Trim(Request.Form("pes_codigo"))
  End If
  If objRS.Fields("tip_codigo").properties("IsAutoIncrement") = False Then
    objRS("tip_codigo") = Trim(Request.Form("tip_codigo"))
  End If
  If objRS.Fields("pes_documento").properties("IsAutoIncrement") = False Then
    objRS("pes_documento") = Trim(Request.Form("pes_documento"))
  End If
  If objRS.Fields("pes_razao_social").properties("IsAutoIncrement") = False Then
    objRS("pes_razao_social") = Trim(Request.Form("pes_razao_social"))
  End If
  If objRS.Fields("pes_nome_fantasia").properties("IsAutoIncrement") = False Then
    objRS("pes_nome_fantasia") = Trim(Request.Form("pes_nome_fantasia"))
  End If
  If objRS.Fields("pes_insc_municipal").properties("IsAutoIncrement") = False Then
    objRS("pes_insc_municipal") = Trim(Request.Form("pes_insc_municipal"))
  End If
  If objRS.Fields("pes_insc_estadual").properties("IsAutoIncrement") = False Then
    objRS("pes_insc_estadual") = Trim(Request.Form("pes_insc_estadual"))
  End If
  If objRS.Fields("pes_end_logra").properties("IsAutoIncrement") = False Then
    objRS("pes_end_logra") = Trim(Request.Form("pes_end_logra"))
  End If
  If objRS.Fields("pes_end_uf").properties("IsAutoIncrement") = False Then
    objRS("pes_end_uf") = Trim(Request.Form("pes_end_uf"))
  End If
  If objRS.Fields("pes_end_cidade").properties("IsAutoIncrement") = False Then
    objRS("pes_end_cidade") = Trim(Request.Form("pes_end_cidade"))
  End If
  If objRS.Fields("pes_end_bairro").properties("IsAutoIncrement") = False Then
    objRS("pes_end_bairro") = Trim(Request.Form("pes_end_bairro"))
  End If
  If objRS.Fields("pes_end_cep").properties("IsAutoIncrement") = False Then
    objRS("pes_end_cep") = Trim(Request.Form("pes_end_cep"))
  End If
  If objRS.Fields("pes_contato").properties("IsAutoIncrement") = False Then
    objRS("pes_contato") = Trim(Request.Form("pes_contato"))
  End If
  If objRS.Fields("pes_fones").properties("IsAutoIncrement") = False Then
    objRS("pes_fones") = Trim(Request.Form("pes_fones"))
  End If
  If objRS.Fields("pes_obs").properties("IsAutoIncrement") = False Then
    objRS("pes_obs") = Trim(Request.Form("pes_obs"))
  End If
  If objRS.Fields("pes_email").properties("IsAutoIncrement") = False Then
    objRS("pes_email") = Trim(Request.Form("pes_email"))
  End If
  If objRS.Fields("ccr_codigo").properties("IsAutoIncrement") = False Then
    objRS("ccr_codigo") = Trim(Request.Form("ccr_codigo"))
  End If
  If objRS.Fields("PES_STATUS").properties("IsAutoIncrement") = False Then
    objRS("PES_STATUS") = Trim(Request.Form("PES_STATUS"))
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
  com sucesso.<BR>
  <BR>
  <%response.Redirect("pg_alteracaoPes.asp?aviso=ok&idlanc=" & session("idPes"))%><BR>
  <%
Else
  sSelecao=false
  If Not IsEmpty(Request.Form("recordno")) Then
  	  sSelecao=true
	  strQ = Request.Form("strQ")
	  indice = Trim(Request.Form("indice"))
	  If indice <> "" Then strQ = " SELECT * FROM mny_pessoa WHERE " & indice
	  
	  SET RS = conexao.execute(strQ)
	  if not rs.eof then 
	  	session("idPes") = RS("pes_codigo")
	  end if
  else
  	IF REQUEST.QueryString("idlanc") <>"" then 
  		  sSelecao=true
		  strQ = "SELECT * FROM mny_pessoa"
		  indice = " pes_codigo=" & Trim(REQUEST.QueryString("idlanc"))
		  If indice <> "" Then strQ = " SELECT * FROM mny_pessoa WHERE " & indice
	ELSE
		sSelecao=FALSE
	end if
  end if
  'response.Write(sSelecao)
  
  if sSelecao=true then 
  
  
  'If Not IsEmpty(Request.Form("recordno")) Then
    Set objCon = Server.CreateObject("ADODB.Connection")
    objCon.Open strCon

    Set objRS = Server.CreateObject("ADODB.Recordset")
    objRS.CursorLocation = 2
    objRS.CursorType = 0
    objRS.LockType = 3


  'strQ = Request.Form("strQ")
  'indice = Trim(Request.Form("indice"))
  'If indice <> "" Then strQ = " SELECT * FROM mny_pessoa WHERE " & indice

    objRS.Open strQ, objCon, , , &H0001
  If indice = "" Then objRS.Move Request.Form("recordno") - 1
%>
  
  <B>Alterar dados do Registro</B><BR>
  Altere os dados 
  necessários abaixo:<BR>
</div>


<%
    'If indice = "" Then
    '  Response.Write "<BR><B>ATENÇÃO:</B> Crie um campo do tipo <i>AutoIncrement</i> com qualquer nome em sua tabela para evitar erros na alteração dos dados. "
    '  Response.Write "<a href=""http://www.dataform.com.br/criar_campo_autoincrement.asp"" target=""_blank"">Clique aqui</a> para mais detalhes."
    'End If
  End If
End If
%>
<table width="780" border="0" align="center" cellpadding="0" cellspacing="0" background="imagens/fdoQuadro/fdoExtraGrande.jpg">
  <tr >
    <td colspan="2" height="2" ></td>
    <td width="325"></td>
  </tr>
  <tr>
    <td width="13" height="37">&nbsp;</td>
    <td width="442" class="texto_pagina"><strong>&nbsp;&nbsp;Edi&ccedil;&atilde;o de Pessoas</strong></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="420" colspan="3" valign="top">
    <form name="form_incluir" method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>" onSubmit="return verifica_form(this);">
<INPUT type=hidden name=recordno value="<%=Request.Form("recordno")%>">
<INPUT type=hidden name=strQ value="<%=Request.Form("strQ")%>">
<INPUT type="hidden" name="indice" value="<%=indice%>">
<TABLE border=0 align="center" cellpadding=0 cellspacing=1 class=tabela_formulario>
  <TR class=titulo_campos><TD width="189">Codigo:<br>
<%If objRS.Fields("pes_codigo").properties("IsAutoIncrement") = False Then%>
<INPUT name="pes_codigo" type="text" class=campos_formulario style="width=50" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("pes_codigo").Value)%>" size="10" maxlength="255"  df_verificar="sim">
<%
Else
  Response.Write "<B>" & (objRS.Fields.Item("pes_codigo").Value) & "</B>"
End If
%>
  </TD>
    <TD width="201">Tipo:<br>
      <SELECT style="width=200" name="tip_codigo" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
        <OPTION value=""></OPTION>
        <%
  Set objRS2 = Server.CreateObject("ADODB.Recordset")
  objRS2.CursorLocation = 3
  objRS2.CursorType = 3
  objRS2.LockType = 1

  strQ = "SELECT * FROM mny_tipo_pessoa ORDER BY tip_nome ASC"
  objRS2.Open strQ, objCon, , , &H0001
  If Not objRS2.EOF Then
    While Not objRS2.EOF
	  If Trim(objRS2.Fields.Item("tip_codigo").Value) <> "" Then
	    Response.Write "      <OPTION value='" & (objRS2.Fields.Item("tip_codigo").Value) & "'"
	    If Lcase(objRS2.Fields.Item("tip_codigo").Value) = Lcase(objRS.Fields.Item("tip_codigo").Value) then
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
    <TD width="233" class="texto_pagina">CPF/CNPJ:<br>
      <%If objRS.Fields("pes_documento").properties("IsAutoIncrement") = False Then%>
      <INPUT name="pes_documento" type="text" class=campos_formulario style="width=150" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("pes_documento").Value)%>" size="30" maxlength="20"  df_verificar="sim" df_validar="cpf_cnpj">
      <%
Else
  Response.Write "<B>" & (objRS.Fields.Item("pes_documento").Value) & "</B>"
End If
%><br></TD>
    <TD width="72">&nbsp;</TD>
  </TR>
  <TR class=titulo_campos><TD colspan="4">Razão:<br>
<%If objRS.Fields("pes_razao_social").properties("IsAutoIncrement") = False Then%>
<INPUT name="pes_razao_social" type="text" class=campos_formulario style="width=500" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("pes_razao_social").Value)%>" size="100" maxlength="255"  df_verificar="sim">
<%
Else
  Response.Write "<B>" & (objRS.Fields.Item("pes_razao_social").Value) & "</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD colspan="4">Nome:<br>
<%If objRS.Fields("pes_nome_fantasia").properties("IsAutoIncrement") = False Then%>
<INPUT name="pes_nome_fantasia" type="text" class=campos_formulario style="width=700" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("pes_nome_fantasia").Value)%>" size="100" maxlength="255"  df_verificar="sim">
<%
Else
  Response.Write "<B>" & (objRS.Fields.Item("pes_nome_fantasia").Value) & "</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Insc. Municipal:<br>
<%If objRS.Fields("pes_insc_municipal").properties("IsAutoIncrement") = False Then%>
<INPUT name="pes_insc_municipal" type="text" class=campos_formulario style="width=150" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("pes_insc_municipal").Value)%>" size="20" maxlength="20"  df_verificar="sim">
<%
Else
  Response.Write "<B>" & (objRS.Fields.Item("pes_insc_municipal").Value) & "</B>"
End If
%>
  </TD>
    <TD>&nbsp;</TD>
    <TD>Insc.Estadual:<br>
      <%If objRS.Fields("pes_insc_estadual").properties("IsAutoIncrement") = False Then%>
      <INPUT name="pes_insc_estadual" type="text" class=campos_formulario style="width=150" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("pes_insc_estadual").Value)%>" size="20" maxlength="20"  df_verificar="sim">
      <%
Else
  Response.Write "<B>" & (objRS.Fields.Item("pes_insc_estadual").Value) & "</B>"
End If
%></TD>
    <TD>&nbsp;</TD>
  </TR>
  <TR class=titulo_campos><TD colspan="2">Endereço:<br>
<%If objRS.Fields("pes_end_logra").properties("IsAutoIncrement") = False Then%>
<INPUT name="pes_end_logra" type="text" class=campos_formulario style="width=350" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("pes_end_logra").Value)%>" size="55" maxlength="255"  df_verificar="sim">
<%
Else
  Response.Write "<B>" & (objRS.Fields.Item("pes_end_logra").Value) & "</B>"
End If
%>
  </TD>
    <TD>UF:<br>
      <%If objRS.Fields("pes_end_uf").properties("IsAutoIncrement") = False Then%>
      <INPUT style="width=100" type="text" name="pes_end_uf" maxlength="2" value="<%=(objRS.Fields.Item("pes_end_uf").Value)%>" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
      <%
Else
  Response.Write "<B>" & (objRS.Fields.Item("pes_end_uf").Value) & "</B>"
End If
%></TD>
    <TD>&nbsp;</TD>
  </TR>
  <TR class=titulo_campos><TD>Cidade:<br>
<%If objRS.Fields("pes_end_cidade").properties("IsAutoIncrement") = False Then%>
<INPUT name="pes_end_cidade" type="text" class=campos_formulario style="width=150" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("pes_end_cidade").Value)%>" size="20" maxlength="255"  df_verificar="sim">
<%
Else
  Response.Write "<B>" & (objRS.Fields.Item("pes_end_cidade").Value) & "</B>"
End If
%>
  </TD>
    <TD>Bairro:<br>
      <%If objRS.Fields("pes_end_bairro").properties("IsAutoIncrement") = False Then%>
      <INPUT name="pes_end_bairro" type="text" class=campos_formulario style="width=150" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("pes_end_bairro").Value)%>" size="20" maxlength="255"  df_verificar="sim">
      <%
Else
  Response.Write "<B>" & (objRS.Fields.Item("pes_end_bairro").Value) & "</B>"
End If
%></TD>
    <TD>CEP:<br>
      <%If objRS.Fields("pes_end_cep").properties("IsAutoIncrement") = False Then%>
      <INPUT name="pes_end_cep" type="text" class=campos_formulario style="width=100" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("pes_end_cep").Value)%>" size="20" maxlength="12"  df_verificar="sim">
      <%
Else
  Response.Write "<B>" & (objRS.Fields.Item("pes_end_cep").Value) & "</B>"
End If
%></TD>
    <TD>&nbsp;</TD>
  </TR>
  <TR class=titulo_campos><TD colspan="2">Contato:<br>
<%If objRS.Fields("pes_contato").properties("IsAutoIncrement") = False Then%>
<INPUT name="pes_contato" type="text" class=campos_formulario style="width=350" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("pes_contato").Value)%>" size="50" maxlength="255"  df_verificar="sim">
<%
Else
  Response.Write "<B>" & (objRS.Fields.Item("pes_contato").Value) & "</B>"
End If
%>
  </TD>
    <TD>Fone:<br>
      <%If objRS.Fields("pes_fones").properties("IsAutoIncrement") = False Then%>
      <INPUT name="pes_fones" type="text" class=campos_formulario style="width=350" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("pes_fones").Value)%>" size="30" maxlength="255"  df_verificar="sim">
      <%
Else
  Response.Write "<B>" & (objRS.Fields.Item("pes_fones").Value) & "</B>"
End If
%></TD>
    <TD>&nbsp;</TD>
  </TR>
  <TR class=titulo_campos><TD colspan="4">Obs:<br>
<%If objRS.Fields("pes_obs").properties("IsAutoIncrement") = False Then%>
<INPUT name="pes_obs" type="text" class=campos_formulario style="width=350" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("pes_obs").Value)%>" size="100" maxlength="255"  df_verificar="nao">
<%
Else
  Response.Write "<B>" & (objRS.Fields.Item("pes_obs").Value) & "</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD colspan="2">Email:<br>
<%If objRS.Fields("pes_email").properties("IsAutoIncrement") = False Then%>
<INPUT name="pes_email" type="text" class=campos_formulario style="width=350" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("pes_email").Value)%>" size="50" maxlength="255" df_validar="email">
<%
Else
  Response.Write "<B>" & (objRS.Fields.Item("pes_email").Value) & "</B>"
End If
%>
  </TD>
    <TD>Conta Corrente:<BR>
      <SELECT style="width=350" name="ccr_codigo" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
      <OPTION value="0">Selecione uma conta</OPTION>
        <%
  Set objRS2 = Server.CreateObject("ADODB.Recordset")
  objRS2.CursorLocation = 3
  objRS2.CursorType = 3
  objRS2.LockType = 1

  strQ = "SELECT ccr_codigo,'Bco.:' & ban_codigo & '-Ag.:' & ccr_agencia & '-' & ccr_agencia_dv & '-Cta.:' & ccr_conta & '-' & ccr_conta_dv  as conta FROM mny_conta_corrente C ,sys_banco b "
  strQ = strQ & " WHERE  b.bco_codigo=ban_codigo and  ccr_codigo  NOT IN (SELECT ccr_codigo FROM mny_pessoa where pes_codigo<>" & session("idPes") & ") ORDER BY ccr_codigo ASC"
  RESPONSE.Write(strQ)	
  objRS2.Open strQ, objCon, , , &H0001
  If Not objRS2.EOF Then
    While Not objRS2.EOF
	  If Trim(objRS2.Fields.Item("ccr_codigo").Value) <> "" Then
	    Response.Write "      <OPTION value='" & (objRS2.Fields.Item("ccr_codigo").Value) & "'"
	    If Lcase(objRS2.Fields.Item("ccr_codigo").Value) = Lcase(objRS.Fields.Item("ccr_codigo").Value) then
	      Response.Write "selected"
	    End If
	    Response.Write ">" & (objRS2.Fields.Item("conta").Value) & "</OPTION>"
	  End If
      objRS2.MoveNext
    Wend
  End If
  Response.Write("ok")
%>
      </SELECT><a href="pg_operacoesCtaBancaria.asp?origem=cadpes&ope=novo" onClick="NovaJanela(this.href,'nomeJanela','800','500','yes');return false"><img title="Cadastrar Conta" src="icones/add.gif" width="16" height="16" border="0"></a></TD>
    <TD>Status:
      <%if objRS("PES_STATUS")="1" THEN sSelect1="SELECTED"
   	    if objRS("PES_STATUS")<>"1" THEN sSelect2="SELECTED"
	  %>
      <SELECT style="width=350" name="PES_STATUS" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
        <option value="1" <%=sSelect1%>>Ativo</option>
        <option value="0" <%=sSelect2%>>Inativo</option>
      </SELECT></TD>
  </TR>
</TABLE>
<div align="center">  <br>
  <input type="submit" name="salvar" value="Gravar" class=botao_enviar>
</div>
</form>
    </td>
  </tr>
</table>
</BODY>
</HTML>

<%
Else
  Response.Write "<B>Acesso negado...</B> somente o administrador do site tem acesso a esta página."
  Response.Write "<BR><a href=""" & pagina_login & """ class=""texto_pagina"">Clique aqui</a> para efetuar login no sitema"
End If
%>
