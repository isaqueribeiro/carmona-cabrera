<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="recursos/scripts.asp" -->

<%

	if request.QueryString("erro")<>"" then 
		select case  request.QueryString("erro")
			case "usunaoloc"
				sMenErro="Usuário não cadastrado!"
			case "senha"
				sMenErro="Senha incorreta!"
				sUsu=request.QueryString("usu")
		end select
	end if
	

%>


<html >
<head>
<link href="css/estiloSis.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>..:: LOGIN iMoney-Web ::..</title>
<style type="text/css">
<!--
.style1 {font-size: 10px}
-->
</style>
</head>

<body class="texto_pagina">
<strong>Login do Sistema iMoney-Web</strong>
<br>
Sistema de Gestão Financeira - Módulo Web
<hr size=1 color=gainsboro>
<br>
<table width="402" border="0" align="center" cellpadding="0" cellspacing="0" background="imagens/fdoLogin.jpg" class="Borda_tabela">
  <tr>
    <td width="402" height="288" background="imagens/fdoLogin.jpg"><form name="form1" method="post" action="coletadados.asp">
      <table width="300" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="29">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="29">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td width="95" height="25">&nbsp;</td>
          <td width="205">&nbsp;</td>
        </tr>
        <tr>
          <td height="25" class="texto_pagina"><div align="right">Usuário:</div></td>
          <td><label>
            <input type="text" name="txtusu" id="txtusu" class="campos_formulario" value="<%=sUsu%>">
          </label></td>
        </tr>
        <tr>
          <td height="28" class="texto_pagina"><div align="right">Senha:</div></td>
          <td><label>
            <input type="password" name="txtsenha" id="txtsenha" class="campos_formulario">
          </label></td>
        </tr>
        <tr>
          <td height="28" class="texto_pagina"><div align="right">Banco:</div></td>
          <td><label>
            <select name="cmbbco" class="campos_formulario" id="cmbbco">
              <option value="1" selected>Produção</option>
              <option value="2">Desenvolvimento</option>
              <option value="3">Local</option>
            </select>
          </label></td>
        </tr>
        <tr>
          <td height="16" colspan="2"><label></label>
            <div align="center" class="texto_erro" ><%=sMenErro%></div></td>
          </tr>
        <tr>
          <td height="28" colspan="2"><label>
            <div align="center">
              <input name="Acessar" type="submit" id="Acessar" value="Acessar">
              </div>
          </label></td>
          </tr>
      </table>
        </form>    </td>
  </tr>
</table>
<br>
<br>
<hr size=1 color=gainsboro>
<div align="center"><span class="style1">CopyRight © 2012 - <%=year(now)%>, Carmona Cabrera. Todos os direitos reservados.</span><br>
  <span class="style1">Desenvolvimento pela Ágil Soluções em Softwares.</span><br>
</div>
</body>
</html>
