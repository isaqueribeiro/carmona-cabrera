<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="recursos/p_conexaobanco.asp" -->
<!--#include file="recursos/scripts.asp" -->
<!--#include file="recursos/p_verificaLogin.asp" -->
<!--#include file="recursos/p_funcoesasp.asp" -->

<%


if request.QueryString("op")="ok" then 
	conexao.execute(session("opExclusao"))
	response.Redirect(session("pgnao"))
end if



%>


<html>
<head>

<link href="css/estiloSis.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.style1 {
	color: #FFFFFF;
	font-weight: bold;
}
-->
</style>
</head>

<body  class="texto_pagina">
<strong>Cancelamento de Registro</strong><br>
<hr size=1 color=gainsboro>
<br>
<table width="400" border="0" align="center" cellpadding="2" cellspacing="0" class="Borda_tabela">
  <tr>
    <td height="34" colspan="2" bgcolor="#FF0000"><div align="center"><span class="style1">Exclus&atilde;o de Registro!</span></div></td>
  </tr>
  <tr>
    <td height="20" colspan="2"><div align="center"><br>
    Confirma exclus&atilde;o do registro ?</div></td>
  </tr>
  <tr>
    <td height="32" colspan="2"><hr size=1 color=gainsboro></td>
  </tr>
  <tr>
    <td width="194" height="20"><div align="center"><a href="pg_cancelaRegistro.asp?op=ok"><img src="icones/75.gif" width="19" height="19" border="0"><br>
    Sim</a></div></td>
    <td width="196"><div align="center"><a href="<%=session("pgnao")%>"><img src="icones/74.gif" width="19" height="19" border="0"><br>
    N&atilde;o</a></div></td>
  </tr>
</table>
</body>




</html>
